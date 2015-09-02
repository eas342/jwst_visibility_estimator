;; Shows the JWST coverage for a list of star clusters
;; We're looking for continuous coverage through the year
pro show_clusters

set_plot,'ps'
!p.font=0
plotprenm='plots/visib'
device,encapsulated=1,/helvetica,$
       filename=plotprenm+'.eps'
device,xsize=14,ysize=10,decomposed=1,/color

dat = ev_delim_read('star_cluster_summary.csv',delim=',')
rough_jwst_vis,dat.ra_deg /15E,dat.dec_deg,dat.name

device,/close
cgPS2pdf,plotprenm+'.eps'
device,decomposed=0
set_plot,'x'
!p.font=-1

end
