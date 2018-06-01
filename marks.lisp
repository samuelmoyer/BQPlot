(in-package :cljw)

					;TODO: register_mark, wrap, shape 

(defclass mark (widget)
  ((mark-types :initarg :mark-types :accessor mark-types
	       :type list
	       :initform nil)
   (scales :initarg :scales :accessor scales
	   :type list
	   :initform  (list (cons ('trait (make-instance 'scale))))
	   :validator %validate-scales
	   :metadata (:sync t
			    :json-name "scales"
			    *widget-serialization*))
   (scales-metadata :initarg :scales-metadata :accessor scales-metadata
		    :type list
		    :initform nil
		    :metadata (:sync t
				     :json-name "scales_metadata"))
   (preserve-domain :initarg :preserve-domain :accessor preserve-domain
		    :type list
		    :initform nil
		    :metadata (:sync t
				     :json-name "preserve_domain"))
   (display-legend :initarg :display-legend :accessor display-legend
		   :type bool
		   :initform :false
		   :metadata (:sync t
				    :json-name "display_legend"
				    :display-name "Display legend"))
   (labels :initarg :labels :accessor labels
	   :type list
	   :initform (list (cons ('trait (unicode ""))))
	   :metadata (:sync t
			    :json-name "labels"
			    :display-name "Labels"))
   (apply-clip :initarg :apply-clip :accessor apply-clip
	       :type bool
	       :initform :true
	       :metadata (:sync t
				:json-name "apply_clip"))
   (visible :initarg :visible :accessor visible
	    :type bool
	    :initform :true
	    :metadata (:sync t
			     :json-name "visible"))
   (selected-style :initarg :selected-style :accessor selected-style
		   :type list
		   :initform nil
		   :metadata (:sync t
				    :json-name "selected_style"))
   (unselected-style :initarg :unselected-style :accessor unselected-style
		    :type list
		    :initform nil
		    :metadata (:sync t
				     :json-name "unselected_style"))
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

   (tooltip :initarg :tooltip :accessor tooltip
	    :initform (make-instance 'domwidget)
	    :metadata (:sync t
			     :json-name "tooltip"
			     *widget-serialization*))
   (tooltip-style :initarg :tooltip-style :accessor tooltip-style
		  :type list
		  :initform (list (cons ("opacity" 0.9)))
		  :metadata (:sync t
				   :json-name "tooltip_style"))
   (interactions :initarg :interactions :accessor interactions
		 :type list
		 :initform (list (cons ("hover" "tooltip")))
		 :metadata (:sync t
				  :json-name "interactions"))
   (tooltip-location :initarg :tooltip-location :accessor tooltip-location
		     :type unicode
		     :initform (unicode "mouse")
		     :metadata (:sync t
				      :json-name "tooltip_location"))
   (:default-initargs
       :model-name (unicode "MarkModel")
     :model-module (unicode "bqplot")
     :view-module (unicode "bqplot")
     :view-module-version *frontend-version*
     :model-module-version *frontend-version*
     :ipython-display nil)))


(defmethod %get-dimension-scales ((self mark) dimension &key (preserve-domain nil))
  (let ((ret nil))
    (if preserve-domain
        (loop for (k . v) in (scales self)
           do
             (when (and
                    (and
                     (assoc k (scales-metadata self) :test #'string=)
                     (= (getf (assoc k (scales-metadata self) :test #'string=) ':dimension) dimension))
                    (not (getf (preserve-domain self) k)))
               (push k ret)))
        (loop for (k . v) in (scales self)
           do
             (when (and
                    (assoc k (scales-metadata self) :test #'string=)
                    (= (getf (assoc k (scales-metadata self) :test #'string=) ':dimension) dimension))
               (push k ret))))
    ret))

(defmethod %validate_scales (object val)
  

					;TODO:
					;def get-dimension-scales
					;def validate-scales
					;def on-hover             Callback
					;def on-click             Callback
					;def on-legend-click      Callback
					;def on-legen-hover       Callback
					;def on-element-click     Callback
					;def on-background-click  Callback
					;def handle-custom-msgs
(defclass lines (mark)
  (icon :accessor icon
	:type string
	:initform "fa-line-chart")
  (icon :accessor name
	:type string
	:initform "Lines"
   (x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
      	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (color :accessor color
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "color"
		       :scaled t
		       :rtype "Color"
		       :atype "bqplot.ColorAxis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
  (scales-metadata :accessor scales-metadata
      :type list
      :initform (list (cons "x" (list (cons "orientation" "horizontal")
				      (cons "dimension" "x")))
		      (cons "y" (list (cons "orientation" "vertical")
				      (cons "dimension" "y"))))
      :metadata (:sync t
		       :json-name "scales_metadata"))
   (colors :accessor colors
	   :type list
	   :initform (list (cons 'trait (unicode "")(cons 'default-value CATEGORY10)))
	   :metadata (:sync t
			    :json-name "colors"
			    :display-name "colors"))
   (fill-colors :accessor fill-colors
		:type list
		:initform (list (cons 'trait (unicode "")))
		:metadata (:sync t
				 :json-name "fill_colors"
				 :display-name "Fill colors"))
   (stroke-width :accessor stroke-width
		 :type float
		 :initform 2.0
		 :metadata (:sync t
				  :json-name "stroke_width"
				  :display-name "Stroke width"))
   (labels-visibility :accessor labels-visibility
		      :type unicode
		      :initform (unicode "none")
		      :metadata (:sync t
				       :json-name "labels_visibility"
				       :display-name "Labels visibility"))
   (curves-subset :accessor curves-subset
		  :type list
		  :initform nil
		  :metadata (:sync t
				   :json-name "curves_subset"))
   (line-style :accessor line-style
	       :type unicode
	       :initform (unicode "solid")
	       :metadata (:sync t
				:json-name "line_style"
				:display-name "Line style"))
   (interpolation :accessor interpolation
		  :type unicode 
		  :initform (unicode "linear")
		  :metadata (:sync t
				   :json-name "interpolation"
				   :display-name "Interpolation"))
   (close-path :accessor close-path
	       :type bool
	       :initform :false
	       :metadata (:sync t
				:json-name "close_path"
				:display-name "Close path"))
   (fill :accessor fill
	 :type unicode
	 :initform (unicode "none")
	 :metadata (:sync t
			  :json-name "fill"
			  :display-name "Fill"))
   (marker :accessor marker
	   :type unicode
	   :initform nil
	   :metadata (:sync t
			    :json-name "marker"
			    :display-name "Marker"))
   (marker-size :accessor marker-size
		:type int
		:initform 64
		:metadata (:sync t
				 :json-name "marker_size"
				 :display-name "Default size"))
   (opacities :accessor opacities
	      :type list
	      :initform nil
	      :metadata (:sync t
			       :json-name "opacities"
			       :display-name "Opacity"))
   (fill-opacities :accessor fill-opacities
		   :type list
		   :initform nil
		   :metadata (:sync t
				    :json-name "fill_opacities"
				    :display-name "Fill Opacity"))
   (:default-initargs
       :view-name (unicode "Lines")
     :model-name (unicode "LinesModel"))))

(defclass flex-line (mark)
  ((x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
      	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (color :accessor color
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "color"
		       :scaled t
		       :rtype "Color"
		       :atype "bqplot.ColorAxis"
		       *array-serialization*))
					;TODO: .valid(array_squeeze)
    (width :accessor width
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "width"
			    :scaled t
			    :rtype "Number"
			    *array-serialization*))
   	;TODO: .valid(array_squeeze)
  (scales-metadata :accessor scales-metadata
		   :type list
		   :initform (list (cons "x" (list (cons "orientation" "horizontal")
						   (cons "dimension" "x")))
				   (cons "y" (list (cons "orientation" "vertical")
						   (cons "dimension" "y")))
				   (cons "color" (cons "dimension" "color")))
      :metadata (:sync t
		       :json-name "scales_metadata"))
   (stroke-width :accessor stroke-width
		 :type float
		 :initform 1.5
		 :metadata (:sync t
				  :json-name "stroke_width"
				  :display-name "Stroke width"))
   (colors :accessor colors
	   :type list
	   :initform (list (cons 'trait (unicode "")(cons 'default-value CATEGORY10)))
	   :metadata (:sync t
			    :json-name "colors"))
   (:default-initargs
       :view-name (unicode "FlexLine")
     :model-name (unicode "FlexLineModel"))))

(defclass %scatter-base (mark)
  ((x :initarg :x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
      	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (y :initarg :y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (color :initarg :color :accessor color
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "color"
			   :scaled t
			   :rtype "Color"
			   :atype "bqplot.ColorAxis"
			   *array-serialization*))
					;TODO: .valid(array_squeeze)
    (opacity :initarg :opacity :accessor opacity
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "width"
			      :scaled t
			      :rtype "Number"
			      *array-serialization*))
   (size :initarg :size :accessor size
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "size"
			  :scaled t
			  :rtype "Number"
			  *array-serialization*))
   (rotation :initarg :rotation :accessor rotation
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "rotation"
			      :scaled t
			      :rtype "Number"
			      *array-serialization*))
   	;TODO: .valid(array_squeeze)
   (scales-metadata :initarg :scales-metadata :accessor scales-metadata
		    :type list
		    :initform (list (cons "x" (list (cons "orientation" "horizontal")
						   (cons "dimension" "x")))
				    (cons "y" (list (cons "orientation" "vertical")
						   (cons "dimension" "y")))
				    (cons "color" (cons "dimension" "color"))
				    (cons "size" (cons "dimension" "size"))
				    (cons "opacity" (cons "dimension" "opacity"))
				    (cons "rotation" (cons "dimension" "rotation")))
		    :metadata (:sync t
				     :json-name "scales_metadata"))
   
					;TODO: default-opacities
   
   (hovered-style :initarg :hovered-style :accessor hovered-style
		  :type list
		  :initform nil
		  :metadata (:sync t
				   :json-name "hovered_style"))
   (unhovered-style :initarg :unhovered-style :accessor unhovered-style
		    :type list
		    :initform nil
		    :metadata (:sync t
				     :json-name "unhovered_style"))
   (hovered-point :initarg :hovered-point :accessor hovered-point
		  :type int
		  :initform nil
		  :metadata (:sync t
				   :json-name "hovered-point"))
   (enable-move :initarg :enable-move :accessor enable-move
		:type bool
		:initform :false
		:metadata (:sync t
				 :json-name "enable-move"))
   (enable-delete :initarg :enable-delete :accessor enable-delete
		  :type bool
		  :initform :false
		  :metadata (:sync t
				   :json-name "enable-delete"))
   (restrict-x :initarg :restrict-x :accessor restrict-x
	       :type bool
	       :initform :false
	       :metadata (:sync t
				:json-name "restrict-x"))
   (restrict-y :initarg :restrict-y :accessor restrict-y
	       :type bool
	       :initform :false
	       :metadata (:sync t
				:json-name "restrict-y"))
   (update-on-move :initarg :update-on-move :accessor update-on-move
		   :type bool
		   :initform :false
		   :metadata (:sync t
				    :json-name "update-on-move"))))

   
					;TODO: def methods
					;3 callbacks, 1 handle custom messages

(defclass scatter (%scatter-base)
  ((icon :accessor icon
	   :type string
	   :initform "fa-cloud")
   (name :accessor name
	   :type string
	   :initform "Scatter")
   (skew :accessor skew
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "skew"
			  :scaled t
			  :rtype "Number"
			  *array-serialization*))
					;TODO: .valid stuff
   (marker :accessor marker
	   :type list
	   :initform (unicode "circle")
	   :metadata (:sync t
			    :json-name "colors"
			    :display-name "Marker"))
   (colors :accessor colors
	   :type list
	   :initform (list (cons 'trait (unicode "")(cons 'default-value "steelblue")))
	   :metadata (:sync t
			    :json-name "colors"
			    :display-name "Colors"))
   (scales-metadata :accessor scales-metadata
		    :type list
		    :initform (list (cons "x" (list (cons "orientation" "horizontal")
						   (cons "dimension" "x")))
				    (cons "y" (list (cons "orientation" "vertical")
						   (cons "dimension" "y")))
				    (cons "color" (cons "dimension" "color"))
				    (cons "size" (cons "dimension" "size"))
				    (cons "opacity" (cons "dimension" "opacity"))
				    (cons "rotation" (cons "dimension" "rotation"))
				    (cons "skew" (cons "dimension" "skew")))
		    :metadata (:sync t
				     :json-name "scales_metadata"))

;TODO: def some methods (default colors)
   
   (stroke :accessor stroke
	   :type unicode
	   :initform (unicode "")
	   :metadata (:sync t
			    :json-name "stroke"
			    :display-name "Stroke color"))
   (stroke-width :accessor stroke-width
		 :type float
		 :initform 1.5
		 :metadata (:sync t
				  :json-name "stroke_width"
				  :display-name "Stroke width"))
   (default-skew :accessor default-skew
                 :type float
		 :initform 0.5
					;TODO min max validator
		 :metadata (:sync t
				  :json-name "default_skew"))
   (default-size :accessor default-size
                 :type int
		 :initform 64
		 :metadata (:sync t
				  :json-name "default_size"
				  :display-name "Display names"))
   (names :accessor names
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "names"
			   *array-serialization*))
					;TODO: .valid(array_squeeze)
   (display-names :accessor display-names
	   :type bool
	   :initform :true
	   :metadata (:sync t
			    :json-name "display_names"
			    :display-name "Display names"))
   (fill :accessor fill
	 :type bool
	 :initform :true
	 :metadata (:sync t
			  :json-name "fill"))
   (drag-color :accessor drag-color
	   :type unicode
	   :initform (unicode "")
	   :metadata (:sync t
			    :json-name "drag_color"))
   (drag-size :accessor drag-size
	   :type float
	   :initform 5.0
	   :metadata (:sync t
			    :json-name "drag-size"))
   (names-unique :accessor names-unique
	   :type bool
	   :initform :true
	   :metadata (:sync t
			    :json-name "names-unique"))
   (:default-initargs
       :view-name (unicode "Scatter")
     :model-name (unicode "ScatterModel"))))

(defclass label (%scatter-base)
  ((icon :accessor icon
	 :type string
	 :initform "fa-font"
   (name :accessor name
	 :type string
	 :initform "Labels"
   (x-offset :accessor x-offset
	     :type int
	     :initform nil
	     :metadata (:sync t
			      :json-name "x_offset"))
   (y-offset :accessor y-offset
	     :type int
	     :initform nil
	     :metadata (:sync t
			      :json-name "y_offset"))
   (colors :accessor colors
	   :type list
	   :initform (list (cons (trait (unicode "")))(cons 'default-value CATEGORY10))
	   :metadata (:sync t
			    :json-name "colors"
			    :display-name "Colors"))
   (rotate-angle :accessor rotate-angle
	   :type float
	   :initform nil
	   :metadata (:sync t
			    :json-name "rotate_angle"))
   (text :accessor text
	 :type list
	 :initform nil
	 :metadata (:sync t
			  :json-name "text"
			  *array-serialization*))
					;TODO: valid(array_squeeze)
   (default-size :accessor default-size
                 :type float
		 :initform 16.0
		 :metadata (:sync t
				  :json-name "default_size"))
   (drag-size :accessor drag-size
	      :type float
	      :initform 1.0
	      :metadata (:sync t
			       :json-name "drag_size"))
   (font-unit :accessor font-unit
	      :type unicode
	      :initform (unicode "px")
	      :metadata (:sync t
			       :json-name "font_unit"))
   (font-weight :accessor font-weight
		:type unicode
		:initform (unicode "bold")
		:metadata (:sync t
				 :json-name "font-weight"))
   (align :accessor align
	  :type unicode
	  :initform (unicode "start")
	  :metadata (:sync t
			   :json-name "align"))
   (:default-initargs
       :view-name (unicode "Label")
     :model-name (unicode "LabelModel"))))

(defclass hist (mark)
  ((icon :accessor icon
	 :type string
	 :initform "fa-signal")
   (name :accessor name
	 :type string
	 :initform "Histogram")
   (sample :accessor sample
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "sample"
			    :display-name "Sample"
			    :scaled t
			    :rtype "Number"
			    :atype "bqplot.Axis"
			    *array-serialization*))
					;TODO: .valid stuff
   (count :accessor count
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "count"
			   :display-name "Count"
			   :scaled t
			   :rtype "Number"
			   :atype "bqplot.Axis"))
					;TODO: valid
   (normalized :accessor normalized
	       :type bool
	       :initform :false
	       :metadata (:sync t
				:json-name "normalized"))
   (scales-metadata :accessor scales-metadata
		    :type list
		    :initform (list (cons "sample" (list (cons "orientation" "horizontal")
						   (cons "dimension" "x")))
				    (cons "count" (list (cons "orientation" "vertical")
						   (cons "dimension" "y"))))
		    :metadata (:sync t
				     :json-name "scales_metadata"))
   (bins :accessor bins
	 :type int
	 :initform 10
	 :metadata (:sync t
			  :json-name "bins"
			  :display-name "Number of bins"))
   (midpoints :accessor midpoints
	 :type list
	 :initform nil ;look into this one
	 :metadata (:sync t
			  :json-name "midpoints"
			  :display-name "Mid points"))
   (colors :accessor colors
	 :type list
	 :initform (list (cons 'trait (unicode "")(cons 'default-value CATEGORY10)))
	 :metadata (:sync t
			  :json-name "colors"
			  :display-name "Colors"))
   (stroke :accessor stroke
	 :type unicode
	 :initform (unicode "")
	 :metadata (:sync t
			  :json-name "stroke"))
   (opacities :accessor opacities
	 :type list
	 :initform (list (cons 'trait 1.0))
	 :metadata (:sync t
			  :json-name "opacities"
			  :display-name "Opacities"))
   (:default-initargs
       :view-name (unicode "Hist")
     :model-name (unicode "HistModel"))))

(defclass boxplot (mark)
  ((x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
      	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
  (scales-metadata :accessor scales-metadata
      :type list
      :initform (list (cons "x" (list (cons "orientation" "horizontal")
				      (cons "dimension" "x")))
		      (cons "y" (list (cons "orientation" "vertical")
				      (cons "dimension" "y"))))
      :metadata (:sync t
		       :json-name "scales_metadata"))
   (stroke :accessor stroke
	 :type unicode
	 :initform (unicode "")
	 :metadata (:sync t
			  :json-name "stroke"
			  :display-name "Stroke color"))
   (box-fill-color :accessor box-fill-color
	 :type unicode
	 :initform (unicode "steelblue")
	 :metadata (:sync t
			  :json-name "box_fill_color"
			  :display-name "Fill color for the box"))
   (outlier-fill-color :accessor outlier-fill-color
	 :type unicode
	 :initform (unicode "gray")
	 :metadata (:sync t
			  :json-name "outlier_fill_color"
			  :display-name "Outlier fill color"))
   (opacities :accessor opacities
	 :type list
	 :initform (list (cons 'trait 1.0))
	 :metadata (:sync t
			  :json-name "opacities"
			  :display-name "Opacities"))
   (box-width :accessor box-width
	 :type int
	 :initform 30
	 :metadata (:sync t
			  :json-name "box_width"
			  :display-name "Box Width"))
   (:default-initargs
       :view-name (unicode "Boxplot")
     :model-name (unicode "BoxplotModel"))))

(defclass bars (mark)
  ((x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
      	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
   (color :accessor color
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "color"
		       :scaled t
		       :rtype "Color"
		       :atype "bqplot.ColorAxis"
		       *array-serialization*))
   	;TODO: .valid(array_squeeze, array_dimension_bounds(1, 2))
  (scales-metadata :accessor scales-metadata
      :type list
      :initform (list (cons "x" (list (cons "orientation" "horizontal")
				      (cons "dimension" "x")))
		      (cons "y" (list (cons "orientation" "vertical")
				      (cons "dimension" "y"))))
      :validator 
      :metadata (:sync t
		       :json-name "scales_metadata"))
   (color-mode :accessor color-mode
	 :type unicode
	 :initform (unicode "auto")
	 :metadata (:sync t
			  :json-name "color-mode"))
   (type :accessor type
	 :type unicode
	 :initform (unicode "stacked")
	 :metadata (:sync t
			  :json-name "type"
			  :display-name "Type"))
   (colors :accessor colors
	 :type list
	 :initform (list (cons 'trait (unicode ""))(cons 'default-value "steelblue"))
	 :metadata (:sync t
			  :json-name "colors"
			  :display-name "Colors"))
   (padding :accessor padding
	 :type float
	 :initform 0.05
	 :metadata (:sync t
			  :json-name "padding"))
   (stroke :accessor stroke
	 :type unicode
	 :initform (unicode "")
	 :metadata (:sync t
			  :json-name "stroke"))
   (base :accessor base
	 :type float
	 :initform nil
	 :metadata (:sync t
			  :json-name "base"))
   (opacities :accessor opacities
	 :type list
	 :initform (list (cons trait 1.0))
	 :metadata (:sync t
			  :json-name "opacities"
			  :display-name "Opacities"))
   (align :accessor align
	 :type unicode
	 :initform (unicode "center")
	 :metadata (:sync t
			  :json-name "align"))
   (orientation :accessor orientation
		:type unicode
		:validator %validate-orientation
		:initform (unicode "vertical")
		:metadata (:sync t
				 :json-name "orientation"))
   (:default-initargs
       :view-name (unicode "Bars")
     :model-name (unicode "BarsModel"))))

(defmethod %validate-orientation (object val)
  ((if (equal val (unicode "vertical"))
       ((setf x-orient "horizontal")
	(setf y-orient "vertical"))
       ((setf x-orient "vertical")
	(setf y-orient "horizontal")))
  (setf scales-metadata (list (cons "x" (list (cons "orientation" x-orient )
				      (cons "dimension" "x")))
			      (cons "y" (list (cons "orientation" y-orient)
				      (cons "dimension" "y")))))))


(defclass bins(bars)
  ((icons :icons :initargs :accessor icons
	  :type unicode
	  :initform (unicode "fa-signal"))
   (name :name :initarg :accessor name
	 :type unicode
	 :initform (unicode "Backend Histogram"))

   ;;TODO IS SAMPLES RIGHT 
   (sample :sample :initarg :accessor sample
	   :type list
	   :initform nil 
	   :meatdata (:sync f
			    :json-name "sample"
			    :display-name "Sample"
			    :rtype "Number"
			    :atype "bqplot.Axis"
			    *array-serializaion*))

   (min :initarg :min :accessor min
	:type float
	:initform nil                       ;;can floats initform be nil??
	:metadata (:sync t
			 :json-name "min"))
   (max :initarg :max :accessor max
	:type float
	:initform nil
	:metadata (:sync t
			 :json-name "max"))
   (density :initarg :density :accessor density
	    :type :bool
	    :initform :false
	    :metadata (:sync t
			     :json-name "density"))


   ;; TODO FINISH BINS 
   (bins :bins :initarg :accessor bins
	    :type 
	    :initform 
	    :metadata (:sync t
			     :json-name "bins"
			     :display-name "Number Of Bins"))

   ;;TODO ADD THE METHODS
   ))


(defclass OHLC (mark)
   ((icon :accessor icon
	   :type unicode
	   :initform (unicode "fa-birthday-cake"))
   (name :accessor name
	 :type unicode
	 :initform (unicode "OHLC Chart"))

    (x :accessor x
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "x"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
     (y :accessor y
      :type list
      :initform nil
      :metadata (:sync t
		       :json-name "y"
		       :scaled t
		       :rtype "Number"
		       :atype "bqplot.Axis"
		       *array-serialization*))
   
    (scales-metadata :accessor scales-metadata
		     :type list
		     :initform (list (cons "x" (list (cons "orientation" "horizontal")
						     (cons "dimension" "x")))
				     (cons "y" (list (cons "orientation" "vertical")
						     (cons "dimension" "y"))))
		     :metadata (:sync t
				      :json-name "scales_metadata"))
    (marker :accessor marker
	     :type unicode
	     :initform (unicode "candle")
	     :metadata (:sync t
			      :json-name "marker"
			      :display-name "Marker"))
    (stroke :accessor stroke
	    :type unicode
	    :initform (unicode "")
	    :metadata (:sync t
			     :json-name "stroke"
			     :display-name "Stroke"))
    (stroke-width :accessor stroke-width
	    :type float
	    :initform 1.0
	    :metadata (:sync t
			     :json-name "stroke_width"
			     :display-name "Stroke Width"))
    (colors :accessor colors
	    :type unicode
	    :initform (unicode "")
	    :metadata (:sync t
			     :json-name "colors"
			     :display-name "Colors"))
    (opacities :accessor opacities
	       :type list
	       :initform (list (cons 'trait 1.0))
	       :metadata (:sync t
				:json-name "opacities"
				:display-name "Opacities")
    
    (format :accessor format
	    :type unicode
	    :initform (unicode "ohcl")
	    :metadata (:sync t
			     :json-name "format"
			     :display-name ""
  

    
    (:default-initargs
   :view-name (unicode "OHLC")
    :model-name (unicode "OHLCModel"))
    (:metaclass traitlets:traitlet-class))

(defclass pie (mark)
   ((icon :accessor icon
	   :type unicode
	   :initform (unicode "fa-pie-chart"))
   (name :accessor name
	 :type unicode
	 :initform (unicode "Pie Chart"))
    ;;TODO DONT KNOW WHAT TO DO WITH THE VALID 
    (sizes :accessor sizes
	   :type list
	   :initform nil 
	   :metadata (:sync t
			    :json-name "sizes"
			    :rtype "number"
			    *array-serializaion*))
    (color :accessor color
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name color
			    :scaled t
			    :rtype "Color"
			    :atype = "bqplot.ColorAxis"
			     *array-serializaion*))


    ;;TODO ADD THE X AND Y FROM OTHER ATTRIBUTES
    
    (scales-metadata :accessor scales-metadata
		     :type list
		     :initform (list (cons "colors" (list (cons "dimension" "color"))))
		     :metadata (:sync t
				      :json-name "scales_metadata"))
    (sort :accessor sort
	  :type :bool
	  :initform :false
	  :metadata (:sync t
			   :json-name "sort"))
    (colors :accessor colors
	    :type list
	    :initform (list (cons 'trait (unicode "")(cons 'default-value CATEGORY10)))
	    :metadata (:sync t
			     :json-name "Colors"))
    (stroke :accessor stroke
	    :type unicode
	    :initform (unicode "")
	    :metadata (:sync t
			     :json-name "stroke"))
    (opacities :accessor opacities
	       :type list
	       :initform (list (cons 'trait 1.0))
	       :metadata (:sync t
				:json-name "opacities"
				:display-name "Opacities"))
    
    ;;TODO HOW TO DEAL WITH THE RANGE
    (radius :accessor radius
	    :type float
	    :initform 180.0
	    :metadata (:sync t
			     :json-name "radius"))

    (inner-radius :accessor inner-radius
		  :type float
		  :initform 0.1
		  :metadata (:sync t
				   :json-name "inner_radius"))
    (start-angle :accessor start-angle
		 :type float
		 :initform 0.0
		 :metadata (:sync t
				  :json-name "start_angle"))
     (end-angle :accessor end-angle
		 :type float
		 :initform 360.0
		 :metadata (:sync t
				  :json-name "end_angle"))

    ;;how to handle the default options with enum.
    ;;is it plausibel to use a type list and a validator to chekc if users string is in the default choices 
    (display-labels :accessor diplay-labels
		    :type unicode
		    :initform (unicode "inside")
		    :metadata (:sync t
				     :json-name "display-labels"))

    (display-values :accessor display-values
		    :type :bool
		    :initform :false
		    :metadata (:sync t
				     :json-name "display-values"))
    (values-format :accessor values-format
		   :type unicode
		   :initform (unicode ".1f")
		   :metadata (sync t
				   :json-name "values-format"))
    (label-color :accessor label-color
		 :type unicode
		 :initform (unicode "")
		 :metadata (:sync t
				  :json-name "label-color"))
    (font-size :accessor font-size
	       :type unicode
	       :initform (unicode "10px")
	       :metadata (:sync t
				:json-name "font-size"))

    ;;handle the default options 
    (font-weight :accessor font-weight
		 :type unicode
		 :initform (unicode "normal")
		 :metadata (:sync t
				  :json-name "font-weight")))

  ;;do topo-load method 
  
    (:default-initargs
   :view-name (unicode "Pie")
    :model-name (unicode "PieModel"))
    (:metaclass traitlets:traitlet-class))

(defclass map (mark)
  ((icon :accessor icon
	   :type unicode
	   :initform (unicode "fa-globe"))
   (name :accessor name
	 :type unicode
	 :initform (unicode "Map"))

   ;;check te scale and sync 
   (color :accessor color
	  :type list
	  :initform nil
	  :metadata (:sync t
			   :json-name "color"
			   :scaled t
			   :rtype "Color"
			   :atype = "bqplot.ColorAxis"))
    (scales-metadata :accessor scales-metadata
		     :type list
		     :initform (list (cons "color" (list (cons "dimension" "color"))))
		     :metadata (:sync t
				      :json-name "scales_metadata"))
   (hover-highlight :accessor hover-highlight
		    :type :bool
		    :initform :true
		    :metadata (:sync t
				     :json-name "hover_highlight"))
   (hover-styles :accessor hover-styles
		 :type list
		 :initform  (list (cons "hovered_fill" "Orange")
				  (cons "hovered_stroke" nil)
				  (cons "hovered_stroke_width" 2.0))
		 :metadata (:sync t
				  :json-name "Hovered-styles"))
   (stroke-color :accessor stroke-color
		 :type unicode
		 :initform (unicode "")
		 :metadata (:sync t
				  :json-name "stroke_color"))
   (colors :accessor colors
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "colors"
			    :displa-name "Colors"))
   (scales-metadata :accessor scales-metadata
		    :type list
		    :initform (list (cons "colors" (list (cons "dimension" "color")))
				    (cons "projection" (list (cons "dimension" "geo"))))
		    :metadata (:sync t
				     :json-name "scales_metadata"))
   (selected :accessor selected
	     :type list
	     :initform nil
	     :metadata (:sync t
			      :json-name "selected"))
   (selected-styles :accessor selected-styles
		    :type list
		    :initform (list (cons "selected_fill" "Red")
				    (cons "selected_stroke" nil)
				    (cons "selected-stroke-width" 2.0))
		    :metadata (:sync t
				     :json-name "selected_styles")))
   ;; TODO MAP DATA

     (:default-initargs
   :view-name (unicode "Map")
    :model-name (unicode "MapModel"))
     (:metaclass traitlets:traitlet-class))

(defclass grid-heat-map (mark)

  ;; TODO row col and color need the .valid to be looked at 
  ((row :initarg :row :accessor row
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "row"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (column :initarg :column :accessor column
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "column"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (color :initarg :color :accessor color
	:type list
	:initform nil
	:metadata (:sync t
			 :scaled t
			 :rtype "Color"
                         :atype "bqplot.ColorAxis"
                         *array-serialization*))
   (scales-metadata :initarg :scales-metadata :accessor scales-metadata
		   :type list
		   :initform (list (cons "row" (list (cons "orientation" "vertical")
						     (cons "dimension" "y")))
				   (cons "column" (list (cons "orientation" "horizontal")
						     (cons "dimension" "x")))
				   (cons "color" (list (cons "dimension" "color"))))
		   :metadata (:sync t
				    :json-name "scales-metadata"))

   ;; need to add the default to row and colun 
   (row-align :initarg :row-align :accessor row-align
	      :type unicode
	      :initform (unicode "start")
	      :metadata (:sync t
			       :json-name "row-align"))
   (column-align :initarg :column-align :accessor column-align
	      :type unicode
	      :initform (unicode "start")
	      :metadata (:sync t
			       :json-name "column-align"))
   (null-color :initarg :null-color :accessor null-color
	       :type unicode
	       :initform (unicode "black")
	       :metadata (:sync t
				:json-name "null-color"))
    (stroke :initarg :stroke :accessor stroke
	       :type unicode
	       :initform (unicode "black")
	       :metadata (:sync t
				:json-name "Stroke"))
   (opacity :initarg :opacity :accessor opacity
	    :type float
	    :initform 1.0
	    :metadata (:sync t
			     :json-name "opacity"
			     :display-name "Opacity"))
   (anchor-style :initarg :anchor-style :accessor anchor-style
		 :type list
		 :initform  (list (cons "fill" "white") (cons "stroke" "blue"))
		 :metadata (:sync t
				  :json-name "anchor_style")))
   
 (:default-initargs
   :view-name (unicode "GridHeatMap")
    :model-name (unicode "GridHeatMapModel"))
 (:metaclass traitlets:traitlet-class))

(defclass heat-map (mark)
   ;; TODO row col and color need the .valid to be looked at 
  ((x :initarg :x :accessor x
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "x"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (y :initarg :y :accessor y
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "y"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (color :initarg :color :accessor color
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name color
			 :scaled t
			 :rtype="Color"
                         :atype="bqplot.ColorAxis"
                         *array-serialization*))
   (scales-metadata :initarg :scales-metadata :accessor scales-metadata
		   :type list
		   :initform (list (cons "x" (list (cons "orientation" "horizontal")
						     (cons "dimension" "x")))
				   (cons "y" (list (cons "orientation" "vertical")
						     (cons "dimension" "y")))
				   (cons "color" (list (cons "dimension" "color"))))
		   :metadata (:sync t
				    :json-name "scales_metadata"))
   (null-color :initarg :null-color :accessor null-color
	       :type unicode
	       :initform (unicode "black")
	       :metadata (:sync t
				:json-name "null_color")))
   ;;TODO THE INIT ARG

    (:default-initargs
   :view-name (unicode "HeatMap")
    :model-name (unicode "HeatMapModel"))
    (:metaclass traitlets:traitlet-class))

(defclass graph (mark)
  ((charge :accessor charge
	   :type integer
	   :initform -600
	   :metadata (:sync t
			    :json-name "charge"))
   (link-distance :accessor link-distance
		  :type float
		  :initform 100.0
		  :metadta(:sync t
				 :json-name "link_distance"))
   (node-data :accessor node-data
	      :type list
	      :initform nil
	      :metadata (:sync t
			       :json-name "node_data"))
    (link-data :accessor link-data
	       :type list
	       :initform nil
	       :metadata (:sync t
				:json-name "link_data"))
   (link-matrix :accessor link-matrix
		:type list
		:initform nil
		:metadata (:sync t
				 :json-name "link_matrix"
				 :rtype "Number"
				 *array-serialization*))
   (link-type :accessor link-type
	      :tyoe unicode
	      :initform (unicode "arc")
	      :metadata(:sync t
			      :json-name "link_type"))
   (directed :accessor directed
	     :type :bool
	     :initform :true
	     :metadata (:sync t
			      :json-name "directed"))
   ;;need to finisht this 
   (colors :accessor colors
	   :type list
	   :initform (list (cons 'trait (unicode ""))
			   (cons 'default-value CATEGORY10))
	   :metadata (:sync t
			    :json-name "colors"))
   (interactions :accessor interactions
		 :type list
		 :initform (list (cons "hover" "tooltip")
				 (cons "click" "select"))
		 :metadata (:sync t
				  :json-name "interactions"))
   (highlight-links :accessor highlight-links
		    :type :bool
		    :initform :true
		    :metadata (:sync t
				     :json-name "highlight_links"))
    ;; TODO row col and color linkcolor  need the .valid to be looked at 
  (x :accessor x
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "x"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (y :accessor y
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "y"
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (color :accessor color
	:type list
	:initform nil
	:metadata (:sync t
			 :json-name "color"
			 :scaled t
			 :rtype "Color"
                         :atype "bqplot.ColorAxis"
                         *array-serialization*))
   (link-color :accessor link-color
	       :type list
	       :initform nil
	       :metadata (:sync t
				:json-name "link_color"
				:rtype "Color"
				:atype "bqplot.ColorAxis"
				*array-serialization*))
   (hovered-style :accessor hovered-style
		:type list
		:initform nil
		:metadata (:sync t
				 :json-name "hovered_style"))
    (unhovered-style :accessor unhovered-style
		:type list
		:initform nil
		:metadata (:sync t
				 :json-name "unhovered_style"))
   (hovered-point :accessor hovered-point
		:type int
		:initform nil 
		:metadata (:sync t
				 :json-name "hovered_point"))
   (scales-metadata :accessor scales-metadata
		   :type list
		   :initform (list (cons "x" (list (cons "orientation" "horizontal")
						   (cons "dimension" "x")))
				   (cons "y" (list (cons "orientation" "vertical")
						   (cons "dimension" "y")))
				   (cons "color" (list (cons "dimension" "color")))
				   (cons "link-color" (list (cons "dimension" "link-color"))))
		   :metadata (:sync t
				    :json-name "scales_metadata")))
   
    (:default-initargs
   :view-name (unicode "GraphModel")
    :model-name (unicode "Graph"))
    (:metaclass traitlets:traitlet-class))

(defclass image (mark)
  ;;need to check the valid part 
  ((x :accessor x
	:type list
	:initform (list (cons 'default-value (list 0 1)))
	:metadata (:sync t
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
   (y :accessor y
	:type list
	:initform (list (cons 'default-value (list 0 1)))
	:metadata (:sync t
			 :scaled t
			 :rtype "Number"
                         :atype "bqplot.Axis"
                         *array-serialization*))
     (scales-metadata :accessor scales-metadata
		   :type list
		   :initform (list (cons "x" (list (cons "orientation" "horizontal")
						     (cons "dimension" "x")))
				   (cons "y" (list (cons "orientation" "vertical")
						     (cons "dimension" "y")))))
		   :metadata (:sync t
				    :json-name "scales_metadata")) 
   ;;need to add the image slot 
  
   (:default-initargs
   :view-name (unicode "Image")
    :model-name (unicode "ImageModel"))
    (:metaclass traitlets:traitlet-class))













		
				       





			     
	       
				     
		    
	      
