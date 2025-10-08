## Keyboard Listener Demo

This Flutter app demonstrates how to use `RawKeyboardListener` to handle keyboard input across desktop, web, and mobile (with hardware keyboards).

### Run

1. Change into the project directory:

```bash
cd keyboard_listener_demo
```

2. Run on your desired platform:

```bash
flutter run -d macos
flutter run -d chrome
flutter run -d ios
flutter run -d android
```

### What to Try

- Click the focus area, then press keys to see:
  - Last key event (down/up + key label)
  - Live snapshot of currently pressed keys
  - Modifier state chips for Shift, Control, Alt/Option, Meta/Cmd
  - Recent keys list (last 10)

### Notes

- On the web, some key labels may differ per browser/OS. Prefer `event.logicalKey` for logic.
- Ensure the `RawKeyboardListener` has a focused `FocusNode`; tap the area or use `autofocus: true`.
- Use `RawKeyboard.instance.keysPressed` for chord detection (e.g., Ctrl+K).

# keyboard_listener_demo
