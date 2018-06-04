(in-package :cljw)

(defclass scale (widget)
  ((scale-types :accessor scale-types
                :initform (list (cons "bqplot.mercator" mercator)
				(cons "bqplot.albers" albers)
				(cons "bqplot.albers-usa" albers-usa)
				(cons "bqplot.equi-rectangular" equi-rectangular)
				(cons "bqplot.orthographic" orthographic)
				(cons "bqplot.gnomonic" gnomonic)
				(cons "bqplot.stereographic" stereographic)
				(cons "bqplot.linear-scale" linear-scale)
				(cons "bqplot.log-scale" log-scale)
				(cons "bqplot.date-scale" date-sale)
				(cons "bqplot.ordinal-scale" ordinal-scale)
				(cons "bqplot.color-scale" color-scale)
				(cons "bqplot.date-color-scale" date-color-scale)
				(cons "bqplot.ordinal-color-scale" ordinal-color-scale)
				) ;;;TODO: Fill in class names
                )
   (precedence :accessor precedence
               :type integer
	       :initform 1)
   (domain-class :accessor domain-class
                 :type float
                 :initform nil)
   (reverse :accessor reverse
            :type bool
            :initform :false
            :metadata (:sync t
                             :json-name "reverse"))
   (allow-padding :accessor allow-padding
		  :type bool
		  :initform :true
		  :metadata (:sync t
				   :json-name "allow_padding")))
  (:default-initargs
   :view-name (unicode "Scale")
    :model-name (unicode "ScaleModel")
    :view-module (unicode "bqplot")
    :model-module (unicode "bqplot")
    :view-module-version *frontend-version*
    :model-module-version *frontend-version*
    :ipython-display nil)
  (:metaclass traitlets:traitlet-class))

(defclass geo-scale (scale)
  (:default-initargs
   :view-name (unicode "GeoScale")
    :model-name (unicode "GeoScaleModel"))
  (:metaclass traitlets:traitlet-class))

