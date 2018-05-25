(in-package :cljw)

(defclass base-axis (widget)
  ((axis-types :accessor axis-types
	       :type list
	       :initform nil)
   (:default-initargs
    :view-module (unicode "bqplot")
     :model-module (unicode "bqplot")
     :view-module-version *frontend-version*
     :model-module-version *frontend-version*))
  
   (:metaclass traitlets:traitlet-class))

(defclass axis (base-axis)
  ((icon :accessor icon
	 :type unicode
	 :initform (unicode "fa-arrows"))	 
   (orientation :accessor orientation
		:type unicode
		:initform (unicode "horizontal")
		:metadata (:sync t
				 :json-name "orientation"))   
   (side :accessor side
	 :type unicode
	 :initform (unicode "")
	 :metadata (:sync t
			  :json-name "side"))
   (label :accessor label
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "label"))
   (grid-lines :accessor grid-lines
	       :type unicode
	       :initform (unicode "solid")
	       :metadata (:sync t
				:json-name "grid_lines"))
   (tick-format :accessor tick-format
		:type unicode
		:initform (unicode "")
		:metadata (:sync t
				 :jsone-name "tick_format"))
   (scale :accessor scale
	  :initform (make-instance 'scale)
	  :metadata (:sync t
			   :json-name "scale"
			   *widget-serialization*))
   (num-ticks :accessor num-ticks
	      :type integer
	      :initform nil
	      :metadata (:sync t
			       :json-name "num_ticks"))
   (tick-values :accesor tick-values
		:type list
		:initform nil
		:metadata (:sync t
				 :json-name "tick_values"
				 *array-serialization*))
   (offset :accessor offset
	   :type list
	   :initform ()
	   :metadata (:sync t
			    :json-name "offset"
			    *array-serialization*))
   (label-location :accessor label-location
		   :type unicode 
		   :initform (unicode "middle")
		   :metadata (:sync t
				    :json-name "label_location"))
   (label-color :accessor label-color
		:type unicode
		:initform (unicode "")
		:metadata (:sync t
				 :json-name "label_color"))
   (grid-color :accessor grid-color
	       :type unicode
	       :initform (unicode "")
	       :metadata (:sync t
				:json-name "grid_color"))
   (color :accessor color
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "color"))
   (label-offset :accessor label-offset
		 :type unicode
		 :initform (unicode "")
		 :metadata (:sync t
				  :json-name "label_offset"))
   (visible :accessor visible
	    :type bool
	    :initform :true
	    :metadata (:sync t
			     :json-name "visible"))
   (tick-style :accessor tick-style
	       :type list
	       :initform nil
	       :metadata (:sync t
				:json-name "tick_style"))
   (%ipython-display :accessor ipython-display
		     :initform nil
		     
   (:default-initargs
       :view-name (unicode "Axis")
     :model-name (unicode "AxisModel")))

   (:metaclass traitlets:traitlet-class))

(defclass color-axis (axis)
  ((orientation :accessor orientation
		:type unicode
		:initform (unicode "horizontal")
		:metadata (:sync t
				 :json-name "orientation"))
   (side :accessor side
	 :type unicode
	 :initform (unicode "bottom")
	 :metadata (:sync t
			 :json-name "side"))
   (label :accessor label
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "label"))
   (scale :accessor scale
	  :initform (make-instance 'scale)
	  :metadata (:sync t
			   :json-name "scale"
			   *widget-serialization*))
   (:default-initargs
       :view-name (unicode "ColorAxis")
     :model-name (unicode "ColorAxisModel")))

  (:metaclass traitlets:traitlet-class))
     
(defmethod widget-slot-value ((w widget) slot-name)
  (slot-value w slot-name))
