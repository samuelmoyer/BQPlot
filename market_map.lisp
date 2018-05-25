(in-package :cljw)

(defclass market-map (domwidget)
  ((names :initarg :name :accessor names
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "names"
			   *array-serialization*))
   (groups :initarg :groups :accessor groups
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "groups"
			    *array-serialization*))
   (display-text :initarg :display-text :accessor display-text
		 :type list
		 :initform nil
		 :metadata (:sync t
				  :json-name "display_text"
				  *array-serialization*))
   (ref-data :initarg :ref-data :accessor ref-data
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "ref_data"
			      *dataframe-serialization*))
   (title :initarg :title :accessor title
	  :type unicode
	  :initform (unicode "")
	  :metadata (:sync t
			   :json-name "title"))
   (tooltip-fields :initarg :tooltip-fields :accessor tooltip-fields
		   :type list
		   :initform nil
		   :metadata (:sync t
				    :json-name "tooltip_fields"))
   (tooltip-formats :initarg :tooltip-formats :accessor tooltip-formats
		    :type list
		    :initform nil
		    :metadata (:sync t
				     :json-name "tooltip_formats"))
   (show-groups :initarg :showgroups :accessor show-groups
		:type bool
		:initform :false
		:metadata (:sync t
				 :json-name "show_groups"))
   (cols :initarg :cols :accessor cols
	 :type integer
	 :initform nil
	 :metadata (:sync t
			  :json-name "cols"))
   (rows :initarg :rows :accessor rows
	 :type integer
	 :initform nil
	 :metadata (:sync t
			  :json-name "row"))
   (row-groups :initarg :row-groups :accessor row-groups
	       :type integer
	       :initform 1
	       :metadata (:sync t
				:json-name "row_groups"))
   (colors :initarg :colors :accessor colors
	   :type list
	   :initform CATEGORY10
	   :metadata (:sync t
			    :json-name "colors"))
   (scales :initarg :scales :accessor scales
	   :type list
	   :initform nil
	   :metadta (:sync t
			   :json-name "scales"
			   *widget-serialization*))
   (axes :initarg :axes :accessor axes
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "axes"
			  *widget-serialization*))
   (color :initarg :color :accessor color
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "color"
			   *widget-serialization*))
   (map-margin :initarg :map-margin :accessor map-margin
	       :type list
	       :initform (list (cons top 50)
			       (cons right 50)
			       (cons left 50)
			       (cons bottom 50))
	       :metadata (:sync t
				:json-name "map_margin"))
   (layout :initarg :layout :accessor layout
	   :type list
	   :initform (list (cons min_width "125px"))
	   :metadata (:sync t
			    :json-name "layout"
			    *widget-serialization*))
   (min-aspect-ratio :initarg :min-aspect-ratio :accessor min-aspect-ratio
		     :type float
		     :initform 1.0
		     :metadata (:sync t
				      :json-name "min_aspect_ratio"))
   (max-aspect-ratio :initarg :max-aspect-ratio :accessor max-aspect-ratio
		     :type float
		     :initform 6.0
		     :metadata (:sync t
				      :json-name "max_aspect_ratio"))
   (stroke :initarg :stroke :accessor stroke
	   :type unicode
	   :initform (unicode "white")
	   :metadata (:sync t
			    :json-name "stroke"))
   (group-stroke :initarg :group-stroke :accessor group-stroke
		 :type unicode
		 :initform (unicode "black")
		 :metadata (:sync t
				  :json-name "group_stroke"))
   (selected-stroke :initarg :selected-stroke :accessor selected-stroke
		    :type unicode
		    :initform (unicode "dodgerblue")
		    :metadata (:sync t
				     :json-name "slected_stroke"))
   (hovered-stroke :initarg :hovered-stroke :accessor hovered-stroke
		   :type unicode
		   :initform (unicode "orangered")
		   :metadata (:sync t
				    :json-name "hovered_stroke"))
   (font-style :initarg :font-style :accessor font-style
	       :type list
	       :initform nil
	       :metadata (:sync t
				:json-name "font_style"))
   (title-style :initarg :title-style :accessor title-style
		:type list
		:initform nil
		:metadata (:sync t
			         :json-name "title_style"))
   (selected :initarg :selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"))
   (enable-hover :initarg :enable-hover :accessor enable-hover
		 :type bool
		 :initform :true
		 :metadata (:sync t
				  :json-name "enable_hover"))
    (enable-select :initarg :enable-select :accessor enable-select
		 :type bool
		 :initform :true
		 :metadata (:sync t
				  :json-name "enable_select"))
   (tooltip-widget :initarg :tooltip-widget :accessor tooltip-widget
		   :initform (make-instance 'domwidget)
		   :metadata (:sync t
				    :json-name "tooltip_widget"
				    *widget-serialization*))
   (:initargs
    :view-name (unicode "MarketMap")
    :model-name (unicode "MarketMapModel")
    :view-module (unicode "bqplot")
    :model-module (unicode "bqplot")
    :view-module-version *frontend-version*
    :model-module-version *frontend-version*))

  (:metaclass traitlets:traitlet-class))

;TODO def on_hover def _handle_custom_msgs def _compare

(defclass square-marekt-map (market-map)
  ((margin :accessor margin
	   :type list
	   :initform (list (cons top 50)
			       (cons right 50)
			       (cons left 50)
			       (cons bottom 50))
	   :metadata (:sync t
			    :json-name "margin"))
   (data :accessor data
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "data"))
   (mode :accessor mode
	 :type unicode
	 :initform (unicode "squarify")
	 :metadata (:sync t
			  :json-name "mode"))
   (:initargs
    :view-name (unicode "SquareMarketMap")))
  
  (:metaclass traitlets:trailet-class))

		   
		   
		 
	   
   
	   
      
