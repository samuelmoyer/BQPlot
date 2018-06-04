(in-package :cljw)

;TODO: def register_interaction and def wrap

(defclass interaction (widget)
  ((types :accessor types
	  :type list
	  :initform nil))
   (:default-initargs
	:view-name (unicode "Interaction")
      :model-name (unicode "BaseModel")
      :view-module (unicode "bqplot")
      :model-name (unicode "bqplot")
      :view-module-version *frontend-version*
      :model-module-version *frontend-version*
      :ipython-display nil)
   
  (:metaclass traitlets:traitlet-class))

(defclass hand-draw (interaction)
  ((lines :accessor lines
	  :initform (make-instance 'lines)
	  :metadata (:sync t
			   :json-name "lines"
			   *widget-serialization*))
   (line-index :accessor line-index
	       :type integer
	       :initform nil
	       :metadata (:sync t
				:json-name "line_index"))
   (min-x :accessor min-x
	  :type float
	  :initform nil
	  :metadata (:sync t
			   :json-name "min_x"))
   (max-x :accessor max-x
	  :type float
	  :initform nil
	  :metadata (:sync t
			   :json-name "max_x")))
   (:default-initargs
       :view-name (unicode "HandDraw")
     :model-name (unicode "HandDrawModel"))
   
  (:metaclass traitlets:traitlet-class))

(defclass-widget-register pan-zoom (interaction)
  ((allow-pan :accessor allow-pan
	      :type bool
	      :initform :true
	      :metadata (:sync t
			       :json-name "allow_pan"))
   (allow-zoom :accessor allow-zoom
	       :type bool
	       :initform :true
	       :metadata (:sync t
				:json-name "allow_zoom"))
   (scales :accessor scales
	   :type list
	   :initform (list (cons 'trait (cons 'trait (make-instance 'scale))))
	   :metadata (:sync t
			    :json-name "scales"
			    *widget-serialization*)))
   (:default-initargs
    :view-name (unicode "PanZoom")
    :model-name (unicode "PanZoomModel"))

  (:metaclass trailets:traitlet-class))

					;TODO def panzoom
(defclass selector (interaction)
  ((marks :accessor marks
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "marks"
			   *widget-serialization*)))
   (:default-initargs
    :view-name (unicode "Selector"))
   
  (:metaclass traitlets:traitlet-class))

					;TODO: def reset

(defclass one-d-selector (selector)
  ((scale :accessor scale
	  :initform (make-instance 'scale)
	  :metadata (:sync t
			   :json-name "one-d-selector"
			   :dimension "x"
			   *widget-serialization*)))
   (:default-initargs
    :model-name (unicode "OneDSelectorModel"))

  (:metaclass traitlets:trailet-class))

(defclass two-d-selector (selector)
  ((x-scale :accessor x-scale
	    :initform (make-instance 'scale)
	    :metadata (:sync t
			     :json-name "x_scale"
			     :dimension "x"
			     *widget-serialization*))
   (y-scale :accessor y-scale
	    :initform (make-instance 'scale)
	    :metadata (:sync t
			     :json-name "y_scale"
			     :dimension "y"
			     *widget-serialization*)))
   (:default-initargs
    :model-name (unicode "TwoDSelectorModel"))
   
  (:metaclass traitlets:traitlet-class))

(defclass fast-interval-selector (one-d-selector)
  ((selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"
			      *array-serialization*))
   (color :accessor color
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "color"))
   (size :accessor size
	 :type float
	 :initform nil
	 :metadata (:sync t
			  :json-name "size")))
   (:default-initargs
       :view-name (unicode "FastIntervalSelector")
     :model-name (unicode "FastIntervalSelectorModel"))
  
  (:metaclass traitlets:trailet-class))

(defclass index-selector (one-d-selector)
  ((selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"
			      *array-serialization*))
   (line-width :accessor line-width
	       :type integer
	       :initform 2
	       :metadata (:sync t
				:json-name "line_width"))
   (color :accessor color
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "color")))
   (:default-initargs
       :view-name (unicode "IndexSelector")
     :model-name (unicode "IndexSelectorModel"))
   
  (:metaclass traitlets:traitlet-class))

(defclass brush-interval-selector (one-d-selector)
  ((brushing :accessor brushing
	     :type bool
	     :initform :false
	     :metadata (:sync t
			      :json-name "brushing"))
   (selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"
			      *array-serialization*))
   (orientation :accessor orientation
		:type unicode
		:initform (unicode "horizontal")
		:metadata (:sync t
				 :json-name "orientation"))
   (color :accessor color
	  :type unicode
	  :initform nil
	  :metadata (:sync t
			   :json-name "color")))
   (:default-initargs
       :view-name (unicode "BrushIntervalSelector")
     :model-name (unicode "BrushIntervalSelectorModel"))

  (:metaclass traitlets:trailet-class))

(defclass brush-selector (two-d-selector)
  ((clear :initarg :clear :accessor clear
	 :type bool
	 :initform :false
	 :metadata (:sync t
			  :json-name "clear"))
  (brushing :initarg :brushing :accessor brushing
	    :type bool
	    :initform :false
	    :metadata (:sync t
			     :json-name "brushing"))
  (selected :initarg :selected :accessor selected
	    :type list
	    :initform nil
	    :metadata (:sync t
			     :json-name "selected"))
  (color :initarg :color :accessor color
	 :type unicode
	 :initform (unicode "")
	 :metadata (:sync t
			  :json-name "color")))
   (:default-initargs
    :view-name (unicode "BrushSelector")
    :model-name (unicode "BrushSelectorModel"))
  
  (:metaclass traitlets:trailet-class))

					;TODO: def selected-changed
(defclass multi-selector (brush-interval-selector)
  ((names :initarg :names :accessor names
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "names"))
   (selected :initarg :selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"))
   (%selected :initarg :%selected :accessor %selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "_selected"))
   (show-names :initarg :show-names :accessor show-names
	       :type bool
	       :initform :true
	       :metadata (:sync t
				:json-name "show_names")))
   (:default-initargs
    :view-name (unicode "MultiSelector")
    :model-name (uncode "MultiSelectorModel"))
    
  (:metaclass traitlets:traitlet-class))

;TODO: def hidden_selected_changed

(defclass lasso-selector (two-d-selector)
  ((color :accessor color
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "color"))
   (:defualt-initargs
       :view-name (unicode "LassoSelector")
    :model-name (unicode "LassoSelectorModel")))

  (:metaclass traitlets:traitlet-class))
