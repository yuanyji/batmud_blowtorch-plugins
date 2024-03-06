English Instructions by GPT
Software-related
1. Backup
① Enter the game, click on the menu icon in the top right corner, select Export Settings to export personal game settings. Remember the configuration file name.
② Open the storage-emulated-0-Blowtorch directory in the phone's storage card, directly copy the entire Blowtorch folder to another location for backup.
2. Reinstall the version provided in the compressed package
The software has modified the maximum window rollback rows to only 300. The software is automatically signed after modification on MT Manager. You need to uninstall the originally installed software first. In cases where there are too many rows, loading the map may freeze on some phones. However, currently, the minimum number of rows to display the complete map at once has been set. If it still fails to run, consider not loading Laenor's map. After deleting some ocean characters from the current Laenor map, my Xiaomi 10 can run normally with the remaining 730 rows of information.
3. Copy the Blowtorch folder provided in the compressed package to the storage-emulated-0 directory
The folder mainly consists of my configuration file, batcombat plugin, chat plugin, batscmsg plugin, and a monospace font used for making large maps (the font file path in my configuration file corresponds to it. If it doesn't correspond, the software will crash). All plugins posted in the group earlier can be omitted. These three plugins have all the necessary functions.
4. Import the configuration files from the compressed package
Expand Import Settings in the game's top right menu to import settings, mainly including my key configuration, and the trigger settings of the software's built-in window (conflicts may occur if the same sentence triggers with different triggers in the lantern, so if your configuration is not necessary to continue using, it is recommended to directly use my configuration to avoid conflicts with the triggers in the plugins). If you want to continue using your own configuration file, you can put your backed-up configuration back into the corresponding folder, import the configuration in the game, those who have installed plugins before can uninstall all plugins and reinstall the new 3 plugins. Also, in the game window Options-Window-Font-luximri-3.ttf, set the font (tried many fonts, this one seems good), check the font in the Window settings of other plugins, and suggest closing the Option-Servers-Local Echo? setting to avoid a bunch of command feedback appearing on the screen.

Function-related
1. log
① The chat plugin automatically records all chat messages in a separate txt file under the chat plugin folder. Blowtorch-plugins-batchat_plugin
② The monster and equipment information obtained through the search function is saved in the corresponding log files in the Blowtorch-plugins-batscmsg_plugin folder.
③ Manually turning on the log recording function will store all information received on the main screen in the Batmud_log file in the batscmsg_plugin folder. Click the log record function again to close the main screen information log function. The switch is the third image button on the screen (further explained in the subsequent command).

2. whereis
Needs to collect location information. The plugin uses the setting in the sc format to obtain it. If there are issues in the search, it’s usually because the sc status hasn't updated after moving. Triggering sc once can fix it:
.wis Search for the nearest town
.wis except XXX Search for the nearest town whose name does not include the characters XXX
.wis nearest XXX Search for the nearest town whose name includes the characters XXX
.wis XXX Search for towns with the characters XX, similar to the usage in mudlet
.wis search XXX Currently unused, some Dryad websites don't specify where some old maps are located

3. Search for equipment and monster information
.seq XXX Search equipment information
.smon XXX Search monster information
.swiki XXX Search the corresponding entry on the wiki, mainly for matching monster or equipment format information, untested for other formats, should be able to display but will mix in some unused format information.

4. Screen font size scaling
① On the main screen, pinch with two fingers to reduce the font size and expand to increase it. The minimum font size is around 22, and the maximum is about 40 (you need to modify it in the plugin if you want to adjust the limit). If you copy the screen, the zoom function will be ineffective, and you need to close the window and reopen it. Closing the window means typing .closewindow in the command line or sliding the screen edge to choose the option to keep running in the background.
② The small map area at the bottom of the screen works similarly; the maximum font size is 30, the minimum is 2. In big map mode, tap the screen with two fingers and lift it to reposition the map based on the coordinates. After zooming in on the map, there may be slight deviations due to processing large amounts of text. Practice more to find techniques (such as moving left and right during zoom might cause deviation or restore accurate positioning) or combine with the small map to determine the location. Alternatively, set a font size you like in the software menu bar option-bat integrated plugin-window-fontsize and save it as a favorite font; you don't need to zoom in often, but closing and reopening the window after zooming in can help reposition accurately.

5. Big map
① Preliminarily completed, requires setting the prompt to refresh the coordinate position in real-time. Since much information is displayed in the small window at the bottom of the screen, misplacing the big map can lead to coordinate misalignment, and currently, there isn't a good solution. First, consider not displaying other information in the small window. If anyone is interested in researching how to achieve a similar effect as the chat window (storing different information in different channels without disturbing other information), it can be optimized (the main hurdle is that the map file is a local ANSI file read and displayed as a string information in the plugin, while the chat window functions by setting received messages from the server to different buffers, corresponding data is handled through lantern's userdata, so you cannot directly connect the map string data with lantern's XXbuffer:appendLine(line)). 
② Temporarily set that if location information repeats within 30 milliseconds, the map positioning won’t refresh. When rapidly moving, triggering related functions continuously isn't necessary; experiment with gradually reducing the interval if it's too long. The plugin won’t update the position when the coordinates don’t change, such as when inside the town where coordinates don't change, and the corresponding functions won't trigger. There may be bugs in some scenarios. If there is no response, try moving slightly to change your own coordinate to see.
③ Load the map only once during each game session to avoid frequent loading of large files, which could cause software to crash. If there's a bug or the big map's position is offset due to other information and can't be located, you can exit the game and re-enter (completely exit the game. It doesn’t require exiting the software or closing the window to run in the background).

6. Dryad's existing small map
   When searching for a specific town using the .wis function, if there is a corresponding small map, it will be displayed. The small map is not locatable and can only be viewed like on a webpage.

7. Avatars
① Under the batscmsg plugin directory, there is an icon folder that divides items into different categories. Currently, only a few basic images are provided, and they can be customized by adding images related to certain game content to the relevant folders. There is ample room for expansion and playability. For example, assigning an icon to each spell, skill, item, and NPC could be feasible. Two icons have been added to the screen, using square icons sized 120 pixels x 120 pixels. The icon filenames are in English (not tested with Chinese).
② The left side of the screen displays the player's race. To change the specific image file, the filename in the Lua file should match the image you wish to display. When in a stunned state, an icon for that state is shown (need to be in battle mode window, further explained below), clicking the stunned state icon sends the command "wimpy now." Clicking the race icon switches to the backpack interface; the icon transforms into a backpack, and clicking it again returns to the default interface.
③ On the right side of the screen, clicking the icon switches to a target interface specific to certain races. Sliding the icon will automatically target the first monster in the current room (this feature is still being optimized and might only be useful for the user, further explained below). The feature currently has some limitations that might not match well with multi-player scenarios or pets, depending on the circumstances.

8. Auto Targeting
Triggered by sliding the icon on the right side of the screen. When a with monsters is entered in the game, typing "blook" displays brief information. For my interface, the name of the monster is below the line mentioning my mount. This logic is used to capture the monster's name. It might not work for other mounts or pets without similar logic; this feature is effective when a fixed reference ("like my mount's name") can be used to lock onto the monster’s name, needing corresponding modifications in the code for different users. Optimization could involve resolving the issue of lantern not detecting colors by possibly finding a method in the source code (getData() can process text into a series of Java objects with text content, further processing needs to convert those Java objects into color ANSI codes like /27[).


9. Horizontal and Vertical Layout Switch
Two layouts have been designed: first, set the horizontal or vertical layout in the in-game menu under "orientation," then check or uncheck the vertical layout option in the bat integration plugin settings. After completing the operation, the software will return to the login screen and entering the game again will complete the layout switch. The settings will be saved for the next time you enter the game and display according to the previous layout.

10. Battle Mode Window
By clicking the icon on the right side of the screen, you can access the targeting interface of a specific race, and sliding it triggers the automatic target feature. The window automatically closes at the end of a battle, while manual closure can be done by sliding the icon on the right side. Directly entering commands in the command bar does not trigger certain functions; usually, there is no need to manually input commands from the plugin. After triggering, a separate window opens. The information displayed is similar to the physical damage level shown in Mudlet on group chats. Additionally, during battles, some information such as monster name, health percentage, player's health percentage, current round of enemy damage, and total output are shown on individual health bars. The main window continues to display original battle information. After the battle ends, the default settings are changed to "battle listen all 0," where all information is continuously displayed during battles.

11. Personal, Monster, and Team Health Bars
① Besides various states, the personal health bar displays some text information. In small battles, specific battle details aren’t necessary to view in the window; the experience bar shows a full status bar of 2M, roughly monitoring the experience value by the bar length.
② The monster health bar is only displayed when the battle mode window is open, currently showing a maximum of the first two monsters' health bars, with the third monster not displayed.
③ The team health bar requires being in a team. Currently, only tested in a solo party status; group play and pets may not match perfectly; it depends on the specific situation.

12. Fixed Buttons
Includes two avatar icons, the personal health bar in the middle, and eight small buttons on the screen, each of which can be set to trigger different commands with up, down, left, right, and click functionalities. Adjusting the small button features is simple, whereas the icons need to retain the functions for clicking and sliding. The command settings for each button's functionality are listed as examples in the Lua file. 

13. Countdown Window
Incycles of 30 seconds, the countdown will be displayed on the screen when it falls below 6 seconds. At the onset of the game, the countdown is not very useful. The cycle resets to 30 seconds when HP/SP/MP increase simultaneously. Some tick periods are not 30 seconds, requiring adjustment in the "ticktick()" function settings in the batscmsgwindow.lua file.

14. Calling the Phone Vibration Duration Feature
In the game, set triggers to respond with the act setting /WindowXCallS("batscmsgwindow","vibratetine","500"), where 500 denotes a vibration duration of 500 milliseconds — it can be modified.

15. Instant Exit
Using the "blook" command displays all exits in the current room. Clicking the first button icon switches to a simple nine-key layout, where each key corresponds to a cardinal direction, and sliding triggers other commands. Sliding buttons on the west and east sides can activate special exits. Path and drawbridge-type exits are considered special. Sliding the west button triggers the first special exit, while sliding the east button triggers the second one. If only one special exit is available, sliding the west button will suffice.

16. Laenor Key Map
By sliding upwards on the first fixed image button and clicking the light blue "lae" tag button, you can enter adjacent towns. Use clicks and slides to navigate to neighboring towns and return to the previous one. The main principle is having blue tag buttons as the main nodes. Nodes move vertically, with each main node expanding sideways to form a horizontal movement map.

17. Miscellaneous Triggers
A few additional triggers include automatically adding commands for selling equipment in shops, and after death, automatically shouting for resurrection the first time, and accepting resurrection the second time. These may require personal customization based on individual needs. No other major functionalities could be identified temporarily.

Game Settings
cutter off
prompt #&<continent>,<coords>&#
sc set &{colorhp},:{diffhp},{colorsp},:{diffsp},{colorep},:{diffep},<exp>,:{diffexp},<pool>,<eqset>,<weight>,<parry>,:<target>,<continent>,<coords>,<maxhp>,<maxsp>,<maxep>,<sec>,<min>,<hour>&
set 11 on
set 27 on

These in-game personal command settings could help understand certain commands within the plugin.

buff1        use Bestial frenzy
c            consider $*
calytodel    7 e;3 s;4 e;2 s;2 e;10 s;travel s;travel sw;travel nw 186;6 e;n
calytoferry  7 e;3 s;4 e;2 s;2 e;7 s;travel s;travel se;travel se;10 e
cbm          cast banish mount
ccf          cast create food
clw          cast cure light wounds at me
cure         cast cure light wounds at $*
deltowell    s;6 w;13 n;2 e
dlow         gagoutput take all from purse;gagoutput drop copper;gagoutput drop mowgles;gagoutput drop bronze;gagoutput drop tin;gagoutput take mithril;gagoutput take batium;gagoutput take anipium;gagoutput take platinum;gagoutput take gold;gagoutput pac
eatch        get cheese calzone from frame;keep cheese calzone;eat cheese calzone
ferrytocaly  10 w;travel w;travel n;travel n;7 n;2 w;2 n;4 w;3 n;7 w
ferrytolor   s;travel s;11 s
ferrytorily  s;travel s;10 e;5 s
ferrytosc    se;s;travel s;travel se;travel se;travel e
ferrytoshad  3 s;10 e;12 ne;6 n;12 ne;13 n;travel nw;travel n;travel nw;travel e
gac          get all from purse
getframe     get $* from frame
getsbag      get $* from niubi
k            kill $*
lortoferry   11 n;travel n;n
pac          put all in purse
pframe       put $* in frame
tcf          tzarakk chaosfeed corpse
ucmn         use ceremony
ucs          use chaotic spawn
var1         use 'charge' $*
var2         use 'rampage' $*
welltodel    2 w;13 s;6 e;n
rideniubi    grep 'Saddlebags' l niubi;grep -B 4 'It is being ridden by' l niubi;gagoutput ride niubi;gagoutput give saddlebags to niubi;give all noeq except salve to niubi
rilytoferry  5 n;10 w;travel w;n
sctobank     20 n;8 n;5 e;5 n;5 e
sctoferry    travel w;travel w;travel w;travel n;n;w;nw;n;nw
sdb          cast Summon dire boar
shadtoferry  travel w;travel s;travel s;travel s 79;13 s;12 sw;6 s;12 sw;10 w;3 n
snarmour     get all armour from niubi;sn
snweapon     get all weapon from niubi;sn
sot          cast steed of tzarakk


中文说明

一、软件相关
1、备份
①进入游戏内，点击右上角展开菜单，选择Export Settings导出个人游戏配置，记住配置文件名；
②打开手机存储卡目录的storage-emulated-0-Blowtorch，直接将整个Blowtorch文件夹拷贝到其它位置备份；
2、重新安装压缩包内提供的版本
软件修改了窗口回滚行数最大只有300行的限制，软件在MT管理器上改完自动签名的，需先卸载原来安装的软件，行数过多的情况可能有的手机上载入地图会卡死，但是目前已经设置到一次性显示完整地图的最小行数了，运行不了的情况得考虑不载入laenor的地图，我的小米10在目前laenor地图删掉一些海洋字符后剩下的730行信息下可以正常运行；
3、拷贝压缩包内提供的Blowtorch文件夹至storage-emulated-0目录下
文件夹主要有我的配置文件、batcombat插件、chat聊天插件、batscmsg插件、一个做大地图时候用到的monospace字体（我的配置文件的字体文件路径是对应的、如果不对应软件会闪退），此前所有发在群里的插件都可以不要、这三个插件该有的功能都在。
4、导入压缩包内的配置文件
游戏内右上角菜单展开Import Settings,主要是我的按键配置、软件自带窗口的trigger设置（喷灯中同句话不同trigger触发会冲突、如果自己的配置不是很有必要继续用的话建议直接用我的配置、避免跟插件内的trigger冲突）
如果想继续用自己的配置文件也可以，把自己备份的配置重新放到对应的文件夹中，游戏中导入配置，之前安装过插件的可以把插件全部卸载掉重新安装新的3个插件，另外在游戏窗口的Options-Window-Font-luximri-3.ttf中设置字体（试了很多款字体感觉这个还不错），其它插件中的Window设置也检查下字体，Option-Servers-Local Echo?设置选项建议关闭、可以避免屏幕上出现一堆命令反馈。

二、功能相关
1、log
①聊天插件会自动记录所有聊天信息至聊天插件文件夹下单独的txt文件内。Blowtorch-plugins-batchat_plugin
②通过查询功能查询到的怪物信息、装备信息保存在Blowtorch-plugins-batscmsg_plugin文件夹内的相应log文件中
③手动打开log记录功能会将主屏幕上收到的所有信息存到batscmsg_plugin文件夹内的Batmud_log文件中，再次点击log记录功能会关闭主屏幕信息log功能。开关是屏幕上的第三个图像按键（按键后续进一步介绍）

2、whereis
需要收集位置信息，插件中通过sc格式的设置获取，如果查的有问题一般是因为移动后sc状态没更新，触发一次sc即可：
.wis	搜索最近的地城
.wis except XXX   搜索地城名字中不包含XXX字符的最近地城
.wis nearest XXX   搜索地城名字中包含XXX字符的最近地城
.wis XXX      搜索包含XX字符的地城，同mudlet中用法
.wis search XXX    暂时没用，一些dryad网站上不知道具体在哪里的老地图

3、搜索装备、怪物信息功能
.seq XXX  搜索装备信息
.smon XXX  搜索怪物信息，
.swiki XXX  搜索wiki上相应词条，主要匹配怪物或装备信息的格式，其它没怎么试验过、应该能显示但是会有写没用的格式信息参杂。

4、屏幕字体大小缩放
①主屏幕上双指捏合缩小字体大小、双指扩张放大字体，最小字体大小22、最大40左右（要调整限制需要在插件里面改），如果进行了屏幕复制会导致放缩功能失效 需要关闭窗口重进，关闭窗口的意思是命令行输入.closewindow或滑动屏幕边缘选择保持后台运行选项。
②屏幕下发小地图区域同理，字体最大30、最小2，在大地图模式双指点击屏幕并抬起后根据坐标位置重新定位地图位置（缩放地图后用得上，放缩后可能会因为处理文本量大之类的原因出现定位小范围偏差，多试试找找技巧（好像放缩中左右平移会造成偏差或恢复准确定位）或者结合小地图确定位置，或者在软件菜单栏option-bat集成插件-window-fontsize中设置一个自己喜欢的字号、平时不太需要放缩、放缩后关闭窗口重进也可以重新准确定位）

5、大地图
①初步完成，需要设置prompt实时刷新位置坐标，由于之前很多信息设置在屏幕下方的小窗口上显示、如果大地图被别的信息顶掉会造成坐标定位错位的问题，暂时没有太好的办法、先考虑其它信息都不在小窗口上显示了，如果哪位大佬有兴趣帮忙研究下如何实现类似聊天窗口中的效果可以优化（不同频道存储不同的信息、切换频道不敢干扰其它信息，主要的问题在于地图文件是本地的ansi文件读取到插件上的字符串信息，聊天窗口中的效果是将从服务器接收到的消息设置到不同的buffer里、对应的数据是经过喷灯处理的userdata，不能直接将地图字符串信息跟喷灯的XXbuffer:appendLine(line)相连）
②暂时设置成30毫秒内重复接收坐标信息不刷新地图定位、应对快速行走时没必要一直触发相关功能的情景，实测如果间隔太长就逐渐改小时间间隔；插件在坐标不变化的时候也不会更新位置、比如在地城里坐标不会变化、相应的功能也不再触发、可能在某些场景下会有bug、没反应的时候移动一下改变自身坐标看看；
③每次启动游戏期间只载入一次地图、避免大文件频繁导入软件可能更容易闪退、如果出bug或者因为其它信息把大地图位置顶偏了导致不能定位、可以退出游戏重新进下（指彻底退出游戏、不需要退出软件、也不是指关闭窗口后台运行）

6、dryad已有的小地图
   使用.wis相关功能搜索某个地城时、如果有相应的小地图、会打印出相应的小地图，小地图不能定位 只能像网页上那样看。

7、头像
①batscmsg插件目录下有个icon文件夹，里面按不同的类别分了一些文件夹，目前只提供几个基础图片，可以自定义，添加到相应文件夹的图片命名成跟游戏某些内容相关的词条都是可以用得上的，有很大的扩展空间跟可玩性，比如每个法术技能物品npc配一个图标，有想法估计场景图片化显示下都有可能，屏幕上目前添加了两个图标显示位置，采用的图标大小是120像素*120像素的方形图标，图标文件名用英文（中文没试验）。
②屏幕左边屏幕目前用来显示本人种族（需要更换脚本的具体图片文件名称跟你想显示的图片名称一致、比如我用的是icons-portraits文件夹中的minotaur_male_web.jpg，想换成其它的就在batscmsgwindow.lua文件中搜索minotaur_male_web.jpg替换成icons-portraits文件夹中的另外一个图片的文件名），该位置的图标除了显示种族、在stun状态时还会显示眩晕状态的图标（需要处于战斗模式窗口、下文介绍）、点击stun状态图标会发送wimpy now，显示种族头像的时候点击图标会切换到背包操作界面、图标变成背包图标、再次点击返回默认操作界面。
③屏幕右侧的图标点击后切换到特定种族target界面、再次点击返回，滑动则自动target当前房间的第一个怪（该功能还不完善、可能只对我自己有用、下文介绍）、并触发怪物信息搜索功能、假如怪物所属的种族在icons文件夹的portraits、mounts、pets文件夹内有图片的文件名中包含该怪物种族名称则会把屏幕右侧的图标变成相应的图片，使用自动target功能成功瞄准怪物后点击左侧头像图标可以上buff、点击右侧怪物头像可以var1怪物（我的游戏设置成command var1 use 'charge' $*，类似的还有var2~var5，buff1，buff2，这样只需要在游戏里设置command就可以更改固定按键的触发命令）、点击命令栏则是kill 怪物、滑动则取消返回默认界面。

8、自动target
通过屏幕右侧图标上滑触发，bat里面进入一个有怪的房间的时候、输入blook会显示简略信息，对我的界面来说怪物的名称会在我的坐骑名称那句话的下面一行，我主要通过这个逻辑抓取怪物名称，其它没坐骑的可能不行、或者宠物也有可能有类似的显示规律，在可以通过“固定标记（如我的坐骑名）”锁定怪物名称的时候这个功能可以生效、对不同的人要在代码里相应修改下固定标记。
如果有大佬可以解决喷灯不能抓颜色的问题可以优化(可能能在源码里找到方法，getData()可以把文本处理成系列java对象+文本内容的格式，需要进一步把java对象处理成颜色ansi代码/27[之类的)。



9、横竖布局切换
设计了两种布局，先在游戏内菜单栏的orientation中设置横竖布局，再在bat集成插件设置中勾选或去掉竖直布局的选项，操作完后软件回到登录界面、重新进入游戏即可完成布局切换。下次进入游戏不需要重新设置、按之前的布局显示。

10、战斗模式窗口
通过点击屏幕右侧图标进入的特定种族瞄准界面触发或滑动进入自动target触发，战斗结束自动关闭、滑动右侧图标手动关闭。直接在命令栏中输入游戏中的命令不触发，一般不需要通过手动输入插件中的函数命令触发。
触发后单独打开一个窗口、信息显示与群里mudlet的物理伤害等级显示差不多，另外战斗中会在个人血条上显示一些信息、比如怪物名称 血量百分比  自己的血量百分比 当前轮次敌我伤害输出、总伤害输出等信息。
主窗口中仍然会显示原始战斗信息，战斗结束后默认设置成battle listen all 0，战斗期间的信息是all 2。

11、个人血条、怪物血条、团队血条
①个人血条除了几个状态，还会显示一些文本信息，小战斗基本不需要看窗口中的具体战斗信息；经验条我设置的满状态条是2M，大概看状态条长度了解经验值即可。
②怪物血条只在打开了战斗模式窗口显示，目前最多只显示前两个怪的血条，第三个怪不显示；
③团队血条需要在团队中，目前只测试过我一个人开party的状态，多人组队以及宠物可能会不匹配、看具体情况。

12、固定按键
包括两个头像图标、中间的个人血条、屏幕上的八个小按键，每个按键都可以设置成上滑、下滑、左滑、右滑、点击分别触发什么命令，小按键改起来简单，两个头像就不用折腾改了、保留点击滑动两个指令就好了。
现有各个按键的命令设置（不需要增减命令的情况直接替换batscmsgwindow.lua文件中相应的字符就可以更改成你们自己的命令）：
imgmessage()括号内共有9个参数，从左到右分别是视图名称、点击命令、滑动命令、点击后图标变换的类型、点击后图标变换的序号、图标变换后的点击命令、图标变换后的滑动命令、图标变换后点击图标变换的类型、图标变换后点击图标变换的序号，除了第一个视图参数，其他参数都用双引号括起来、并用逗号隔开。如果搞不来图标变换，把相应位置的点击命令、滑动命令替换成自己想要的命令即可。
imgmessage5items（）括号内共有6个参数，从左到右分别是视图名称，点击命令，上滑命令，下滑命令，左滑命令，右滑命令。这个函数主要用在八个按键上面，跟据自己的需要，把相关的命令替换。
示例：
左边的头像图标(如果进行修改，在文件的其他部分也搜索一下进行修改)：
imgmessage(imageview, ".loadset bags", "eq", "items", 1, ".loadset Brief", "eq", "portraits", 1)
右边的头像图标(如果进行修改，在文件的其他部分也搜索一下进行修改)：
这个按键的'Niubi'是我的坐骑名，滑动触发自动target功能需要依靠标志语句定位，可能有的人用不了，如果这里改了坐骑名变成其他的标志语句，在batscmsgserver.lua文件中也搜索下'Niubi'修改掉：
imgmessage(imageview2, ".dmgifs on;.loadset rctgt;blook", ".tgton on;grep -q -A 1 'Niubi' blook", "status", 2, ".dmgifs off;.loadset Brief", ".tgton on;grep -q -A 1 'Niubi' blook", "mounts", 1)
中间的血条图标：
imgmessage5items(barView, "sc;score", ".keyboard party create ;pss", "show summary;ps;.keyboard disband", "ucmn;.kb cbm", "sot")
但从左到右顺序，八个按键：
地图，wis相关功能：
imgmessage5items(buttonview0, ".loadset Brief;set 23 on", ".loadset travel", "sc;.kb .wis ", "sc;.kb .wis except ", "sc;.kb .wis nearest ")
套装切换：
imgmessage(buttonview1, "gagoutput eqset defset;/Note(\"\\27[1m\\n-------EQ ------- >>> Default\\27[0m\\n\\n\");gagoutput eqset command sprset put <item> in frame;/WindowXCallS(\"batscmsgwindow\",\"processscanep\", \"Default <<<-- EQ --\")", "gagoutput eqset command sprset get <item> from frame;gagoutput eqset replacing sprset;/Note(\"\\27[1m\\n-------EQ ------- >>> Spr\\27[0m\\n\\n\");/WindowXCallS(\"batscmsgwindow\",\"processscanep\", \"Spr <<<-- EQ --\")", 0, 0, 0, 0, 0, 0)
log与搜索功能：
imgmessage5items(buttonview2, "ccatch change", ".kb .seq ", ".kb .smon ", ".kb .swiki ", ".kb .swiki ")
骑马睡觉相关：
imgmessage(buttonview3, ".timer info 300;rideniubi", "dismount;lead niubi;.kb release niubi;sleep", 0, 0, 0, 0, 0, 0)
切换至团队操作 常用语等按键：
imgmessage(buttonview4, ".loadset default", ".loadset default", 0, 0, 0, 0, 0, 0)
治疗：
imgmessage5items(buttonview5, "clw", ".keyboard cure ", ".keyboard cure ", "show effects", "show effects")
技能：
imgmessage5items(buttonview6, "var1", "var2", "var3", "var4", "var5")
简洁/复杂模式，look on move等：
imgmessage5items(buttonview8, "brief brief;set 23 on", "brief verbose", "brief weather", "set 23 off",  "set 23 on")



13、倒计时窗口
30秒一个循环，倒计时在6秒以下时会显示在屏幕上，刚进游戏时没参考价值、循环会在hp\sp\mp同时有增加的时候刷新到30秒，有的tick周期不是30秒的需要更改batscmsgwindow.lua中的ticktick()函数中的设置数值。

14、调用手机振动时长功能
游戏中需要的地方trigger的响应act设置成 /WindowXCallS("batscmsgwindow","vibratetine","500")  500指震动时长500毫秒、可改。

15、出口免打字
blook可以看到当前房间的各个出口，点击第一个按键图标会切换到我的简易按键布局，九宫格按键。点击触发常规的东南西北等方向。滑动触发其他的命令。从西侧和东侧的按钮滑动会触发特殊的出口，也就是在用blook看到的出口信息中，除去常规的东南西北上下出口，如果有path、drawbridge)这种单词出口，滑动西侧按钮触发第一个特殊出口、滑动东侧按钮触发第二个特殊出口、如果只有一个特殊出口滑动西侧按钮就可以了。

16、laenor按键地图
第一个固定图像按钮上滑、点击浅蓝色lae标签按钮进入，相邻两个地城，通过点击和滑动实现前往相邻的地城和返回上一个地城。主要原则为蓝色标签按钮为主节点，主节点之间竖向移动，每个主节点向两侧摊开、行成横向移动地图。

17、其它，一些零零碎碎的trigger,比如商店里命令行会添加卖装备的命令，死了look一次命令行添加求复活喊话 再一次添加接受xxx复活，有的跟游戏内的命令相关需要根据个人需要重新设置，暂时想不到其它大的功能了。

三、游戏设置相关
cutter off
prompt #&<continent>,<coords>&#
sc set &{colorhp},:{diffhp},{colorsp},:{diffsp},{colorep},:{diffep},<exp>,:{diffexp},<pool>,<eqset>,<weight>,<parry>,:<target>,<continent>,<coords>,<maxhp>,<maxsp>,<maxep>,<sec>,<min>,<hour>&
set 11 on
set 27 on

以下游戏内的个人command设置可能有助于理解插件中的一些命令：
buff1        use Bestial frenzy
c            consider $*
calytodel    7 e;3 s;4 e;2 s;2 e;10 s;travel s;travel sw;travel nw 186;6 e;n
calytoferry  7 e;3 s;4 e;2 s;2 e;7 s;travel s;travel se;travel se;10 e
cbm          cast banish mount
ccf          cast create food
clw          cast cure light wounds at me
cure         cast cure light wounds at $*
deltowell    s;6 w;13 n;2 e
dlow         gagoutput take all from purse;gagoutput drop copper;gagoutput drop mowgles;gagoutput drop bronze;gagoutput drop tin;gagoutput take mithril;gagoutput take batium;gagoutput take anipium;gagoutput take platinum;gagoutput take gold;gagoutput pac
eatch        get cheese calzone from frame;keep cheese calzone;eat cheese calzone
ferrytocaly  10 w;travel w;travel n;travel n;7 n;2 w;2 n;4 w;3 n;7 w
ferrytolor   s;travel s;11 s
ferrytorily  s;travel s;10 e;5 s
ferrytosc    se;s;travel s;travel se;travel se;travel e
ferrytoshad  3 s;10 e;12 ne;6 n;12 ne;13 n;travel nw;travel n;travel nw;travel e
gac          get all from purse
getframe     get $* from frame
getsbag      get $* from niubi
k            kill $*
lortoferry   11 n;travel n;n
pac          put all in purse
pframe       put $* in frame
tcf          tzarakk chaosfeed corpse
ucmn         use ceremony
ucs          use chaotic spawn
var1         use 'charge' $*
var2         use 'rampage' $*
welltodel    2 w;13 s;6 e;n
rideniubi    grep 'Saddlebags' l niubi;grep -B 4 'It is being ridden by' l niubi;gagoutput ride niubi;gagoutput give saddlebags to niubi;give all noeq except salve to niubi
rilytoferry  5 n;10 w;travel w;n
sctobank     20 n;8 n;5 e;5 n;5 e
sctoferry    travel w;travel w;travel w;travel n;n;w;nw;n;nw
sdb          cast Summon dire boar
shadtoferry  travel w;travel s;travel s;travel s 79;13 s;12 sw;6 s;12 sw;10 w;3 n
snarmour     get all armour from niubi;sn
snweapon     get all weapon from niubi;sn
sot          cast steed of tzarakk
