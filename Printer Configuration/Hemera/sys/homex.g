; homex.g
; called to home the X axis
; updated September 4, 2018

; same as homey.g because of coreXY
; Front left corner is (0,0)

; ============= PRE-HOMING =====================

M913 X60 ; drop X motor currents to 60%
M913 Y60 ; drop Y motor currents to 60%

; Ignore Machine boundaries
M564 H0 S0

; Turn off bed leveling during homing
G29 S2 ; Does the same as M561!

; Switch to Origin Tool
T0

; Relative positioning
G91

; Provide Z height clearance
G1 Z10 F750 S1

; ================== HOME Y ============================

; Rapid Y until limit switch triggers
G0 Y450 F1500 S1

; Back off to release limit switch
G0 Y-6 F1500

; Slow advance to trigger limit switch
G0 Y10 F120 S1

; Set this location as Y = 341mm
G92 Y341

; Move the gantry slightly away from back of printer, to allow travel past the bolt mounting the gantry bracket
G0 Y-2 F1200

; ============= HOME X ====================

; Rapid X until limit switch triggers
G0 X-450 F1500 S1

; Back off to release limit switch
G0 X6 F1500

; Slow advance to trigger limit switch
G0 X-10 F120 S1

; Set this location as X = 0mm
G92 X0

; Move away from the limit switch, to prevent damage to it upon next move
G0 X5 F1500

; ============ Post-Homing ==============

; Revert to absolute coordinates
G90

; Re-enable mesh leveling
;G29 S1

M913 X100					; X motor currents back to 100%
M913 Y100					; Y motor currents back to 100%

M98 Pmachine_axisdimension.g ; Set Axes Limits

; Stop movement across limits, enable boundaries, homing requirement
M564 H1 S1
