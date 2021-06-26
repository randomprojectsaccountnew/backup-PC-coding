;; filetable.asm: basic "file table" made with db. Strings consist of '{filename1 sector#, filename2 sector# ...

db '{calculator-04,holyprogram-06}'

times 512-($-$$) db 0 

