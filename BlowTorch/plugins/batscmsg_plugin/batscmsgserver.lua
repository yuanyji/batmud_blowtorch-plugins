--scmsg plugin
--made by potion

require("serialize")
package.path = package.path..";"..GetPluginInstallDirectory().."/?.lua"
--require("dkjson")
package.path = package.path..";".."/storage/emulated/0/BlowTorch/Maps/areamaps".."/?.lua"
require("arealocationsandmap")


RegisterSpecialCommand("hpr","rbar")
RegisterSpecialCommand("dmgifs","damageInfostart")
RegisterSpecialCommand("scr","scanshow")
RegisterSpecialCommand("wis","displayNearestCityData")
RegisterSpecialCommand("swchfc","switchingfunc")
RegisterSpecialCommand("dmgif","damageInfoaccept")
RegisterSpecialCommand("tgt","targetnpc")
RegisterSpecialCommand("tgton","targetallswitch")
RegisterSpecialCommand("tgton2","targetallswitch2")
RegisterSpecialCommand("exit","exitsearch")
RegisterSpecialCommand("seq","downloadEquipSearchJson")
RegisterSpecialCommand("smon","downloadMonsterInfo")
RegisterSpecialCommand("swiki","DownloadWikiSearchItem")
RegisterSpecialCommand("cs","vshdjnfkkd")
RegisterSpecialCommand("win","windowcontain")
RegisterSpecialCommand("mpp","ifDrawMap")
RegisterSpecialCommand("mp","drawAreaMapceshi")
RegisterSpecialCommand("fy","ManualTranslation")
RegisterSpecialCommand("tmx","executeTermuxCommand")
function executeTermuxCommand(command)
--local activity = luajava.bindClass("android.app.Activity")
WindowXCallS("batscmsgwindow","executeTermuxCommand",command)
end

batscmsgWindow = GetWindowTokenByName("batscmsgwindow")
batscmsgWindowName = "batscmsgwindow"
AppendWindowSettings("batscmsgwindow")

TextTree = luajava.bindClass("com.offsetnull.bt.window.TextTree")
--mainWindow = GetWindowTokenByName("mainDisplay")
--mainWindow = getWindowManager():getDefaultDisplay()
--Note(mai  nWindow:getLayouts():keySet():iterator():next():toString())
--local orientation2 = mainWindow:getSettings():findOptionByKey("font_size"):getValue()
--local orientation = mainWindow:GetOptionValue("ORIENTATION")
--local orientation2 = view:getSystemService()
--Note("\norien:"..tostring(orientation2).."\n")
--mainWindow:isLandscape()
--local psettings1 = GetSettings()
--local op1 = psettings1:findOptionByKey("orientation")
--local opval1 = op1:getValue()
--Note(tostring(op1))
--setOrientation(1)
function ceshice(name, line, map)
local data = line:getData()
Note(data)
AppendLineToWindow(batscmsgWindowName, "data"..data:toString())
end

--Note("vdhhdjdjdk:"..tostring(EnableTrigger("translationcatch")))

function ceshice2()
if EnableTrigger("translationcatch") then
Note("it is true")
else
Note("it is false")
end
end

local ansi = "\27["
local lwhite = "\27[0m"
local lwhite2 = "\27[1m"
local dred = "\27[0;31m"
local dgreen = "\27[0;32m"
local dyellow = "\27[0;33m"
local dblue = "\27[0;34m"
local dmagenta = "\27[0;35m"
local dcyan = "\27[0;36m"
local dwhite = "\27[0;37m"
local bred = "\27[31;1m"
local bgreen = "\27[32;1m"
local byellow = "\27[33;1m"
local bblue = "\27[34;1m"
local bmagenta = "\27[35;1m"
local lmagenta = "\27[1;35m"
local bcyan = "\27[36;1m"
local bwhite = "\27[37;1m"


local opsettings = GetPluginSettings()
local optrans = opsettings:findOptionByKey("whattotranslate")
local optransval = optrans:getValue()
local opdrawandtranslate = opsettings:findOptionByKey("drawandtranslate"):getValue()
local opDeeplUrl = opsettings:findOptionByKey("deeplxurl"):getValue()

local laemapfile = io.open("/storage/emulated/0/BlowTorch/Maps/laenor.ansi", "r")
local laemap_ansi = laemapfile:read('*all')
laemapfile:close()
local furmapfile = io.open("/storage/emulated/0/BlowTorch/Maps/furnachia.ansi", "r")
local furmap_ansi = furmapfile:read('*all')
furmapfile:close()
local rothmapfile = io.open("/storage/emulated/0/BlowTorch/Maps/rothikgen.ansi", "r")
local rothmap_ansi = rothmapfile:read('*all')
rothmapfile:close()
local lucemapfile = io.open("/storage/emulated/0/BlowTorch/Maps/lucentium.ansi", "r")
local lucemap_ansi = lucemapfile:read('*all')
lucemapfile:close()
local desomapfile = io.open("/storage/emulated/0/BlowTorch/Maps/desolathya.ansi", "r")
local desomap_ansi = desomapfile:read('*all')
desomapfile:close()

buffers = {}
--buffers["mainbuffer"] = batscmsgWindow:getBuffer()
buffers["mainbuffer"] = luajava.new(TextTree)
buffers["mainbuffer"]:setMaxLines(300)
--buffer:getBrokenLineCount()
--buffer:setLineBreakAt(80)
buffers["Laenor"] = luajava.new(TextTree)
buffers["Furnachia"] = luajava.new(TextTree)
buffers["Rothikgen"] = luajava.new(TextTree)
buffers["Lucentium"] = luajava.new(TextTree)
buffers["Desolathya"] = luajava.new(TextTree)


--buffers["mainbuffer"]:addString("chj\n\nvdejjjikj\n\n\nddr\n\nyhh\n\n\nvcdrhjb\n")
buffers["Laenor"]:addString(laemap_ansi)
buffers["Furnachia"]:addString(furmap_ansi)
buffers["Rothikgen"]:addString(rothmap_ansi)
buffers["Lucentium"]:addString(lucemap_ansi)
buffers["Desolathya"]:addString(desomap_ansi)

local NewContinent = nil
local NewPosition = nil
local PositionDelta = 0
local PositionTotal = 0
local globalbuffer
function LoadMap(name, line, map)
  
  if NewContinent ~= map["1"] then
      NewContinent = map["1"]
      globalbuffer = NewContinent
      if buffers[globalbuffer] == nil then
        buffers[globalbuffer] = luajava.new(TextTree)
      end
      batscmsgWindow:setBuffer(buffers[globalbuffer])
      InvalidateWindowText(batscmsgWindowName)
      if NewContinent == "Laenor" then
        PositionDelta = 24
        PositionTotal = 730
      elseif NewContinent == "Furnachia" then
        PositionDelta = 0
        PositionTotal = 480
      elseif NewContinent == "Rothikgen" then
        PositionDelta = 0
        PositionTotal = 480
      elseif NewContinent == "Lucentium" then
        PositionDelta = 0
        PositionTotal = 500
      elseif NewContinent == "Desolathya" then
        PositionDelta = 0
        PositionTotal = 530
      else
        PositionDelta = 0
        PositionTotal = 0
      end   
  end
  if NewPosition ~= map["2"] then
    if globalbuffer == "mainbuffer" then
      globalbuffer = NewContinent
      batscmsgWindow:setBuffer(buffers[globalbuffer])
      InvalidateWindowText(batscmsgWindowName)
    end
    NewPosition = map["2"]
    WindowXCallS("batscmsgwindow","updatePosition",NewPosition..","..PositionDelta..","..PositionTotal)
  end
end

function windowcontain(var)
    globalbuffer = var
    batscmsgWindow:setBuffer(buffers[var])
    InvalidateWindowText(batscmsgWindowName)
    if globalbuffer == "mainbuffer" then
      AppendLineToWindow(batscmsgWindowName,"\n")
      WindowXCallS("batscmsgwindow","updatePosition","0,22200"..",".."0"..",".."0")
    end
end

------------------
local Runtime = luajava.bindClass("java.lang.Runtime")
local BufferedReader = luajava.bindClass("java.io.BufferedReader")
local InputStreamReader = luajava.bindClass("java.io.InputStreamReader")

function executeShellCommand(command)
    local runtime = Runtime:getRuntime()
    -- 直接执行命令，不使用 /bin/sh -c
    local process = runtime:exec(command)
    
    local inputStream = process:getInputStream()
    local errorStream = process:getErrorStream()
    local inputReader = luajava.new(BufferedReader, luajava.new(InputStreamReader, inputStream))
    local errorReader = luajava.new(BufferedReader, luajava.new(InputStreamReader, errorStream))
    
    local output = ""
    local line = inputReader:readLine()
    while line do
        output = output .. line .. "\n"
        line = inputReader:readLine()
    end
    
    local errorOutput = ""
    line = errorReader:readLine()
    while line do
        errorOutput = errorOutput .. line .. "\n"
        line = errorReader:readLine()
    end
    
    process:waitFor()
    inputReader:close()
    errorReader:close()
    
    return output, errorOutput
end

-- 注册特殊命令
RegisterSpecialCommand("shell", "runShellCommand")

function runShellCommand(command)
    if command and command ~= "" then
        local result, errorResult = executeShellCommand(command)
        Note("命令输出:\n" .. result)
        if errorResult and errorResult ~= "" then
            Note("错误输出:\n" .. errorResult)
        end
    else
        Note("请提供一个shell命令。")
    end
end


--------------------------------- mapping plugin start ---------------------------------
function getAreaLocName()
  local continent = NewContinent:lower()
  for i, city in pairs(locations[continent]) do
    if city.x..","..city.y == NewPosition then
      local areaname = city.name:gsub(" ","_")
      return areaname
    end
  end
end