(defclass mercator (geo-scale)
  ((scale-factor :accessor scale-factor
		 :type float
		 :initform 190.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (center :accessor center
	   :type list
	   :initform (list (cons 0 60)) 
	   :metadata (:sync t
			    :json-name "center"))
   (rotate :accessor rotate
	   :type list
	   :initform (list (cons 0 0))
	   :metadata (:sync t
			    :json-name "rotate"))
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number")) ;;;;TODO kevin has no idea whats going on 
  )
  (:default-initargs
   :view-name (unicode "Mercator")
    :model-name (unicode "MercatorModel"))
  (:metaclass traitlets:traitlet-class))

(defclass albers (geo-scale)
  ((scale-factor :accessor  scale-factor
		 :type float
		 :initform 250.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
    (rotate :accessor rotate
	   :type list
	   :initform (list (cons 96 0))
	   :metadata (:sync t
			    :json-name "rotate"))
   (center :accessor center
	   :type list
	   :initform (list (cons 0 60)) 
	   :metadata (:sync t
			    :json-name "center"))
   (parallels :accessor parallels
	   :type list
	   :initform (list  (cons 29.5 45.5))
	   :metadata (:sync t
			    :json-name "parallels"))
   (precision :accessor precision
	       :type float
	       :initform 0.1
	       :metadata (:sync t
				:json-name "precision"))
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number")) ;;;;TODO kevin has no idea whats going on 
    )
  (:default-initargs
   :view-name (unicode "Albers")
    :model-name (unicode "AlbersModel"))
  
  (:metaclass traitlets:traitlet-class)) 

(defclass albers-usa (geo-scale)
  ((scale-factor :accessor  scale-factor
		 :type float
		 :initform 1200.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (translate :accessor :translate translate
		 :type list
		 :initform (list (cons 600 490))
		 :metadata (:sync t
				  :json-name "translate"))
  
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number")) ;;;;TODO kevin has no idea whats going on 
   )
  
   (:default-initargs
   :view-name (unicode "AlbersUSA")
     :model-name (unicode "AlbersUSAModel"))
   
   (:metaclass traitlets:traitlet-class))


(defclass equi-rectangular (geo-scale)
   ((scale-factor :accessor scale-factor
		 :type float
		 :initform 145.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (center :accessor center 
	   :type list
	   :initform (list (cons 0 60)) 
	   :metadata (:sync t
			    :json-name "center")) 
  (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
  (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number"))) ;;;;TODO kevin has no idea whats going on 
   (:default-initargs
   :view-name (unicode "EquiRectangular")
     :model-name (unicode "EquiRectangularModel"))
   
   (:metaclass traitlets:traitlet-class))
   
  
(defclass orthographic (geo-scale)
   ((scale-factor :accessor scale-factor
		 :type float
		 :initform 145.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (center :accessor center 
	   :type list
	   :initform (list (cons 0 60)) 
	   :metadata (:sync t
			    :json-name "center"))
   (rotate :accessor rotate
	   :type list
	   :initform (list (cons 0 0))
	   :metadata (:sync t
			    :json-name "rotate"))
   (clip-angle :accessor clip-angle
               :type float
	       :initform 90.0 
	       :validator validate-clip-angle 
	       :metadata (:sync t
	                  :json-name "clip_angle"))
   (precision :accessor :precision precision
	       :type float
	       :initform 0.1
	       :metadata (:sync t
				:json-name "precision"))
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number"))) ;;;;TODO kevin has no idea whats going on 
 (:default-initargs
   :view-name (unicode "Orthographic")
   :model-name (unicode "OrthographicModel"))
 
 (:metaclass traitlets:traitlet-class))

  
(defun validate-clip-angle (object val)
  (if  (slot-boundp object 'clip-angle) 
	(cond ((> val 360.0) 360.0)
	      ((< val 0.0) 0.0)
	      (t val)))
      val)
			  
(defclass gnomonic (geo-scale)
  ((scale-factor :accessor scale-factor
		 :type float
		 :initform 145.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (center :accessor center 
	   :type list
	   :initform (list (cons 0 60))
	   :metadata (:sync t
			    :json-name "center"))
   (clip-angle :accessor clip-angle
               :type float
	       :initform 89.999 
	       :validator validate-clip-angle
	       :metadata (:sync t
	                  :json-name "clip_angle"))
   (precision :accessor precision
	       :type float
	       :initform 0.1
	       :metadata (:sync t
				:json-name "precision"))
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number"))) ;;;;TODO kevin has no idea whats going on 
 (:default-initargs
   :view-name (unicode "Gnomonic")
   :model-name (unicode "GnomonicModel"))
 
  (:metaclass traitlets:traitlet-class))


(defclass stereographic (geo-scale)
    ((scale-factor :accessor scale-factor
		 :type float
		 :initform 145.0
		 :metadata (:sync t
				  :json-name "scale_factor"))
   (center :accessor center 
	   :type list
	   :initform (list (cons 0 60)) 
	   :metadata (:sync t
			    :json-name "center"))
   (rotate :accessor rotate
	   :type list
	   :initform (list (cons 96 0 ))
	   :metadata (:sync t
			    :json-name "rotate"))
   (clip-angle :accessor clip-angle
               :type float
	       :initform 179.9999 
	       :validator validate-clip-angle
	       :metadata (:sync t
	                  :json-name "clip_angle"))
   (precision :accessor precision
	       :type float
	       :initform 0.1
	       :metadata (:sync t
				:json-name "precision"))
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "(Number, Number)"))
   (d-type :accessor d-type
	    :type unicode
	   :initform (unicode "numpy.number"))) ;;;;TODO kevin has no idea whats going on
 (:default-initargs
   :view-name (unicode "Stereographic")
   :model-name (unicode "StereographicModel"))
 
  (:metaclass traitlets:traitlet-class))

(defclass linear-scale (scale)
  ((precedence :accessor precedence
               :type int
	       :iniform 2))   
   (r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Number"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.number"))
   (min :accessor min
	:type float
	:initform 0.0              
	:metadata (:sync t
			 :json-name "min"))
   (max :accessor max
	:type float
	:initform 1.0              ;;;;tentative value for now not sure what it does 
	:metadata (:sync t
			 :json-name "max"))
   (stabilized :accessor stabilized
	       :type bool
	       :initform :false
	       :metadata (:sync t
				:json-name "stabilized"))
   (min-range :accessor min-range
	      :type float
	      :initform 0.6
	      :validator validate-min-range 
	      :metadata (:sync t
			       :json-name "min_range"))
   (mid-range :accessor mid-range
	      :type float
	      :initform 0.8
	      :validator validate-mid-range
	      :metadata (:sync t
			       :json-name "mid_range"))
   (:default-initargs
   :view-name (unicode "LinearScale")
     :model-name (unicode "LinearScaleModel"))
   
  (:metaclass traitlets:traitlet-class))

;;;;Validator for min-range making sure its between [0,1]
(defun validate-min-range (object val)
  (if (slot-boundp object 'min-range)
	 (cond ((>= val  1.0) 1.0)
	       ((<= val 0.0) 0.0)
	       (t val))
    val))
;;;;Validator for mid-range making sure its between [.1,1]
(defun validate-mid-range (object val)
  (if (slot-boundp object 'mid-range)
	 (cond ((>= val  1.0) 1.0)
	       ((<= val 0.1) 0.1)
	       (t val))
	 val))


(defclass log-scale (scale) 
   ((r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Number"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.number"))
   (min :accessor min
	:type float  
	:initform 0            
	:metadata (:sync t
			 :json-name "min"))
   (max :accessor max
	:type float
	:initform 1              ;;;;tentative 
	:metadata (:sync t
			 :json-name "max")))
 (:default-initargs
   :view-name (unicode "LogScale")
   :model-name (unicode "LogScaleModel"))
 
 (:metaclass traitlets:traitlet-class))

;;HOW DO WE DO DATES?
#|
(defclass date-scale (scale)
  ((r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Number"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.datetime64"));;;;TODO is this right?
   (min :accessor min
	:type date                                 ;;;;Not sure what to put for type 
	:initform nil
	:metadata (:sync t
			 :json-name "min"))
   (max :accessor max
	:type date                                  ;;;Not sure what to put for type 
	:initform nil
	:metadata (:sync t
			 :json-name "max")))

 (:default-initargs
   :view-name (unicode "DataScale")
    :model-name (unicode "DataScaleModel"))
 (:metaclass traitlets:traitlet-class))
|#

(defclass ordinal-scale (scale)
  ((r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Number"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.str"))
   (domain :accessor domain
	   :type list
	   :initform nil
	   :metadata (:sync t
			    :json-name "domain")))	    
 (:default-initargs
   :view-name (unicode "DataScale")
   :model-name (unicode "DataScaleModel"))
 
 (:metaclass traitlets:traitlet-class))

(defclass color-scale (scale)
  ((r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Color"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.number"))
   (scale-type :accessor scale-type
	       :type unicode
	       :initform (unicode "linear")
	       :metadata (:sync t
				:json-name "scale_type"))
   (colors :accessor colors
	   :type list
	   :initform nil ;;;; not sure how to deal with the trait = color part
	   :metadata (:sync t
			    :json-name "color"))
   (min :accessor min
	:type float        
	:initform 0.0
	:metadata (:sync t
			 :json-name "min"))
   (max :accessor max
	:type float
	:initform 1   
	:metadata (:sync t
			 :json-name "max"))
   (mid :accessor mid
	:type float
	:initform 0.5    ;;;;not sure if you can use this value. just using for now   
	:metadata (:sync t
			 :json-name "mid"))
   (scheme :accessor scheme
	   :type unicode
	   :initform (unicode "RdYlGn")
	   :metadata (:sync t
			    :json-name "scheme")))
    (:default-initargs
   :view-name (unicode "ColorScale")
      :model-name (unicode "ColorScaleModel"))
    
    (:metaclass traitlets:traitlet-class))

(defclass date-color-scale (color-scale)
  ((d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.datetime64")) 
   ;;;;not sure about the domain-class
   (domain-class :accessor domain-class
		 :type date
		 :initform nil) 
   (min :accessor min
	:type float        
	:initform 0
	:metadata (:sync t
			 :json-name "min"))
   (max :accessor max
	:type float             
	:initform 1 
	:metadata (:sync t
			 :json-name "max"))
   (mid :accessor mid 
	:type float           
	:initform .5     
	:metadata (:sync t
			 :json-name "mid")))
   (:default-initargs
   :view-name (unicode "DateColorScale")
     :model-name (unicode "DataColorScaleModel"))
   
   (:metaclass traitlets:traitlet-class))

(defclass ordinal-color-scale (color-scale)
  ((r-type :accessor r-type
	   :type unicode
	   :initform (unicode "Color"))
   (d-type :accessor d-type
	    :type unicode
	    :initform (unicode "numpy.str"))
   (domain :accessor domain
	   :type list         
	   :initform nil
	   :metadata (:sync t
			    :json-name "domain")))
    (:default-initargs
   :view-name (unicode "DateColorScale")
      :model-name (unicode "DataColorScaleModel"))
    
   (:metaclass traitlets:traitlet-class))
