# Author:Potion(My batmud game id).
This github repository is used to share my batmud blowtorch plugins.
# Main function provided by these plugins:
## Overview
The BlowTorch plugin is a comprehensive tool designed to enhance the gaming experience by providing various functionalities such as world map,health bar,portraits,easy targetting,fast move,location route search, translation features, Termux interaction, map drawing, and more. This plugin is particularly useful for players who want to play batmud by Android devices.
## Key Features
1. **App Modifications**: 
   - Reduced the time required for long-pressing the screen to bring up the clipboard.
   - Fixed issues with Chinese font display.
   - Increased line height for command input.
   - Added Termux interaction permissions.
   - Increase the maximum number of scrollback lines.
2. **File Path Manager**:
   - Icons, logs, maps, and other files are organized under the BlowTorch directory for easy check.
   - Users should replace the contents of the BlowTorch directory with the provided compressed package.
3.**Plugin Settings**:
   - Accessible via the in-game menu under the options tab.
   - Customize settings for combat information, chat windows, and Bat integration.
   - Options include automatic translation of chat messages, tick cycle settings, health bar alerts, font size adjustments, and more.
4.**Translation Functionality**:
   - Use .fy xxx for manual translation between Chinese and English.
   - Translation can be toggled by swiping the health bar.
   - Utilizes the DeepLX-Serverless project for translation.
5.**Termux Interaction**:
   - Execute commands and retrieve results within Termux, also chat with LLM modules is available.
   - Requires specific setup and permissions via ADB.
6.**Map Drawing**:
   - Create and manage maps with commands like .mp new, .mp ld, .mp bk, .mp sv, etc.
   - Customize map appearance and manage room coordinates.
7.**Additional Features**:
   - Log management for chat and game information.
   - Whereis functionality for dungeon location tracking.
   - Font size adjustments for screen readability.
   - World map support with real-time coordinate updates.
   - Customizable button and icon settings for quick access to commands.
## Usage
- **Installation**: Replace the existing BlowTorch directory with the provided package and install the BlowTorch 2.1 app.
- **Configuration**: Import settings via the in-game menu and adjust plugin settings as needed.
- **Commands**: Utilize the various commands and shortcuts provided by the plugin to enhance gameplay efficiency.
## Termux Setup
1. Install ADB in Termux: `pkg install android-tools`
2. Enable wireless debugging on your phone and pair with Termux.
3. Grant interaction permissions: `adb shell pm grant com.happygoatstudios.bt com.termux.permission.RUN_COMMAND`
4. Execute commands in BlowTorch using `.tmx`.
## Map Drawing Commands
- `.mp new`: Start a new map.
- `.mp ld`: Load an existing map.
- `.mp bk`: Revert to the previous room.
- `.mp ed`: End map drawing.
- `.mp sv`: Save the current map.
- `.mp e\n\s\w\ee\ww\ss\nn`: Manually adjust room position in different direction.
- `.mp spl\spr`: Add or execute special command to\in cruent room, you can add at most of 2 command per room.
- `.mp mt`: search or show detailed information of monsters in cruent room.
- `.mp other chars`: Replace strings at designated location.

## Translation Commands
- `.fy xxx`: Translate text manually.
- Swipe health bar to toggle translation mode.
## Acknowledgments
The translation feature uses the [DeepLX-Serverless](https://github.com/guobao2333/DeepLX-Serverless) project. Special thanks to the contributors for their work.


For more detailed instructions and troubleshooting, please refer to the .docx document.
