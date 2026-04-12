#Requires AutoHotkey v2.0

pressedModifiers := Map()
win_down := false
is_hotkey_mode := false
is_hotkey_mode_fn := false

; Hook all keyboard input
InstallKeybdHook()
#InputLevel 1
#UseHook

; --- Key down handler ---
; =========================
; KEY DOWN HOTKEYS
; =========================

; Letters
*a::KeyDown("a")
*b::KeyDown("b")
*c::KeyDown("c")
*d::KeyDown("d")
*e::KeyDown("e")
*f::KeyDown("f")
*g::KeyDown("g")
*h::KeyDown("h")
*i::KeyDown("i")
*j::KeyDown("j")
*k::KeyDown("k")
*l::KeyDown("l")
*m::KeyDown("m")
*n::KeyDown("n")
*o::KeyDown("o")
*p::KeyDown("p")
*q::KeyDown("q")
*r::KeyDown("r")
*s::KeyDown("s")
*t::KeyDown("t")
*u::KeyDown("u")
*v::KeyDown("v")
*w::KeyDown("w")
*x::KeyDown("x")
*y::KeyDown("y")
*z::KeyDown("z")

; Number row
*1::KeyDown("1")
*2::KeyDown("2")
*3::KeyDown("3")
*4::KeyDown("4")
*5::KeyDown("5")
*6::KeyDown("6")
*7::KeyDown("7")
*8::KeyDown("8")
*9::KeyDown("9")
*0::KeyDown("0")

; Function keys
*F1::FuncKeyDown("F1")
*F2::FuncKeyDown("F2")
*F3::FuncKeyDown("F3")
*F4::FuncKeyDown("F4")
*F5::FuncKeyDown("F5")
*F6::FuncKeyDown("F6")
*F7::FuncKeyDown("F7")
*F8::FuncKeyDown("F8")
*F9::FuncKeyDown("F9")
*F10::FuncKeyDown("F10")
*F11::FuncKeyDown("F11")
*F12::FuncKeyDown("F12")

; Modifiers
~*Shift::ModifierDown("Shift")
~*Ctrl::ModifierDown("Ctrl")
~*Alt::ModifierDown("Alt")
~*LShift::ModifierDown("LShift")
~*RShift::ModifierDown("RShift")
~*LCtrl::ModifierDown("LCtrl")
~*RCtrl::ModifierDown("RCtrl")
~*LAlt::ModifierDown("LAlt")
~*RAlt::ModifierDown("RAlt")
~*CapsLock::ModifierDown("CapsLock")

; Special keys
*Esc::KeyDown("Esc")
*Tab::KeyDown("Tab")
*Enter::KeyDown("Enter")
*Space::KeyDown("Space")
*Backspace::KeyDown("Backspace")
*Delete::KeyDown("Delete")
*Insert::KeyDown("Insert")
*PrintScreen::KeyDown("PrintScreen")
*Pause::KeyDown("Pause")
*ScrollLock::KeyDown("ScrollLock")
*NumLock::KeyDown("NumLock")
*AppsKey::KeyDown("AppsKey")

; Navigation keys
*Up::KeyDown("Up")
*Down::KeyDown("Down")
*Left::KeyDown("Left")
*Right::KeyDown("Right")
*Home::KeyDown("Home")
*End::KeyDown("End")
*PgUp::KeyDown("PgUp")
*PgDn::KeyDown("PgDn")

; Numpad keys
*Numpad0::KeyDown("Numpad0")
*Numpad1::KeyDown("Numpad1")
*Numpad2::KeyDown("Numpad2")
*Numpad3::KeyDown("Numpad3")
*Numpad4::KeyDown("Numpad4")
*Numpad5::KeyDown("Numpad5")
*Numpad6::KeyDown("Numpad6")
*Numpad7::KeyDown("Numpad7")
*Numpad8::KeyDown("Numpad8")
*Numpad9::KeyDown("Numpad9")
*NumpadDot::KeyDown("NumpadDot")
*NumpadDiv::KeyDown("NumpadDiv")
*NumpadMult::KeyDown("NumpadMult")
*NumpadAdd::KeyDown("NumpadAdd")
*NumpadSub::KeyDown("NumpadSub")
*NumpadEnter::KeyDown("NumpadEnter")

