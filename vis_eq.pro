function vis_eq,elatdeg
;; Calculates the visibility as a function of equatorial latitude
;; input latitude in degrees
;; 

elatrad = abs(elatdeg) * !pi / 180E ;; also take abs because symmetric

nlat = n_elements(elatdeg)
visLen = fltarr(nlat) * !values.f_nan

;; Year length
yr = 365.24E

;; Maximum tip toward sun from orthogonal
sinmaxtipT = sin(5E * !PI/180E)
;; Maximum tip away from sun from orthogonal
sinmaxtipA = sin(45E * !PI/180E)

yrConversion = yr / (2E * !PI) ;; conversion from angle to yr

lowReg = where(elatdeg LT 45,nlow)
if nlow GE 1 then begin
   alpha = asin(sinmaxtipT/cos(elatrad[lowReg]))
   beta = asin(sinmaxtipA/cos(elatrad[lowReg]))
   visLen[lowReg] = 2E * (alpha + beta) * yrConversion
endif

midReg = where(elatdeg GE 45 and elatdeg LT 85,nmidreg)
if nmidreg GE 1 then begin
   alpha = asin(sinmaxtipT/cos(elatrad[midReg]))
   visLen[midReg] = (!PI + 2E * alpha) * yrConversion
endif

highReg = where(elatdeg GE 85,nhigh)
if nhigh GE 1 then begin
   visLen[highreg] = yr
endif

return,visLen

end
