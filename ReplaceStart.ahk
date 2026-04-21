#Requires AutoHotkey v2.0

; ========= Explicit refresh frequency ===========
updateFrequency := 200 ; every 200 ms (tweak as needed)

; ============ Win Key Swap ============
; Define the action to perform when the Win key is pressed without any other modifiers
WinKeyAction() {
    Send("{Ctrl down}{Alt down}{Shift down}")
    Send("/")
    Send("{Shift up}{Alt up}{Ctrl up}")
}

; ========= Code ===========

; Explicit refresh Function

CheckPhysicalKeys() {
    global pressedKeys, pressedModifiers, shift_down, win_down

    ; --- Fix normal keys ---
    for key, _ in pressedKeys.Clone() {
        if !GetKeyState(key, "P") {
            Send "{" key " up}"
            pressedKeys.Delete(key)
        }
    }

    ; --- Fix Shift state ---
    if (shift_down && !GetKeyState("Shift", "P")) {
        shift_down := false
        Send "{Shift up}"
    }

    ; --- Fix Win key state ---
    if (win_down && !GetKeyState("LWin", "P") && !GetKeyState("RWin", "P")) {
        win_down := false
        Send "{LWin up}"
    }

    ; --- Fix modifiers map (Ctrl / Alt) ---
    for mod, _ in pressedModifiers.Clone() {
        if !GetKeyState(mod, "P") {
            Send "{" mod " up}"
            pressedModifiers.Delete(mod)
        }
    }
}

; State variables and Objects
pressedModifiers := Map()
pressedKeys := Map()
win_down := false
shift_down := false
is_hotkey_mode := false

; Hook all keyboard input
InstallKeybdHook()
SetTimer(CheckPhysicalKeys, updateFrequency)
#InputLevel 1
#UseHook
#MaxHotkeysPerInterval 0

; --- Key down handler ---
; =========================
; KEY DOWN HOTKEYS
; =========================

; Letters
*a:: KeyDown("a")
*b:: KeyDown("b")
*c:: KeyDown("c")
*d:: KeyDown("d")
*e:: KeyDown("e")
*f:: KeyDown("f")
*g:: KeyDown("g")
*h:: KeyDown("h")
*i:: KeyDown("i")
*j:: KeyDown("j")
*k:: KeyDown("k")
*l:: KeyDown("l")
*m:: KeyDown("m")
*n:: KeyDown("n")
*o:: KeyDown("o")
*p:: KeyDown("p")
*q:: KeyDown("q")
*r:: KeyDown("r")
*s:: KeyDown("s")
*t:: KeyDown("t")
*u:: KeyDown("u")
*v:: KeyDown("v")
*w:: KeyDown("w")
*x:: KeyDown("x")
*y:: KeyDown("y")
*z:: KeyDown("z")

; Number row
*1:: KeyDown("1")
*2:: KeyDown("2")
*3:: KeyDown("3")
*4:: KeyDown("4")
*5:: KeyDown("5")
*6:: KeyDown("6")
*7:: KeyDown("7")
*8:: KeyDown("8")
*9:: KeyDown("9")
*0:: KeyDown("0")

; Function keys
*F1:: KeyDown("F1")
*F2:: KeyDown("F2")
*F3:: KeyDown("F3")
*F4:: KeyDown("F4")
*F5:: KeyDown("F5")
*F6:: KeyDown("F6")
*F7:: KeyDown("F7")
*F8:: KeyDown("F8")
*F9:: KeyDown("F9")
*F10:: KeyDown("F10")
*F11:: KeyDown("F11")
*F12:: KeyDown("F12")


; Modifiers
~*Ctrl:: ModifierDown("Ctrl")
~*Alt:: ModifierDown("Alt")

; Special keys
~*CapsLock:: _KeyDown("CapsLock")
~*Shift:: ShiftDown()
*Esc:: KeyDown("Esc")
*Tab:: KeyDown("Tab")
*Enter:: KeyDown("Enter")
*Space:: KeyDown("Space")
*Backspace:: KeyDown("Backspace")
*Delete:: KeyDown("Delete")
*Insert:: KeyDown("Insert")
*PrintScreen:: KeyDown("PrintScreen")
*Pause:: KeyDown("Pause")
*ScrollLock:: KeyDown("ScrollLock")
*AppsKey:: KeyDown("AppsKey")