; Symbols / punctuation
*`::KeyDown("``")
*-::KeyDown("-")
*=::KeyDown("=")
*[::KeyDown("[")
*]::KeyDown("]")
*\::KeyDown("\")
*`;::KeyDown(";")
*'::KeyDown("'")
*,::KeyDown(",")
*.::KeyDown(".")
*/::KeyDown("/")


; Win key
*LWin::WinDown()
*RWin::WinDown()


; =========================
; KEY UP HOTKEYS
; =========================

; Letters
*a up::KeyUp("a")
*b up::KeyUp("b")
*c up::KeyUp("c")
*d up::KeyUp("d")
*e up::KeyUp("e")
*f up::KeyUp("f")
*g up::KeyUp("g")
*h up::KeyUp("h")
*i up::KeyUp("i")
*j up::KeyUp("j")
*k up::KeyUp("k")
*l up::KeyUp("l")
*m up::KeyUp("m")
*n up::KeyUp("n")
*o up::KeyUp("o")
*p up::KeyUp("p")
*q up::KeyUp("q")
*r up::KeyUp("r")
*s up::KeyUp("s")
*t up::KeyUp("t")
*u up::KeyUp("u")
*v up::KeyUp("v")
*w up::KeyUp("w")
*x up::KeyUp("x")
*y up::KeyUp("y")
*z up::KeyUp("z")

; Number row
*1 up::KeyUp("1")
*2 up::KeyUp("2")
*3 up::KeyUp("3")
*4 up::KeyUp("4")
*5 up::KeyUp("5")
*6 up::KeyUp("6")
*7 up::KeyUp("7")
*8 up::KeyUp("8")
*9 up::KeyUp("9")
*0 up::KeyUp("0")

; Function keys
*F1 up::FuncKeyUp("F1")
*F2 up::FuncKeyUp("F2")
*F3 up::FuncKeyUp("F3")
*F4 up::FuncKeyUp("F4")
*F5 up::FuncKeyUp("F5")
*F6 up::FuncKeyUp("F6")
*F7 up::FuncKeyUp("F7")
*F8 up::FuncKeyUp("F8")
*F9 up::FuncKeyUp("F9")
*F10 up::FuncKeyUp("F10")
*F11 up::FuncKeyUp("F11")
*F12 up::FuncKeyUp("F12")

; Modifiers
~*Shift up::ModifierUp("Shift")
~*Ctrl up::ModifierUp("Ctrl")
~*Alt up::ModifierUp("Alt")
~*LShift up::ModifierUp("LShift")
~*RShift up::ModifierUp("RShift")
~*LCtrl up::ModifierUp("LCtrl")
~*RCtrl up::ModifierUp("RCtrl")
~*LAlt up::ModifierUp("LAlt")
~*RAlt up::ModifierUp("RAlt")
~*CapsLock up::ModifierUp("CapsLock")

; Special keys
*Esc up::KeyUp("Esc")
*Tab up::KeyUp("Tab")
*Enter up::KeyUp("Enter")
*Space up::KeyUp("Space")
*Backspace up::KeyUp("Backspace")
*Delete up::KeyUp("Delete")
*Insert up::KeyUp("Insert")
*PrintScreen up::KeyUp("PrintScreen")
*Pause up::KeyUp("Pause")
*ScrollLock up::KeyUp("ScrollLock")
*NumLock up::KeyUp("NumLock")
*AppsKey up::KeyUp("AppsKey")

; Navigation keys
*Up up::KeyUp("Up")
*Down up::KeyUp("Down")
*Left up::KeyUp("Left")
*Right up::KeyUp("Right")
*Home up::KeyUp("Home")
*End up::KeyUp("End")
*PgUp up::KeyUp("PgUp")
*PgDn up::KeyUp("PgDn")

; Numpad keys
*Numpad0 up::KeyUp("Numpad0")
*Numpad1 up::KeyUp("Numpad1")
*Numpad2 up::KeyUp("Numpad2")
*Numpad3 up::KeyUp("Numpad3")
*Numpad4 up::KeyUp("Numpad4")
*Numpad5 up::KeyUp("Numpad5")
*Numpad6 up::KeyUp("Numpad6")
*Numpad7 up::KeyUp("Numpad7")
*Numpad8 up::KeyUp("Numpad8")
*Numpad9 up::KeyUp("Numpad9")
*NumpadDot up::KeyUp("NumpadDot")
*NumpadDiv up::KeyUp("NumpadDiv")
*NumpadMult up::KeyUp("NumpadMult")
*NumpadAdd up::KeyUp("NumpadAdd")
*NumpadSub up::KeyUp("NumpadSub")
*NumpadEnter up::KeyUp("NumpadEnter")

