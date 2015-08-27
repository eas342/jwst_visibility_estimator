;; Rough calculator for JWST visibility
;; Input the RA in decimal hours and declination in decimal degrees
;; Versioni 1 - circular Earth orbit
pro rough_jwst_vis,ra,dec

;; Maybe later
;yr = '2015'
;jdStart = date_conv(yr+'-01-01T00:00','JD')
; sunpos,jdstart,raSun,decSun,elong

euler,ra * 15E,dec,elLong,elLatdeg,select=3

visLen = vis_eq(elLatdeg)

print,'Visible for '+strtrim(visLen,1)+' days'

end
