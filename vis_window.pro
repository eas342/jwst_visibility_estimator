function vis_window,elondeg,elatdeg
;; Calculates the visibility as a function of equatorial latitude
;; input latitude in degrees
;; 

elatrad = abs(elatdeg) * !pi / 180E ;; also take abs because symmetric
elonrad = elondeg * !Pi / 180E
;; Year length
yr = 365.24E

;; Maximum tip toward sun from orthogonal
sinmaxtipT = sin(5E * !PI/180E)
;; Maximum tip away from sun from orthogonal
sinmaxtipA = sin(45E * !PI/180E)

yrConversion = yr / (2E * !PI) ;; conversion from angle to yr

case 1 of
   abs(elatdeg) LT 45: begin
      alpha = asin(sinmaxtipT/cos(elatrad))
      beta = asin(sinmaxtipA/cos(elatrad))
      visTimes = ([!pi/2E - alpha,$
                   !pi/2E + beta,$
                   3E * !pi/2E - beta,$
                   3E * !pi/2E + alpha] + elonrad)
      visLen = 2E * (alpha + beta) * yrConversion
   end
   abs(elatdeg) GE 45 and abs(elatdeg) LT 85: begin
      alpha = asin(sinmaxtipT/cos(elatrad))
      visTimes = ([!pi/2E - alpha,$
                   3E * !pi/2E + alpha,$
                   !values.f_nan,$
                   !values.f_nan]+ elonrad)
      visLen = (!PI + 2E * alpha) * yrConversion
   end
   abs(elatdeg) GE 85: begin
      vistimes = [0, 2E * !pi,!values.f_nan,!values.f_nan]
   end
endcase

visTimes = visTimes - 3E * !pi/2E ;; since Sun at 0 deg in Spring Eq
visTimes = (visTimes / (2E * !pi)) ;mod 1.0;; from radians to years

;if visTimes[3] LT visTimes[2] then visTimes[3] = visTimes[3] + 1.0
return,visTimes

end
