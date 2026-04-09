# Win Key Remap for PowerToys Run

This AutoHotkey script changes the behavior of the **Left Windows key**:

* **Tap `LWin`** → Opens **PowerToys Run**
* **Use `LWin` in combinations** → Behaves like the normal Windows key (`Win + E`, `Win + R`, `Win + 1`, etc.)

The script now works **directly with the Windows key** and **does not require PowerToys Keyboard Manager** or any virtual key remapping.

It also uses a **higher input hook priority** for better compatibility with applications that may otherwise intercept the Windows key.

> **Important:** Run the script **as Administrator** to allow the highest possible input hook priority and improve compatibility across elevated or input-heavy applications.

---

## Features

* Tap **Left Windows key** to open **PowerToys Run**
* Preserve standard **Windows key shortcuts**
* No PowerToys key remapping required
* Improved compatibility using **higher input hook priority**
* Lightweight and simple AutoHotkey-based solution

---

## Requirements

* **AutoHotkey v2**
* **PowerToys** installed
* **PowerToys Run shortcut** configured as:

```text
Ctrl + Alt + Shift + /
```

---

## Installation

1. Install **AutoHotkey v2**
2. Save the script as:

```text
win_to_powertoys.ahk
```

3. Run the script

> For best results, **right-click → Run as administrator**

---

## How It Works

The script intercepts the **Left Windows key** and distinguishes between:

### 1. Tap

If the key is pressed and released **without being used in a combination**, it sends:

```text
Ctrl + Alt + Shift + /
```

This opens **PowerToys Run**.

### 2. Combination

If the Windows key is used with another key, it behaves like a normal Windows modifier:

```text
Win + E
Win + R
Win + D
Win + 1
```

and so on.

---

## Example Behavior

| Input      | Result              |
| ---------- | ------------------- |
| `LWin`     | Opens PowerToys Run |
| `LWin + E` | Opens File Explorer |
| `LWin + R` | Opens Run dialog    |
| `LWin + D` | Show desktop        |
| `LWin + 1` | Opens pinned app 1  |

---

## Notes

* This script is designed for the **Left Windows key**
* Some applications with **low-level keyboard hooks**, **anti-cheat systems**, or **elevated privileges** may still interfere
* Running the script as **Administrator** improves reliability in such cases
* If another application already uses the same PowerToys Run shortcut, change it either in PowerToys or in the script

---

## Autostart on Windows Login

To start the script automatically when Windows launches:

1. Press:

```text
Win + R
```

2. Enter:

```text
shell:startup
```

3. Place a shortcut to your `.ahk` script inside that folder

If you need it to always run as administrator, use **Task Scheduler** instead of the Startup folder.

---

*Note: This is an AI generated README.md, please create an issue to bring any flaws found in the README into my notice.*
