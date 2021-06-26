;;this is where we're defining the bytes for the text.

cmdstring: db ''
failure: db 0xA, 0xD, 'Something went wrong, command not working...', 0xA, 0xD, 0xA, 0xD, 0
failuregfxver: db 0xA, 0xD, 'Something went wrong, gfx command not working...', 0xA, 0xD, 0xA, 0xD, 0
failuretestmver: db 0xA, 0xD, 'We have an issue, the command did not work...', 0xA, 0xD, 0xA, 0xD, 0
welcome: db 'Kernel booted, hi, type H and then enter for help', 0xA, 0xD, \
'-------------------------------------------------', 0xA, 0xD, 0
help: db 0xA, 0xD, 'Here are some commands you may find to be useful in your journey', 0xA, 0xD, \
'----------------------------------------------------------------', 0xA, 0xD, 0xA, 0xD, \
'F) (test) File & Program Browser/Loader', 0xA, 0xD, 'R) Reboot', \
0xA, 0xD, 'N) Turn off', 0xA, 0xD, 'P) Print registers and memory location', 0xA, 0xD, \
'H) Help', 0xA, 0xD, 'G) gfx mode test', 0xA, 0xD, 0xA, 0xD, 0 
filetableheading: db '------------     ------', 0xA, 0xD, \
                     'File/Program     Sector', 0xA, 0xD, \
                     '------------     ------', 0xA, 0xD, 0
regheading: db '--------  ------------', 0xA, 0xD, \
               'Register  Mem Location', 0xA, 0xD, \
               '--------  ------------', 0xA, 0xD, 0

nomouse db 'no mouse found', 0xA, 0xD, 0

presskeypls: db 0xA, 0xD, 0xA, 0xD, 'Press any key to go back...', 0xA, 0xD, 0

gfxheading: db 'Hi, here you can try the product of some graphics experiments', 0xA, 0xD, \
               'I have conducted, use the command H for help!', 0xA, 0xD, \
               '-------------------------------------------------------------', 0xA, 0xD, 0xA, 0xD, 0

gfxhelp: db  0xA, 0xD, 'G) Games', 0xA, 0xD, 'R) Return to the main menu', 0xA, 0xD, \
             'T) Graphics tests', 0xA, 0xD, 'H) Help', 0xA, 0xD, 0xA, 0xD, 0

testmheading: db 'Welcome to the menu for graphics tests! Use H for Help', 0xA, 0xD, \
		 '------------------------------------------------------', 0xA, 0xD, 0xA, 0xD, 0

testmhelp: db 0xA, 0xD, 'S) Squares and rectangles test', 0xA, 0xD, 'R) Return to the Gfx main menu', \
              0xA, 0xD, 'L) Lines test', 0xA, 0xD, 'M) Return to Main Menu', 0xA, 0xD, 'H) Help', \
	      0xA, 0xD, 'T) Triangles Test', 0xA, 0xD, 0