; Symbols / punctuation
*` up::KeyUp("``")
*- up::KeyUp("-")
*= up::KeyUp("=")
*[ up::KeyUp("[")
*] up::KeyUp("]")
*\ up::KeyUp("\")
*`; up::KeyUp(";")
*' up::KeyUp("'")
*, up::KeyUp(",")
*. up::KeyUp(".")
*/ up::KeyUp("/")

; Win key
*LWin up::WinUp()
*RWin up::WinUp()

; =========================

; --- Function keys swap ---
func_keys := Map()

func_keys["F1"] := "\\#g"
func_keys["F2"] := "Volume_Down"
func_keys["F3"] := "Volume_Up"
func_keys["F4"] := "Volume_Mute"
func_keys["F5"] := "Media_Stop"
func_keys["F6"] := "Media_Prev"
func_keys["F7"] := "Media_Play_Pause"
func_keys["F8"] := "Media_Next"
func_keys["F9"] := "Launch_Mail"
func_keys["F10"] := "Browser_Home"
func_keys["F11"] := "F11"
func_keys["F12"] := "Launch_App2"

Launch_Media::F1
Volume_Down::F2
Volume_Up::F3
Volume_Mute::F4
Media_Stop::F5
Media_Prev::F6
Media_Play_Pause::F7
Media_Next::F8
Launch_Mail::F9
Browser_Home::F10
Launch_App2::F12

; --- Functions ---


WinUp() {
    global win_down, is_hotkey_mode
    if (!win_down) {
        return
    }
    win_down := false

    Send "{LWin up}"
    if (is_hotkey_mode) {
        is_hotkey_mode := false
        return
    }
    else {
        Send("{Ctrl down}{Alt down}{Shift down}")
        Send("/")
        Send("{Shift up}{Alt up}{Ctrl up}")
    }
}

WinDown() {
    global win_down, is_hotkey_mode
    win_down := true
    if (checkIsHotkey()) {
        is_hotkey_mode := true
        Send "{LWin down}"
    }
}

ModifierUp(key) {
    global pressedModifiers
    try {
        pressedModifiers.Delete(key)
    }
    catch {
        ; Key wasn't in the map, ignore
    }
    KeyUp(key)
}

KeyUp(key) {
    Send "{" key " up}"
}

ModifierDown(key) {
    global pressedModifiers, win_down, is_hotkey_mode
    pressedModifiers[key] := true
    KeyDown(key)
}

KeyDown(key) {
    global win_down, is_hotkey_mode
    if (win_down) {
        is_hotkey_mode := true
        Send "{LWin down}"
    }
    Send "{" FormatKey(key) " down}"
}

FormatKey(key) {
    ; Check if we're in hotkey mode - if so, return the key as-is (except for function keys)
    if (!checkIsHotkey()){
        ; Check if it's a single alphabet letter
        if RegExMatch(key, "^[a-zA-Z]$") {
            caps := GetKeyState("CapsLock", "T")
            shift := GetKeyState("Shift")
            
            ; XOR logic (normal keyboard behavior)
            if (caps != shift)
                return StrUpper(key)
            else
                return StrLower(key)
        }
    }
        
    ; Not a letter → return as-is
    return key
}
FuncKeyDown(key) {
    global is_hotkey_mode_fn, func_keys, win_down
    if (!checkIsHotkey() && !win_down) {
        if (InStr(func_keys[key], "\\")) {
            Send SubStr(func_keys[key], 3)
        }
        else{
            Send "{" func_keys[key] " down}"
        }
    }
    else {
        is_hotkey_mode_fn := true
        KeyDown(key)
    }
}

FuncKeyUp(key) {
    global is_hotkey_mode_fn, func_keys
    if (is_hotkey_mode_fn) {
        is_hotkey_mode_fn := false
        KeyUp(key)
    }
    else {
        Send "{" func_keys[key] " up}"
    }
}

checkIsHotkey() {
    global pressedModifiers
    isHotkey := false
    for k, v in pressedModifiers{
        if (v){
            isHotkey := true
        }
    }
    return isHotkey
}
