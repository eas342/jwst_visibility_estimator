pro test_herschel
;; Compare to Herschel windows from Herschel manual

;; From the manual: http://herschel.esac.esa.int/Docs/HSPOT/html/ch09s07.html
;; PDF manual: http://herschel.asdc.asi.it/documents/hspot-help.pdf

m31RA = ten(00,42,44) ;; simbad coordinates
m31dec = ten(41,16,07.5)

triton09RA = ten(21,54,43.8)
triton09Dec = ten(-13,06,27)

rough_jwst_vis,[m31RA,triton09RA],[m31dec,triton09dec],$
               ['M31 Herchel Est','Triton Herchel Est'],/herschel

;; from Herschel manual (I couldn't get HSpot to install)
;; add 10 years assuming L2 orbit
hlist = ['2009-06-12T13:38',$
         '2009-08-27T13:38',$
         '2009-12-13T13:38',$
         '2010-02-22T13:38',$
         '2010-04-18T13:38',$
         '2010-06-19T13:38',$
         '2010-10-19T13:38',$
         '2010-12-18T13:38']
offset = '2009-01-01T00:00'
yrlen = 365.24E ;; days
yradd = 2019E
nh = n_elements(hlist)
datearr = fltarr(nh)
for i=0l,nh-1l do begin
   datearr[i] = (date_conv(hlist[i],'JD') - date_conv(offset,'JD'))/yrlen + yradd
   if i mod 2 EQ 1 then begin
      if i LT 4 then yoffset=0 else yoffset=1
      for k=-2,2 do begin
         oplot,datearr[i-1:i] + float(k),$
               [0.9,0.9]+ yoffset,color=mycol('blue')
      endfor
   endif
endfor

end
