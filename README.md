# start-to-run

> Note:
> This README is not fully  maintained for this branch (Except the list of additional features in this callout). This branch includes additional features targetting different hotkey combinations.
> You are free to modify and use on your environment as per your needs
>
> **List of additional features: **
> - Function key presses trigger special keys, while hotkeys using them will register as is

An AutoHotkey v2 script that makes:

- **Tap Win key** → open **PowerToys Run**
- **Hold Win + another key** → behave like **normal Windows shortcuts**

So:

- `Win` → opens **PowerToys Run**
- `Win + E` → still opens **File Explorer**
- `Win + R` → still opens **Run**
- `Win + D`, `Win + Tab`, etc. → still work

Because apparently mapping one key to another in a "simple" way is still too much to ask from desktop tooling.

---

## Why this exists

If you map the **Windows key directly** to a shortcut in **PowerToys Keyboard Manager** (for example `Ctrl + Shift + Alt + /` for PowerToys Run), then **Win-based hotkeys stop working properly**.

That means stuff like:

- `Win + E`
- `Win + R`
- `Win + D`
- `Win + Arrow`
- etc.

either stops working or becomes unreliable.

### Workaround used here

Instead of mapping `Win` directly to the PowerToys Run shortcut:

1. **Map the Windows key to a special unused key** in **PowerToys Keyboard Manager**
   - Example: **`VK232`** (or whatever special virtual key you configured)
2. Let this **AHK script** decide:
   - if the key was **tapped alone** → send PowerToys Run shortcut
   - if the key was used **with another key** → temporarily behave like **real Win**

This preserves normal Windows hotkeys while still letting a single Win tap launch PowerToys Run.

---

## What this script does

This script listens to a remapped special key (currently **`VKE8`** in the script) and tracks whether:

- it was pressed **alone**
- or it was pressed **with another key**

### Behavior

#### 1) Tap key alone
If the remapped Win key is pressed and released **without any other key**, it sends:

```text
Ctrl + Shift + Alt + /
````

which should be your **PowerToys Run** shortcut.

#### 2) Use it as a modifier

If another key is pressed while the remapped key is held, the script sends:

```text
LWin down
```

so combinations like these work normally:

* `Win + E`
* `Win + R`
* `Win + Arrow`
* `Win + Tab`
* etc.

On release, it sends:

```text
LWin up
```

So Windows still thinks you used the actual Win key.

---

## Requirements

* **Windows**
* **[AutoHotkey v2](https://www.autohotkey.com/)**
* **[Microsoft PowerToys](https://learn.microsoft.com/windows/powertoys/)**
* **PowerToys Run** enabled

---

## Setup

## 1) Configure PowerToys Run shortcut

Set your **PowerToys Run** activation shortcut to:

```text
Ctrl + Shift + Alt + /
```

You can change this if you want, but then you’ll also need to update the script.

---

## 2) Remap the Windows key in PowerToys Keyboard Manager

Open:

```text
PowerToys → Keyboard Manager → Remap a key
```

Map:

```text
Win (Left / Right, depending on your setup) → VK232
```

> Important:
> The point is to map the Win key to a **special virtual key** that **does not open the Start menu** by itself.

### Important note about the script

The current script listens for:

```ahk
~*VKE8::
~*VKE8 up::
```

So if you mapped your key to **VK232** in PowerToys but your system reports it differently (for example `VKE8` in AHK), **use whatever AHK sees**.

This is normal. Windows key handling is a tiny circus.

### How to confirm the correct key code

Use **AutoHotkey Window Spy** or a quick test script to see what key code is produced when pressing your remapped key.

Then update these two lines if needed:

```ahk
~*VKE8::VKDown()
~*VKE8 up::VKUp()
```

---

## 3) Run the script

Install **AutoHotkey v2**, then run the script:

```text
double-click the .ahk file
```

Or launch it from terminal:

```powershell
AutoHotkey64.exe .\your-script-name.ahk
```

---

## 4) (Optional) Start with Windows

To run it automatically on startup:

1. Press `Win + R`
2. Run:

```text
shell:startup
```

3. Put a shortcut to the `.ahk` file there

Because of course one more startup script is how modern computing achieves elegance.

---

## How it works

The script:

* hooks keyboard input
* tracks currently pressed keys in a `Map()`
* watches the remapped special key
* decides whether it should:

  * trigger **PowerToys Run**
  * or act as **real LWin**

### Core logic

### On special key down

If another key is already pressed or another key gets pressed while held:

```ahk
Send "{LWin down}"
```

This enables standard Win combos.

### On special key up

If no combo happened:

```ahk
Send("{Ctrl down}{Alt down}{Shift down}")
Send("/")
Send("{Shift up}{Alt up}{Ctrl up}")
```

This launches PowerToys Run.

Otherwise:

```ahk
Send "{LWin up}"
```

to finish the Win shortcut cleanly.

---

## Supported hotkeys

The script explicitly tracks a large set of keys, including:

* `A-Z`
* `0-9`
* `F1-F12`
* `Ctrl`, `Alt`, `Shift`, left/right variants
* arrows, Home/End, PgUp/PgDn
* numpad keys
* punctuation / symbols
* common special keys like:

  * `Tab`
  * `Enter`
  * `Esc`
  * `Backspace`
  * `Delete`
  * `Space`

So most normal Win shortcuts should work as expected.

---

## Customization

## Change PowerToys Run shortcut

If your PowerToys Run shortcut is not:

```text
Ctrl + Shift + Alt + /
```

update this block:

```ahk
Send("{Ctrl down}{Alt down}{Shift down}")
Send("/")
Send("{Shift up}{Alt up}{Ctrl up}")
```

### Example: use `Alt + Space`

Replace with:

```ahk
Send("! ")
```

or more explicitly:

```ahk
Send("{Alt down}{Space}{Alt up}")
```

---

## Change the trigger key

If your remapped special key is not `VKE8`, change:

```ahk
~*VKE8::VKDown()
~*VKE8 up::VKUp()
```

to whatever key AHK detects.

Example:

```ahk
~*vkE8::VKDown()
~*vkE8 up::VKUp()
```

or another virtual key code if needed.

---

## Notes / limitations

* This script is designed around **one remapped Win-like trigger key**
* It works best when your **physical Win key is intercepted before Windows sees it as a normal Win key**
* If your PowerToys mapping still causes the Start menu to appear, your remap key choice is probably wrong
* The script manually tracks many keys, so if you use something unusual and it doesn’t behave correctly, you may need to add it

---

## Troubleshooting

### Tapping the key still opens Start menu

Your remapped key is probably still being interpreted as a real Win key somewhere.

Check:

* your **PowerToys Keyboard Manager** remap
* whether the target key is actually a **non-standard virtual key**
* whether AHK is listening to the correct key code

---

### `Win + E` or other Win shortcuts don’t work

Check that:

* the trigger key matches what AHK actually receives
* the script is running
* another app is not intercepting the same shortcut

---

### PowerToys Run doesn’t open

Check that your configured shortcut in PowerToys Run matches:

```text
Ctrl + Shift + Alt + /
```

If not, update either:

* PowerToys Run shortcut
* or the script send sequence

---

## Why not just use PowerToys alone?

Because **direct remap = broken Win shortcuts**.

This script exists specifically to get both:

* **single-key launcher behavior**
* **normal Windows hotkeys**

which, absurdly, still requires a custom keyboard state machine in 2026.

---

*Note: This is an AI generated README.md, please create an issue to bring any flaws found in the README into my notice.*