; Navigation keys
*Up:: KeyDown("Up")
*Down:: KeyDown("Down")
*Left:: KeyDown("Left")
*Right:: KeyDown("Right")
*Home:: KeyDown("Home")
*End:: KeyDown("End")
*PgUp:: KeyDown("PgUp")
*PgDn:: KeyDown("PgDn")

; Numpad keys
*Numpad0:: KeyDown("Numpad0")
*Numpad1:: KeyDown("Numpad1")
*Numpad2:: KeyDown("Numpad2")
*Numpad3:: KeyDown("Numpad3")
*Numpad4:: KeyDown("Numpad4")
*Numpad5:: KeyDown("Numpad5")
*Numpad6:: KeyDown("Numpad6")
*Numpad7:: KeyDown("Numpad7")
*Numpad8:: KeyDown("Numpad8")
*Numpad9:: KeyDown("Numpad9")
*NumpadDot:: KeyDown("NumpadDot")
*NumpadDiv:: KeyDown("NumpadDiv")
*NumpadMult:: KeyDown("NumpadMult")
*NumpadAdd:: KeyDown("NumpadAdd")
*NumpadSub:: KeyDown("NumpadSub")
*NumpadEnter:: KeyDown("NumpadEnter")

; Symbols / punctuation
*`:: KeyDown("``")
*-:: KeyDown("-")
*=:: KeyDown("=")
*[:: KeyDown("[")
*]:: KeyDown("]")
*\:: KeyDown("\")
*`;:: KeyDown(";")
*':: KeyDown("'")
*,:: KeyDown(",")
*.:: KeyDown(".")
*/:: KeyDown("/")

; Win key
*LWin:: WinDown()
*RWin:: WinDown()

; =========================
; KEY UP HOTKEYS
; =========================

; Letters
*a up:: KeyUp("a")
*b up:: KeyUp("b")
*c up:: KeyUp("c")
*d up:: KeyUp("d")
*e up:: KeyUp("e")
*f up:: KeyUp("f")
*g up:: KeyUp("g")
*h up:: KeyUp("h")
*i up:: KeyUp("i")
*j up:: KeyUp("j")
*k up:: KeyUp("k")
*l up:: KeyUp("l")
*m up:: KeyUp("m")
*n up:: KeyUp("n")
*o up:: KeyUp("o")
*p up:: KeyUp("p")
*q up:: KeyUp("q")
*r up:: KeyUp("r")
*s up:: KeyUp("s")
*t up:: KeyUp("t")
*u up:: KeyUp("u")
*v up:: KeyUp("v")
*w up:: KeyUp("w")
*x up:: KeyUp("x")
*y up:: KeyUp("y")
*z up:: KeyUp("z")

; Number row
*1 up:: KeyUp("1")
*2 up:: KeyUp("2")
*3 up:: KeyUp("3")
*4 up:: KeyUp("4")
*5 up:: KeyUp("5")
*6 up:: KeyUp("6")
*7 up:: KeyUp("7")
*8 up:: KeyUp("8")
*9 up:: KeyUp("9")
*0 up:: KeyUp("0")

; Function keys
*F1 up:: KeyUp("F1")
*F2 up:: KeyUp("F2")
*F3 up:: KeyUp("F3")
*F4 up:: KeyUp("F4")
*F5 up:: KeyUp("F5")
*F6 up:: KeyUp("F6")
*F7 up:: KeyUp("F7")
*F8 up:: KeyUp("F8")
*F9 up:: KeyUp("F9")
*F10 up:: KeyUp("F10")
*F11 up:: KeyUp("F11")
*F12 up:: KeyUp("F12")

; Modifiers
~*Ctrl up:: ModifierUp("Ctrl")
~*Alt up:: ModifierUp("Alt")

