var isWebkit = ('WebkitAppearance' in document.documentElement.style);
CKEDITOR.plugins.add( 'base64imagedrop', {
    init: function( editor ) {
    	
        function doNothing(e) { }

        function dropHandler(e) {
            e.preventDefault();
            
            //Get dropped file
            var file = e.dataTransfer.files[0];
            
            if(file==undefined){
                if (!isWebkit) {
                    return;
                  }
                  //onDomReady handler
                  editor.on('contentDom', function(evt) {
                    init(editor);
                  });
            	  function init(editor) {
            	    var window = editor.window.$, document = editor.document.$;
            	    var snapToSize = (typeof IMAGE_SNAP_TO_SIZE === 'undefined') ? null : IMAGE_SNAP_TO_SIZE;

            	    var resizer = new Resizer(editor, {snapToSize: snapToSize});

            	    document.addEventListener('mousedown', function(e) {
            	      if (resizer.isHandle(e.target)) {
            	        resizer.initDrag(e);
            	      }
            	    }, false);

            	    function selectionChange() {
            	      var selection = editor.getSelection();
            	      if (!selection) return;
            	      // If an element is selected and that element is an IMG
            	      if (selection.getType() !== CKEDITOR.SELECTION_NONE && selection.getStartElement().is('img')) {
            	        // And we're not right or middle clicking on the image
            	        if (!window.event || !window.event.button || window.event.button === 0) {
            	          resizer.show(selection.getStartElement().$);
            	        }
            	      } else {
            	        resizer.hide();
            	      }
            	    }

            	    editor.on('selectionChange', selectionChange);

            	    editor.on('getData', function(e) {
            	      var html = e.data.dataValue || '';
            	      html = html.replace(/<div id="ckimgrsz"([\s\S]*?)<\/div>/i, '');
            	      html = html.replace(/\b(ckimgrsz)\b/g, '');
            	      e.data.dataValue = html;
            	    });

            	    editor.on('beforeUndoImage', function() {
            	      // Remove the handles before undo images are saved
            	      resizer.hide();
            	    });

            	    editor.on('afterUndoImage', function() {
            	      // Restore the handles after undo images are saved
            	      selectionChange();
            	    });

            	    editor.on('blur', function() {
            	      // Remove the handles when editor loses focus
            	      resizer.hide();
            	    });

            	    editor.on('beforeModeUnload', function self() {
            	      editor.removeListener('beforeModeUnload', self);
            	      resizer.hide();
            	    });

            	    // Update the selection when the browser window is resized
            	    var resizeTimeout;
            	    editor.window.on('resize', function() {
            	      // Cancel any resize waiting to happen
            	      clearTimeout(resizeTimeout);
            	      // Delay resize to "debounce"
            	      resizeTimeout = setTimeout(selectionChange, 50);
            	    });
            	  }

            	  function Resizer(editor, cfg) {
            	    this.editor = editor;
            	    this.window = editor.window.$;
            	    this.document = editor.document.$;
            	    this.cfg = cfg || {};
            	    this.init();
            	  }

            	  Resizer.prototype = {
            	    init: function() {
            	      var container = this.container = this.document.createElement('div');
            	      container.id = 'ckimgrsz';
            	      this.preview = this.document.createElement('span');
            	      container.appendChild(this.preview);
            	      var handles = this.handles = {
            	        tl: this.createHandle('tl'),
            	        tm: this.createHandle('tm'),
            	        tr: this.createHandle('tr'),
            	        lm: this.createHandle('lm'),
            	        rm: this.createHandle('rm'),
            	        bl: this.createHandle('bl'),
            	        bm: this.createHandle('bm'),
            	        br: this.createHandle('br')
            	      };
            	      for (var n in handles) {
            	        container.appendChild(handles[n]);
            	      }
            	    },
            	    createHandle: function(name) {
            	      var el = this.document.createElement('i');
            	      el.classList.add(name);
            	      return el;
            	    },
            	    isHandle: function(el) {
            	      var handles = this.handles;
            	      for (var n in handles) {
            	        if (handles[n] === el) return true;
            	      }
            	      return false;
            	    },
            	    show: function(el) {
            	      this.el = el;
            	      if (this.cfg.snapToSize) {
            	        this.otherImages = toArray(this.document.getElementsByTagName('img'));
            	        this.otherImages.splice(this.otherImages.indexOf(el), 1);
            	      }
            	      var box = this.box = getBoundingBox(this.window, el);
            	      positionElement(this.container, box.left, box.top);
            	      this.document.body.appendChild(this.container);
            	      this.el.classList.add('ckimgrsz');
            	      this.showHandles();
            	    },
            	    hide: function() {
            	      // Remove class from all img.ckimgrsz
            	      var elements = this.document.getElementsByClassName('ckimgrsz');
            	      for (var i = 0; i < elements.length; ++i) {
            	        elements[i].classList.remove('ckimgrsz');
            	      }
            	      this.hideHandles();
            	      if (this.container.parentNode) {
            	        this.container.parentNode.removeChild(this.container);
            	      }
            	    },
            	    initDrag: function(e) {
            	      if (e.button !== 0) {
            	        //right-click or middle-click
            	        return;
            	      }
            	      var resizer = this;
            	      var drag = new DragEvent(this.window, this.document);
            	      drag.onStart = function() {
            	        resizer.showPreview();
            	        resizer.isDragging = true;
            	        resizer.editor.getSelection().lock();
            	      };
            	      drag.onDrag = function() {
            	        resizer.calculateSize(this);
            	        resizer.updatePreview();
            	        var box = resizer.previewBox;
            	        resizer.updateHandles(box, box.left, box.top);
            	      };
            	      drag.onRelease = function() {
            	        resizer.isDragging = false;
            	        resizer.hidePreview();
            	        resizer.hide();
            	        resizer.editor.getSelection().unlock();
            	        // Save an undo snapshot before the image is permanently changed
            	        resizer.editor.fire('saveSnapshot');
            	      };
            	      drag.onComplete = function() {
            	        resizer.resizeComplete();
            	        // Save another snapshot after the image is changed
            	        resizer.editor.fire('saveSnapshot');
            	      };
            	      drag.start(e);
            	    },
            	    updateHandles: function(box, left, top) {
            	      left = left || 0;
            	      top = top || 0;
            	      var handles = this.handles;
            	      positionElement(handles.tl, -3 + left, -3 + top);
            	      positionElement(handles.tm, Math.round(box.width / 2) - 3 + left, -3 + top);
            	      positionElement(handles.tr, box.width - 4 + left, -3 + top);
            	      positionElement(handles.lm, -3 + left, Math.round(box.height / 2) - 3 + top);
            	      positionElement(handles.rm, box.width - 4 + left, Math.round(box.height / 2) - 3 + top);
            	      positionElement(handles.bl, -3 + left, box.height - 4 + top);
            	      positionElement(handles.bm, Math.round(box.width / 2) - 3 + left, box.height - 4 + top);
            	      positionElement(handles.br, box.width - 4 + left, box.height - 4 + top);
            	    },
            	    showHandles: function() {
            	      var handles = this.handles;
            	      this.updateHandles(this.box);
            	      for (var n in handles) {
            	        handles[n].style.display = 'block';
            	      }
            	    },
            	    hideHandles: function() {
            	      var handles = this.handles;
            	      for (var n in handles) {
            	        handles[n].style.display = 'none';
            	      }
            	    },
            	    showPreview: function() {
            	      this.preview.style.backgroundImage = 'url("' + this.el.src + '")';
            	      this.calculateSize();
            	      this.updatePreview();
            	      this.preview.style.display = 'block';
            	    },
            	    updatePreview: function() {
            	      var box = this.previewBox;
            	      positionElement(this.preview, box.left, box.top);
            	      resizeElement(this.preview, box.width, box.height);
            	    },
            	    hidePreview: function() {
            	      var box = getBoundingBox(this.window, this.preview);
            	      this.result = {width: box.width, height: box.height};
            	      this.preview.style.display = 'none';
            	    },
            	    calculateSize: function(data) {
            	      var box = this.previewBox = {top: 0, left: 0, width: this.box.width, height: this.box.height};
            	      if (!data) return;
            	      var attr = data.target.className;
            	      if (~attr.indexOf('r')) {
            	        box.width = Math.max(32, this.box.width + data.delta.x);
            	      }
            	      if (~attr.indexOf('b')) {
            	        box.height = Math.max(32, this.box.height + data.delta.y);
            	      }
            	      if (~attr.indexOf('l')) {
            	        box.width = Math.max(32, this.box.width - data.delta.x);
            	      }
            	      if (~attr.indexOf('t')) {
            	        box.height = Math.max(32, this.box.height - data.delta.y);
            	      }
            	      //if dragging corner, enforce aspect ratio (unless shift key is being held)
            	      if (attr.indexOf('m') < 0 && !data.keys.shift) {
            	        var ratio = this.box.width / this.box.height;
            	        if (box.width / box.height > ratio) {
            	          box.height = Math.round(box.width / ratio);
            	        } else {
            	          box.width = Math.round(box.height * ratio);
            	        }
            	      }
            	      var snapToSize = this.cfg.snapToSize;
            	      if (snapToSize) {
            	        var others = this.otherImages;
            	        for (var i = 0; i < others.length; i++) {
            	          var other = getBoundingBox(this.window, others[i]);
            	          if (Math.abs(box.width - other.width) <= snapToSize && Math.abs(box.height - other.height) <= snapToSize) {
            	            box.width = other.width;
            	            box.height = other.height;
            	            break;
            	          }
            	        }
            	      }
            	      //recalculate left or top position
            	      if (~attr.indexOf('l')) {
            	        box.left = this.box.width - box.width;
            	      }
            	      if (~attr.indexOf('t')) {
            	        box.top = this.box.height - box.height;
            	      }
            	    },
            	    resizeComplete: function() {
            	      resizeElement(this.el, this.result.width, this.result.height);
            	    }
            	  };

            	  function DragEvent(window, document) {
            	    this.window = window;
            	    this.document = document;
            	    this.events = {
            	      mousemove: bind(this.mousemove, this),
            	      keydown: bind(this.keydown, this),
            	      mouseup: bind(this.mouseup, this)
            	    };
            	  }

            	  DragEvent.prototype = {
            	    start: function(e) {
            	      e.preventDefault();
            	      e.stopPropagation();
            	      this.target = e.target;
            	      this.attr = e.target.className;
            	      this.startPos = {x: e.clientX, y: e.clientY};
            	      this.update(e);
            	      var events = this.events;
            	      this.document.addEventListener('mousemove', events.mousemove, false);
            	      this.document.addEventListener('keydown', events.keydown, false);
            	      this.document.addEventListener('mouseup', events.mouseup, false);
            	      this.document.body.classList.add('dragging-' + this.attr);
            	      this.onStart && this.onStart();
            	    },
            	    update: function(e) {
            	      this.currentPos = {x: e.clientX, y: e.clientY};
            	      this.delta = {x: e.clientX - this.startPos.x, y: e.clientY - this.startPos.y};
            	      this.keys = {shift: e.shiftKey, ctrl: e.ctrlKey, alt: e.altKey};
            	    },
            	    mousemove: function(e) {
            	      this.update(e);
            	      this.onDrag && this.onDrag();
            	      if (e.which === 0) {
            	        //mouse button released outside window; mouseup wasn't fired (Chrome)
            	        this.mouseup(e);
            	      }
            	    },
            	    keydown: function(e) {
            	      //escape key cancels dragging
            	      if (e.keyCode === 27) {
            	        this.release();
            	      }
            	    },
            	    mouseup: function(e) {
            	      this.update(e);
            	      this.release();
            	      this.onComplete && this.onComplete();
            	    },
            	    release: function() {
            	      this.document.body.classList.remove('dragging-' + this.attr);
            	      var events = this.events;
            	      this.document.removeEventListener('mousemove', events.mousemove, false);
            	      this.document.removeEventListener('keydown', events.keydown, false);
            	      this.document.removeEventListener('mouseup', events.mouseup, false);
            	      this.onRelease && this.onRelease();
            	    }
            	  };

            	  //helper functions
            	  function toArray(obj) {
            	    var len = obj.length, arr = new Array(len);
            	    for (var i = 0; i < len; i++) {
            	      arr[i] = obj[i];
            	    }
            	    return arr;
            	  }

            	  function bind(fn, ctx) {
            	    if (fn.bind) {
            	      return fn.bind(ctx);
            	    }
            	    return function() {
            	      fn.apply(ctx, arguments);
            	    };
            	  }

            	  function positionElement(el, left, top) {
            	    el.style.left = String(left) + 'px';
            	    el.style.top = String(top) + 'px';
            	  }

            	  function resizeElement(el, width, height) {
            	    el.style.width = String(width) + 'px';
            	    el.style.height = String(height) + 'px';
            	  }

            	  function getBoundingBox(window, el) {
            	    var rect = el.getBoundingClientRect();
            	    return {
            	      left: rect.left + window.pageXOffset,
            	      top: rect.top + window.pageYOffset,
            	      width: rect.width,
            	      height: rect.height
            	    };
            	  };
                return;
            }
            
            //Return if file is not an image
            var fileType = file["type"];

            var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];
            if (ValidImageTypes.indexOf(fileType) < 0){
            	return;
            }
            //Read file as data url (base64) and insert it as an image
            var fr = new FileReader();
            fr.onload = (function(f) { return function(e) {
				insertImage(e.target.result);
			}; })(file);
            fr.readAsDataURL(file);
        }

        function insertImage(source) {
            var elem = editor.document.createElement('img', {
                attributes: {
                    src: source
                }
            });
            editor.insertElement(elem);
        }

        CKEDITOR.on('instanceReady', function() {
        	var iframeBase = document.querySelector('iframe').contentDocument.querySelector('html');
            var iframeBody = iframeBase.querySelector('body');

            iframeBody.ondragover = doNothing;
            iframeBody.ondrop = dropHandler;

            paddingToCenterBody = ((iframeBase.offsetWidth - iframeBody.offsetWidth) / 2) + 'px';
            iframeBase.style.height = '100%';
            iframeBase.style.width = '100%';
            iframeBase.style.overflowX = 'hidden';

            iframeBody.style.height = '100%';
            iframeBody.style.margin = '0';
            iframeBody.style.paddingLeft = paddingToCenterBody;
            iframeBody.style.paddingRight = paddingToCenterBody;
        });
    }
});
