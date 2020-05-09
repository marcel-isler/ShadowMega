;_____________Set Z Endstop Height_____________
M291 P"Do you want to mechanically level the bed?  You need adjustable Z sliders for this process!" S3
M291 P"Preparing for mechanical bed level, this will home the printer, heat the bed and nozzle and then give you further instructions." S0

M140 S60 ; Start heating bed to 60c
G10 P0 S150 ;turn on extruder

G28 ; Home all

M190 S60 ; wait for heat bed to get to 60c

G91 ; Use Relative Coordinates
G0 Z-30 F100 ; Move the bed up slowly
G90 ; and back to absolute coordinates

G1 X310 Y330 Z200 F3000 ; move the bed to 200mm from the nozzle

G29 S2 ; Disable bed mesh
G29 S2 ; Disable bed mesh

G1 Z20 F1500 ; move to back right corner and raise bed.

M564 S0 ; Disable movement boundaries.

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"Lower the three adjustable Z sliders to their lowest position." S0
M291 P"Slowly move the bed up until nozzle is touching. This should be at Z0. Press OK when done." S2 Z1
M291 P"If the Z position wasn't 0, please set your Z Endstop Height first" S2

G1 Z20 F1500 ; lower bed.
G1 X310 Y10 F5000 ; move to front right corner.
M291 P"Move the bed to Z0 withtout touching the nozzle, skip bed down if necessary." S0
M291 P"At Z0, move the bed up using the adjustable Z slider until the nozzle touches." S2 Z1

G1 Z20 F1500 ; lower bed.
G1 X10 Y10 F5000 ; move to front left corner.
M291 P"Move the bed to Z0 withtout touching the nozzle, skip bed down if necessary." S0
M291 P"At Z0, move the bed up using the adjustable Z slider until the nozzle touches." S2 Z1

G1 Z20 F1500 ; lower bed.
G1 X10 Y330 F5000 ; move to back left corner.
M291 P"Move the bed to Z0 withtout touching the nozzle, skip bed down if necessary." S0
M291 P"At Z0, move the bed up using the adjustable Z slider until the nozzle touches." S2 Z1

M291 P"Do you want to verify the bed level?" S3
G1 Z20 F1500 ; lower bed.
G1 X310 Y330 F5000 ; move to back right corner.
M291 P"Move the bed to Z0 verifying that it just touches the bed." S2 Z1

G1 Z20 F1500 ; lower bed.
G1 X310 Y10 F5000 ; move to front right corner.
M291 P"Move the bed to Z0 verifying that it just touches the bed." S2 Z1

G1 Z20 F1500 ; lower bed.
G1 X10 Y10 F5000 ; move to front left corner.
M291 P"Move the bed to Z0 verifying that it just touches the bed." S2 Z1

G1 Z20 F1500 ; lower bed.
G1 X10 Y330 F5000 ; move to back left corner.
M291 P"Move the bed to Z0 verifying that it just touches the bed." S2 Z1

M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