; Special keys
~*Shift up:: ShiftUp()
~*CapsLock up:: KeyUp("CapsLock")
*Esc up:: KeyUp("Esc")
*Tab up:: KeyUp("Tab")
*Enter up:: KeyUp("Enter")
*Space up:: KeyUp("Space")
*Backspace up:: KeyUp("Backspace")
*Delete up:: KeyUp("Delete")
*Insert up:: KeyUp("Insert")
*PrintScreen up:: KeyUp("PrintScreen")
*Pause up:: KeyUp("Pause")
*ScrollLock up:: KeyUp("ScrollLock")
*AppsKey up:: KeyUp("AppsKey")

; Navigation keys
*Up up:: KeyUp("Up")
*Down up:: KeyUp("Down")
*Left up:: KeyUp("Left")
*Right up:: KeyUp("Right")
*Home up:: KeyUp("Home")
*End up:: KeyUp("End")
*PgUp up:: KeyUp("PgUp")
*PgDn up:: KeyUp("PgDn")

; Numpad keys
*Numpad0 up:: KeyUp("Numpad0")
*Numpad1 up:: KeyUp("Numpad1")
*Numpad2 up:: KeyUp("Numpad2")
*Numpad3 up:: KeyUp("Numpad3")
*Numpad4 up:: KeyUp("Numpad4")
*Numpad5 up:: KeyUp("Numpad5")
*Numpad6 up:: KeyUp("Numpad6")
*Numpad7 up:: KeyUp("Numpad7")
*Numpad8 up:: KeyUp("Numpad8")
*Numpad9 up:: KeyUp("Numpad9")
*NumpadDot up:: KeyUp("NumpadDot")
*NumpadDiv up:: KeyUp("NumpadDiv")
*NumpadMult up:: KeyUp("NumpadMult")
*NumpadAdd up:: KeyUp("NumpadAdd")
*NumpadSub up:: KeyUp("NumpadSub")
*NumpadEnter up:: KeyUp("NumpadEnter")

; Symbols / punctuation
*` up:: KeyUp("``")
*- up:: KeyUp("-")
*= up:: KeyUp("=")
*[ up:: KeyUp("[")
*] up:: KeyUp("]")
*\ up:: KeyUp("\")
*`; up:: KeyUp(";")
*' up:: KeyUp("'")
*, up:: KeyUp(",")
*. up:: KeyUp(".")
*/ up:: KeyUp("/")

; Win key
*LWin up:: WinUp()
*RWin up:: WinUp()


; --- Functions ---

ShiftDown() {
    global shift_down
    shift_down := true
}

ShiftUp() {
    global shift_down
    shift_down := false
    Send "{Shift up}"
}

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
        WinKeyAction()
    }
}

WinDown() {
    global win_down, is_hotkey_mode
    win_down := true
    if (_checkIsHotkey()) {
        is_hotkey_mode := true
        Send "{LWin down}"
    }
}

ModifierUp(key) {
    global pressedModifiers
    key := RegExReplace(key, "^(L|R)")
    pressedModifiers.Delete(key)
    KeyUp(key)
}

KeyUp(key) {
    global pressedKeys
    pressedKeys.Delete(key)
    Send "{" key " up}"
}

ModifierDown(key) {
    global pressedModifiers
    key := RegExReplace(key, "^(L|R)")
    pressedModifiers[key] := true
    KeyDown(key)
}

KeyDown(key) {
    global win_down, is_hotkey_mode, shift_down
    if (win_down && !is_hotkey_mode) {
        is_hotkey_mode := true
        Send "{LWin down}"
    }
    if (checkIsHotkey() && shift_down) {
        Send "{Shift down}"
    }
    _KeyDown(key)
}

_KeyDown(key) {
    global pressedKeys
    pressedKeys[key] := true
    Send "{" FormatKey(key) " down}"
}

FormatKey(key) {
    global shift_down
    ; Only process single alphabet letters
        if (!checkIsHotkey()) {
            caps := GetKeyState("CapsLock", "T")
            if RegExMatch(key, "^[a-z]$") {
                if (caps == shift_down) {
                    return key
                } else {
                    return StrUpper(key)
                }
            }
            else {
                if (shift_down) {
                    Send "{Shift down}"
                }
                return key
            }
        }
        else {
            return key

        }

    ; Non-letters → return as-is
    return key
}

_checkIsHotkey() {
    return pressedModifiers.Count > 0
}

checkIsHotkey() {
    global pressedModifiers, win_down
    return _checkIsHotkey() || win_down
}
