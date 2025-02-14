; CONFIGURATION FILE for Duet Maestro

; Executed by the firmware on start-up

; Headers within parenthesis are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer
; Visit https://reprap.org/wiki/G-code for an explanation of G-code commands

; --- SECTION: GENERAL PREFERENCES ( ) ---

M564 S1 H1 ; Enables Homing Requirement For Motor Activation and set axes limits

; --- SECTION: Z-PROBE & MESH COMPENSATION ---

M98 Pmachine_zprobe.g ; configure the z probe

M98 Pmachine_bedmesh.g ; configure the bed mesh

;G29 S1 ; Load heightmap after power cycle

; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---
M98 Pmachine_stepper_movement.g ; configures the motion steppers
M98 Pmachine_stepper_extruder.g ; configures the extruder steppers
M98 Pmachine_endstoptypes.g     ; set endstop types

G21 ; Work in millimetres
G90 ; Set to absolute coordinates...
M84 S1 ; Set idle timeout

; --- SECTION: HEATERS, BED & THERMISTOR ---
M98 Pmachine_heater_bed.g
M98 Pmachine_heater_extrusion.g

; --- SECTION: FANS ( ) ---
M98 Pmachine_fans.g

; --- SECTION: TOOLS ( ) --- 

; Comment: Remember! H0 is the heated bed!
; Comment: D0 is the first driver after movement (X, Y and Z) drives, which is left extruder
; D1 is right extruder

M98 Pmachine_tools.g ; Define the tools

T0 ; Automatic tool select

; --- SECTION: NETWORKS (PROLOGUE & COMMUNCATIONS SECTION) ---
M98 Pmachine_access.g ; set machine name and IP
M586 P0 S1 ; Enable HTTP
M586 P1 S0 ; Disable FTP
M586 P2 S0 ; Disable Telnet

; --- SECTION: MISCELLANEOUS --- 

; Set auto resume
M911 S21.0 R23.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"

M98 Pmachine_zendstop.g
M564 H0 S0
G91
G0 Z-30 F100
G28 Z
G90
M564 H1 S1

