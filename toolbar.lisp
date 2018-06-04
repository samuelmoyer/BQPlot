(in-package :cljw)

(defclass-widget-register toolbar (domwidget)
  ((figure :accessor figure
	   :initform (make-instance 'figure)
	   :metadata (:sync t
			    :json-name "figure"
			    *widget-serialization*))
   (%panning :accessor panning
	     :type bool
	     :initform :true
	     :metadata (:sync t
			      :json-name "_panning"))
   (%panzoom :accessor panzoom
	     :initform (make-instance 'pan-zoom)
	     :metadata (:sync t
			      :json-name "_panzoom"
			      *widget serialization*)))
					;TODO: look into non translated variables
   (:default-initargs
    :view-name (unicode "Toolbar")
    :model-name (unicode "ToolbarModel")
    :view-module (unicode "bqplot")
    :model-module (unicode "bqplot")
    :view-module-version *frontend-version*
    :model-module-version *frontend-version*)

  (:metaclass traitlets:traitlet-class))

			      
	   
  