function replaceCharAt(s, index, char)
    -- 获取字符串的前半部分
    local start = string.sub(s, 1, index - 1)
    -- 获取字符串的后半部分
    local endstr = string.sub(s, index + #char)
    -- 组合新的字符串：前半部分 + 新的字符 + 后半部分
    return start .. char .. endstr
end

DirectionConstant1 = {"n", "w", "s", "e", "nw", "ne", "sw", "se", "up", "down", "enter", "out", "new", "ld", "bk"}
DirectionConstant2 = {"s", "e", "n", "w", "se", "sw", "ne", "nw", "down", "up", "out", "enter", "new", "ld", "bk"}
DirectionConstant3 = {"B10", "B9", "B8", "B7", "B6", "B5", "B4", "B3", "B2", "B1", "GF", "L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12"}
DirectionConstant4 = {["n"] = {0, 1, 0}, ["ne"] = {1, 1, 0}, ["nw"] = {-1, 1, 0}, ["s"] = {0, -1, 0}, ["se"] = {1, -1, 0}, ["sw"] = {-1, -1, 0}, ["w"] = {-1, 0, 0}, ["e"] = {1, 0, 0}, ["up"] = {0, 0, 1}, ["down"] = {0, 0, -1}, ["new"] = {0, 0, 0}, ["ld"] = {0, 0, 0}, ["bk"] = {0, 0, 0}}
nextPosition = ""
drawmapmode = "false"
EnableTrigger("roominfo",false)
RelativeCoordsTmp = {}

function initializationAreaMapDraw()
    CurrentFloorIndex = 11
    FirstLinkedIndex = {}
    CurrentFloor = DirectionConstant3[CurrentFloorIndex]
    roominformation = "true"
    exitTable = {}
    column = 44
    row = 37
    index = (row - 6) / 2 * column + 7
    columnstr = "              |"..string.rep(" ", column-17).."|\n"
    areamap = "              ,"..string.rep("-", column-17)..",\n"..string.rep(columnstr, row - 8).."              '"..string.rep("-", column-17).."'\n"..string.rep(string.rep(" ", column - 1).."\n",6)
    map = replaceCharAt(areamap, index, "I")
    roomIndexTableOrder = {}
    roomIndexTable = {}
    roomIndexTable[CurrentFloor] = {}
    table.insert(roomIndexTable[CurrentFloor], index)
    table.insert(roomIndexTableOrder, index)
    roomcoordinateY = math.ceil(index / column)
    roomcoordinateX = index % column
    currentRoomDescription = ""
    NewRoomMessage = {}  -- 创建空表room
    mappingmode = 1
    RelativeCoords = {0, 0, 0}
end

initializationAreaMapDraw()

function ifDrawMap(val)
  nextPosition = val
  if nextPosition == "new" then
    areaname = getAreaLocName()
    drawmapmode = "true"
    EnableTrigger("roominfo",true)
    lastRoomOrder = 1
    ordernum = 1
    if not NewRoomMessage[NewContinent] then
        NewRoomMessage[NewContinent] = {}  -- 如果continent不存在，则创建空表
    end
    if not NewRoomMessage[NewContinent][areaname] then
        NewRoomMessage[NewContinent][areaname] = {}  -- 如果area不存在，则创建空表
    end
    SendToServer("l;brief verbose;set look_on_move on")
  elseif nextPosition == "ld" then
    areaname = getAreaLocName()
    local file = io.open("/storage/emulated/0/BlowTorch/Maps/areamaps/"..NewContinent.."_"..areaname..".lua", "r")
    if file then
        file:close()
        initializationAreaMapDraw()
        drawmapmode = "true"
        EnableTrigger("roominfo",true)
        loadareamap(NewContinent.."_"..areaname)
        SendToServer("l;brief verbose;set look_on_move on")
    else
        ifDrawMap("new")
        return
    end
  elseif nextPosition == "bk" then
    initializationAreaMapDraw()
    loadareamap()
    if mappingmode == 3 then
      RelativeCoords = RelativeCoordsTmp
    end
    SendToServer("l")
  end
  
  if drawmapmode == "true" then
    if nextPosition == "fy" then
      ManualTranslation(roomdescription)
      nextPosition = lastPosition
    end
  end
end

-- 保存地图数据到文件
function saveareamap(filename)
    local file = io.open("/storage/emulated/0/BlowTorch/Maps/areamaps/"..filename..".lua", "w")
    if not file then
        Note("\n无法创建文件: " .. filename)
        return false
    end
    
    local areamapData = BackUpMapDraw()
    
    -- 使用serialize序列化数据
    local serialized = serialize(areamapData)
    file:write(serialized)
    file:close()
    
    --Note("\n地图数据已保存到: " .. filename)
    return true
end

function BackUpMapDraw()
    local areamapData = {
        FirstLinkedIndex = FirstLinkedIndex,
        exitTable = exitTable,
        column = column,
        row = row,
        columnstr = columnstr,
        map = map,
        roomIndexTableOrder = roomIndexTableOrder,
        roomIndexTable = roomIndexTable,
        NewRoomMessage = NewRoomMessage,
        ordernum = ordernum,
        mappingmode = mappingmode
    }
    return areamapData
end

-- 加载地图数据
function loadareamap(filename)
  if filename then
    local mapData = dofile("/storage/emulated/0/BlowTorch/Maps/areamaps/"..filename..".lua")
    -- 初始化所有地图数据
    FirstLinkedIndex = mapData.FirstLinkedIndex
    exitTable = mapData.exitTable
    column = mapData.column
    row = mapData.row
    columnstr = mapData.columnstr
    map = mapData.map
    roomIndexTableOrder = mapData.roomIndexTableOrder
    roomIndexTable = mapData.roomIndexTable
    NewRoomMessage = mapData.NewRoomMessage
    ordernum = mapData.ordernum
    mappingmode = mapData.mappingmode or 1
    Note("\n地图数据已加载\n")
  else
    --local mapData = BackUpMap1
    local mapData = dofile("/storage/emulated/0/BlowTorch/Maps/areamaps/backup.lua")
    -- 初始化所有地图数据
    FirstLinkedIndex = mapData.FirstLinkedIndex
    exitTable = mapData.exitTable
    column = mapData.column
    row = mapData.row
    columnstr = mapData.columnstr
    map = mapData.map
    roomIndexTableOrder = mapData.roomIndexTableOrder
    roomIndexTable = mapData.roomIndexTable
    NewRoomMessage = mapData.NewRoomMessage
    ordernum = mapData.ordernum
    mappingmode = mapData.mappingmode or 1
   -- CurrentFloorIndex = tonumber(NewRoomMessage[areacontinent][areaname].Floor)
    Note("\n地图数据已回退\n")
    --BackUpMap1 = BackUpMap2
    --BackUpMap2 = BackUpMap3
  end
end

function reverseDirection(val)
  for i, direction in ipairs(DirectionConstant1) do
    if direction == val then
      return DirectionConstant2[i]
    end
  end
  return val
end

roomdescription1 = ""
function processRoomInformation(name, line, stringmap)
  local str = line:getIterator():next()
  local infoline = stringmap["1"].." "
  if str:toString():find("$Color@") then
    local colorcode = str:getOperations():toString()
    if colorcode == "[38, 5, 255]" then
      conjectInfo = true
      if mappingmode == 3 and nextPosition ~= "" then
        local deltacoords = DirectionConstant4[nextPosition] or DirectionConstant4[lastPosition]
        for i = 1, 3 do
          RelativeCoordsTmp[i] = RelativeCoords[i] + deltacoords[i]
        end
        conjectInfo = false
        roomdescription1 = "x"..RelativeCoordsTmp[1].."y"..RelativeCoordsTmp[2].."z"..RelativeCoordsTmp[3]
      end
    elseif colorcode == "[0]" then
      if mappingmode == 1 then
        conjectInfo = false
      elseif mappingmode == 2 then
        if (string.sub(stringmap["1"], 1, 7) == "Obvious") or (stringmap["1"]:find("door ",1 ,true)) then
          roomdescription1 = roomdescription1..infoline
          conjectInfo = false
        else
          infoline = ""
        end
      elseif mappingmode == 4 then
        if (string.sub(stringmap["1"], 1, 7) == "Obvious") or (stringmap["1"]:find("door ",1 ,true)) then
          roomdescription1 = roomdescription1..infoline
          conjectInfo = false
        end
      end
    end
  end
  
--  if string.sub(stringmap["1"], 1, 12) == "Obvious exit" then
--  if stringmap["1"]:find("Obvious exit") then
 --     conjectInfo = "false"
 -- end
  
  if conjectInfo then
  roomdescription1 = roomdescription1..infoline
  elseif not conjectInfo and roomdescription1 ~= "" then
  roomInformation(roomdescription1)
  roomdescription1 = ""
  end
end

function roomInformation(val)
  roomdescription = val
  counternextPosition = reverseDirection(nextPosition)
  if currentRoomDescription ~= roomdescription then
    currentRoomDescription = roomdescription
    

    local roomInfo = NewRoomMessage[NewContinent][areaname]  -- 获取当前area的信息

    for _, data in ipairs(roomInfo) do
        if data.Info == roomdescription then
           -- WindowXCallS("batscmsgwindow", "ifStartDrawAreaMap", "cancel")
            roominformation = "false"
            existenceroomorder = data.order
            ManualAllOd = existenceroomorder
            ManualFloorOd = data.FloorOrder
            CurrentFloorIndex = tonumber(data.Floor)
            CurrentFloor = DirectionConstant3[CurrentFloorIndex]
            if exitTable[existenceroomorder]:find(("+"..counternextPosition.."+"), 1, true) then
            firstlinkoldroom = "false"
         --   Note("check")
            elseif nextPosition == "ld" then
              firstlinkoldroom = "false"
              buffers[areaname] = luajava.new(TextTree)
            elseif nextPosition == "bk" then
              firstlinkoldroom = "false"
              nextPosition = lastPosition
            else
            exitTable[lastRoomOrder] = exitTable[lastRoomOrder]..nextPosition.."+"
            exitTable[existenceroomorder] = exitTable[existenceroomorder]..counternextPosition.."+"
            firstlinkoldroom = "true"
            end
            lastRoomOrder = existenceroomorder
            drawAreaMap()
            return
        end
    end
    saveareamap("backup")
    if opdrawandtranslate then
      ManualTranslation(roomdescription)
    end
    roominformation = "true"
    if nextPosition == "down" then
      CurrentFloorIndex = CurrentFloorIndex - 1
      CurrentFloor = DirectionConstant3[CurrentFloorIndex]
    elseif nextPosition == "up" then
      CurrentFloorIndex = CurrentFloorIndex + 1
      CurrentFloor = DirectionConstant3[CurrentFloorIndex]
    end
    ManualAllOd = ordernum
    if nextPosition == "new" then
      ManualFloorOd = 1
    else
      ManualFloorOd = not roomIndexTable[CurrentFloor] and 1 or (#roomIndexTable[CurrentFloor] + 1)
    end
    table.insert(NewRoomMessage[NewContinent][areaname], {order = ordernum, Info = roomdescription, Floor = CurrentFloorIndex, FloorOrder = ManualFloorOd})  -- 将新的信息插入到roomInfo中
    table.insert(exitTable, "+"..counternextPosition.."+")
    exitTable[lastRoomOrder] = exitTable[lastRoomOrder]..nextPosition.."+"
  --  Note(exitTable[lastRoomOrder].."&"..exitTable[ordernum])
    lastRoomOrder = ordernum
    ordernum = ordernum + 1
    
    --[[for conti, areas in pairs(NewRoomMessage) do
        for ar, info in pairs(areas) do
            Note("\nNewRoomMessage[" .. conti .. "][" .. ar .. "] = {")
            for _, data in ipairs(info) do
                Note("\t{order = " .. data.order .. ", Info = \"" .. data.Info .. "\"},")
            end
            Note("}\n")
        end
    end]]
    if buffers[areaname] == nil then
    buffers[areaname] = luajava.new(TextTree)
    end
    --Note("\n"..roomdescription.."\n")
    drawAreaMap()
  end
end

function getCharAt(s, index)
    return string.sub(s, index, index)
end

function insertStringAfterIndex(s, index, newString)
    -- 提取索引号之前的字符串
    renewroomIndex1(index, #newString)
    row = row + #newString / column
    local start = string.sub(s, 1, index)
    -- 提取索引号之后的字符串
    local endstr = string.sub(s, index+1)
    -- 将新字符串插入到索引号之后，然后连接起来
    return start .. newString .. endstr
end

function replaceWithOffsets(s, a, b, c, d)
    local result = s
    
    for i = a, b do
        local char = string.sub(result, i, i)
        local char2 = string.sub(result, i - column*3, i - column*3)
        local char3 = string.sub(result, i - column*3 - 1, i - column*3 - 1)
        local char4 = string.sub(result, i - column*3 + 1, i - column*3 + 1)
        if char ~= " " and (char2 == "|" or char2 == "+" or char3 == "\\" or char3 == "X" or char4 == "X" or char4 == "/") then
            local index1 = i - c
            local index2 = i - d
            result = replaceCharAt(result, index1, "|")
            result = replaceCharAt(result, index2, "|")
        end
    end
    
    return result
end
function replaceWithOffsets2(s, a, b, c, d)
    local result = s
    
    for i = a, b do
        local char = string.sub(result, i, i)
        
        if char ~= " " then
            local index1 = i - c
            local index2 = i - d
            if char == "/" then
            result = replaceCharAt(result, index1+1, "/")
            result = replaceCharAt(result, index2+1, "|")
            elseif char == "\\" then
            result = replaceCharAt(result, index1-1, "\\")
            result = replaceCharAt(result, index2-1, "|")
            else
            result = replaceCharAt(result, index1, "|")
            result = replaceCharAt(result, index2, "|")
            end
        end
    end
    
    return result
end

function insertAfterChar(str, n)
-- 分割字符串
local parts = {}
for part in str:gmatch("[^\n]+") do
    table.insert(parts, part)
end

-- 插入字符
for i, part in ipairs(parts) do
    local char = part:sub(n, n)
    if char == " " then
        parts[i] = part:sub(1, n) .. "  " .. part:sub(n+1)
    elseif char == "/" then
        parts[i] = part:sub(1, n) .. "  " .. part:sub(n+1)
        parts[i-1] = parts[i-1]:sub(1, n) .. "__" .. parts[i-1]:sub(n+3)
    elseif char == "\\" or char == "_" then
        parts[i] = part:sub(1, n) .. "__" .. part:sub(n+1)
    else
        parts[i] = part:sub(1, n) .. "--" .. part:sub(n+1)
    end
    renewroomIndex1((i - 1) * column + n + (i - 1) * 2, 2)
end

column = column + 2
columnstr = "              |"..string.rep(" ", column-17).."|\n"
-- 合并字符串
--local new_str = table.concat(parts, "\n")
return table.concat(parts, "\n")
end

--currentroomindex = index
function drawAreaMap()
--index = currentroomindex
if nextPosition ~= "" and roominformation == "true" then
    if nextPosition == "n" then
      index = index - column * 2
      if getCharAt(map, index) == " " then
          if getCharAt(map, index + column) == "-" then
          map = replaceCharAt(map, index + column, "+")
          else
          map = replaceCharAt(map, index + column, "|")
          end
          map = replaceCharAt(map, index, "O")
          if math.ceil(index / column) < minY then
          index = index + column * 2
          map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
          end
      else
          local index2 = (math.ceil(index / column) + 1) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + column * 2 + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets(map, index3, index4, column, column*2)
          index = index + column * 2
          map = replaceCharAt(map, index + column, "|")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "s" then
      index = index + column * 2
      if getCharAt(map, index) == " " then
          if getCharAt(map, index - column) == "-" then
          map = replaceCharAt(map, index - column, "+")
          else
          map = replaceCharAt(map, index - column, "|")
          end
          map = replaceCharAt(map, index, "O")
          if math.ceil(index / column) > maxY then
          map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
          end
      else
          local index2 = (math.ceil(index / column) - 2) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + 2*column + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets2(map, index3, index4, column, column*2)
        --  index = index + column * 2
          map = replaceCharAt(map, index - column, "|")
          map = replaceCharAt(map, index, "O")
          end
          table.insert(roomIndexTable[CurrentFloor], index)
          table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "nw" then
      index = index - column * 2 - 2
      if getCharAt(map, index) == " " then
          if getCharAt(map, index + column + 1) == "/" then
          map = replaceCharAt(map, index + column + 1, "X")
          map = replaceCharAt(map, index, "O")
          else
          map = replaceCharAt(map, index + column + 1, "\\")
          map = replaceCharAt(map, index, "O")
          end
          if math.ceil(index / column) < minY then
          index = index + column * 2
          map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
          end
          if (index % column) < minX then
          index = math.ceil(index / column) * 2 + index
          map = insertAfterChar(map, minX - 3)
          end
      else
          local index2 = math.ceil(index / column) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + column * 2 + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets2(map, index3, index4, column, column*2)
          index = index + column * 2
          --map = replaceCharAt(map, index + column, " ")
          --map = replaceCharAt(map, index, " ")
          local n = index % column + 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 1
          map = insertAfterChar(map, n)
          map = replaceCharAt(map, index + column + 1, "\\")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "ne" then
      index = index - column * 2 + 2
      if getCharAt(map, index) == " " then
        if getCharAt(map, index + column - 1) == "\\" then
          map = replaceCharAt(map, index + column - 1, "X")
        else
          map = replaceCharAt(map, index + column - 1, "/")
        end
        map = replaceCharAt(map, index, "O")
        if math.ceil(index / column) < minY then
        index = index + column * 2
        map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
        end
        if (index % column) > maxX then
        index = math.floor(index / column) * 2 + index
        map = insertAfterChar(map, maxX + 3)
        end
      else
          local index2 = (math.ceil(index / column) + 1) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + column * 2 + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets(map, index3, index4, column, column*2)
          index = index + column * 2
          local n = index % column - 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 1
          map = insertAfterChar(map, n)
          map = replaceCharAt(map, index + column - 1, "/")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "sw" then
      index = index + column * 2 - 2
      if getCharAt(map, index) == " " then
          if getCharAt(map, index - column + 1) == "\\" then
          map = replaceCharAt(map, index - column + 1, "X")
          else
          map = replaceCharAt(map, index - column + 1, "/")
          end
          map = replaceCharAt(map, index, "O")
          if math.ceil(index / column) > maxY then
          map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
          end
          if (index % column) < minX then
          index = math.ceil(index / column) * 2 + index
          map = insertAfterChar(map, minX - 3)
          end
      else
          local index2 = (math.ceil(index / column) - 2) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + 2*column + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets2(map, index3, index4, column, column*2)
          local n = index % column + 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 1
          map = insertAfterChar(map, n)
          map = replaceCharAt(map, index - column + 1, "/")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "se" then
      index = index + column * 2 + 2
      if getCharAt(map, index) == " " then
        if getCharAt(map, index - column - 1) == "/" then
        map = replaceCharAt(map, index - column - 1, "X")
        else
        map = replaceCharAt(map, index - column - 1, "\\")
        end
        map = replaceCharAt(map, index, "O")
        if math.ceil(index / column) > maxY then
        map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
        end
        if (index % column) > maxX then
        index = math.floor(index / column) * 2 + index
        map = insertAfterChar(map, maxX + 3)
        end
      else
          local index2 = (math.ceil(index / column) - 2) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + 2*column + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets2(map, index3, index4, column, column*2)
          local n = index % column - 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 1
          map = insertAfterChar(map, n)
          map = replaceCharAt(map, index - column - 1, "\\")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "w" then
      index = index - 2
      if getCharAt(map, index) == " " then
          if getCharAt(map, index + 1) == "|" then
          map = replaceCharAt(map, index + 1, "+")
          else
          map = replaceCharAt(map, index + 1, "-")
          end
          map = replaceCharAt(map, index, "O")
          if (index % column) < minX then
          index = math.ceil(index / column) * 2 + index
          map = insertAfterChar(map, minX - 3)
          end
      else
          local n = index % column + 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 1
          map = insertAfterChar(map, n)
          map = replaceCharAt(map, index + 1, "-")
          map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "e" then
      index = index + 2
      if getCharAt(map, index) == " " then
        map = replaceCharAt(map, index - 1, "-")
        map = replaceCharAt(map, index, "O")
        if (index % column) > maxX then
        index = math.floor(index / column) * 2 + index
        map = insertAfterChar(map, maxX + 3)
        end
      else
        local n = index % column - 1
        local k = math.floor(index / column)
        index = (column + 2) * k + n + 1
        map = insertAfterChar(map, n)
        map = replaceCharAt(map, index - 1, "-")
        map = replaceCharAt(map, index, "O")
      end
      table.insert(roomIndexTable[CurrentFloor], index)
      table.insert(roomIndexTableOrder, index)
    elseif nextPosition == "up" then
      map = replaceCharAt(map, index, "U")
      --CurrentFloorIndex = CurrentFloorIndex + 1
      --CurrentFloor = DirectionConstant3[CurrentFloorIndex]
      if not roomIndexTable[CurrentFloor] then
        findRangOfCoordsorder()
        roomIndexTable[CurrentFloor] = {}
        FirstLinkedIndex[CurrentFloor] = getOrderofIndex(index)
        index = (minY - 7) * column + maxX + 6
        map = replaceCharAt(map, index, "D")
        table.insert(roomIndexTable[CurrentFloor], index)
        table.insert(roomIndexTableOrder, index)
      --  index = index + column * 6
        map = insertStringAfterIndex(map, (minY - 8) * column, string.rep(columnstr, 6))
     --   index = math.floor(index / column) * 6 + index
        map = insertAfterChar(map, maxX + 8)
        map = insertAfterChar(map, maxX + 8)
        map = insertAfterChar(map, maxX + 8)
      else
        findRangOfCoords()
        local difFloorIndex =  roomIndexTableOrder[FirstLinkedIndex[CurrentFloor]]
        local x1 = index % column
        local y1 = math.ceil(index / column)
        local x0 = difFloorIndex % column
        local y0 = math.ceil(difFloorIndex / column)
        if x1 > x0 then
          if y1 > y0 then
            index = (maxY + 1) * column + maxX + 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "D")
            map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
            map = insertAfterChar(map, maxX + 3)
          else
            index = (minY - 3) * column + maxX + 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "D")
            map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
            map = insertAfterChar(map, maxX + 3)
          end
        else
          if y1 > y0 then
            index = (maxY + 1) * column + minX - 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "D")
            map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
            map = insertAfterChar(map, minX - 3)
          else
            index = (minY - 3) * column + minX - 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "D")
            map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
            map = insertAfterChar(map, minX - 3)
          end
        end
      end
      index = roomIndexTableOrder[#roomIndexTableOrder]
    elseif nextPosition == "down" then
      map = replaceCharAt(map, index, "D")
      --CurrentFloorIndex = CurrentFloorIndex - 1
      --CurrentFloor = DirectionConstant3[CurrentFloorIndex]
      if not roomIndexTable[CurrentFloor] then
        findRangOfCoordsorder()
        roomIndexTable[CurrentFloor] = {}
        FirstLinkedIndex[CurrentFloor] = getOrderofIndex(index)
        index = (maxY + 5) * column + minX - 6
        map = replaceCharAt(map, index, "U")
        table.insert(roomIndexTable[CurrentFloor], index)
        table.insert(roomIndexTableOrder, index)
      --  index = index + column * 6
        map = insertStringAfterIndex(map, (maxY + 8) * column, string.rep(columnstr, 6))
     --   index = math.floor(index / column) * 6 + index
        map = insertAfterChar(map, minX - 8)
        map = insertAfterChar(map, minX - 8)
        map = insertAfterChar(map, minX - 8)
      else
        findRangOfCoords()
        local difFloorIndex =  roomIndexTableOrder[FirstLinkedIndex[CurrentFloor]]
        local x1 = index % column
        local y1 = math.ceil(index / column)
        local x0 = difFloorIndex % column
        local y0 = math.ceil(difFloorIndex / column)
        if x1 > x0 then
          if y1 > y0 then
            index = (maxY + 1) * column + maxX + 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "U")
            map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
            map = insertAfterChar(map, maxX + 3)
          else
            index = (minY - 3) * column + maxX + 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "U")
            map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
            map = insertAfterChar(map, maxX + 3)
          end
        else
          if y1 > y0 then
            index = (maxY + 1) * column + minX - 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "U")
            map = insertStringAfterIndex(map, (maxY + 2) * column, columnstr..columnstr)
            map = insertAfterChar(map, minX - 3)
          else
            index = (minY - 3) * column + minX - 2
            table.insert(roomIndexTable[CurrentFloor], index)
            table.insert(roomIndexTableOrder, index)
            map = replaceCharAt(map, index, "U")
            map = insertStringAfterIndex(map, (minY - 3) * column, columnstr..columnstr)
            map = insertAfterChar(map, minX - 3)
          end
        end
      end
      index = roomIndexTableOrder[#roomIndexTableOrder]
    elseif nextPosition == "enter" then
      map = replaceCharAt(map, index, "E")
      local orderi = getOrderofIndex(index)
     -- local chari = lastPosition == ("\\" or "-" or "|" or "/") and " " or
      nextPosition = lastPosition
      drawAreaMap()
      map = replaceCharAt(map, (index + roomIndexTableOrder[orderi]) / 2, " ")
      --return
    elseif nextPosition == "out" then
      map = replaceCharAt(map, index, "G")
      local orderi = getOrderofIndex(index)
     -- local chari = lastPosition == ("\\" or "-" or "|" or "/") and " " or
      nextPosition = lastPosition
      drawAreaMap()
      map = replaceCharAt(map, (index + roomIndexTableOrder[orderi]) / 2, " ")
    elseif nextPosition == "new" then
      findRangOfCoords()
      nextPosition = "ne"
      FirstLinkedIndex[CurrentFloor] = 1
      buffers[areaname]:empty()
      buffers[areaname]:addString(map)
      batscmsgWindow:setBuffer(buffers[areaname])
      InvalidateWindowText(batscmsgWindowName)
      WindowXCallS("batscmsgwindow","updatePosition",roomcoordinateX..","..roomcoordinateY..",".."0"..","..row)
      return
    else
      map = replaceCharAt(map, index, "S")
      local orderi = getOrderofIndex(index)
     -- local chari = lastPosition == ("\\" or "-" or "|" or "/") and " " or
      nextPosition = lastPosition
      drawAreaMap()
      if mappingmode == 3 then
        nextPosition = lastPosition
      end
      map = replaceCharAt(map, (index + roomIndexTableOrder[orderi]) / 2, " ")
      --return
    end

elseif nextPosition ~= "" and roominformation == "false" and firstlinkoldroom == "true" then
    if #nextPosition <= 2 and string.find("nenwsesw", nextPosition) then
      linkPlanA()
    else
      map = replaceCharAt(map, index, string.sub(nextPosition, 1, 1):upper())
      nextPosition = lastPosition
    end
    index = roomIndexTableOrder[existenceroomorder]
elseif nextPosition ~= "" and roominformation == "false" and firstlinkoldroom == "false" then
    index = roomIndexTableOrder[existenceroomorder]
end
findRangOfCoords()
roomcoordinateY = math.ceil(index / column)
roomcoordinateX = index % column
buffers[areaname]:empty()
buffers[areaname]:addString(map)
batscmsgWindow:setBuffer(buffers[areaname])
InvalidateWindowText(batscmsgWindowName)
WindowXCallS("batscmsgwindow","updatePosition",roomcoordinateX..","..roomcoordinateY..",".."0"..","..row)
lastPosition = nextPosition
if mappingmode == 3 then
  nextPosition = ""
  RelativeCoords = RelativeCoordsTmp
end
end

function linkPlanA()
 --   local path = {}
    local newindex = roomIndexTableOrder[existenceroomorder]
    local x1 = index % column
    local y1 = math.ceil(index / column)
    local x0 = newindex % column
    local y0 = math.ceil(newindex / column)
    local dx = math.abs(x1 - x0)
    local dy = math.abs(y1 - y0)
    local stepX = x1 < x0 and 1 or -1
    local stepY = y1 < y0 and 1 or -1
    if dx == 0 then
      for i = 1, (dy - 1) do
        local indexi = index + stepY * i * column
        map = replaceCharAt(map, indexi, "|")
      end
    elseif dy == 0 then
      for i = 1, (dx - 1) do
        local indexi = index + stepX * i
        map = replaceCharAt(map, indexi, "-")
      end
    else
      local minXY = dx < dy and dx or dy
      local maxXY = dx > dy and dx or dy
      local direction = x1 < x0 and y1 < y0 and "\\" or (x1 > x0 and y1 > y0 and "\\" or "/")
      for i = 1, (minXY - 1) do
        local indexi = index + stepY * i * column + stepX * i
        map = replaceCharAt(map, indexi, direction)
      end
      if minXY ~= maxXY then
        local startindex = index + (stepY * column + stepX) * minXY
        local directioni = dx < dy and "|" or "-"
        local stepXY = dx < dy and (stepY * column) or stepX
        for i = 1, (maxXY - minXY) do
          local indexi = startindex + stepXY * (i - 1)
          map = replaceCharAt(map, indexi, directioni)
        end
      end
    end
    --index = newindex
end

function linkPlanB()
        local path = {}
        local newindex = roomIndexTableOrder[existenceroomorder]
        
        local x1 = index % column
        local y1 = math.ceil(index / column)
        local x0 = newindex % column
        local y0 = math.ceil(newindex / column)
        local dx = math.abs(x1 - x0)
        local dy = math.abs(y1 - y0)
        local stepX = x1 < x0 and 1 or -1
        local stepY = y1 < y0 and 1 or -1
        if dx < 3 and dy < 3 then
          local direction = dx == 0 and "|" or (dy == 0 and "-" or (x1 < x0 and y1 < y0 and "\\" or (x1 > x0 and y1 > y0 and "\\" or "/")))
          local olddirect = getCharAt(map, (index + newindex) / 2)
          direction = howtoreplaceChar(direction, olddirect)
          map = replaceCharAt(map, (index + newindex) / 2, direction)
        elseif dx == 0 and dy > 3 then
          local direction0 = y1 > y0 and "," or "'"
          local directione = y1 > y0 and "'" or ","
          local index0 = index - 1
          local indexe = index0 + dy * stepY * column
          local olddirect0 = getCharAt(map, index0)
          local olddirecte = getCharAt(map, indexe)
          direction0 = olddirect0 ~= " " and "→" or direction0
          directione = olddirecte ~= " " and "→" or directione
          map = replaceCharAt(map, index0, direction0)
          map = replaceCharAt(map, indexe, directione)
          for i = 1, (dy - 1) do
          local indexi = index0 + stepY * i * column
          local olddirecti = getCharAt(map, indexi)
          local directioni = howtoreplaceChar(":", olddirecti)
          map = replaceCharAt(map, indexi, directioni)
          end
        elseif dy == 0 and dx > 3 then
          local direction0 = "'"
          local directione = "'"
          local index0 = index + column
          local indexe = index0 + dx * stepX
          local olddirect0 = getCharAt(map, index0)
          local olddirecte = getCharAt(map, indexe)
          direction0 = olddirect0 ~= " " and "↑" or direction0
          directione = olddirecte ~= " " and "↑" or directione
          map = replaceCharAt(map, index0, direction0)
          map = replaceCharAt(map, indexe, directione)
          for i = 1, (dx - 1) do
          local indexi = index0 + stepX * i
          local olddirecti = getCharAt(map, indexi)
          local directioni = howtoreplaceChar("~", olddirecti)
          map = replaceCharAt(map, indexi, directioni)
          end
        else
          local directionX = y1 > y0 and "," or "'"
          local directionY = y1 > y0 and "," or "'"
          local directionM = y1 > y0 and "'" or ","
          local index0 = index + stepY * column
          local indexM = index0 + (dx -1) * stepX
          local indexe = indexM + (dy - 1) * stepY * column
          local olddirect0 = getCharAt(map, index0)
          local olddirectM = getCharAt(map, indexM)
          local olddirecte = getCharAt(map, indexe)
          directionX = olddirect0 ~= " " and y1 > y0 and "↓" or (olddirect0 ~= " " and y1 < y0 and "↑" or directionX)
          directionY = olddirecte ~= " " and x1 > x0 and "←" or (olddirecte ~= " " and x1 < x0 and "→" or directionY)
          directionM = olddirectM ~= " " and olddirectM or directionM
          map = replaceCharAt(map, index0, directionX)
          map = replaceCharAt(map, indexM, directionM)
          map = replaceCharAt(map, indexe, directionY)
          for i = 1, (dx - 1) do
          local indexi = index0 + stepX * i
          local olddirecti = getCharAt(map, indexi)
          local directioni = howtoreplaceChar("~", olddirecti)
          map = replaceCharAt(map, indexi, directioni)
          end
          for i = 1, (dy - 2) do
          local indexi = indexM + stepY * i * column
          local olddirecti = getCharAt(map, indexi)
          local directioni = howtoreplaceChar(":", olddirecti)
          map = replaceCharAt(map, indexi, directioni)
          end
        end
        index = newindex
end

function renewroomIndex1(startI, deltaI)
  for i, index in ipairs(roomIndexTableOrder) do
    if index > startI then
    roomIndexTableOrder[i] = roomIndexTableOrder[i] + deltaI
    end
    --Note(roomIndexTable[i].."-")
  end
  
  for floor, indices in pairs(roomIndexTable) do
    for i, index in ipairs(indices) do
        if index > startI then
        roomIndexTable[floor][i] = roomIndexTable[floor][i] + deltaI
        end
    end
    --Note(roomIndexTable[i].."-")
  end
end


function findRangOfCoords()
  minX = roomIndexTable[CurrentFloor][1] % column
  minY = math.ceil(roomIndexTable[CurrentFloor][1] / column)
  maxX = minX
  maxY = minY
  for i, index in ipairs(roomIndexTable[CurrentFloor]) do
    local x = index % column
    local y = math.ceil(index / column)
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
  end
--  Note("\n"..minX.."+"..maxX.."+"..minY.."+"..maxY.."\n")
end

function findRangOfCoordsorder()
  minX = roomIndexTableOrder[1] % column
  minY = math.ceil(roomIndexTableOrder[1] / column)
  maxX = minX
  maxY = minY
  for i, index in ipairs(roomIndexTableOrder) do
    local x = index % column
    local y = math.ceil(index / column)
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
  end
  --Note("\n"..minX.."+"..maxX.."+"..minY.."+"..maxY.."\n")
end

function getOrderofIndex(indexO)
  for i, indexOi in ipairs(roomIndexTableOrder) do
    if indexOi == indexO then
      return i
    end
  end
end

function findRangOfCoords1(startnum, endnum)
  minX = roomIndexTable[startnum] % column
  minY = math.ceil(roomIndexTable[startnum] / column)
  maxX = minX
  maxY = minY
  for i = startnum, endnum do
    local x = roomIndexTable[i] % column
    local y = math.ceil(roomIndexTable[i] / column)
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
  end
end

function howtoreplaceChar(char1, char2)
if char2 == " " then
  return char1
else
  if char1 == char2 then
    return char1
  elseif char1 == "-" then
    if char2 == "|" then
    return "+"
    else
    return char1
    end
  elseif char1 == "|" then
    if char2 == "-" then
    return "+"
    else
    return char1
    end
  elseif char1 == "\\" then
    if char2 == "/" then
    return "X"
    else
    return char1
    end
  elseif char1 == "/" then
    if char2 == "\\" then
    return "X"
    else
    return char1
    end
  elseif char1 == "'" then
    if char2 == "|" then
    return "↑"
    else
    return char1
    end
  elseif char1 == "~" or char1 == ":" then
    if char2 ~= " " then
    return char2
    else
    return char1
    end
  elseif char1 == "," then
    if char2 == "-" or char2 == "_" then
    return "→"
    else
    return char1
    end
  end
end
end

function drawAreaMapceshi(val)
    local gtPosition = val
    if gtPosition == "nn" then
          local index2 = (math.ceil(index / column) - 1) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + column * 2 + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets(map, index3, index4, column, column*2)
          index = index + column * 2
    elseif gtPosition == "n" then
          map = replaceCharAt(map, index, "|")
          map = replaceCharAt(map, index - column, "|")
          map = replaceCharAt(map, index - column * 2, "O")
          index = index - column * 2
          roomIndexTable[CurrentFloor][ManualFloorOd] = index
          roomIndexTableOrder[ManualAllOd] = index
    elseif gtPosition == "ss" then
          local index2 = math.ceil(index / column) * column
          map = insertStringAfterIndex(map, index2, columnstr..columnstr)
          local index3 = index2 + 2*column + 1
          local index4 = index3 + column - 2
          map = replaceWithOffsets2(map, index3, index4, column, column*2)
    elseif gtPosition == "s" then
          map = replaceCharAt(map, index, "|")
          map = replaceCharAt(map, index + column, "|")
          map = replaceCharAt(map, index + column * 2, "O")
          index = index + column * 2
          roomIndexTable[CurrentFloor][ManualFloorOd] = index
          roomIndexTableOrder[ManualAllOd] = index
    elseif gtPosition == "ww" then
          local n = index % column - 1
          local k = math.floor(index / column)
          index = (column + 2) * k + n + 3
          map = insertAfterChar(map, n)
    elseif gtPosition == "w" then
          map = replaceCharAt(map, index, "-")
          map = replaceCharAt(map, index - 1, "-")
          map = replaceCharAt(map, index - 2, "O")
          index = index - 2
          roomIndexTable[CurrentFloor][ManualFloorOd] = index
          roomIndexTableOrder[ManualAllOd] = index
    elseif gtPosition == "ee" then
        local n = index % column + 1
        local k = math.floor(index / column)
        index = (column + 2) * k + n - 1
        map = insertAfterChar(map, n)
    elseif gtPosition == "e" then
        map = replaceCharAt(map, index, "-")
        map = replaceCharAt(map, index + 1, "-")
        map = replaceCharAt(map, index + 2, "O")
        index = index + 2
        roomIndexTable[CurrentFloor][ManualFloorOd] = index
        roomIndexTableOrder[ManualAllOd] = index
    elseif gtPosition == "fy" then
        ManualTranslation(roomdescription)
        return
    elseif gtPosition == "mt" then
        if NewRoomMessage[NewContinent][areaname][ManualAllOd]["Monster"] then
          local monsters = NewRoomMessage[NewContinent][areaname][ManualAllOd]["Monster"]
          for i=1,#monsters do
            Note(lwhite2..monsters[i]..lwhite.."\n")
          end
        else
          SendToServer(".tgton on;blook")
        end
          SendToServer(".kb close;.kb .mp ")
        return
    elseif gtPosition == "bk" then
        SendToServer(".kb close;.mpp bk;.kb .mp ")
        return
    elseif gtPosition == "sv" then
        SendToServer(".kb close;.kb .mp ")
        saveareamap(NewContinent.."_"..areaname)
        Note("\n地图数据已保存到: " .. NewContinent.."_"..areaname)
        return
    elseif gtPosition == "ld" then
        SendToServer(".kb close;.mpp ld;.kb .mp ")
        return
    elseif gtPosition == "ed" then
        SendToServer(".kb close;.kb .mp ")
        drawmapmode = "false"
        EnableTrigger("roominfo",false)
        initializationAreaMapDraw()
        SendToServer("brief brief")
        areaname = nil
        RelativeCoordsTmp = {}
        return
    elseif gtPosition == "new" then
        SendToServer(".kb close;.mpp new;.kb .mp spr .mp ed&")
        return
    elseif string.sub(gtPosition, 1, 4) == "spl " then
      if NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandL"] then
        local spCommand = NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandL"]:gsub("&", ";")
        SendToServer(spCommand)
      elseif #gtPosition > 4 then
        NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandL"] = string.sub(gtPosition, 5)
      end
      return
    elseif string.sub(gtPosition, 1, 4) == "spr " then
      if NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandR"] then
        local spCommand = NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandR"]:gsub("&", ";")
        SendToServer(spCommand)
      elseif #gtPosition > 4 then
        NewRoomMessage[NewContinent][areaname][ManualAllOd]["SpecialCommandR"] = string.sub(gtPosition, 5)
      end
      return
    elseif string.sub(gtPosition, 1, 3) == "md " then
      mappingmode = tonumber(string.sub(gtPosition, 4, 4))
      return
    else
        mapnotes = gtPosition ~= "" and gtPosition or " "
        local coords = {
        row = row,
        column = column
        }
        WindowXCallS("batscmsgwindow","getPointPosi",serialize(coords))
    end
    roomcoordinateY = math.ceil(index / column)
    roomcoordinateX = index % column
    buffers[areaname]:empty()
    buffers[areaname]:addString(map)
    batscmsgWindow:setBuffer(buffers[areaname])
    InvalidateWindowText(batscmsgWindowName)
    WindowXCallS("batscmsgwindow","updatePosition",roomcoordinateX..","..roomcoordinateY..",".."0"..","..row)
    --lastPosition = nextPosition
    SendToServer(".kb close;.kb .mp "..gtPosition)
end

function addMapNotes(val)
    map = replaceCharAt(map, tonumber(val), mapnotes)
    roomcoordinateY = math.ceil(index / column)
    roomcoordinateX = index % column
    buffers[areaname]:empty()
    buffers[areaname]:addString(map)
    batscmsgWindow:setBuffer(buffers[areaname])
    InvalidateWindowText(batscmsgWindowName)
    WindowXCallS("batscmsgwindow","updatePosition",roomcoordinateX..","..roomcoordinateY..",".."0"..","..row)
end
----------------------------------------------------------------------
-------------36   33   1 33--------38 5 15------38 5 82--- Translation plugin ---------1 32--------1 36----
sourceText = ""

--[[
function processOrignText(name, line, iflower)
  local ifcolor = line:getIterator():next()
  local str = TextTree:deColorLine(line):toString()
  if ifcolor:toString():find("$Color@") then
    sourceText = sourceText .. "\n" .. str
  else
    sourceText = sourceText .. " " .. str
  end
  WindowXCallS("batscmsgwindow","sendTranslation")
end
]]


local iftranslate = false
function processOrignText(name, line, iflower)
  local ifcolor = line:getIterator():next()
  if ifcolor:toString():find("$Color@") then
    local colorcode = ifcolor:getOperations():toString():gsub("]", "%]")
    if optransval:find("%"..colorcode) then
  --  if string.find(optransval, colorcode) then
  --  if colorcode == "[38, 5, 255]" or colorcode == "[38, 5, 51]" then
      iftranslate = true
      --Note(optransval.."&&&"..colorcode)
    elseif colorcode == "[0]" then
      iftranslate = false
    end
  end
  
  if iftranslate == true then
    local str = TextTree:deColorLine(line):toString()
   -- str = str:toString():gsub(".%-%-%-%-%-...............  ", ""):gsub("%|....................  ", ""):gsub("<....................  ", "")
    sourceText = sourceText .. " " .. str
    WindowXCallS("batscmsgwindow","sendTranslation")
  end
end



function ManualTranslation(val)
sourceText = sourceText..tostring(val)
--Note(sourceText)
WindowXCallS("batscmsgwindow","sendTranslation")
end

function string_to_bytes(str)
    local bytes = {}
    for i = 1, #str do
        table.insert(bytes, string.byte(str, i))
    end
    return bytes
end

function translationContent()
   local byte = string.byte(sourceText, 1)
   local searchUrlAll = { "http://127.0.0.1:6119/translate", "https://deeplx.gobob.top/translate", "https://deeplx.gobob.top/V1/translate", "https://deeplx.gobob.top/V2/translate" }
   if (byte >= 0xE0 and byte < 0xF0) then
     source_lang = "zh"
     target_lang = "en"
   else
     source_lang = "en"
     target_lang = "zh"
   end
   local runner = {}
   runner.run = function()
     if opDeeplUrl ~= 0 then
      local searchUrl = luajava.newInstance("java.lang.String", searchUrlAll[opDeeplUrl])
      local json = luajava.newInstance("org.json.JSONObject")
      json:put("text", sourceText)
      json:put("source_lang", "auto")
      json:put("target_lang", target_lang)
      json:put("alt_count", 0)
      local postData = json:toString()
      sourceText = ""
      -- 发送POST请求提交表单
      local url = luajava.newInstance("java.net.URL", searchUrl)
      local connection = url:openConnection()
      connection:setRequestMethod("POST")
      connection:setRequestProperty("Content-Type", "application/json; charset=utf-8")
      connection:setDoOutput(true)

      local outputStream = connection:getOutputStream()
      
      local outputStreamWriter = luajava.newInstance("java.io.OutputStreamWriter", outputStream, "UTF-8")
      local bufferedWriter = luajava.newInstance("java.io.BufferedWriter", outputStreamWriter)
      bufferedWriter:write(postData)
      bufferedWriter:flush()
      bufferedWriter:close()
      
      local responseCode = connection:getResponseCode()
      if responseCode == 200 then
            local inputStreamReader = luajava.newInstance("java.io.InputStreamReader", connection:getInputStream(), "UTF-8")
            local reader = luajava.newInstance("java.io.BufferedReader", inputStreamReader)
            local response = reader:readLine()
            reader:close()
            local dataStartIndex = string.find(response, "\"data\":\"") + 8
            local dataEndIndex = string.find(response, "\",\"", dataStartIndex)
            local outputText = string.sub(response, dataStartIndex, dataEndIndex - 1):gsub("\\", "")            
            if source_lang == "zh" then
              SendToServer(".kb "..outputText)
            else
              AppendLineToWindow("chats","译文————————————————————\n")
              processTranslationResult(outputText)
            end
      else
            -- Handle error response from the server
            Note("\nError: Non-200 response code received: " .. responseCode.."\n")
      end
      connection:disconnect()
     else
      return
     end
   end

   local runnerProxy = luajava.createProxy("java.lang.Runnable", runner)
   local runnerThread = luajava.newInstance("java.lang.Thread", runnerProxy)
   runnerThread:start()
end


function processTranslationResult(str) 
  
   -- AppendLineToWindow("chats","  ————————————————————\n")
--    insertcharateveryrow(outputText)
  --  AppendLineToWindow("chats","译文："..outputText2.."\n")
  --  AppendLineToWindow("chats","译文："..outputText.."\n")
  local str = str:gsub("\\n", "\n")
  local maxChunkSize = 33 -- 最大字符数，而不是字节
  local currentPos = 1
  local result = ""
  while currentPos <= #str do
    local chunk = ""
    local remainingLength = maxChunkSize
    while remainingLength > 0 and currentPos <= #str do
      local byte = string.byte(str, currentPos)
      -- 检查是否是UTF-8的多字节序列的起始字节
      if byte < 0x80 then
        -- 单字节字符 (0xxxxxxx)
        chunk = chunk .. string.char(byte)
        currentPos = currentPos + 1
        remainingLength = remainingLength - 0.6
      elseif (byte >= 0xC0 and byte < 0xE0) then
        -- 双字节字符 (110xxxxx 10xxxxxx)
        if currentPos + 1 <= #str then
          chunk = chunk .. string.sub(str, currentPos, currentPos + 1)
          currentPos = currentPos + 2
          remainingLength = remainingLength - 0.7
        else
          break -- 不完整的多字节序列
        end
      elseif (byte >= 0xE0 and byte < 0xF0) then
        -- 三字节字符 (1110xxxx 10xxxxxx 10xxxxxx)
        if currentPos + 2 <= #str then
          chunk = chunk .. string.sub(str, currentPos, currentPos + 2)
          currentPos = currentPos + 3
          remainingLength = remainingLength - 1
        else
          break -- 不完整的多字节序列
        end
      elseif (byte >= 0xF0 and byte < 0xF8) then
        -- 四字节字符 (11110xxx 10xxxxxx 10xxxxxx 10xxxxxx)
        if currentPos + 3 <= #str then
          chunk = chunk .. string.sub(str, currentPos, currentPos + 3)
          currentPos = currentPos + 4
          remainingLength = remainingLength - 1
        else
          break -- 不完整的多字节序列
        end
      end
    end
    
    AppendLineToWindow("chats", "  " .. chunk .. "\n")
  end
end

function insertcharateveryrow(str)
  
end

orignTextCaptureState = "1"
function translationCapture()
	if orignTextCaptureState == "1" then
		EnableTriggerGroup("translationcatchgroup",true)
		Note("Turning Translator On.\n")
		orignTextCaptureState = "2"
	else
		EnableTriggerGroup("translationcatchgroup",false)
		Note("Turning Translator Off.\n")
		orignTextCaptureState = "1"
	end
end
--translationContent("test translation plugin")
---------------------------- Translation plugin ----------------------

------------------------------------ equipment search plugin start ---------------------------------

function downloadEquipSearchJson(searchTerm)
   local Equip = {}
   local EQexit = "no"
   local EQfile = io.open("/storage/emulated/0/BlowTorch/logfiles/Batmud_EQLog.txt", "r")
   local content = EQfile:read('*all')
   EQfile:close()
   for EQContent in content:gmatch("{(.-)}") do
     table.insert(Equip, EQContent)
   end
   for i= 1, #Equip do
       if Equip[i]:lower():find(searchTerm:lower(), 1, true) then
         Note(lwhite2.."\n\n"..Equip[i]..lwhite.."\n")
         EQexit = "yes"
         break
       end
   end
   
   if EQexit == "no" then   
   local runner = {}
   runner.run = function()
      local searchUrl = luajava.newInstance("java.lang.String", "https://batshoppe.dy.fi/eqinfo2.php")
      local postData = "eqshort=" .. searchTerm .. "&submit=Submit"

      -- 发送POST请求提交表单
      local url = luajava.newInstance("java.net.URL", searchUrl)
      local connection = url:openConnection()
      connection:setRequestMethod("POST")
      connection:setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
      connection:setDoOutput(true)

      local outputStream = connection:getOutputStream()
      local dataOutputStream = luajava.newInstance("java.io.DataOutputStream", outputStream)
      dataOutputStream:writeBytes(postData)
      dataOutputStream:flush()
      dataOutputStream:close()

      -- 发送GET请求获取查询结果页面
      connection:setRequestMethod("GET")
      local reader = luajava.newInstance("java.io.BufferedReader",
         luajava.newInstance("java.io.InputStreamReader", connection:getInputStream()))
      local buffer = {}
      local line = reader:readLine()
      while line do
         table.insert(buffer, line)
         line = reader:readLine()
      end
      local response = table.concat(buffer, "\n")
      reader:close()
      connection:disconnect()

      if processEquipInfoResult then
         processEquipInfoResult(response)
      else
         Note("No function found to process the monster search result.")
      end
   end

   local runnerProxy = luajava.createProxy("java.lang.Runnable", runner)
   local runnerThread = luajava.newInstance("java.lang.Thread", runnerProxy)
   runnerThread:start()
   end
end


function processEquipInfoResult(Data)
    --Note(Data)
    local resultStartIndex = string.find(Data, "Eq Name")
    if resultStartIndex then
    local resultEndIndex = string.find(Data, "Equipment has not been", resultStartIndex)
    local result = string.sub(Data, resultStartIndex-4, resultEndIndex-2)
    local result2 = result:gsub("<th>","1:"):gsub("<td>","2:"):gsub("</th>",","):gsub("</td>",","):gsub("<[^<>]+>", ""):gsub("\n", ""):gsub("&#039;", "'")
    local streq = ""
    local streq1 = {}
    local streq2 = {}
    local j = 1
    local k = 1
    local data = __split(result2, ",")
    for i = 1, #data do
        local key, value = data[i]:match("(%d):(.+)")
        if key == "1" then
            streq1[j] = value
            j= j+1
        elseif key == "2" then
            streq2[k] = value
            k= k+1
        end
    end
    for h = 1, #streq1 do
        streq = streq..streq1[h]..": "..streq2[h].."; \n"
    end
    --return streq
    --[[local enemyname = result2:match("Monster Name:(.*) \nShortname:")
    local enemyportrait = result2:match("Race:(.*) \nAggro:")
    if enemyportrait ~= "N/A" and enemyportrait ~= "" then
      SendToServer("target " ..enemyportrait)
      WindowXCallS("batscmsgwindow","setenmportrait",enemyportrait)
    else
      targetall(enemyname)
    end]]
    Note("\n\n"..lwhite2..streq..lwhite)
    eqlog	= io.open("/storage/emulated/0/BlowTorch/logfiles/Batmud_EQLog.txt", "a+")
    eqlog:write(",\r{\r"..streq.."}")
    eqlog:flush()
    eqlog:close()
    else
    Note(bred.."\nNo equipment was found\n"..lwhite)
    end
end

-----------------------equipment search plugin end---------------------
------------------------------------ log plugin start ---------------------------------
local LogFileName = "/storage/emulated/0/BlowTorch/logfiles/Batmud_Log.txt"
local log = nil

function processAll(name, line, replaceMap)
	if log then  -- Only proceed if log file is open
		local StuffCaptured1 = replaceMap["1"]
		--local TimeStamp = os.date("%c")
		local logLine = string.format("%s\r", StuffCaptured1)
		log:write(logLine)
		--log:write(line)
		log:flush()  -- Ensure the line is written to the file immediately
	else
	Note(bred.."Warning! The log file is close!"..lwhite.."\n")
	end
end

function logStart()
	if not log then
		log	= io.open(LogFileName, "a+")
		local TimeStamp = os.date("%c")
		log:write(TimeStamp.."\r")
		log:flush()
	end
end

function logEnd()
	if log then
		local TimeStamp = os.date("%c")
		log:write(TimeStamp.."\r")
		log:close()
		log = nil
	end
end

chatCaptureState = "1"
function chatCapture(val)
	if chatCaptureState == "1" then
		EnableTrigger("roominfo",false)
		EnableTriggerGroup("chatcapture",true)
		logStart()
		Note("Turning Logging On.\n")
		chatCaptureState = "2"
	else
		if drawmapmode == "true" then
          EnableTrigger("roominfo",true)
        end
		EnableTriggerGroup("chatcapture",false)
		logEnd()
		Note("Turning Logging Off.\n")
		chatCaptureState = "1"
	end
end
------------------------------ log plugin end ------------------------------

function teamviewprocess(name, line, map)
    local position = map["1"]
    local player = map["2"] or "none"
    local state = map["3"] or "O"
    local Php = tonumber(map["4"])
    local Phpmax = tonumber(map["5"])
    local Psp = tonumber(map["6"])
    local Pspmax = tonumber(map["7"])
    local Pep = tonumber(map["8"])
    local Pepmax = tonumber(map["9"])
    local Plevel = tonumber(map["10"])
    local Pexp = tonumber(map["11"])
    local hppct = Php / Phpmax
    local sppct = Psp / Pspmax
    local eppct = Pep / Pepmax
    WindowXCallS("batscmsgwindow","teamviewprocesswindow",position..","..player..","..state..","..Php..","..Phpmax..","..Psp..","..Pspmax..","..Pep..","..Pepmax..","..Pexp..","..Plevel)
end

----------------------- target plugin start--------------------------

function targetallswitch(val)
    if val == "on" then
        EnableTrigger("targetgag",true)
    elseif val == "off" then
        EnableTrigger("targetgag",false)
    end
end

function tableContains(tab, val)
  for i = 1, #tab do
    if tab[i] == val then
      return true
    end
  end
  return false
end

function stoptargetgagserver()
  EnableTrigger("targetgag", false)
end

monstername = ""
function targetnpc(name, raw, map)
   local str6 = nil
   local str5 = raw:getIterator():next()
   if str5:toString():find("$Color@") then
     str6 = str5:getOperations():toString()
   end
   if str6 == "[38, 5, 82]" then
     monstername = map["1"]
     EnableTrigger("targetgag",false)
     local line = map["1"]:gsub(".*�",""):gsub("<.*", "")
     local areaname1 = getAreaLocName() or "outside"
     local npcfile = io.open("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/"..NewContinent.."/"..areaname1..".lua", "r")
     if npcfile then
       npcfile:close()
       local npcData = dofile("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/"..NewContinent.."/"..areaname1..".lua")
       if npcData[monstername] then
           Note(npcData[monstername])
           local race = npcData[monstername]:match("Race:(.-) ")
           if race ~= "-" then
             SendToServer("target " ..race)
             WindowXCallS("batscmsgwindow","setenmportrait",race)
           else
             targetall(monstername)
           end
           return
       end
     else
       local npcfile = io.open("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/"..NewContinent.."/"..areaname1..".lua", "w")
       npcfile:close()
     end
     downloadMonsterInfo(line)
  end
end

function targetall(line)
  local excludeList = {"a", "the", "at", "on", "you", "in", "by", "big", "small", "is", "his", "to", "beautiful", "and", "black", "dark", "here", "her", "with", "yellow", "looks", "blue", "an", "little"}
  local excludeList2 = {"Niubi"}
  --if line and not line:find("Niubi") then
  if line then
    local line1 = line:lower()
    local target = {}
    local i = 1
    for word in line1:gmatch("%w+") do
      if not tableContains(excludeList, word) then
        target[i] = word
        SendToServer("gagoutput target " .. target[i])
        i = i + 1
      end
    end
  --  for j = 1, i-1 do
     -- SendToServer("gagoutput target " .. target[j])
    --end
    WindowXCallS("batscmsgwindow","setenmportrait","unknow race")
  end
  --SendToServer("target")
end

function downloadMonsterInfo(searchTerm)
   local runner = {}
   runner.run = function()
      local searchUrl = luajava.newInstance("java.lang.String", "https://batshoppe.dy.fi/monsieinfo.php")
      local postData = "monsiestring=" .. searchTerm .. "&submit=Submit"

      -- 发送POST请求提交表单
      local url = luajava.newInstance("java.net.URL", searchUrl)
      local connection = url:openConnection()
      connection:setRequestMethod("POST")
      connection:setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
      connection:setDoOutput(true)

      local outputStream = connection:getOutputStream()
      local dataOutputStream = luajava.newInstance("java.io.DataOutputStream", outputStream)
      dataOutputStream:writeBytes(postData)
      dataOutputStream:flush()
      dataOutputStream:close()

      -- 发送GET请求获取查询结果页面
      connection:setRequestMethod("GET")
      local reader = luajava.newInstance("java.io.BufferedReader",
         luajava.newInstance("java.io.InputStreamReader", connection:getInputStream()))
      local buffer = {}
      local line = reader:readLine()
      while line do
         table.insert(buffer, line)
         line = reader:readLine()
      end
      local response = table.concat(buffer, "\n")
      reader:close()
      connection:disconnect()
      processMonsterInfoResult(response)
   end

   local runnerProxy = luajava.createProxy("java.lang.Runnable", runner)
   local runnerThread = luajava.newInstance("java.lang.Thread", runnerProxy)
   runnerThread:start()
end


function processMonsterInfoResult(Data)
    --Note(Data)
    local resultStartIndex = string.find(Data, "Monster Name:")
    local resultEndIndex = string.find(Data, "input type", resultStartIndex)
    if resultStartIndex and resultEndIndex then
      local result = string.sub(Data, resultStartIndex, resultEndIndex-2)
      local result2 = result:gsub("<tr class='leftaligned'>","\n"):gsub("<[^<>]+>", ""):gsub("\n+", "\n"):gsub("&#039;","'")
      local enemyname = result2:match("Monster Name:(.*) \nShortname:")
      local enemyportrait = result2:match("Race:(.-) ")
      if enemyportrait ~= "-" then
        SendToServer("target " ..enemyportrait)
        WindowXCallS("batscmsgwindow","setenmportrait",enemyportrait)
      else
        targetall(enemyname)
      end
      Note("\n"..lwhite2..result2..lwhite)
      local areaname1 = getAreaLocName() or "outside"
      npclog = io.open("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/Batmud_npcLog.txt", "a+")
      npclog:write(",\n{"..NewContinent.."_"..areaname1.."_"..NewPosition..":\n"..result2.."}")
      npclog:flush()
      npclog:close()
      if NewRoomMessage[NewContinent] and NewRoomMessage[NewContinent][areaname1] and NewRoomMessage[NewContinent][areaname1][ManualAllOd] then
        local roommonsters = NewRoomMessage[NewContinent][areaname1][ManualAllOd]
        if not roommonsters["Monster"] then
          roommonsters["Monster"] = {}
        end
        table.insert(NewRoomMessage[NewContinent][areaname1][ManualAllOd]["Monster"], "{"..result2.."}")
      end
      local npcData = dofile("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/"..NewContinent.."/"..areaname1..".lua") or {}
     npcData[monstername] = result2
      local serialized = serialize(npcData)
      local file = io.open("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/"..NewContinent.."/"..areaname1..".lua", "w")
      file:write(serialized)
      file:close()
    else
      Note("\n"..lwhite2.."Monster was not found.\n"..lwhite)
      targetall(monstername)
    end
end

function searchlocalnpclog(val)
  local Npc = {}
  local npclog = io.open("/storage/emulated/0/BlowTorch/logfiles/NPCMessages/Batmud_npcLog.txt", "r")
  local content = npclog:read('*all')
  npclog:close()
  for npcContent in content:gmatch("{(.-)}") do
    table.insert(Npc, npcContent)
  end
  for i = 1, #Npc do
    if Npc[i]:find(val, 1, true) then
      Note(Npc[i].."\n")
      break
    end
  end
end

WikiSearchItem = nil
function DownloadWikiSearchItem(searchTerm)
  WikiSearchItem = searchTerm
  local runner = {}
  runner.run = function()
      local searchUrl = string.format("https://taikajuoma.ovh/wiki/%s", searchTerm)
      local url = luajava.newInstance("java.net.URL", searchUrl)
      local connection = url:openConnection()
      connection:setRequestMethod("GET")
      connection:setDoInput(true)
      connection:setDoOutput(true)
      connection:connect()
      local reader = luajava.newInstance("java.io.InputStreamReader", connection:getInputStream())
      local bufferedReader = luajava.newInstance("java.io.BufferedReader", reader)
      local responseLines = {}
      local line = bufferedReader:readLine()
      while line do
          table.insert(responseLines, line)
          line = bufferedReader:readLine()
      end

      local responseData = table.concat(responseLines, "")
      connection:disconnect()

      if ProcessWikiSearchResult then
          --Note(responseData)
          ProcessWikiSearchResult(responseData)
      else
         Note("No function found to process the monster search result.")
      end
  end

  local runnerProxy = luajava.createProxy("java.lang.Runnable", runner)
  local runnerThread = luajava.newInstance("java.lang.Thread", runnerProxy)
  runnerThread:start()
end

function ProcessWikiSearchResult(htmlData)
local startIndex0 = string.find(htmlData, WikiSearchItem)
local startIndex = string.find(htmlData,"<h1 id=\"firstHeading\" class=\"firstHeading\" lang=\"en\"><span dir=\"auto\">")
--local startIndex = string.find(htmlData,"\"wgCategories\":")
local endIndex = string.find(htmlData,"NewPP limit reportCPU time usage:",  startIndex)
local htmlData1 = string.sub(htmlData,startIndex,  endIndex-6)
local htmlData2 = htmlData1:gsub("<br />", "\n"):gsub("</dd>", "\n"):gsub("</p>", "\n"):gsub("<th align=\"right\">", "\n"):gsub("<li>", "\n"):gsub("</table>", "\n"):gsub("<!%-%- start content %-%->", "\n"):gsub("<[^<>]+>", ""):gsub("From BatWiki", ""):gsub("Jump to: ", ""):gsub("navigation, search", ""):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("\n+", "\n")
Note("\n\n"..lwhite2..htmlData2.."\n"..lwhite)
--Note("\n"..htmlData1.."\n")
end




--------------------- target 2 plugin start ----------------------
function targetallswitch2()
  EnableTrigger("targetgag2",true)
end

function targetnpc2(name, raw, map)
   local str6 = nil
   local str5 = raw:getIterator():next()
   if str5:toString():find("$Color@") then
   str6 = str5:getOperations():toString()
   end
   if str6 == "[38, 5, 82]" then
   targetall2(map["1"])
   EnableTrigger("targetgag2",false)
   end
end

function targetall2(line)
  local excludeList = {"a", "the", "at", "on", "you", "in", "by", "big", "small", "is", "his", "to", "beautiful", "and", "black", "dark", "here", "her", "with", "yellow", "looks", "blue", "an", "little"}
  local excludeList2 = {"Niubi"}
  --if line and not line:find("Niubi") then
  if line then
    local line1 = line:lower()
    local target = {}
    local i = 1
    for word in line1:gmatch("%w+") do
      if not tableContains(excludeList, word) then
        target[i] = word
        SendToServer("gagoutput target " .. target[i])
        i = i + 1
      end
    end
   -- for j = 1, i-1 do
    --  SendToServer("gagoutput target " .. target[j])
   -- end
    SendToServer("target")
    WindowXCallS("batscmsgwindow","setenmportrait","unknow race")
    --WindowXCallS("batscmsgwindow","dlact","target,300")
    --SendToServer("target")
  end
  --SendToServer("target")
end

--------------------- switching and UI design plugin start ----------------------
function OnOptionChanged(key,value)
	local func = optionsTable[key]
	if(func ~= nil) then
		func(value)
	end
end

local exitdir = nil
function exitprocess(name,line,str_e)
    if drawmapmode == "true" then
      EnableTrigger("roominfo",true)
    end
    EnableTrigger("exitblook",false)
    local excludeList = {"nw","n","ne","e","se","s","sw","w","u","d"}
    local exit = {}
    local i = 1
    local line1 = str_e["1"]
    
    for word in line1:gmatch("%w+") do
      if not tableContains(excludeList, word) then
        exit[i] = word
        i = i + 1
      end
    end
    
    if exitdir == "left" then
            SendToServer(exit[1])
            ifDrawMap(exit[1])
    elseif exitdir == "right" then
            SendToServer(exit[#exit])
            ifDrawMap(exit[#exit])
    end    
end
 
function exitsearch(val)
    EnableTrigger("exitblook",true)
    EnableTrigger("roominfo",false)
    exitdir = val
end

judgenumber = 1
autoaction = false
function switchingfunc(g)
if g == "reset" then
    judgenumber = 1
    autoaction = false
elseif g == "auto" then
    if autoaction == false then
    autoaction = true
    WindowXCallS(batscmsgWindowName,"promptatton")
    elseif autoaction == true then
    autoaction = false
    WindowXCallS(batscmsgWindowName,"promptattoff")
    end
elseif g == "map" then
    if autoaction == false then
    autoaction = true
    EnableTrigger("gagmaps",false)
    elseif autoaction == true then
    autoaction = false
    EnableTrigger("gagmaps",true)
    end
elseif g == "ghost" then
    if judgenumber == 1 then
    SendToServer(".kb ghost new body please!")
    judgenumber = 2
    elseif judgenumber == 2 then
    SendToServer(".kb popup accept body from ")
    judgenumber = 3
    elseif judgenumber == 3 then
    SendToServer(".kb ghost ress please!")
    judgenumber = 4
    elseif judgenumber == 4 then
    SendToServer(".kb popup accept ress from ")
    judgenumber = 1
    end
end
end

function autoclw(val)
if autoaction == true then
    if val == "Chanted" then
    if hppercent <= 0.95 and crtsp >= 20 then SendToServer("clw") end
    elseif val == "Prepared" then
    if battlestate == true and crtep >= 20 then SendToServer("var1") end
    end
else
scanshow(val)
end
end

function set_showhp(val)
	if(val == "true") then
		option_showhp = true
		EnableTrigger("hpset",true)
		WindowXCallS(batscmsgWindowName,"hpbarshow")
	else
		option_showhp = false
		EnableTrigger("hpset",false)
		WindowXCallS(batscmsgWindowName,"hpbargone")
	end
end

function set_portrait_landscape()
    if option_portrait then
        EnableTrigger("gagmaps",false)
        SendToServer("/WindowXCallS(\"batscmsgwindow\",\"setDisplayViewHeight\",\"true\")")
        SendToServer("/WindowXCallS(\"combat\",\"setCombatViewPosition\",\"true\")")
        SendToServer("/WindowXCallS(\"chats\",\"setChatViewPosition\",\"true\")")
    else
        EnableTrigger("gagmaps",false)
        SendToServer("/WindowXCallS(\"batscmsgwindow\",\"setDisplayViewHeight\",\"false\")")
        SendToServer("/WindowXCallS(\"combat\",\"setCombatViewPosition\",\"false\")")
        SendToServer("/WindowXCallS(\"chats\",\"setChatViewPosition\",\"false\")")
    end
end

firstload = true
function set_portrait(val)
    if(val == "true") then
        option_portrait = true
    else
        option_portrait = false
    end
    set_portrait_landscape()
    if not firstload then
    SendToServer(".win mainbuffer;.closewindow")
    else
    firstload = false
    end
end

optionsTable = {}
optionsTable.showhp = set_showhp
optionsTable.portrait = set_portrait

line1_fill = false
function rbar(str)
setposition("1,"..str)
if line1_fill == false then
WindowXCallS(batscmsgWindowName,"sethpbar","1,"..str)
line1_fill = true
elseif line1_fill == true then
WindowXCallS(batscmsgWindowName,"sethpbar","2,"..str)
line1_fill = false
end
end

function __split(str, reps)
	local r = {}
	if str == nil then return nil end
	string.gsub(str, "[^"..reps.."]+", function(w) table.insert(r, w) end)
	return r
end

function setposition(scmesg)
strp = __split(scmesg, ",")
--fillnum = str[1]
crthp = tonumber(strp[2])
--difhp = str[3]
crtsp = tonumber(strp[4])
--difsp = str[5]
crtep = tonumber(strp[6])
--difep = str[7]
--crtexp = str[8]
--difexp1 = str[9]
--if difexp1 ~= ":" then
--difexp = difexp1
--end
--exppool = str[10]
--eqset = str[11]
--weight = str[12]
--parry = str[13]
--target = str[14]
continent = strp[15]
xcoords = tonumber(strp[16])
ycoords = tonumber(strp[17])
maxhp = tonumber(strp[18])
hppercent = crthp / maxhp
end

EnableTrigger("damageInfo",false)
battlestate = false
function damageInfostart(val)
    if val == "on" then
    EnableTrigger("damageInfo",true)
    SendToServer(".setcbt true;gagoutput battle listen all 2")
    battlestate = true
    else
    EnableTrigger("damageInfo",false)
    scanshow("R.I.P.")
    dmgTT1st = 0
    dmgTT3rd = 0
    dmgTTenm = 0
    dmguishow("reset")
    RIPcountmax = 0
    RIPcount2 = 0
    SendToServer(".setcbt false;gagoutput battle listen all 0")
    AppendLineToWindow('combat','####################################################\n\n')
    battlestate = false
    end
end

msgnumb = 1
function scanshow(val)
z = val
if z == "R.I.P." then
WindowXCallS(batscmsgWindowName,"processscanhp","round over")
msgnumb = 1
elseif z == "Round" then
--a = z
msgnumb = 2
elseif msgnumb == 2 then
b = z
msgnumb = 3
elseif msgnumb == 3 then
c = z
WindowXCallS(batscmsgWindowName,"processscanhp","R"..b.." "..c)
msgnumb = 4
elseif msgnumb == 4 then
d = z
WindowXCallS(batscmsgWindowName,"processscanhp","R"..b.." "..c.." "..d)
msgnumb = 5
elseif msgnumb == 5 then
e = z
WindowXCallS(batscmsgWindowName,"processscanhp","R"..b.." "..c.." "..d.." "..e)
msgnumb = 6
elseif msgnumb == 6 then
f = z
WindowXCallS(batscmsgWindowName,"processscanhp","R"..b.." "..c.." "..d.." "..e.." "..f)
msgnumb = 1
end
end


x = ""
y = ""
u = ""
v = ""
l = ""
m = ""
n = ""
function dmguishow(val)
w = val
if w == "reset" then
    Note(bmagenta.." "..x.." "..y.." "..u.." "..v.." "..l.." "..m.." "..n..lwhite.."\n")
    x = ""
    y = ""
    u = ""
    v = ""
    l = ""
    m = ""
    n = ""
else
    if string.sub(w, 1, 4) == "Me:[" then
    x = w
    elseif y == "" then
    y = w
    elseif string.sub(y, 1, 4) == string.sub(w, 1, 4) then
    y = w
    elseif u == "" then
    u = w
    elseif string.sub(u, 1, 4) == string.sub(w, 1, 4) then
    u = w
    elseif v == "" then
    v = w
    elseif string.sub(v, 1, 4) == string.sub(w, 1, 4) then
    v = w
    elseif l == "" then
    l = w
    elseif string.sub(l, 1, 4) == string.sub(w, 1, 4) then
    l = w
    elseif m == "" then
    m = w
    elseif string.sub(m, 1, 4) == string.sub(w, 1, 4) then
    m = w
    elseif n == "" then
    n = w
    elseif string.sub(n, 1, 4) == string.sub(w, 1, 4) then
    n = w
    end
WindowXCallS(batscmsgWindowName,"processscanexp",x.." "..y.." "..u.." "..v.." "..l.." "..m.." "..n)
end
end

--------------------- switching and UI design plugin end ---------------------------
---------------------------damage information plugin start -----------------
function linematchtable(tab, line)
  for i = 1, #tab do
    if string.sub(line, -#(tab[i]..".")) == tab[i].."." then
      return true
    end
  end
  return false
end

dmgRD1st = 0
dmgRD3rd = 0
dmgRDenm = 0
dmgTT1st = 0
dmgTT3rd = 0
dmgTTenm = 0
RIPcount = 0
RIPcountmax = 0
RIPcount2 = 0
function damageInfoaccept(name,line,replaceMap)
    hitMessages1st = {
        { " lightly jostle ", " barely scratch ", " barely graze ", " lightly shove ", " pat ", " sample ", " slap ", " tickle ", " lash ", " lightly claw ", " breath lightly " },
        { " jostle ", " scratch ", " solidly slash ", " lightly batter ", " spank ", " morsel ", " push ", " step on ", " lightly lash ", " claw ", " breath " },
        { " butt ", " slightly pierce ", " gash ", " lightly push ", " smack ", " nibble ", " shove ", " grasp ", " lightly flog ", " barely scrape ", " snort " },
        { " bump ", " pierce ", " lightly cut ", " lightly bash ", " bitchslap ", " taste ", " grab ", " toe kick ", " slightly slash ", " scrape ", " snort lightly " },
        { " thump ", " puncture ", " cut ", " lightly slam ", " lightly strike ", " bite ", " punch ", " knee ", " flog ", " prick ", " sneeze " },
        { " stroke ", " sink ", " tear ", " lightly crush ", " boot ", " nip ", " foot sweep ", " elbow ", " slice ", " stick ", " sneeze softly " },
        { " thrust ", " bore ", " incise ", " heavily shove ", " kick ", " really taste ", " evade, and then reverse ", " elbow smash ", " sharply slice ", " lacerate ", " cough " },
        { " jab ", " crater ", " shred ", " batter ", " suckerpunch ", " snap ", " grab and shoulder toss ", " stomp kick ", " lightly flick ", " perforate ", " gasp " },
        { " bash ", " cavitate ", " horribly shred ", " heavily push ", " ankle stomp ", " munch ", " snap kick ", " foot step ", " flick ", " badly perforate ", " gasp loudly " },
        { " strike ", " shaft ", " slash ", " heavily bash ", " stomp ", " chomp ", " joint lock ", " twist and throw ", " whip ", " wound ", " vomit " },
        { " sock ", " gorge ", " incisively cut ", " slam ", " knee kick ", " gnaw ", " unbalance, then expertly throw ", " finger jab ", " wantonly whip ", " badly wound ", " vomit profusely " },
        { " cuff ", " really poke ", " incisively tear ", " crush ", " badly kick ", " split ", " stop kick ", " joint twist ", " welt ", " savagely claw ", " choke " },
        { " knock ", " riddle ", " slit ", " really shove ", " jump kick ", " masticate ", " reverse spin kick ", " back kick ", " lightly blister ", " cruelly perforate ", " exhale " },
        { " flail ", " dig into ", " cruelly tatter ", " really batter ", " uppercut ", " badly chomp ", " pull, then cruelly throat chop ", " spinning back kick ", " blister ", " plunge ", " exhale quickly " },
        { " whack ", " dig through ", " savagely shave ", " really push ", " kidneypunch ", " chew ", " trip and head stomp ", " phoenix eye punch ", " badly flog ", " lightly eviscerate ", " blow " },
        { " beat ", " chasm ", " rive ", " really bash ", " spin kick ", " rip ", " savagely hammerfist ", " spinning backfist ", " slightly gash ", " ram ", " burp " },
        { " smash ", " drill ", " cruelly slash ", " really slam ", " headbutt ", " cruelly gnaw ", " craftily feint and then grab and flip ", " jump up and side kick ", " savagely cut ", " clash ", " burp loudly " },
        { " cruelly beat ", " powerfully perforate ", " uncontrollably slash ", " really crush ", " cruelly headbutt ", " cruelly chomp ", " fluidly evade, duck under and spine chop ", " dragon claw ", " sharply cut ", " savagely strike ", " hiccough " },
        { " badly smash ", " powerfully pierce ", " quickly cut ", " cruelly shove ", " dragon punch ", " savagely snap ", " nerve grab, causing unendurable pain to ", " feint high and then cruelly groin rip ", " thrash ", " eviscerate ", " hiccough rapidly " },
        { " horribly thrust ", " cruelly crater ", " savagely rip ", " cruelly batter ", " savagely triple kick ", " brutally bite ", " perform a lightning fast punch and throw combo on ", " snake strike, blocking the chi of ", " cruelly thrash ", " cruelly rip ", " sigh " },
        { " savagely sock ", " savagely shaft ", " BRUTALLY TEAR ", " cruelly push ", " roundhouse ", " meanly munch ", " grab, headbutt, then NECK SNAP ", " pummel, with dozens of chain punches, ", " slightly slit ", " nastily plunge ", " sigh heavily " },
        { " savagely strike ", " uncontrollably dig through ", " SAVAGELY SHRED ", " cruelly bash ", " bodyslam ", " really chew ", " masterfully evade then JUMP KICK ", " leap, spin, and swallow tail KICK ", " strap ", " cruelly ram ", " yawn " },
        { " REALLY WHACK ", " REALLY DRILL ", " CRUELLY REND ", " REALLY SLAM ", " run into ", " horribly munch ", " DEVASTATINGLY HEAD THROW ", " DEVASTATE, with a thrusting blow, ", " lather ", " WHACK ", " yawn widely " },
        { " BRUTALLY BEAT ", " CRUELLY RIDDLE ", " BARBARICALLY REND ", " REALLY CRUSH ", " REALLY SMASH ", " SAVAGELY CHEW ", " HORRIBLY DOUBLE KICK ", " BRUTALLY THROAT RIP ", " SADISTICALLY SLASH ", " RELENTLESSLY RAM ", " BREATH HARD " },
        { " CRUELLY CUFF ", " BRUTALLY BORE ", " DISMEMBER ", " BRUTALLY CRUSH ", " BRUTALLY BOOT ", " UNCONTROLLABLY GNAW ", " MASTERFULLY POWER THROW ", " SAVAGELY BELLY SMASH ", " MADLY THRASH ", " CRUELLY CLAW ", " SNORT SAVAGELY " },
        { " BARBARICALLY BASH ", " BARBARICALLY PIERCE ", " CRUELLY DISMEMBER ", " BARBARICALLY SLAM ", " BARBARICALLY BEAT ", " BARBARICALLY BITE ", " DEVASTATINGLY SNAP KICK ", " CRUELLY TIGER STRIKE ", " WILDLY WHIP ", " BARBARICALLY LACERATE ", " VICIOUSLY VOMIT " }
    }
    hitMessages3rd = {
        { " lightly jostles ", " barely scratches ", " barely grazes ", " lightly shoves ", " pats ", " samples ", " slaps ", " tickles ", " lashes ", " lightly claws ", " breaths lightly " },
        { " jostles ", " scratches ", " solidly slashes ", " lightly batters ", " spanks ", " morsels ", " pushes ", " steps on ", " lightly lashes ", " claws ", " breaths " },
        { " butts ", " slightly pierces ", " gashes ", " lightly pushes ", " smacks ", " nibbles ", " shoves ", " grasps ", " lightly flogs ", " barely scrapes ", " snorts " },
        { " bumps ", " pierces ", " lightly cuts ", " lightly bashes ", " bitchslaps ", " tastes ", " grabs ", " toe kicks ", " slightly slashes ", " scrapes ", " snorts lightly " },
        { " thumps ", " punctures ", " cuts ", " lightly slams ", " lightly strikes ", " bites ", " punches ", " knees ", " flogs ", " pricks ", " sneezes " },
        { " strokes ", " sinks ", " tears ", " lightly crushes ", " boots ", " nips ", " foot sweeps ", " elbows ", " slices ", " sticks ", " sneezes softly " },
        { " thrusts ", " bores ", " incises ", " heavily shoves ", " kicks ", " really tastes ", " evades, and then reverses ", " elbow smashes ", " sharply slices ", " lacerates ", " coughes " },
        { " jabs ", " craters ", " shreds ", " batters ", " suckerpunches ", " snaps ", " grabs and shoulder tosses ", " stomp kicks ", " lightly flicks ", " perforates ", " gasps " },
        { " bashes ", " cavitates ", " horribly shreds ", " heavily pushes ", " ankle stomps ", " munches ", " snap kicks ", " foot steps ", " flicks ", " badly perforates ", " gasp loudly " },
        { " strikes ", " shafts ", " slashes ", " heavily bashes ", " stomps ", " chomps ", " joint locks ", " twists and throws ", " whips ", " wounds ", " vomits " },
        { " socks ", " gorges ", " incisively cuts ", " slams ", " knee kicks ", " gnaws ", " unbalances, then expertly throws ", " finger jabs ", " wantonly whips ", " badly wounds ", " vomits profusely " },
        { " cuffs ", " really pokes ", " incisively tears ", " crushes ", " badly kicks ", " splits ", " stop kicks ", " joint twists ", " welts ", " savagely claws ", " chokes " },
        { " knocks ", " riddles ", " slits ", " really shoves ", " jump kicks ", " masticates ", " reverse spin kicks ", " back kicks ", " lightly blisters ", " cruelly perforates ", " exhales " },
        { " flails ", " digs into ", " cruelly tatters ", " really batter ", " uppercuts ", " badly chomps ", " pulls, then cruelly throat chops ", " spinning back kicks ", " blisters ", " plunges ", " exhales quickly " },
        { " whacks ", " digs through ", " savagely shaves ", " really pushes ", " kidneypunches ", " chews ", " trips and head stomps ", " phoenix eye punches ", " badly flogs ", " lightly eviscerates ", " blows " },
        { " beats ", " chasms ", " rives ", " really bashes ", " spin kicks ", " rips ", " savagely hammerfists ", " spinning backfists ", " slightly gashes ", " rams ", " burps " },
        { " smashes ", " drills ", " cruelly slashes ", " really slams ", " headbutts ", " cruelly gnaws ", " craftily feints and then grabs and flips ", " jump up and side kicks ", " savagely cuts ", " clashes ", " burps loudly " },
        { " cruelly beats ", " powerfully perforates ", " uncontrollably slashes ", " really crushes ", " cruelly headbutts ", " cruelly chomps ", " fluidly evades, ducks under and spine chops ", " dragon claws ", " sharply cuts ", " savagely strikes ", " hiccoughs " },
        { " badly smashes ", " powerfully pierces ", " quickly cuts ", " cruelly shoves ", " dragon punches ", " savagely snaps ", " nerve grabs, causing unendurable pain to ", " feints high and then cruelly groin rips ", " thrashes ", " eviscerates ", " hiccoughs rapidly " },
        { " horribly thrusts ", " cruelly craters ", " savagely rips ", " cruelly batters ", " savagely triple kicks ", " brutally bites ", " performs a lightning fast punch and throws combo on ", " snake strikes, blocking the chi of ", " cruelly thrashes ", " cruelly rips ", " sighs " },
        { " savagely socks ", " savagely shafts ", " BRUTALLY TEARS ", " cruelly push ", " roundhouses ", " meanly munches ", " grabs, headbutts, then NECK SNAPS ", " pummels, with dozens of chain punches, ", " slightly slits ", " nastily plunges ", " sighs heavily " },
        { " savagely strikes ", " uncontrollably digs through ", " SAVAGELY SHREDS ", " cruelly bashes ", " bodyslams ", " really chews ", " masterfully evades then JUMP KICKS ", " leaps, spins, and swallow tail KICKS ", " straps ", " cruelly ram ", " yawns " },
        { " REALLY WHACKS ", " REALLY DRILLS ", " CRUELLY RENDS ", " REALLY SLAMS ", " runs into ", " horribly munches ", " DEVASTATINGLY HEAD THROWS ", " DEVASTATES, with a thrusting blow, ", " lathers ", " WHACKS ", " yawns widely " },
        { " BRUTALLY BEATS ", " CRUELLY RIDDLES ", " BARBARICALLY RENDS ", " REALLY CRUSHES ", " REALLY SMASHES ", " SAVAGELY CHEWS ", " HORRIBLY DOUBLE KICKS ", " BRUTALLY THROAT RIPS ", " SADISTICALLY SLASHES ", " RELENTLESSLY RAMS ", " BREATHS HARD " },
        { " CRUELLY CUFFS ", " BRUTALLY BORES ", " DISMEMBERS ", " BRUTALLY CRUSHES ", " BRUTALLY BOOTS ", " UNCONTROLLABLY GNAWS ", " MASTERFULLY POWER THROWS ", " SAVAGELY BELLY SMASHES ", " MADLY THRASHES ", " CRUELLY CLAWS ", " SNORTS SAVAGELY " },
        { " BARBARICALLY BASHES ", " BARBARICALLY PIERCES ", " CRUELLY DISMEMBERS ", " BARBARICALLY SLAMS ", " BARBARICALLY BEATS ", " BARBARICALLY BITES ", " DEVASTATINGLY SNAP KICKS ", " CRUELLY TIGER STRIKES ", " WILDLY WHIPS ", " BARBARICALLY LACERATES ", " VICIOUSLY VOMITS " }
    }
    hitType = { "  bash  ", " pierce ", "  slash ", " shield ", " unarmed", "  bite  ", " ma monk", "ma tiger", "  whip  ", "  claw  ", " breath " }
    tank = {
       "Niubi", "you", "with shield", "Spiderman", "Spiderwoman", "Zoid", "Ugliness", "soul companion", "spirit", "Excel", "Luckyday", "Pipixia",
        "Capwailing", "Stylus", "Docx", "Docx's", "Nevermore's", "Nevermore", "Wildfist", "Zjmee",
        "Dbv", "Winword", "Derendil", "Aloysha", "Eltan", "Rayleigh", "Liao", "Malu", "Floki", "Soshwi", "Soshwi's",
        "Siralpaca", "Alpaca", "Notme", "Nkvd", "Ancient chimera", "Ancient fire drake",
        "Hoar frost gryphon", "Teenage duz", "Panda", "Huge slave", "Golem", "Jade spider", "Servant"
    }
    local i = 0
    local v = 0
    local count = ""
    local hitDamage = 0
    local weaponType = 0
    local damageFound = ""
    local friends = ""
    local enemy = ""
    local line2 = replaceMap["1"]:gsub("-", " ")
    
    
  
    if string.sub(line2, 1, 9) =="You take " or line2:find("Its mane is glowing") or line2:find("surrounding the whole body") or line2:find(" miss%.") or line2:find(" misses%.") or line2:find(" dodges%.") or line2:find(" parries%.") or line2:find(" dodge%.") or line2:find("a CRITICAL hit") or replaceMap["1"]:find("-----------------------------") or line2:find("================") then
        damageFound = "skip"
    elseif damageFound == "" then
        if line2:find("R.I.P.") then
            RIPcount2 = RIPcount2 + 1
            if RIPcount2 == RIPcountmax then
            damageInfostart("off")
            --scanshow("R.I.P.")
            --dmgTT1st = 0
            --dmgTT3rd = 0
            --dmgTTenm = 0
            --dmguishow("reset")
            --RIPcountmax = 0
            --RIPcount2 = 0
            end
        elseif line2:find("Round") then
            --Note(line2)
            AppendLineToWindow('combat', line)
            local a, b = line2:match("%*%*%*%*%* (Round) (.+) %*%*%*")
            scanshow(a)
            scanshow(b)
            dmgRD1st = 0
            dmgRD3rd = 0
            dmgRDenm = 0
            RIPcount = 0
        elseif line2:find("%%%)") then
            local a, b = line2:match("(%w+)%s+is.*(%b())")
            scanshow(a..b)
            RIPcount = RIPcount + 1
            RIPcountmax = (RIPcount > RIPcountmax) and RIPcount or RIPcountmax
        elseif line2:find("arrives") or line2:find("leaves") then
            AppendLineToWindow('combat',bgreen..line2..lwhite)
        elseif line2 == "...BUT you break it off." then
            WindowXCallS("batscmsgwindow","setmainportrait","reset")
        elseif string.sub(line2, 1, 3) == "You" then
          if line2 == "You are prepared to do the skill." then
            autoclw("Prepared")
            if RIPcountmax ~= 0 then AppendLineToWindow('combat', line) end
          elseif line2 == "You are done with the chant." then
            autoclw("Chanted")
            if RIPcountmax ~= 0 then AppendLineToWindow('combat', line) end
          elseif line2 == "You are not doing anything at the moment." then
            scanshow("IDLE")
            AppendLineToWindow('combat', line)
          elseif line2:find("You get hit, and your eyes lose focus slightly.") then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 1")
          elseif line2 == "You become somewhat confused, losing your edge." then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 2")
          elseif line2 == "Your mind reels and the world becomes blurred." then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 3")
          elseif line2 == "You get hit badly, and have problems staying in balance." then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 4")
          elseif line2 == "You stagger helplessly in pain and confusion." then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 5")
          elseif line2 == "You lose connection to reality, becoming truly STUNNED." then
            WindowXCallS("batscmsgwindow","setmainportrait","STUN 6")
          elseif line2 == "You lose your concentration and cannot do the skill." then
            scanshow("Lose Concentration")
            autoclw("Prepared")
          elseif line2 == "You try to act but just blank out, losing focus." then
            AppendLineToWindow('combat', line)
            scanshow("Lose Control")
            SendToServer("wimpy now")
          elseif line2 == "You are no longer stunned." then
            WindowXCallS("batscmsgwindow","setmainportrait","reset")
          elseif line2 == "Your thoughts still feel clear and calm." then
            WindowXCallS("batscmsgwindow","setmainportrait","reset")
          -- elseif line2:match("You heal .* of your own wounds.") then
       --     AppendLineToWindow('combat',lwhite2..line2..lwhite.."\n")
          else
            for i = 1, 26 do
                for v = 1, 11 do
                    local hitMessage = hitMessages1st[i][v]
                    if line2:find(hitMessage, 1, true) then
                        if #hitMessage > #damageFound then
                            damageFound = hitMessage
                            hitDamage = i
                            weaponType = v
                        end
                    end
                end
            end
            if damageFound ~= "" then
              dmgRD1st = dmgRD1st + hitDamage * hitDamage
              dmgTT1st = dmgTT1st + hitDamage * hitDamage
              dmguishow("Me:".."["..dmgRD1st.."/"..dmgTT1st.."]")
              for j = 1, hitDamage do
                count = count.."#"
              end
              AppendLineToWindow('combat',string.format("%s[%11s-%2s][%s-%s]%s\n", bcyan, "Potion", hitDamage, hitType[weaponType], damageFound, lwhite))
              --Note(string.format("%s[%11s-%2s][%s-%s]%s\n", byellow, "Potion", hitDamage, hitType[weaponType], damageFound, lwhite))
            else
              --Note(line)
              AppendLineToWindow('combat', line)
            end
          end
        else
          for k = 1, #tank do
            if string.sub(line2, 1, #(tank[k].." ")) == tank[k].." " and not linematchtable(tank,line2) then
              --for h = 1, #tank do
                --if string.sub(line2, -#(tank[h]..".")) == tank[k].."." then
                friends = tank[k]
                for i = 1, 26 do
                    for v = 1, 11 do
                        local hitMessage = hitMessages3rd[i][v]
                        if line2:find(hitMessage, 1, true) then
                          if #hitMessage > #damageFound then
                            damageFound = hitMessage
                            hitDamage = i
                            weaponType = v
                          end
                        end
                    end
                end
                if damageFound ~= "" then
                  dmgRD3rd = dmgRD3rd + hitDamage * hitDamage
                  dmgTT3rd = dmgTT3rd + hitDamage * hitDamage
                  dmguishow(friends..":".."["..dmgRD3rd.."/"..dmgTT3rd.."]")
                  for j = 1, hitDamage do
                    count = count.."#"
                  end
                  AppendLineToWindow('combat',string.format("%s[%11s-%2s][%s-%s]%s\n", dcyan, friends, hitDamage, hitType[weaponType], damageFound, lwhite))
                  --Note(string.format("%s[%11s-%2s][%s-%s]%s\n", bcyan, friends, hitDamage, hitType[weaponType], damageFound, lwhite))
                else
                  --Note(line)
                  AppendLineToWindow('combat', line)
                end
            elseif string.sub(line2, -#(tank[k]..".")) == tank[k].."." then
                for i = 1, 26 do
                    for v = 1, 11 do
                        local hitMessage = hitMessages3rd[i][v]
                        if line2:find(hitMessage, 1, true) then
                          if #hitMessage > #damageFound then
                            damageFound = hitMessage
                            hitDamage = i
                            weaponType = v
                          end
                        end
                    end
                end
                if damageFound ~= "" then
                  enemy = line2:match("(%w+)"..damageFound)
                  dmgRDenm = dmgRDenm + hitDamage * hitDamage
                  dmgTTenm = dmgTTenm + hitDamage * hitDamage
                  dmguishow(enemy..":".."["..dmgRDenm.."/"..dmgTTenm.."]")
                  for j = 1, hitDamage do
                    count = count.."#"
                  end
                  if string.sub(line2, -4) == "you." or string.sub(line2, -16) == "you with shield." then
                    AppendLineToWindow('combat',string.format("%s[%11s-%2s][%s-%s]%s\n", bred, enemy, hitDamage, hitType[weaponType], damageFound, lwhite))
                    --Note(string.format("%s[%11s-%2s][%s-%s]%s\n", bred, enemy, hitDamage, hitType[weaponType], damageFound, lwhite))
                  else
                    AppendLineToWindow('combat',string.format("%s[%11s-%2s][%s-%s]%s\n", dred, enemy, hitDamage, hitType[weaponType], damageFound, lwhite))
                    --Note(string.format("%s[%11s-%2s][%s-%s]%s\n", dred, enemy, hitDamage, hitType[weaponType], damageFound, lwhite))
                  end
                --else
                  --AppendLineToWindow('combat', line)
                end       
            end
          end
          if friends == "" and enemy == "" then
            --Note(line)
            AppendLineToWindow('combat', line)
          end 
        end
    end
end


-------------------- location and map information plugin start ------------------------






function calculateDistance(x1, y1, x2, y2)
  dx = x2 - x1
  dy = y2 - y1
  return math.sqrt(dx * dx + dy * dy)
end

function getNearestCity(x, y, cities)
  nearestCity = nil
  minDistance = math.huge

  for _, city in ipairs(cities) do
      distance = calculateDistance(x, y, city.x, city.y)
      if distance < minDistance then
          minDistance = distance
          nearestCity = city
      end
  end

  return nearestCity
end

function generatePath(x1, y1, x2, y2)
  dx = math.abs(x2 - x1)
  dy = math.abs(y2 - y1)
  if dx == 0 and dy ==0 then
  path = {"0n0e"}
  else
  directions = {}

  directionX = x1 < x2 and "e" or "w"
  for i = 1, dx do
      table.insert(directions, directionX)
  end

  directionY = y1 < y2 and "s" or "n"
  for i = 1, dy do
      table.insert(directions, directionY)
  end

  path = {}
  currentDirection = directions[1]
  count = 1

  for i = 2, #directions do
      if directions[i] == currentDirection then
          count = count + 1
      else
          table.insert(path, count .. currentDirection)
          currentDirection = directions[i]
          count = 1
      end
  end

  table.insert(path, count .. currentDirection)
  end
  return table.concat(path)
end


function displayNearestCityData(val)
  continentName = continent:lower()
  x = xcoords
  y = ycoords  
  cities = {}
    

  if string.sub(val, 1, 6) == "search" then
    if locations.unknownow then
      for i, city in pairs(locations.unknownow) do
        if city.name:find(val:lower():match("search%s(.+)")) then
         --if option_portrait then
          --AppendLineToWindow('batscmsgwindow',city.information)
         --else
          Note(city.information)
         --end
        end
      end
    end
  elseif string.sub(val, 1, 7) == "nearest" then
    for j, cities in pairs(locations) do
        if j == continentName then
             local val2 = val:lower():match("nearest%s(.+)")
             local cities2 = {} 
             for i, city in pairs(cities) do
               if city.name:match(val2) then
                 table.insert(cities2, city)
               end
             end
              nearestCity = getNearestCity(x, y, cities2)
              if nearestCity then
              path = generatePath(x, y, nearestCity.x, nearestCity.y)
              WindowXCallS(batscmsgWindowName,"processscanhp","Path to ".. nearestCity.name.." : "..path:gsub("(%d)(%a)", "%1 %2"):gsub("(%a)(%d)", "%1;%2"))
              SendToServer(".kb .run "..path)
              --if option_portrait then
                --AppendLineToWindow('batscmsgwindow',nearestCity.information)
             -- else
                Note(nearestCity.information)
            --  end
              end
        end
    end
  elseif string.sub(val, 1, 6) == "except" then
    for j, cities in pairs(locations) do
        if j == continentName then
             local val3 = val:lower():match("except%s(.+)")
             local k = 1
             local exception={}
             for word in val3:gmatch("%w+") do
             exception[k] = word
             k = k + 1
             end
             local cities3 = {} 
             for i, city in pairs(cities) do
               local matchFound = false
               for _, exceptionWord in pairs(exception) do
                 if city.name:match(exceptionWord) then
                   matchFound  =  true
                   break
                 end
               end

               if not matchFound then
                 table.insert(cities3, city)
               end
             end
              nearestCity = getNearestCity(x, y, cities3)
              if nearestCity then
              path = generatePath(x, y, nearestCity.x, nearestCity.y)
              WindowXCallS(batscmsgWindowName,"processscanhp","Path to ".. nearestCity.name.." : "..path:gsub("(%d)(%a)", "%1 %2"):gsub("(%a)(%d)", "%1;%2"))
              SendToServer(".kb .run "..path)
            --  if option_portrait then
             --   AppendLineToWindow('batscmsgwindow',nearestCity.information)
           --   else
                Note(nearestCity.information)
           --   end
              end
        end
    end
  elseif val == "" then
    Note("input <.wis> to get path to nearest city\ninput <.wis nearest xxx> to get path to nearest city which name contain <xxx>\ninput <.wis except x1,x2...> to get path to nearest city except x1 or x2 or...\ninput <.wis search xxx> may get a map of city i donot know where is now\ninput <.wis xxx> to get path to xxx city\n")
    for j, cities in pairs(locations) do
        if j == continentName then
             local cities2 = {} 
             for i, city in pairs(cities) do
               if not city.name:match("pcity") then
                 table.insert(cities2, city)
               end
             end
              nearestCity = getNearestCity(x, y, cities2)
              if nearestCity then
              path = generatePath(x, y, nearestCity.x, nearestCity.y)
              WindowXCallS(batscmsgWindowName,"processscanhp","Path to ".. nearestCity.name.." : "..path:gsub("(%d)(%a)", "%1 %2"):gsub("(%a)(%d)", "%1;%2"))
              SendToServer(".kb .run "..path)
           --   if option_portrait then
              --  AppendLineToWindow('batscmsgwindow',nearestCity.information)
           --   else
                Note(nearestCity.information)
            --  end
              if path == "0n0e" and nearestCity.bottonset ~= "nil" then
                  SendToServer(".loadset "..nearestCity.bottonset)
              end
              end
            --end
        end
    end
  else
    SendToServer("gagoutput unalias nav1;gagoutput unalias nav2;gagoutput unalias nav3")
    search_target = val:lower()
    nav = 0
    global = 0
    for j, cities in pairs(locations) do
        if j == continentName then
            for i, city in pairs(cities) do
                if city.name:find(search_target) then
                          diff_x = city.x - x
                          diff_y = city.y - y
                          distance = generatePath(x, y, city.x, city.y)
                          if nav < 3 then
                              nav = nav + 1
                              nav_alias = "nav" .. nav
                              SendToServer("alias "..nav_alias.." "..distance:gsub("(%d)(%a)", "%1 %2"):gsub("(%a)(%d)", "%1, %2"))
                              Note(city.name.." ["..city.x..", "..city.y.."]".."("..diff_x..", "..diff_y..")--->"..nav_alias.."\n")
                              SendToServer(".kb .run "..distance)
                          end
                end
            end
        else
                  for i, city in pairs(cities) do
                      if city.name:find(search_target) then
                          if global < 3 then
                              global = global + 1
                              global_alias = "global " .. global
                              Note(city.name.." ["..j.."]--->"..global_alias.."\n")
                          end
                      --elseif global == 0 then
                        --Note("Global areas not found.\n")
                      end
                  end
        end
    end
  end
end