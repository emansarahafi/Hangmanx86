# Hangman x86

A classic Hangman word guessing game implemented in x86 assembly language using DOS interrupts.

## 🎮 Game Description

This is a console-based Hangman game where players try to guess a hidden word by entering letters one at a time. Each incorrect guess costs a life, and players have **6 lives** in total. The game features ASCII art hangman graphics that appear when the player loses.

## 📋 Features

- **Interactive gameplay** with keyboard input
- **ASCII art hangman** displayed on game over
- **6 lives** to guess the word correctly
- **Real-time feedback** on guessed letters
- **Screen clearing** between guesses for clean display
- **Win/Lose detection** with appropriate messages

## 🎯 How to Play

1. Run the program
2. You'll see underscores representing the hidden word (default: "CHALLENGE")
3. Type a letter and press Enter
4. If the letter is in the word, it will be revealed
5. If the letter is not in the word, you lose a life
6. Continue guessing until you:
   - **Win**: Discover all letters in the word
   - **Lose**: Run out of lives (6 incorrect guesses)

## 🛠️ Technical Details

- **Language**: x86 Assembly (16-bit)
- **Assembler**: MASM/TASM compatible
- **Platform**: DOS or DOS emulator (DOSBox recommended)
- **Interrupts Used**:
  - `INT 21h` - DOS functions (display, keyboard input)
  - `INT 10h` - Video services (screen clearing)

## 📦 File Structure

```
hangman.asm     # Main assembly source code
README.md       # This file
LICENSE         # License information
```

## 🚀 Building and Running

### Prerequisites

- MASM (Microsoft Macro Assembler) or TASM (Turbo Assembler)
- DOSBox or similar DOS emulator for modern systems

### Assembly and Linking

Using MASM:

```bash
masm hangman.asm;
link hangman.obj;
hangman.exe
```

Using TASM:

```bash
tasm hangman.asm
tlink hangman.obj
hangman.exe
```

### Running in DOSBox

```bash
dosbox
# Inside DOSBox:
mount c /path/to/hangman/directory
c:
hangman.exe
```

## 📝 Code Structure

The program is organized into several segments:

- **Data Segment**: Contains all game messages, the word to guess, and game state variables
- **Stack Segment**: Memory allocation for the stack
- **Code Segment**: Main game logic including:
  - `main_loop`: Primary game loop
  - `check`: Win/lose condition checking
  - `update`: Updates discovered letters
  - `read_keyboard`: Handles keyboard input
  - `print_hangman`: Displays ASCII art hangman
  - `clear_screen`: Clears the console
  - `game_over_win`/`game_over_lose`: End game handlers

## 🎨 Game Variables

- **Word**: "CHALLENGE" (9 letters)
- **Lives**: 6 attempts
- **Display**: Underscores for undiscovered letters

## 👤 Author

**Eman Sarah Afi** (A00051)

## 📄 License

See the [LICENSE](LICENSE) file for details.
