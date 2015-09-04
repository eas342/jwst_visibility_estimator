pro choose_clist
;; Choose a file list
flist = choose_file(searchDir='cluster_lists/',filetype='.csv')

file_copy,flist,'cluster_lists/star_cluster_summary.csv',/overwrite

end
