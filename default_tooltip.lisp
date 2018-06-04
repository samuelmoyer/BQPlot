(in-package :cljw)

(defclass tooltip (domwidget)
  ((fields :accessor fields
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "fields"))
   (formats :accessor formats
	    :type list
	    :initform nil
	    :metadata (:sync t
			     :json-name "formats"))
   (show-labels :accessor show-labels
		:type bool
		:initform :true
		:metadata (:sync t
				 :json-name "show_labels"))
   (labels :accessor labels
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "labels")))
   (:default-initargs
    :view-name (unicode "Tooltip")
    :model-name (unicode "TooltipModel")
    :view-module (unicode "bqplot")
    :model-module (unicode "bqplot")
    :view-module-version *frontend-version*
    :model-module-version *frontend-version*)

  (:metaclass traitlets:trailet-class))

		
