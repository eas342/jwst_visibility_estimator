;; Rough calculator for JWST visibility
;; Input the RA in decimal hours and declination in decimal degrees
;; Versioni 1 - circular Earth orbit
pro rough_jwst_vis,ra,dec,name

;; Maybe later if I get fancier (circular Earth orbit for now)
;yr = '2015'
;jdStart = date_conv(yr+'-01-01T00:00','JD')
; sunpos,jdstart,raSun,decSun,elong

nobj = n_elements(ra)
lookYear=2019

if n_elements(name) NE nobj then name=strarr(nobj)

for i=0l,nobj-1l do begin
   
   euler,ra * 15E,dec,elLongdeg,elLatdeg,select=3

;   visLen = vis_eq(elLatdeg)
;   print,'Visible for '+strtrim(visLen,1)+' days'
   print,name[i],format='(A," ",$)'
   print,'Ecliptic lon lat = '+strtrim(elLongdeg[i],1)+$
   ' '+strtrim(elLatdeg[i],1)
   visArr = vis_window(elLongdeg[i],elLatdeg[i])
;   print,visarr
   if i EQ 0 then begin
      plot,[lookyear - 0.5,lookyear+1],[0,0],yrange=[0,1 + nobj],$
           xtitle='Year',ytitle='Obj Num'
   endif
   for j=-1l,1l do begin
      oplot,visArr[0:1] + lookyear + float(j),[1,1]+i,$
            color=mycol('red'),thick=3
      oplot,visArr[2:3] + lookyear + float(j),[1,1]+i,$
            color=mycol('red'),thick=3
   endfor

   xyouts,lookyear + 0.5E,1 + i + 0.1,name[i]
endfor

end
