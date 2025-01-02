# Author:Potion(My batmud game id).
This github repository is used to share my batmud blowtorch plugins.

# Main function provided by these plugins:
## Overview
The BlowTorch plugin is designed to enhance the gaming experience by providing various functionalities such as world map,health bar,portraits,easy targetting,fast move,location route search, translation features, Termux interaction, map drawing, and more. This plugin is particularly useful for players who want to play batmud by Android devices.
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

3. **Plugin Settings**:
  - Accessible via the in-game menu under the options tab.
  - Customize settings for combat information, chat windows, and Bat integration.
  - Options include automatic translation of chat messages, tick cycle settings, health bar alerts, font size adjustments, and more.

4. **Convenient Functions**:
  - Map Drawing: Create and manage maps with commands like .mp new, .mp ld, .mp bk, .mp sv, etc.
  - Translation: translation between Chinese and English.
  - Termux Interaction: Execute commands and retrieve results within Termux, also chat with LLM modules is available.
  - Log management: record chat and game informations.
  - Whereis: functionality for dungeon location tracking.
  - Font size: Double finger zoom to adjust size for screen readability.
  - World map: display location of character outdoors with real-time coordinate updates.
  - Buttons: Customizable button and icon settings for quick access to commands by click or slide in different directions.
  - Target monsters: by swipe buttons or type icons, no need type chars.
  - Special exit: slide button to get access to special exits, like "drawbridge".
  - Combat window: simplify the combat informations display, like "potion: 200".
  - Health bar: Show your hp,ep,sp status or party status graphically, also for enemy health.
  - Timer window: shows count every tick cycle.
  - Chat window: individual window for chat message display.

# Plugin Usage
- **Installation**: Replace the existing BlowTorch directory with provided package or create new emulated/0/BlowTorch directory and install the BlowTorch 2.1 app.

- **Configuration**: Import settings via the in-game menu and adjust plugin settings as needed.

- **Commands**: Adjust theme and color settings to match plugin 

  `set channel_timestamp on`

  `set graphic_exits on`

  `set map_frame on`

  `set ultra_verbose on`

  `set coords_on_short on`

  `cutter off`

  `prompt #&<continent>,<coords>&#`

  `sc set &{colorhp},:{diffhp},{colorsp},:{diffsp},{colorep},:{diffep},<exp>,:{diffexp},<pool>,<eqset>,<weight>,<parry>,:<target>,<continent>,<coords>,<maxhp>,<maxsp>,<maxep>,<sec>,<min>,<hour>&`

  ansi set:

    regmons      #66ff00  **match script color  string [38, 5, 82]

    roomlong         light white

    roomshort      #feeeed    **match script color  string   [38, 5, 255]

# Function Usage
## Map Drawing Commands

- `.mp new`: Start a new map.
- `.mp ld`: Load an existing map.
- `.mp bk`: Revert to the previous room.
- `.mp ed`: End map drawing.
- `.mp sv`: Save the current map.
- `.mp e\n\s\w\ee\ww\ss\nn`: Manually adjust room position in different direction.
- `.mp spl\spr`: Add or execute special command to\in current room, you can add at most of 2 command per room.
- `.mp mt`: search or show detailed information of monsters in current room.
- `.mp md 1/2`/3: toggle room information catch mode, the default set is 'md 1', if you want change other mode, you should manual input command before a new map drawing start. Mode 1 distinguish different room by roomshort + roomlong. Mode 2 will add 'obvious exits' information after roomlong messages. Mode 3 won't record any room messages, just create coords by moved position and activated by a new room message, that means you can only use this mode when the room distance are all regular, and you should notice to sure the position is renewed every step you move, this mode is useful when the area has many same room description.
- `.mp other chars`: Replace strings at designated location.

## Translation Commands（En↹Zh）

- Choose a url used for translation in menu-options-bat集成插件设置-翻译插件url.
- `.fy xxx`: Translate text manually.
- Swipe health bar to toggle translation mode.
- Please do not abuse this function! If you translate frequently, please purchase a paid service from DeepL. The web version of the interface used by the plugin is subject to DeepL policies.

## Termux Interaction Setup
1. Install ADB in Termux: `pkg install android-tools`
2. Enable wireless debugging on your phone and pair with Termux.
3. Grant interaction permissions: `adb shell pm grant com.happygoatstudios.bt com.termux.permission.RUN_COMMAND`
4. Execute commands in BlowTorch using `.tmx`.
5. Chat with `qwen2.5:0.5b` by `.tmx ai xxx` if you have installed ollama and started `qwen2.5:0.5b` in your termux.
## Log management
- Chat messages will automatically recorded, check your logfiles under `/BlowTorch`.
- Click ![log button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/book.jpg) to turn on log function, click again to turn off.

## Whereis
- `.wis xxx`: Search how to get to your target location.
- click ![map button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/travel.jpg) for more information.

## Font size: 
- Double finger zoom to adjust size for screen readability.
- swipe left above the ![map button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/travel.jpg) to minimize the text size and swipe left again to recover the default text size.
## World map
- display location of character outdoors with real-time coordinate updates.
- click above the ![map button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/travel.jpg) to clear the map.
## Buttons
- left portrait: click to switch to bag commands list（etc. drop、i、l frame), swipe up to send command eq.
- right portrait: click to switch to race commands list(etc. kill human, var1 human), swipe up to auto target enemy in current room ( sometimes may need to click again to target for unknow reason).
- health bar: named barView in batscmsgwindow.lua, will send different command to server when click, swipe up, swipe down, swipe left, swipe right, search 'imgmessage5items(barView' in batscmsgwindow.lua to check or modifier every command.
- You can also check and modifer other 8 buttons in the script, they are named buttonview0~buttonview6 and buttonview8. 
- I strongly recommand set command var1-var5 as your own general skills in your game, cause the button ![skills button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/charge.jpg) is used to send var1-var5.
## Target monsters
- swipe up or click right portrait to access enemy target without  monster information.
- swipe up or swipe down button ![search button](https://github.com/yuanyji/batmud_blowtorch-plugins/tree/main/BlowTorch/Icons/buttons/book.jpg) to target and get monster information before you take action.
## Special exit
- the default nine-square box are used for moving! 
- click button to send nw,n,ne,w,bl,e,sw,s,se.
- swipe to send enter,up,tansuo,special left,look,special right,leave,down,open door.
- long click to adjust command by yourself.
- the special left/right means irregular exits name like "drawbridge" ,  for example, if the exits are '(e, s, w, n, drawbridge, dortwall, forest)', special left will send 'drawbridge', and special right 'forest'.
## Combat window
- if you use some auto target function, it may aotomatic enter combat window.
- if you want to exit manually, try click or swipe right portrait. Also send command by command line is ok, the command line will keep the last auto target command used.
# Acknowledgments
The translation feature uses the [DeepLX-Serverless](https://github.com/guobao2333/DeepLX-Serverless) project. Special thanks to the contributors for their work. And please do not abuse this function! If you have a large amount of content to translate, please purchase a paid service from DeepL. The web version of the interface used by the plugin is subject to DeepL policies.


For more detailed instructions and troubleshooting, please refer to the .docx document.
