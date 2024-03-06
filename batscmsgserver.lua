--scmsg plugin
--made by potion

require("serialize")

RegisterSpecialCommand("hpr","rbar")
RegisterSpecialCommand("dmgifs","damageInfostart")
RegisterSpecialCommand("scr","scanshow")
RegisterSpecialCommand("wis","displayNearestCityData")
RegisterSpecialCommand("swchfc","switchingfunc")
RegisterSpecialCommand("dmgif","damageInfoaccept")
RegisterSpecialCommand("tgt","targetnpc")
RegisterSpecialCommand("tgton","targetallswitch")
RegisterSpecialCommand("exit","exitsearch")
RegisterSpecialCommand("seq","downloadEquipSearchJson")
RegisterSpecialCommand("smon","downloadMonsterInfo")
RegisterSpecialCommand("swiki","DownloadWikiSearchItem")
--RegisterSpecialCommand("map","loadmap")
--RegisterSpecialCommand("map","loadmap")

batscmsgWindow = GetWindowTokenByName("batscmsgwindow")
batscmsgWindowName = "batscmsgwindow"
AppendWindowSettings("batscmsgwindow")

TextTree = luajava.bindClass("com.offsetnull.bt.window.TextTree")

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

local laemapfile = io.open(GetPluginInstallDirectory().."/laenor.ansi", "r")
local laemap_ansi = laemapfile:read('*all')
laemapfile:close()
local furmapfile = io.open(GetPluginInstallDirectory().."/furnachia.ansi", "r")
local furmap_ansi = furmapfile:read('*all')
furmapfile:close()
local rothmapfile = io.open(GetPluginInstallDirectory().."/rothikgen.ansi", "r")
local rothmap_ansi = rothmapfile:read('*all')
rothmapfile:close()
local lucemapfile = io.open(GetPluginInstallDirectory().."/lucentium.ansi", "r")
local lucemap_ansi = lucemapfile:read('*all')
lucemapfile:close()
local desomapfile = io.open(GetPluginInstallDirectory().."/desolathya.ansi", "r")
local desomap_ansi = desomapfile:read('*all')
desomapfile:close()

local NewContinent = nil
local NewPosition = nil
local PositionDelta = 0
local PositionTotal = 0
function LoadMap(name, line, map)
  if NewContinent ~= map["1"] then
      NewContinent = map["1"]
      if NewContinent == "Laenor" then
        AppendLineToWindow('batscmsgwindow', laemap_ansi)
        PositionDelta = 24
        PositionTotal = 730
      elseif NewContinent == "Furnachia" then
        AppendLineToWindow('batscmsgwindow', furmap_ansi)
        PositionDelta = 0
        PositionTotal = 480
      elseif NewContinent == "Rothikgen" then
        AppendLineToWindow('batscmsgwindow', rothmap_ansi)
        PositionDelta = 0
        PositionTotal = 480
      elseif NewContinent == "Lucentium" then
        AppendLineToWindow('batscmsgwindow', lucemap_ansi)
        PositionDelta = 0
        PositionTotal = 500
      elseif NewContinent == "Desolathya" then
        AppendLineToWindow('batscmsgwindow', desomap_ansi)
        PositionDelta = 0
        PositionTotal = 530
      end
  end
  if NewPosition ~= map["2"] then
      NewPosition = map["2"]
      WindowXCallS("batscmsgwindow","updatePosition",NewPosition..","..PositionDelta..","..PositionTotal)
  end
end
--[[function loadmap(val)
  if val == "lae" then
    processWorldMap("lae", laemap_ansi)
  elseif val == "fur" then
    processWorldMap("fur", furmap_ansi)
  elseif val == "roth" then
    processWorldMap("roth", rothmap_ansi)
  elseif val == "luce" then
    processWorldMap("luce", lucemap_ansi)
  elseif val == "deso" then
    processWorldMap("deso", desomap_ansi)
  else
    updateSelection("main")
  end
end]]

--[[currentChannel = "main"
buffers = {}
buffers[currentChannel] = batscmsgWindow:getBuffer()

function updateSelection(newChannel)
	if(newChannel == currentChannel) then
		return
	end
	currentChannel = newChannel
	buffer = buffers[currentChannel]
	batscmsgWindow:setBuffer(buffer)
	InvalidateWindowText(batscmsgWindowName)
end]]
--[[currentChannel = "main"
buffers = {}
buffers["main"] = batscmsgWindow:getBuffer()
buffers["lae"] = luajava.new(TextTree)
buffers["fur"] = luajava.new(TextTree)
buffers["roth"] = luajava.new(TextTree)
buffers["deso"] = luajava.new(TextTree)
buffers["luce"] = luajava.new(TextTree)

function updateSelection(newChannel)
	if(newChannel == currentChannel) then
		return
	end
	currentChannel = newChannel
	buffer = buffers[currentChannel]
	batscmsgWindow:setBuffer(buffer)
	InvalidateWindowText(batscmsgWindowName)
end

function processWorldMap(name,line)
	channel = name

	if(currentChannel == channel) then
		AppendLineToWindow(batscmsgWindowName,line)
	else
		channelBuffer = buffers[channel]
		channelBuffer:appendLine(line)
		buffers[channel] = channelBuffer
	end

	updateSelection(name)
end]]


--[[function processWorldMap(name,line)
	channel = name
	if(currentChannel == "main") then
		AppendLineToWindow(batscmsgWindowName,line)
	else
		mainBuffer = buffers["main"]
		mainBuffer:appendLine(line)
    end

	if(channel ~= nil) then
		if(currentChannel == channel) then
			AppendLineToWindow(batscmsgWindowName,line)
		else
			channelBuffer = buffers[channel]
			if(channelBuffer == nil) then
				channelBuffer = luajava.newInstance("com.offsetnull.bt.window.TextTree")
				--channelBuffer:appendLine(line)
				buffers[channel] = channelBuffer
				updateSelection(name)
			end
			channelBuffer:appendLine(line)
		end
	else
		newchannel = luajava.newInstance("com.offsetnull.bt.window.TextTree")
		newchannel:appendLine(line)
		buffers[channel] = newchannel
		updateSelection(name)
	end
	--updateSelection(name)
end]]

------------------------------------ equipment search plugin start ---------------------------------

local json
local dkjson_code = [[
-- Module options:
local always_try_using_lpeg = true
local register_global_module_table = false
local global_module_name = 'json'

--[==[

David Kolf's JSON module for Lua 5.1/5.2

Version 2.5


For the documentation see the corresponding readme.txt or visit
<http://dkolf.de/src/dkjson-lua.fsl/>.

You can contact the author by sending an e-mail to 'david' at the
domain 'dkolf.de'.


Copyright (C) 2010-2014 David Heiko Kolf

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]==]

-- global dependencies:
local pairs, type, tostring, tonumber, getmetatable, setmetatable, rawset =
      pairs, type, tostring, tonumber, getmetatable, setmetatable, rawset
local error, require, pcall, select = error, require, pcall, select
local floor, huge = math.floor, math.huge
local strrep, gsub, strsub, strbyte, strchar, strfind, strlen, strformat =
      string.rep, string.gsub, string.sub, string.byte, string.char,
      string.find, string.len, string.format
local strmatch = string.match
local concat = table.concat

local json = { version = "dkjson 2.5" }

if register_global_module_table then
  _G[global_module_name] = json
end

local _ENV = nil -- blocking globals in Lua 5.2

pcall (function()
  -- Enable access to blocked metatables.
  -- Don't worry, this module doesn't change anything in them.
  local debmeta = require "debug".getmetatable
  if debmeta then getmetatable = debmeta end
end)

json.null = setmetatable ({}, {
  __tojson = function () return "null" end
})

local function isarray (tbl)
  local max, n, arraylen = 0, 0, 0
  for k,v in pairs (tbl) do
    if k == 'n' and type(v) == 'number' then
      arraylen = v
      if v > max then
        max = v
      end
    else
      if type(k) ~= 'number' or k < 1 or floor(k) ~= k then
        return false
      end
      if k > max then
        max = k
      end
      n = n + 1
    end
  end
  if max > 10 and max > arraylen and max > n * 2 then
    return false -- don't create an array with too many holes
  end
  return true, max
end

local escapecodes = {
  ["\""] = "\\\"", ["\\"] = "\\\\", ["\b"] = "\\b", ["\f"] = "\\f",
  ["\n"] = "\\n",  ["\r"] = "\\r",  ["\t"] = "\\t"
}

local function escapeutf8 (uchar)
  local value = escapecodes[uchar]
  if value then
    return value
  end
  local a, b, c, d = strbyte (uchar, 1, 4)
  a, b, c, d = a or 0, b or 0, c or 0, d or 0
  if a <= 0x7f then
    value = a
  elseif 0xc0 <= a and a <= 0xdf and b >= 0x80 then
    value = (a - 0xc0) * 0x40 + b - 0x80
  elseif 0xe0 <= a and a <= 0xef and b >= 0x80 and c >= 0x80 then
    value = ((a - 0xe0) * 0x40 + b - 0x80) * 0x40 + c - 0x80
  elseif 0xf0 <= a and a <= 0xf7 and b >= 0x80 and c >= 0x80 and d >= 0x80 then
    value = (((a - 0xf0) * 0x40 + b - 0x80) * 0x40 + c - 0x80) * 0x40 + d - 0x80
  else
    return ""
  end
  if value <= 0xffff then
    return strformat ("\\u%.4x", value)
  elseif value <= 0x10ffff then
    -- encode as UTF-16 surrogate pair
    value = value - 0x10000
    local highsur, lowsur = 0xD800 + floor (value/0x400), 0xDC00 + (value % 0x400)
    return strformat ("\\u%.4x\\u%.4x", highsur, lowsur)
  else
    return ""
  end
end

local function fsub (str, pattern, repl)
  -- gsub always builds a new string in a buffer, even when no match
  -- exists. First using find should be more efficient when most strings
  -- don't contain the pattern.
  if strfind (str, pattern) then
    return gsub (str, pattern, repl)
  else
    return str
  end
end

local function quotestring (value)
  -- based on the regexp "escapable" in https://github.com/douglascrockford/JSON-js
  value = fsub (value, "[%z\1-\31\"\\\127]", escapeutf8)
  if strfind (value, "[\194\216\220\225\226\239]") then
    value = fsub (value, "\194[\128-\159\173]", escapeutf8)
    value = fsub (value, "\216[\128-\132]", escapeutf8)
    value = fsub (value, "\220\143", escapeutf8)
    value = fsub (value, "\225\158[\180\181]", escapeutf8)
    value = fsub (value, "\226\128[\140-\143\168-\175]", escapeutf8)
    value = fsub (value, "\226\129[\160-\175]", escapeutf8)
    value = fsub (value, "\239\187\191", escapeutf8)
    value = fsub (value, "\239\191[\176-\191]", escapeutf8)
  end
  return "\"" .. value .. "\""
end
json.quotestring = quotestring

local function replace(str, o, n)
  local i, j = strfind (str, o, 1, true)
  if i then
    return strsub(str, 1, i-1) .. n .. strsub(str, j+1, -1)
  else
    return str
  end
end

-- locale independent num2str and str2num functions
local decpoint, numfilter

local function updatedecpoint ()
  decpoint = strmatch(tostring(0.5), "([^05+])")
  -- build a filter that can be used to remove group separators
  numfilter = "[^0-9%-%+eE" .. gsub(decpoint, "[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "]+"
end

updatedecpoint()

local function num2str (num)
  return replace(fsub(tostring(num), numfilter, ""), decpoint, ".")
end

local function str2num (str)
  local num = tonumber(replace(str, ".", decpoint))
  if not num then
    updatedecpoint()
    num = tonumber(replace(str, ".", decpoint))
  end
  return num
end

local function addnewline2 (level, buffer, buflen)
  buffer[buflen+1] = "\n"
  buffer[buflen+2] = strrep ("  ", level)
  buflen = buflen + 2
  return buflen
end

function json.addnewline (state)
  if state.indent then
    state.bufferlen = addnewline2 (state.level or 0,
                           state.buffer, state.bufferlen or #(state.buffer))
  end
end

local encode2 -- forward declaration

local function addpair (key, value, prev, indent, level, buffer, buflen, tables, globalorder, state)
  local kt = type (key)
  if kt ~= 'string' and kt ~= 'number' then
    return nil, "type '" .. kt .. "' is not supported as a key by JSON."
  end
  if prev then
    buflen = buflen + 1
    buffer[buflen] = ","
  end
  if indent then
    buflen = addnewline2 (level, buffer, buflen)
  end
  buffer[buflen+1] = quotestring (key)
  buffer[buflen+2] = ":"
  return encode2 (value, indent, level, buffer, buflen + 2, tables, globalorder, state)
end

local function appendcustom(res, buffer, state)
  local buflen = state.bufferlen
  if type (res) == 'string' then
    buflen = buflen + 1
    buffer[buflen] = res
  end
  return buflen
end

local function exception(reason, value, state, buffer, buflen, defaultmessage)
  defaultmessage = defaultmessage or reason
  local handler = state.exception
  if not handler then
    return nil, defaultmessage
  else
    state.bufferlen = buflen
    local ret, msg = handler (reason, value, state, defaultmessage)
    if not ret then return nil, msg or defaultmessage end
    return appendcustom(ret, buffer, state)
  end
end

function json.encodeexception(reason, value, state, defaultmessage)
  return quotestring("<" .. defaultmessage .. ">")
end

encode2 = function (value, indent, level, buffer, buflen, tables, globalorder, state)
  local valtype = type (value)
  local valmeta = getmetatable (value)
  valmeta = type (valmeta) == 'table' and valmeta -- only tables
  local valtojson = valmeta and valmeta.__tojson
  if valtojson then
    if tables[value] then
      return exception('reference cycle', value, state, buffer, buflen)
    end
    tables[value] = true
    state.bufferlen = buflen
    local ret, msg = valtojson (value, state)
    if not ret then return exception('custom encoder failed', value, state, buffer, buflen, msg) end
    tables[value] = nil
    buflen = appendcustom(ret, buffer, state)
  elseif value == nil then
    buflen = buflen + 1
    buffer[buflen] = "null"
  elseif valtype == 'number' then
    local s
    if value ~= value or value >= huge or -value >= huge then
      -- This is the behaviour of the original JSON implementation.
      s = "null"
    else
      s = num2str (value)
    end
    buflen = buflen + 1
    buffer[buflen] = s
  elseif valtype == 'boolean' then
    buflen = buflen + 1
    buffer[buflen] = value and "true" or "false"
  elseif valtype == 'string' then
    buflen = buflen + 1
    buffer[buflen] = quotestring (value)
  elseif valtype == 'table' then
    if tables[value] then
      return exception('reference cycle', value, state, buffer, buflen)
    end
    tables[value] = true
    level = level + 1
    local isa, n = isarray (value)
    if n == 0 and valmeta and valmeta.__jsontype == 'object' then
      isa = false
    end
    local msg
    if isa then -- JSON array
      buflen = buflen + 1
      buffer[buflen] = "["
      for i = 1, n do
        buflen, msg = encode2 (value[i], indent, level, buffer, buflen, tables, globalorder, state)
        if not buflen then return nil, msg end
        if i < n then
          buflen = buflen + 1
          buffer[buflen] = ","
        end
      end
      buflen = buflen + 1
      buffer[buflen] = "]"
    else -- JSON object
      local prev = false
      buflen = buflen + 1
      buffer[buflen] = "{"
      local order = valmeta and valmeta.__jsonorder or globalorder
      if order then
        local used = {}
        n = #order
        for i = 1, n do
          local k = order[i]
          local v = value[k]
          if v then
            used[k] = true
            buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
            prev = true -- add a seperator before the next element
          end
        end
        for k,v in pairs (value) do
          if not used[k] then
            buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
            if not buflen then return nil, msg end
            prev = true -- add a seperator before the next element
          end
        end
      else -- unordered
        for k,v in pairs (value) do
          buflen, msg = addpair (k, v, prev, indent, level, buffer, buflen, tables, globalorder, state)
          if not buflen then return nil, msg end
          prev = true -- add a seperator before the next element
        end
      end
      if indent then
        buflen = addnewline2 (level - 1, buffer, buflen)
      end
      buflen = buflen + 1
      buffer[buflen] = "}"
    end
    tables[value] = nil
  else
    return exception ('unsupported type', value, state, buffer, buflen,
      "type '" .. valtype .. "' is not supported by JSON.")
  end
  return buflen
end

function json.encode (value, state)
  state = state or {}
  local oldbuffer = state.buffer
  local buffer = oldbuffer or {}
  state.buffer = buffer
  updatedecpoint()
  local ret, msg = encode2 (value, state.indent, state.level or 0,
                   buffer, state.bufferlen or 0, state.tables or {}, state.keyorder, state)
  if not ret then
    error (msg, 2)
  elseif oldbuffer == buffer then
    state.bufferlen = ret
    return true
  else
    state.bufferlen = nil
    state.buffer = nil
    return concat (buffer)
  end
end

local function loc (str, where)
  local line, pos, linepos = 1, 1, 0
  while true do
    pos = strfind (str, "\n", pos, true)
    if pos and pos < where then
      line = line + 1
      linepos = pos
      pos = pos + 1
    else
      break
    end
  end
  return "line " .. line .. ", column " .. (where - linepos)
end

local function unterminated (str, what, where)
  return nil, strlen (str) + 1, "unterminated " .. what .. " at " .. loc (str, where)
end

local function scanwhite (str, pos)
  while true do
    pos = strfind (str, "%S", pos)
    if not pos then return nil end
    local sub2 = strsub (str, pos, pos + 1)
    if sub2 == "\239\187" and strsub (str, pos + 2, pos + 2) == "\191" then
      -- UTF-8 Byte Order Mark
      pos = pos + 3
    elseif sub2 == "//" then
      pos = strfind (str, "[\n\r]", pos + 2)
      if not pos then return nil end
    elseif sub2 == "/*" then
      pos = strfind (str, "*/", pos + 2)
      if not pos then return nil end
      pos = pos + 2
    else
      return pos
    end
  end
end

local escapechars = {
  ["\""] = "\"", ["\\"] = "\\", ["/"] = "/", ["b"] = "\b", ["f"] = "\f",
  ["n"] = "\n", ["r"] = "\r", ["t"] = "\t"
}

local function unichar (value)
  if value < 0 then
    return nil
  elseif value <= 0x007f then
    return strchar (value)
  elseif value <= 0x07ff then
    return strchar (0xc0 + floor(value/0x40),
                    0x80 + (floor(value) % 0x40))
  elseif value <= 0xffff then
    return strchar (0xe0 + floor(value/0x1000),
                    0x80 + (floor(value/0x40) % 0x40),
                    0x80 + (floor(value) % 0x40))
  elseif value <= 0x10ffff then
    return strchar (0xf0 + floor(value/0x40000),
                    0x80 + (floor(value/0x1000) % 0x40),
                    0x80 + (floor(value/0x40) % 0x40),
                    0x80 + (floor(value) % 0x40))
  else
    return nil
  end
end

local function scanstring (str, pos)
  local lastpos = pos + 1
  local buffer, n = {}, 0
  while true do
    local nextpos = strfind (str, "[\"\\]", lastpos)
    if not nextpos then
      return unterminated (str, "string", pos)
    end
    if nextpos > lastpos then
      n = n + 1
      buffer[n] = strsub (str, lastpos, nextpos - 1)
    end
    if strsub (str, nextpos, nextpos) == "\"" then
      lastpos = nextpos + 1
      break
    else
      local escchar = strsub (str, nextpos + 1, nextpos + 1)
      local value
      if escchar == "u" then
        value = tonumber (strsub (str, nextpos + 2, nextpos + 5), 16)
        if value then
          local value2
          if 0xD800 <= value and value <= 0xDBff then
            -- we have the high surrogate of UTF-16. Check if there is a
            -- low surrogate escaped nearby to combine them.
            if strsub (str, nextpos + 6, nextpos + 7) == "\\u" then
              value2 = tonumber (strsub (str, nextpos + 8, nextpos + 11), 16)
              if value2 and 0xDC00 <= value2 and value2 <= 0xDFFF then
                value = (value - 0xD800)  * 0x400 + (value2 - 0xDC00) + 0x10000
              else
                value2 = nil -- in case it was out of range for a low surrogate
              end
            end
          end
          value = value and unichar (value)
          if value then
            if value2 then
              lastpos = nextpos + 12
            else
              lastpos = nextpos + 6
            end
          end
        end
      end
      if not value then
        value = escapechars[escchar] or escchar
        lastpos = nextpos + 2
      end
      n = n + 1
      buffer[n] = value
    end
  end
  if n == 1 then
    return buffer[1], lastpos
  elseif n > 1 then
    return concat (buffer), lastpos
  else
    return "", lastpos
  end
end

local scanvalue -- forward declaration

local function scantable (what, closechar, str, startpos, nullval, objectmeta, arraymeta)
  local len = strlen (str)
  local tbl, n = {}, 0
  local pos = startpos + 1
  if what == 'object' then
    setmetatable (tbl, objectmeta)
  else
    setmetatable (tbl, arraymeta)
  end
  while true do
    pos = scanwhite (str, pos)
    if not pos then return unterminated (str, what, startpos) end
    local char = strsub (str, pos, pos)
    if char == closechar then
      return tbl, pos + 1
    end
    local val1, err
    val1, pos, err = scanvalue (str, pos, nullval, objectmeta, arraymeta)
    if err then return nil, pos, err end
    pos = scanwhite (str, pos)
    if not pos then return unterminated (str, what, startpos) end
    char = strsub (str, pos, pos)
    if char == ":" then
      if val1 == nil then
        return nil, pos, "cannot use nil as table index (at " .. loc (str, pos) .. ")"
      end
      pos = scanwhite (str, pos + 1)
      if not pos then return unterminated (str, what, startpos) end
      local val2
      val2, pos, err = scanvalue (str, pos, nullval, objectmeta, arraymeta)
      if err then return nil, pos, err end
      tbl[val1] = val2
      pos = scanwhite (str, pos)
      if not pos then return unterminated (str, what, startpos) end
      char = strsub (str, pos, pos)
    else
      n = n + 1
      tbl[n] = val1
    end
    if char == "," then
      pos = pos + 1
    end
  end
end

scanvalue = function (str, pos, nullval, objectmeta, arraymeta)
  pos = pos or 1
  pos = scanwhite (str, pos)
  if not pos then
    return nil, strlen (str) + 1, "no valid JSON value (reached the end)"
  end
  local char = strsub (str, pos, pos)
  if char == "{" then
    return scantable ('object', "}", str, pos, nullval, objectmeta, arraymeta)
  elseif char == "[" then
    return scantable ('array', "]", str, pos, nullval, objectmeta, arraymeta)
  elseif char == "\"" then
    return scanstring (str, pos)
  else
    local pstart, pend = strfind (str, "^%-?[%d%.]+[eE]?[%+%-]?%d*", pos)
    if pstart then
      local number = str2num (strsub (str, pstart, pend))
      if number then
        return number, pend + 1
      end
    end
    pstart, pend = strfind (str, "^%a%w*", pos)
    if pstart then
      local name = strsub (str, pstart, pend)
      if name == "true" then
        return true, pend + 1
      elseif name == "false" then
        return false, pend + 1
      elseif name == "null" then
        return nullval, pend + 1
      end
    end
    return nil, pos, "no valid JSON value at " .. loc (str, pos)
  end
end

local function optionalmetatables(...)
  if select("#", ...) > 0 then
    return ...
  else
    return {__jsontype = 'object'}, {__jsontype = 'array'}
  end
end

function json.decode (str, pos, nullval, ...)
  local objectmeta, arraymeta = optionalmetatables(...)
  return scanvalue (str, pos, nullval, objectmeta, arraymeta)
end

function json.use_lpeg ()
  local g = require ("lpeg")

  if g.version() == "0.11" then
    error "due to a bug in LPeg 0.11, it cannot be used for JSON matching"
  end

  local pegmatch = g.match
  local P, S, R = g.P, g.S, g.R

  local function ErrorCall (str, pos, msg, state)
    if not state.msg then
      state.msg = msg .. " at " .. loc (str, pos)
      state.pos = pos
    end
    return false
  end

  local function Err (msg)
    return g.Cmt (g.Cc (msg) * g.Carg (2), ErrorCall)
  end

  local SingleLineComment = P"//" * (1 - S"\n\r")^0
  local MultiLineComment = P"/*" * (1 - P"*/")^0 * P"*/"
  local Space = (S" \n\r\t" + P"\239\187\191" + SingleLineComment + MultiLineComment)^0

  local PlainChar = 1 - S"\"\\\n\r"
  local EscapeSequence = (P"\\" * g.C (S"\"\\/bfnrt" + Err "unsupported escape sequence")) / escapechars
  local HexDigit = R("09", "af", "AF")
  local function UTF16Surrogate (match, pos, high, low)
    high, low = tonumber (high, 16), tonumber (low, 16)
    if 0xD800 <= high and high <= 0xDBff and 0xDC00 <= low and low <= 0xDFFF then
      return true, unichar ((high - 0xD800)  * 0x400 + (low - 0xDC00) + 0x10000)
    else
      return false
    end
  end
  local function UTF16BMP (hex)
    return unichar (tonumber (hex, 16))
  end
  local U16Sequence = (P"\\u" * g.C (HexDigit * HexDigit * HexDigit * HexDigit))
  local UnicodeEscape = g.Cmt (U16Sequence * U16Sequence, UTF16Surrogate) + U16Sequence/UTF16BMP
  local Char = UnicodeEscape + EscapeSequence + PlainChar
  local String = P"\"" * g.Cs (Char ^ 0) * (P"\"" + Err "unterminated string")
  local Integer = P"-"^(-1) * (P"0" + (R"19" * R"09"^0))
  local Fractal = P"." * R"09"^0
  local Exponent = (S"eE") * (S"+-")^(-1) * R"09"^1
  local Number = (Integer * Fractal^(-1) * Exponent^(-1))/str2num
  local Constant = P"true" * g.Cc (true) + P"false" * g.Cc (false) + P"null" * g.Carg (1)
  local SimpleValue = Number + String + Constant
  local ArrayContent, ObjectContent

  -- The functions parsearray and parseobject parse only a single value/pair
  -- at a time and store them directly to avoid hitting the LPeg limits.
  local function parsearray (str, pos, nullval, state)
    local obj, cont
    local npos
    local t, nt = {}, 0
    repeat
      obj, cont, npos = pegmatch (ArrayContent, str, pos, nullval, state)
      if not npos then break end
      pos = npos
      nt = nt + 1
      t[nt] = obj
    until cont == 'last'
    return pos, setmetatable (t, state.arraymeta)
  end

  local function parseobject (str, pos, nullval, state)
    local obj, key, cont
    local npos
    local t = {}
    repeat
      key, obj, cont, npos = pegmatch (ObjectContent, str, pos, nullval, state)
      if not npos then break end
      pos = npos
      t[key] = obj
    until cont == 'last'
    return pos, setmetatable (t, state.objectmeta)
  end

  local Array = P"[" * g.Cmt (g.Carg(1) * g.Carg(2), parsearray) * Space * (P"]" + Err "']' expected")
  local Object = P"{" * g.Cmt (g.Carg(1) * g.Carg(2), parseobject) * Space * (P"}" + Err "'}' expected")
  local Value = Space * (Array + Object + SimpleValue)
  local ExpectedValue = Value + Space * Err "value expected"
  ArrayContent = Value * Space * (P"," * g.Cc'cont' + g.Cc'last') * g.Cp()
  local Pair = g.Cg (Space * String * Space * (P":" + Err "colon expected") * ExpectedValue)
  ObjectContent = Pair * Space * (P"," * g.Cc'cont' + g.Cc'last') * g.Cp()
  local DecodeValue = ExpectedValue * g.Cp ()

  function json.decode (str, pos, nullval, ...)
    local state = {}
    state.objectmeta, state.arraymeta = optionalmetatables(...)
    local obj, retpos = pegmatch (DecodeValue, str, pos, nullval, state)
    if state.msg then
      return nil, state.pos, state.msg
    else
      return obj, retpos
    end
  end

  -- use this function only once:
  json.use_lpeg = function () return json end

  json.using_lpeg = true

  return json -- so you can get the module using json = require "dkjson".use_lpeg()
end

if always_try_using_lpeg then
  pcall (json.use_lpeg)
end

return json
]]

local dkjson_func, load_error = load(dkjson_code, "dkjson", "t", _G)
if not dkjson_func then
error("Error loading dkjson: " .. tostring(load_error))
else -- Execute the loaded chunk which returns the json table 
json = dkjson_func()
end

function downloadEquipSearchJson(searchTerm)
   local Equip = {}
   local EQexit = "no"
   local EQfile = io.open(GetPluginInstallDirectory().."/Batmud_EQLog.txt", "r")
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
    eqlog	= io.open(GetPluginInstallDirectory().."/Batmud_EQLog.txt", "a+")
    eqlog:write(",\r{\r"..streq.."}")
    eqlog:flush()
    eqlog:close()
    else
    Note(bred.."\nNo equipment was found\n"..lwhite)
    end
end

function downloadEquipSearchJson1(searchTerm)
  local runner = {}
  runner.run = function()
      local searchUrl = string.format("http://bat.miaobai.net/?auth=bat&eq=%s", searchTerm)

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

      if processEquipSearchResult then
          processEquipSearchResult(responseData)
      else
          print("No function found to process the equipment search result.")
      end
  end

  local runnerProxy = luajava.createProxy("java.lang.Runnable", runner)
  local runnerThread = luajava.newInstance("java.lang.Thread", runnerProxy)
  runnerThread:start()
end

function processEquipSearchResult(jsonData)
  local data = json.decode(jsonData)
  if data then
       printTable(data)
  else
      Note("There was an error parsing the JSON data.")
  end
end

function printTable(t, indent)
    indent = indent or ''
    for key, value in pairs(t) do
        if type(value) == 'table' then
            Note(indent .. tostring(key) .. ':')
            printTable(value, indent .. '  ')
        else
            Note(indent .. tostring(key) .. ': ' .. tostring(value).."\n")
        end
    end
end
-----------------------equipment search plugin end---------------------
function processmap2(name, line, replaceMap)
    --local MapCaptured1 = replaceMap["1"]
    local MapCaptured2 = replaceMap["2"]
    --Note(lwhite2..MapCaptured1..lwhite.."\n")
    --Note(lwhite2..MapCaptured2..lwhite.."\n")
    --AppendLineToWindow('maps', line)
    AppendLineToWindow('batscmsgwindow', lwhite2..MapCaptured2..lwhite.."\n")
end

------------------------------------ log plugin start ---------------------------------
local LogFileName = GetPluginInstallDirectory().."/Batmud_Log.txt"
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
		EnableTriggerGroup("chatcapture",true)
		logStart()
		Note("Turning Logging On.\n")
		chatCaptureState = "2"
	else
		EnableTriggerGroup("chatcapture",false)
		logEnd()
		Note("Turning Logging Off.\n")
		chatCaptureState = "1"
	end
end

--chatCapture("2")
--function OnBackgroundStartup()
--	chatCapture("2")
--end


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
function targetnpc(name,raw, map)
   --local str = raw:TextTree:setLineBreakAt(15)
   --getData()
   --Note(str:toString())
   WindowXCallS("batscmsgwindow","stoptargetgag")
   monstername = map["1"]
   local line = map["1"]:gsub(".*�","")
   if not line:find("Niubi") then
   local NPC = {}
   local npcexit = "no"
   local npcfile = io.open(GetPluginInstallDirectory().."/Batmud_npcLog.txt", "r")
   local content = npcfile:read('*all')
   npcfile:close()
   EnableTrigger("targetgag", false)
   for npcContent in content:gmatch("{(.-)}") do
     table.insert(NPC, npcContent)
   end
   for i= 1, #NPC do
       if NPC[i]:find(line, 1, true) then
         Note(lwhite2..NPC[i]..lwhite)
         npcexit = "yes"
         local race = NPC[i]:match("Race:(.-) ")
         if race ~= "-" then
           SendToServer("target " ..race)
           --Note(race)
           WindowXCallS("batscmsgwindow","setenmportrait",race)
         else
           targetall(line)
         end
         break
       end
   end
   if npcexit == "no" then
     downloadMonsterInfo(line)
   end
   end
end

function targetall(line)
  local excludeList = {"a", "the", "at", "on", "you", "in", "by", "big", "small", "is", "his", "to", "beautiful", "and", "black", "dark", "here", "her", "with", "yellow", "looks", "blue", "an", "little"}
  local excludeList2 = {"Niubi"}
  
  if line and not line:find("Niubi") then
    local line1 = line:lower()
    local target = {}
    local i = 1
    for word in line1:gmatch("%w+") do
      if not tableContains(excludeList, word) then
        target[i] = word
        i = i + 1
      end
    end
    for j = 1, i-1 do
      SendToServer("gagoutput target " .. target[j])
    end
    SendToServer("target")
    WindowXCallS("batscmsgwindow","setenmportrait","unknow race")
  end
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
    local resultStartIndex = string.find(Data, "Search Results")
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
    npclog	= io.open(GetPluginInstallDirectory().."/Batmud_npcLog.txt", "a+")
    npclog:write(",\r{\r"..result2.."}")
    npclog:flush()
    npclog:close()
    else
    Note("\n"..lwhite2.."Monster was not found.\n"..lwhite)
    targetall(monstername)
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
--------------------- switching and UI design plugin start ----------------------
function OnOptionChanged(key,value)
	local func = optionsTable[key]
	if(func ~= nil) then
		func(value)
	end
end

local exitdir = nil
function exitprocess(name,line,str_e)
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
    if exit then
        if exitdir == "left" then
            SendToServer(exit[1])
        elseif exitdir == "right" then
            SendToServer(exit[#exit])
        end
    end
    EnableTrigger("exitblook",false)
end
 
function exitsearch(val)
    if val == "on left" then
        EnableTrigger("exitblook",true)
        exitdir = "left"
    elseif val == "on right" then
        EnableTrigger("exitblook",true)
        exitdir = "right"
    else
        EnableTrigger("exitblook",false)
    end
end

judgenumber = 1
function switchingfunc(g)
if g == "reset" then
    judgenumber = 1
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
        --WindowXCallS("batscmsgwindow","IfViewPortrait","true")
        SendToServer("/WindowXCallS(\"batscmsgwindow\",\"setDisplayViewHeight\",\"true\")")
        --SendToServer("/WindowXCallS(\"batscmsgwindow\",\"acceptsizetransmit\",\"540,210,840\")")
        --WindowXCallS("combat","IfViewPortrait","true")
        SendToServer("/WindowXCallS(\"combat\",\"setCombatViewPosition\",\"true\")")
        --WindowXCallS("chats","IfViewPortrait","true")
        SendToServer("/WindowXCallS(\"chats\",\"setChatViewPosition\",\"true\")")
    else
        EnableTrigger("gagmaps",false)
        --WindowXCallS("batscmsgwindow","IfViewPortrait","false")
        SendToServer("/WindowXCallS(\"batscmsgwindow\",\"setDisplayViewHeight\",\"false\")")
        --SendToServer("/WindowXCallS(\"batscmsgwindow\",\"acceptsizetransmit\",\"540,210,840\")")
        --WindowXCallS("combat","IfViewPortrait","false")
        SendToServer("/WindowXCallS(\"combat\",\"setCombatViewPosition\",\"false\")")
        --WindowXCallS("chats","IfViewPortrait","false")
        SendToServer("/WindowXCallS(\"chats\",\"setChatViewPosition\",\"false\")")
    end
    --SendToServer("/WindowXCallS(\"batscmsgwindow\",\"inputviewchange\",\"0\")")
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
    SendToServer(".closewindow")
    else
    firstload = false
    end
end

optionsTable = {}
optionsTable.showhp = set_showhp
optionsTable.portrait = set_portrait


--[[if option_portrait then
singleWidth = displayWidth / 2    540
iconwidth = 120
iconheight = iconwidth
hpheight = 40
textsize = 4*density
iconsize = displayWidth / 8
iconsize2 = iconsize/3*2 - 4
barheight = iconsize2 + 3*hpheight + 4   210
barwidth = displayWidth-2*iconwidth      840
else
singleWidth = (displayHeight - 740) / 2    755
iconwidth = 120
iconheight = iconwidth
hpheight = 40
textsize = 4*density
iconsize = displayWidth / 8
iconsize2 = iconsize/3*2 - 4
barheight = 3*hpheight + 4      124
barwidth = (displayHeight - 740)-2*iconwidth   1270
end]]

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
strp= {}
a = __split(scmesg, ",")
for k,v in pairs(a) do
	table.insert(strp,v)	
end
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
        elseif line2 == "You are no longer stunned." then
            WindowXCallS("batscmsgwindow","setmainportrait","reset")
        elseif string.sub(line2, 1, 3) == "You" then
          if line2 == "You are prepared to do the skill." then
            scanshow("Prepared")
            if RIPcountmax ~= 0 then AppendLineToWindow('combat', line) end
          elseif line2 == "You are done with the chant." then
            scanshow("Chanted")
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
            scanshow("Prepared")
          elseif line2 == "You try to act but just blank out, losing focus." then
            AppendLineToWindow('combat', line)
            scanshow("Lose Control")
            SendToServer("wimpy now")
          elseif line2:match("You heal .* of your own wounds.") then
            AppendLineToWindow('combat',lwhite2..line2..lwhite.."\n")
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
    
  locations = {
    laenor = {
      { name = "city arelium", x = 365, y = 474 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "batcity church", x = 363, y = 472 ,information = lwhite.."---------------The Church (BatCity)(Newbie, newbie parties)----------------------\n  level 0---Damogran  | Graveyard            chest\n               |      |  Mordain --o--o--o--o--o--hut-grounds keeper\n               |      |               |  |  |  |  |\n   graveyard --|      |            Tomb--o--o--o--o  Mortis Damogran\n               |      |               |  |  |  |  |     |     |\n         o     |      |               o--o--o--o--o--o--o-----o\n         |     |      |                                 |\n   altar o--fountain  |                    cryogenic freeze\n         |            |---------------------------------------------------------\n         o            |           up | o  o--o | o  o  o     | o  o  o\n         |            | o--o--o--o   | |  |up  | |  |  |     | |  |  |\n      o--o--o         | |     |  |   | o--o--o | o--o--o     | o--o--o\n down    |            | o--o  o--o   |    |  | | |  |  |     | |  |  |\n   o--o--o--o--o      |    |     |   | o--o  o | o  o  o     | o  o  o\n      |  |  |         |    o--o--o   |         |    |        |    |   \n      o  o  o         |  down    |   |         |    o        |    o   \n  bakery | lounge     |          o   |         |     up/down |      down\n         o            | level-1      |level-2  |level 1/2    | level 3\n          up          | Church Tower |  Tower  |  Tower      |  Tower  \n--------------------------------------------------------------------------------\nlevel 1         e= entrance from up                  |   o   ooo o o\n                d= down                              |    \\ / | \\|/\no--o--o--e      p= push button, opens trapdoor, down |  o--o-moo-o \n|     |  |     --------------------------------------- o+  |  |  | \no--o  o--o     | m=minotaur, get corpse for sacrifice.  o--o--o--o--o--d\n   |     |     | d= down to altar of sacrifice             |  |  |\n   d--o--p     | += north, but not to same north.        o-o-o-ooo--o\n         |                                                \\ / |\n         o               Church Basement                   o  u \n--------------------------------------------------------------------------------\n*At altar of sacrifice,there are 3 archways each leading to a maze with a lever\nthat needs pulling. One lever is in each of the directions from the altar.\n*The maze from the alter of sacrifice changes every few minutes.  \n*You must go through all mazes and `pull lever` when you reach the\narchway... then go `archway` and continue to the next maze.\n---N,E,W,E,N is first---W,N,N,W,E,S,S is second---E,W,N,S,E,W,S,N,W is third.\n*When navigating the maze 3 exits will go back one position and one will go\nforward, drop coins so you can tell if you have gone forward or backwards.\n*You will return to the altar after completing each maze, it will have\nrevealed an exit down if you pull all three levers.\ndown is Captain Annihilation, aprox. 3.5k monsie and two goblins.\n*If you kill the minotaur in the cell room, get the corpse and take it to the\naltar. `sacrifice corpse` and you (and party) will be transported to the\nCaptain`s ship.  There you will find Roscoe, the captain`s 1st mate (bone\nlongsword and bone breastplate, also carries hand rolled joints) and the\nBride of annihilation (carries crystal daggers) both are aprox. \n3.5-4k monsies.  to get out of the area go south of Roscoe and `walk plank`\nthen `jump`  There is also a 10k seamonster in the first room you arrive in. \nIt may aggro, but doesn`t always right at first.\n\n level 1.                       | level 2  \n            s= Seamonster,      | b--r   b= Bride of Annihilation\n   s           go up from here. |    |   r= Roscoe\n                                |    w   w= walk plank, jump to exit\n                                |    |   d= down to Seamonster\n                                | d--o\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "city pleasantville", x = 339, y = 494 ,information = lwhite.."----------------------------Pleasantville--Newbie--------------------------------\n        #######      |  * In the bakers go down to kill two rats.\n        #.....#      |    Then `move barrels` to reveal secret exit.\n        E.#F#.#      |  \n        #.#*#.#      |  \n    #####.#G#.#H###  |  1 Entrance/exit\n    #.............#  |  A Portal and Items+info on Damogran\n    #.###.ppp.###.#  |  B Race shrine portal\n    1.A #.ppp.# I.J  |  C Tutorial    D Quest room     E Bank\n    #.###.ppp.###.#  |  F Reastaurateur and Bakers Food store  *\n    #.............#  |  G Storage Rent Rooms\n    #####.###.#####  |  H Shopkeeper\n        #.# #.#      |  I Armour       J Weapons\n        B.#C#.D      |-----------------------------------------------------------\n        #.....#      |     1st floor                   |  3rd floor |~ = water\n      #####.#####    |        `O=O   push boulder      |      U     |S = aggro\n    ##ggg#.#ggg##    |         |         |  2nd floor  |     / \\    |   spider\n    ##gIggggggggg##  |         O-O-O     |  U-O D   O  |  O-O O-O-O |C = aggro\n    #gggggggIggIgg#  |           |       |    | |   |  |     \\    | |  creeper\n    #ggggggggggggg#  |     D-O-#-O       |  O-F-O   O-C|      O-S O |\n    #gIggIgggggggg#  |       |    \\      |  |   |  /   |      |     |\n    ##ggggggIggg##   |       O     O     |  ~   O-O    |    S-O     |\n    ##Iggggggg##     |*`enter well` in center of Pleasantville to get to #.\n      ##########     |*F = healing flame; touch flame for 500+ hp damage.\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "city vendace shore", x = 273, y = 406 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "100 acre forest", x = 341, y = 489 ,information = lwhite.."------------------\n  D\n  :\n  O   O-O\n  :   |\n  U   O-O\n  |   |\nO-O   O\n  |   |\nO-O-O O\n  |   |\n  O-O-O-O-O\n    |\n    O\n    |\n entrance\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned valley", x = 462, y = 292 ,information = lwhite.."---------------------------\nMennfel [newbie]: OMG i shouldn`t have said Ramja aijasona!\nMennfel [newbie]: I found a note in an abandoned valley and it said some gibberish and ramja aijasona then someone whispered `say my name` And this witch came down from the sky and killed me with 1 hit :D\nBmoa the Helper (newbie): You learn. Next time you don`t say it.\nMennfel [newbie]: Ramja Aijasona, the defiled witch mistress of Domgroth\n  outerworld o\n          \\ /|\\\n           o-o-o-o\n           |x|/\n           o-o\n           |x|\\   /tower\n         o-o-o-o-o\n         |/   \\|x|\n         o     o-o\n  Tower: start in middle\n          o-o-o\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "apple orchard", x = 354, y = 497 ,information = lwhite.."-------------------Bob`s Apple Orchard(Newbie)-----------------\n                    outerworld\n		        |\n			O\n			|\n			O-O-O-O-O\n			| | | | |\n			O-O-O-O-O\n			| | | | |\n			O-O-O-O-O\n			| | | | |\n                        O-O-O-O-O   kitchen   living room\n			| | | | |   |         |\n			O-O-O-O-O   Bob`s house\n			         \\  |\n				  O-O-pig pen\n				    |\n				    chicken coop\n--------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "arska's hut", x = 422, y = 524 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "arthur", x = 311, y = 404 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "arthur", mobkind = "nil" },
      { name = "asylum", x = 348, y = 474 ,information = lwhite.."----------------------Asylum(Midbie)----------------------------------------\n Main floor: |  Cellar: |Gerttuli exclaims`I hope that duergar...\n     D/U     | stairs   |ask gerttuli about duergar,wizard,farmer\n      |      |    :     |Konrad exclaims...   ask konrad about belt,kimuzu,\n    ?=O=?    |    ?     |secret,nightvision,geezer,duergar,magician\n      |      |-----------\n    O=O-O    | Upstairs:|\n      |      | stairs   |\n      O      |    |     |\n      |      |    O     |\n  entrance   |          |\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "beastlands", x = 524, y = 606 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bigeaul", x = 528, y = 429 ,information = lwhite.."--------------------Bigeaul Castle(Partied lowbie to mid)-------------------------\n             entrance       | Castle Map:   | Second Level:\n                 |          | O   O     O   |           michelle\n                 O          | |   |     |   |               |\n                / \\         | O-O-U-O---O   |       yvonne--O--janine\n      see      /   \\        | | | |     |   |               |\n   Beldarus   /     \\       | O O O-O-U O   |baronette-O-O-U/D-O---O\n      map    O       O      |   |           |               |      |\n       |    /        |      | south entrance|             O-O-O    O\n   ?=O-O-O-O     O-O-O-O-O  |               |               |     /\n     |           |   :   |  |               |               O\n  stables        O       O  |-------------------------------------------------\n                 |  see  |  | Cellar:           |Attic:\n                 O castleO  |            O      |         *O----d----O\n * kill man,     |  map  |  |            |      |jean-claude          yves\n wield crowbar,  O       O  | entrance---O-O-O  |*search nests,find pigeon(item)\n force door      |   |   |  |--------------------------------------------------\n                 O-O-O-O-O  |b = blocking    f = firebolts   g = golden arrows\n                     *      |x = casts several nasty spells\n---------------------------------------------------------------------------------\nBeldarus:                          O-O-O\n                                   | | |\n                               O O-O-O-O-O\n                               | |       |\n                             u-O-O       O\n                             | | |       |\n                             O d O       O\n                                 |   :   |\nNotes:                       d-O-O-O-O-O-O       \nlook at vase                   |     |\n                               O entrance\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "bigeaul", mobkind = "nil" },
      { name = "blackteeth mountains", x = 580, y = 185 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bunny valley", x = 559, y = 412 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "butterfly farm", x = 439, y = 278 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "chessboard", x = 517, y = 593 ,information = lwhite.."----Chessboard-Newbie to mid--western part of the area is low-lvl restricted----\n                         o-o-o-o-o-o-o-o \n                         | | | | | | | |\n                         o-o-o-o-o-o-o-o\n                         | | | | | | | |\n                         o-o-o-o-o-o-o-o\n                         | | | | | | | |\n               O-U       o-o-o-o-o-o-o-o\n                 |       | | | | | | | |\n             O   O       o-o-o-o-o-o-o-o\n             |   |       | | | | | | | |\n         O-O-O-O-O-D.....D-o-o-o-o-o-o-o\n                 |       | | | | | | | |\n                 O       o-o-o-o-o-o-o-o\n                 |       | | | | | | | |\n                 O       o-o-o-o-o-o-o-o\n                 |\n             outerworld\n-----------------Many of the bigger monsies poison------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "circus", x = 312, y = 460 ,information = lwhite.."----------------Circus(Newbie)-----Notes:Ask Ernesto about task.---------------\n                               E\n                               |\n                               O   O   O   O\n                               |   |   |   |\n                         O-O-O-O-O-O-O-O-O-O-O\n                           |     |     |   |\n                           O     O     O   O\n                           |    /|\\    |\n                       O-O-O-O-O-O-O   O\n                           |    \\|/    |\n                           O     O     O-O-O\n                           |           |\n                           O           O\n                                      /|\n                                   O-O-O\n                                  /|\\|\\|\\\n                                 O-O-O-O-O\n                                  \\|/|/|/\n                                   O-O-O\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "conifer forest", x = 228, y = 476 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "crack", x = 474, y = 574 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "crescent tower", x = 456, y = 616 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dark castle", x = 340, y = 578 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "darkcastle", mobkind = "nil" },
      { name = "digga's domain", x = 289, y = 474 ,information = lwhite.."-----------------------------Digga`S(Newbie to high)-----------------------------\n                             Forest Path       City of Raven     Raven`s walls\n       City of Raven             |               o woods            o\n	     |                   |               |/                /\n     o-o-o   o         CAVE-o    |               o woods          o       o\n     | | |    \\       /      \\   |               | |             /         \\\n   o-o o o-o   o     o    o-o o  |             o-o-o            o           o\n   | |/ \\| |\\  |    /    /  | |  |             | | |             \\         /\n o-o-o   o-o-o-o   o    o   o o  |      cleric-o o o-slimos       o       o\n   | |\\ /| |/  |  /      \\   /   |             | | |               \\     /\n   o-o o o-o   o-o        o-o    |         inn-o-o-o-jail           d   d\n     | | |    /   Mountain Trail |             | | |             \n     o-o-o o-o      Cave:        |  guardhouse-o o o-taskmaster\n   Digga`s    \\            /     |             | | |\n   Newbie      o          O      |             o-o-o\n   Area         \\         |      |               |\n	         o        O      |           u-gates-u\n	        /     entrance   |*In Raven jail, kill jailkeeper to get key. \n	       o                /Unlock cell,open cell, enter cell.This frees\n	       |               /Groo,give you the Barbarian Ring of Friendship\n	       o              /*At Slimos,after killing everyone in the room,\n	       |             /type `enter bar`.Go north a few rooms and\n	   outerworld       /`break wall`to release several aggressive undeads.\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dortlewall", x = 580, y = 379 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "drawbridge", x = 490, y = 469 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "drawbridge", mobkind = "nil" },
      { name = "dunedain's mansion", x = 538, y = 167 ,information = lwhite.."-----------------------------Dunedain-------------------------------------------\nAlphabet Maze:\n     Z>T1-X X---I   |Kobold Maze:\n     |\\v \\ \\|   |   |              shaman  *:: mean a pair of rooms connected up\n     E G  H K < U   |                |        and down.\n     v |  |         |            -2::O   kobolds  * When you come out of the \n     X K  I-S-W     |             |  | | |       alphabet maze,you arrive at 1. \n     v ^     /      |   skeletons-3--O-1-O      *There is no way from the kobold\n     J>V  Y-A  P    |                    |           down into the alphabet maze.\n          |    |    |                    O::O-courtyard\n    T3-U1-O-U2>V    |  * If you go n from 1 or w from 2, you arrive at 3.\n                    ------------------------------------------------------------\n* ^,v,> and < indicate one-way exits.\n* You start at T1, and there is no exit back up from T1.\n* From T3 `up` takes you into the kobold maze, and `down` takes you to\n`the dreadful Minotaur`.\n* if you use peer, and follow the words `THISWAYOUT`, you can navigate the maze\n  without a map (though you may have to backtrack at U).\n* There are 4 `a giant scorpion` at T2.   * There are 6 `a giant rat` at P.\n* The exits marked on this map are sufficient to navigate around the\nmaze, but there are additional exits, as well. The only one people\nmight need to use is from P to U2.\n1. P goes sw to U2.                2. V goes w to the westernmost X.\n3. K1 goes ne to E.                4. G goes ne to T1.\n5. T1 goes w to E.                 6. X goes s to K, e to I.\n7. T2 goes w to T1, se to K.       8. K goes w to U.\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dungeon", x = 363, y = 485 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "enc drow", x = 327, y = 470 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "enc valar", x = 344, y = 481 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "elven village", x = 727, y = 135 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "elfvillage", mobkind = "nil" },
      { name = "ferry/laenor/daerwon", x = 301, y = 361 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "faerie forest", x = 343, y = 88 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "faerie island", x = 270, y = 322 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "farmhouse", x = 387, y = 528 ,information = lwhite.."---------------------Farmhouse(Newbie to lowbie)--------------------\n           O-O-O\n	   | | |     <--- barnyard\n           O-O-O\n 	     : \n             O\n             |       <--- house\n             O-O\n             :\n             O\n            /\n           O         <--- path\n	   |\n        entrance\n-------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "farmhouse", mobkind = "nil" },
      { name = "forest of legolas", x = 532, y = 263 ,information = lwhite.."----------------Legolas-----------------------\n                      E\n                      |\n                      O\n                      |\n                    O-O-O\n                      |\n                    O-O\n                      |\n                      O <--jump river\n\n                      |\n                      |\n                      V\n\n                      O-O   O-O-O--O--O\n                      | |   |\\|/|     |\n                      O-O-O-O-O-O-O O O\n                            |/|\\| | | |\n                            O-O-O O-O O\n---------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "forest of moonrind", x = 571, y = 484 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "foul's creche", x = 621, y = 103 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "fulgurite shop", x = 633, y = 355 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "gallery cave", x = 321, y = 483 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "gates of serinna", x = 525, y = 627 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "gauntlet event", x = 350, y = 242 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "gnome airship", x = 406, y = 596 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "goddess garden", x = 690, y = 408 ,information = lwhite.."----------------------------Goddess Garden---------------------------\n                            O-O --> Locked\n                            | |\n                            O-O\n	                    |\n                            E\n----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "granny's house", x = 317, y = 466 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guard's gap", x = 605, y = 101 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hugoville", x = 594, y = 467 ,information = lwhite.."---------------------------------------------------------------------------------\n       o  @ = search bottom to find rusty breastplate| Von Huber Mansion\n      / \\  & = move hay to find boots                |       O-O-O\n     o   o-o   * = move boxes to find secret door    |  nw     |\n     |   |         to basement                       | lawn    O-O-O\n o-o-o-@ o     *   o   o   o   to von Huber Mansion  |   |     |  \n   |      \\    |   |   |   |   |                     |   O   O-U-O-O\n   &       o---o---o---o---o---o                     |   |     |   |\n           |   |   |   |   |    \\                    |   O-O-O-O-O-O\n         o-o   o   o---o vault   o                   |   |     |\n	           |  	          \\                  |   O     O  (use knocker)\n               o---o---o           outerworld  |------Annie says:  If I had\n                   |       ---------------------someone to love I could tell them\n	       o---o---o   |all sorts of secrets.     Otto says:  There is one\n		   |       |thing in the world I long for more than anything else,\n		   o       |and I would tell you, but you are not noble enough to\nknow.  But, if you should find it and give it to me you will be richly rewarded.\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "hugoville", mobkind = "nil" },
      { name = "hunt master", x = 434, y = 522 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hut", x = 345, y = 470 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "iron mine", x = 613, y = 410 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ivory tower", x = 508, y = 347 ,information = lwhite.."--------------------------Ivory Tower---Newbie to mid---------------------\n       Puff\n        |                       *Avenging angel = dispels evill;levin bolt\n      D/U--o--D                 *Cloud giant    = poisons\n    { |       |                 *Puff           = banishes\nonly{ |       U/D               *Wind Walker    = poisons\ndown{ |       |  \\              *Puff banishes, and most of the area is \n    {  \\   o--U   \\              no-summon.Be sure to HW the party first.\n    {   \\ /   |  jump(out from the tower)\n      D->o    |\n      .   \\   |\n      .    o--o\n      .\n      |\n    o-U\n    |\nentrance    \n---------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ix'ixixiblat", x = 363, y = 133 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kender mansion", x = 542, y = 509 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kevin's watch", x = 614, y = 100 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kilrathi", x = 419, y = 539 ,information = lwhite.."--------------Kilrathi Compound-----------\n                       O:?\n		       |\n		     O-O-O\n		     | | |\n		     O | O\n		       |\n		     O-O O-O\n		       | |\n		 O-O   O O-O\n		   |   | |\n		 O-O-O O O\n		      \\|/\n		       O\n		       |\n                    Entrance\n------------------------------------------\n"..lwhite2.."\n", bottonset = "kilrathi", mobkind = "nil" },
      { name = "land of anarchy", x = 517, y = 526 ,information = lwhite.."------------Land of Anarchy-----------------------------\n                   O                           |\n                   |                           |   O\n             E-O-D-O-O-O                       |   |\n                 | | |                         | O-U-O\n                 | O O                         |   |\n                 |   |                         | O-O-O\n                 |   O <--jump to enter maze   |   |\n                 |                             |  Sid\n                 |                             |\n                 V                             |\n--------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lonely inn", x = 519, y = 553 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mesme", x = 298, y = 122 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "misty forest", x = 467, y = 572 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mithil stonedown", x = 613, y = 102 ,information = lwhite.."------Pixies( lowbie)------\n              o o     o\n	 d    | |     |\n	 |\\---u-o-U-o-o\n	 o    |\n	      o\n----------------------------\n"..lwhite.."\n", bottonset = "mithil", mobkind = "nil" },
      { name = "mountain dwarves", x = 310, y = 556 ,information = lwhite.."--------------------------Mountain Dwarves---------------------------\nupper level                    O           |Lower Level:\nMidbie                         |           |      O-O\n                     O   O   O O           |      |\n                     |   |   | |           |      U-O-D\n                     O---O---O-O           |      |\n                     |         |           |    O-O-D\n                     |   O     |           |    |\n                     |   |     |           |    O-O\n                     | O-O-O O |   O-O     |    |\n                     |   |   | |   | |     |    O\n                     E---O---O-O-O-O-O-O   |\n                     |         |   | |     |\n                     |   O     |   O-O     |\n                     |   |     |           |\n                     O---O---O-D --> (X2)  |\n                     |   |   | |           |\n                     O   O   O O           |\n---------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mountaineer cottage", x = 594, y = 367 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "newberry park", x = 368, y = 491 ,information = lwhite.."---------------Newberry Park---------------------Newbie------------------\n       outside\n          |\n          o\n          |\n    o--o--o--o--o\n    |  |  |  |  |\n    o--o--o--o--o\n    |  |  |  |  |\n    o--o--o--o--o\n    |  |  |  |  |\n   +o--o--o--o--o    * = `enter oak` to goblin caves\n    |  |  |  |\n   +o--*--o--o--o    + = exa bushes, exa shrubbery, exa flowers, exa rock\n-------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "newbie forest", x = 238, y = 470 ,information = lwhite.."-----------------Newbie Forest-----------Newbie, newbie parties----------------\ntroll o=o-o-o-o-o   o-o\n         \\   \\  |   |\n          o-o-o-**  o-o      ** = entrance\n         / / /  |   |        *Move rock to get to the troll cave\n        o-o-o   o   o-o      *Search pile in kitchen to get the freezer key\n                 \\  |        *In the north-eastern corner of the garden, \n                  o-o         there is a cube.Touching it transports you inside\n                  | |         the cube, where there is a`Cubic man`(`Cubic man\n                  o-o         sitting on his legs is here`).\n                 /   \\\n                o     o\n                |     |\n                o--o--o   o freezer\n                |  |  |  /\n                o--o--o-o kitchen\n                |  |  |\n    o   o       o--o--o\n     \\ /        |\n king o up o up o\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "newbie mines", x = 306, y = 486 ,information = lwhite.."---Newbie Mines---Newbie, Newbie Parties---level-limit at 30--- lq16 and lq17----\n                                    o--o       *tie rope to pole\n                                    |          *you can buy rope from tinker`s \n sd = 2 skeleton dwarfs             o           shop in batcity\n p = black pudding                  |          *black puddings go all aggro if\n b = beholder (they move)           o down/out  you use offensive skills or\n                                                spells in the same room\n                                    o down/up  *from the mouth of the mines go\n                                                down and north.  Type `enter \n    o--o--o                         o down/up   painting` and go east, and \n    |     |      p                              there`s some bloke to kill..you \n    o     o--o  o          o        o down/up   can go down from there and kick \n             |  |          |                    the sink to get more black \n             o--o--o--o=o--o        o down/up   puddings\n                |     p p  |                   *inside the painting,a mouse drops\n     o up       o          o        o up        a key which fits the locked door\n                 2p        |        | \n     o down                o     o--o     o--o\n    b|                     |  down  |     |\nsd o-o-o sd                o up     o     o\n     up                    |              |\n               o 4p        o--o--o--o--o--o--o--o 3p\n       down    |           |                    |\n          o=o--o           o                    o sd\n               |           |                    |\n            o--o           o                    o\n            |              |                    |\n            o--o--o--o--o--o                 o--o--o\n                  |                          |vault|\n                  o                        b o o   o b\n                  |                          |/    |\n                  o       o b                o--o--o\n                  |       |                     b\n                  o--o=o--o\n                     sd   |\n                          o b\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "newbie mountain", x = 281, y = 479 ,information = lwhite.."------------------------- Newbie Mountain ------- Newbie----------------------\n       Key:                   bbbb        \n       b Base of Mt         bbbbbbbb      \n       L Lower slopes      bbbbbbbbbbbb   \n       m midway up      bbbbbbLLLLbbbbbb  \n       N Near top   E bbbbbbLLLLLLLLbbbbb    *Be sure not to miss the rock\n       p Plateau     bbbbbbLLLmmmmLLLbbb      digger area on the sw side of \n       T Temple     bbbbbLLLmmNNNNmmLLbbb     the mid-way up the mountain lvl.\n       E Entrance  bbbLLLLLmNNppppNmLLbbb \n       s mountain  bbbLLLmmNpppTpNmLLbbb  \n          stream    bbbLLmNNppppNmLLbbbb  \n                     bbbLsssNNNNmLLbbbb   \n                     bbsssLLmmmmLLbbbbb   \n                     bbsbbLLLLLLLLbbb     \n                       sbbbbLLLLbbbb      \n                        bbbbbbbbbbbb      \n                          bbbbbbbbb       \n                            bbbb      \n   CAVE:            |   2nd Lvl of Cave:   |    3rd Lvl of Cave: \n          o         |        o         o   |            o\n          |         |        |         |   |            |\n      o   o-o-o-o-o |        o     o-o-o   |      o     o     o\n      |       |     |        |     |       |       \\   / \\   /\n      o       o     |        o-o-o-o       |        o-o   o-o\n       \\      |     |       /      |       |              |\n        o-d   o-o   |      o       d-o-o-o |              o     o\n       /   \\ /      |       \\     /      | |              |    /\n      o     o       |        o-U-o       o |      o-o-o   o-U-o\n            |       |       /    |       | |           \\ /     \\\n          o-o-o-o   |      o     o-o     o |            o       o\n         /          |      |     |         |           /        |\n   newbie mtn       |      o     o         |        o-o     o   o-o\n                                           |           \\   /    |\n                                           |            o-o     o\n                                           |           /   \\    |\n                                           |      o-o-o     o-o-o\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "newbie playground", x = 388, y = 511 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "newbieplayground", mobkind = "nil" },
      { name = "newbie taskmaster", x = 340, y = 498 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "northrend", x = 712, y = 60 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "oakvale", x = 288, y = 433 ,information = lwhite.."--------Oakvale(Midbie)-------\n             entrance\n                |\n                O\n                |\n       O--------O---------O\n       |\\      /|\\        |\n       | O--O-O | O       |\n       | |  |   |         |\n       |U/D-O   |         |\n       | |RM1-5 |         |\n       | O      |       O |\n       |/       |        \\|\n       O--------O---------O\n       |\\       |\\       /|\n       | O      | O     O |\n       |        | |     | |\n       |        | O     O |\n       |        |       | |\n       |        |       O |\n       |      O | O       |\n       |       \\|/        |\n       O--------O---------O\n                |\n                O\n                |\n        blue----O----yellow\n-------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old oak forest", x = 319, y = 462 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old convent", x = 302, y = 497 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "orc scouts", x = 339, y = 468 ,information = lwhite.."----------------------------Orc Scout Tree---newbie------------------------------\n  Level 1  |    Level 2       |Level 3|     Level 4    |\n   (2)     |         O        |(4)    |         O      |*At entrance, climb tree\n    U-O    |        / \\       | U-O   |        / \\     | to enter the area\n   /   \\   |   (2) D   O      | | |   |       / O \\    |\n  O     O  |      /     \\     | O-D   |      /  =  \\   |*At K on level 4,push\n  |     |  |     O       O    |  (3)  | (4) D   K---O  | knot find a secret room.\n  O     O  |      \\     /     |       |      \\     /   |\n   \\   /   |       O   U (3)  |       |       \\   /    |*rockets from the little\n    D-O    |        \\ /       |       |        \\ /     | punks will send message\n   (1)     |         O        |       |         O      | to the whole mud.Type:\n                                     message , then drop rocket and light rocket.\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "peacock farm", x = 463, y = 520 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "petting zoo", x = 357, y = 482 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "pettingzoo", mobkind = "nil" },
      { name = "plura's castle", x = 365, y = 294 ,information = lwhite.."----------Plura`s Castle---low to mid--------------\n            entrance\n		|\n		o\n	  down  |\n          o     o-o-o\n	  |     |   |\n	  o-o-o-o o-o\n                | | |\n            o-o-o o o-o-o\n                | | |   |\n	    o   o | o-o-o\n	    |   | |   |\n            o-o o-o   o\n	    |   |     |\n        *-o-o-o-o   o-o o     * = aggr monsie\n	            |   |\n	            o *-o\n                    |   |\n	            o-o-o\n----------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rainbow cloak", x = 518, y = 508 ,information = lwhite.."----------Rainbow Cloak---------newbie to lowbi----------\n                          O\n                          |\n                          O\n                          |\n             O..O..O..O-O-O-O-O-U..O..O..O..O \n        (foliage)         |               (beam)\n                          O\n                          |\n                          O           O-O\n                          =          /\n                        O-O-O   O-O-O-O-O=O\n                        | | |   |    \\\n                    O-=-O-O-O=O-O-O   O\n                    :   | | |   |     |\n                    :   O-O-O   O     O\n                    :     =\n                    :     O\n                   u/d    |\n                    :     O (search crack)         \n             entrance     |\n                        O-O-O\n                        | | |\n                        O-O-O\n                        | | |\n                        O-O-O\n                          :\n                          O\n                          |\n                        O-O-O\n                          |\n                          O  (enter coffin, pull lever)\n----------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "revelstone", x = 608, y = 99 ,information = lwhite.."------------------------Revelstone-------------------\n                   O-O (need to check if correct)\n                   |  \n                   | ?\n                   | |\n             O-O-O O-O <-- aggr lord\n                 | | \n             O O U-O\n             | | | |\n             O-O-O-O\n                \\|/\n                 O\n                 |\n                 O\n                 |\n        enterwest....O....entereast\n                 |\n              entrance\n-----------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "school of lumine", x = 459, y = 533 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "secladin", x = 577, y = 681 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "sewers of silverfang", x = 614, y = 634 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "simon's hut", x = 447, y = 241 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "small meadow", x = 385, y = 518 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "smallmeadow", mobkind = "nil" },
      { name = "stone circle", x = 292, y = 517 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of las", x = 546, y = 632 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of sarku", x = 652, y = 358 ,information = lwhite.."-------------Sarku`s Temple(Newbie to partied low)-------------\n                     O       |Inner Sanctum (lower level)\n                     |       |                O\n             O O D-O-O       |                |\n             | |     |       |       cell-O-D-O\n           O-O-O-O-O-O       |              :  \\\n                 |           |              D   U\n                 O           |              :\n                 |           |          worm lair\n           Entrance Hall     |\n---------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of the winds", x = 590, y = 428 ,information = lwhite.."--------------Temple of the Winds--------------------------\n            O         | PLAKHSTAN\n           / \\        |      Hut (Aggros, Blocks Out)\n          O O O       |     /\n         /|\\|/|\\      |  O-O\n        O O-O-O O     |   |\n         \\|/|\\|/      |  O------O\n          O-O-O       |  |     / \\\n         / \\ /        |O-O-O  ?   ? ---> Locked Doors\n        O   O         |  |\n        |             |  O\n        E             |  |\n                      |  E\n-----------------------------------------------------------\n"..lwhite2.."\n", bottonset = "templeofwind", mobkind = "nil" },
      { name = "tunnel", x = 533, y = 479 ,information = lwhite.."------------------------------------Tunnel--------------------------------------\n           blocked           |Bottom Level|Room 1 runes:A, N` guen stoh Qwendir!\n              |              |   2        |Vir xinth sor `e n`hul relsh!\n              O   O          |   O        |        |---------------------------\n              |   |          |   |        |   @    |Room 3   __,@._           |\n            O-O   O  O       | O-O-O      |`--.--` |           *** `          |\n              |   |  |       |1  |  3     |   *    |             `-.          |\n              O D O--O--O    |   O        |  / |   |--------|     | |         |\n             /  |/       \\   |   4        |  | |   Kodorthn |    /  |         |\n Entrance---O-O-O         O  |--------------------------------------------    |\n             \\   \\       /   |Room 2 runes: A, N` guen stoh Qwendir!     |    |\n              O   \\     O    |__@           Vir xinth sor `e n`hul relsh!|    |\n              |    \\   /     | ** _        |------------------------------    |\n            O-O     O-O      | / __        |  A, N` guen stoh Qwendir!        |\n                    |        | |  Gtrehn   |  Vir xinth sor `e n`hul relsh!   |\n                    O        | /           |-----------------------------------\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "tyr farwyn", x = 596, y = 411 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "urvile tree", x = 618, y = 98 ,information = lwhite.."------------------------------Urvile Tree(Midbie)---------------------------\nSecond level A:  First level:  Second level C:   Second level B:\n  Elder Xerses      B         Urvile Loremaster  Hirebrand Davinor\n       :           / \\             / \\                   :\n       O          A   C           O   O                  O\n      / \\          \\ /             \\ /                  / \\\n     O   O          O               C                  O   O\n      \\ /           |                                   \\ /\n       A           u/d                                   B \n                    |\n                 entrance\n* Watch out for wandering aggressives.  An aggressive urvile \n  walking into your room can quickly spoil the fun!\n* Merchants can cannibalize corpses for flesh.Each corpse weighs 2 to 5 kgs.\n* Kill urvile within trunk of tree. He`s non-aggressive and relatively easy.\n* Then take out the wandering urvile guard. No skills, no spells if other\n  critters are in the room. He follows and tracks, so it`s useful to \n  Look for rooms with single creatures. \n* Last, clear the rooms with multiple creatures that don`t wander.If they`re\n  tough for you, kill them one at a time with no skills/spells.\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "village of stouby", x = 516, y = 585 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "waldrand", x = 678, y = 441 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wibble village", x = 351, y = 479 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wrebie forest", x = 410, y = 533 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "wrebieforest", mobkind = "nil" },
      { name = "wrecked ship hull", x = 264, y = 408 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "zoy's inn", x = 516, y = 632 ,information = lwhite.."---------------------------------Zoy`s Inn-------------------------------------\n                            O (search pile to retreive the silver disc)\n    O-u                     :\n      :   `enter hole`    O O (slither to get to the treasure room)\n      :         /\\       / \\|\n      d-O      /  \\     O   O\n        |     /    \\    |\n      O-hole_/ O    \\_hole(realm of snakemen)     O (dig)\n      | |     /                                   |\n      O-O yeti(`enter crevice` to                boat\n        | |     get to female yeti)               |\n      O-O shack(`search bench` to                 O\n        | |      find Easter Egg)                 |\n        O O                                      hut  (swim to boat, search bed)\n         \\|                                       |\n          O..................................swim in river\n          |\n         inn(`pay` to rent the rooms.`Sleep` to regen)\n          |\n          O\n          |\n      entrance\nBoat, main deck:                     | Inside the Inn:\n          captain (search chest)     |     O\n             |                       |     | : \n             O-O                     |     O-entrance\n             |                       |       :\n          ladder                     |\n             |                       |\n             O    (rope is here,Tie rope to stakein the northwestern forest)\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild ancient ruins", x = 309, y = 335 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild archer", x = 391, y = 292 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild blackbone encampment", x = 358, y = 634 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild cathedral of darkness", x = 515, y = 615 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild channeller", x = 505, y = 483 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild crimson", x = 490, y = 299 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild druid", x = 453, y = 559 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild explorer", x = 310, y = 381 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild forest grove", x = 478, y = 647 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild knight", x = 465, y = 504 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (magical)", x = 699, y = 701 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild monk special (lae)", x = 405, y = 294 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild ranger", x = 340, y = 554 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild runemage (east)", x = 295, y = 608 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild runemage (south)", x = 404, y = 242 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild runemage (west)", x = 642, y = 415 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild sailor", x = 352, y = 468 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild squire&amp;cavalier", x = 335, y = 460 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tarmalen (summer)", x = 572, y = 403 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild ziggurat of serinna", x = 537, y = 638 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer barb (lae)", x = 297, y = 513 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer priest (lae)", x = 670, y = 90 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine animist totem (lae)", x = 295, y = 408 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine dwarf", x = 561, y = 303 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine elf", x = 405, y = 550 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine ent", x = 621, y = 455 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine hobbit", x = 398, y = 570 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine human", x = 474, y = 506 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine leprechaun", x = 256, y = 585 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine sprite", x = 613, y = 116 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine tinmen", x = 510, y = 310 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine zombie", x = 394, y = 319 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ss suicidal+", x = 299, y = 397 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ss wihne+", x = 489, y = 303 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob river cavalier", x = 517, y = 647 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity absolon", x = 467, y = 599 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ankh-morpork", x = 444, y = 518 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity avalon", x = 302, y = 433 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity babylon", x = 376, y = 501 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity bandung", x = 680, y = 450 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity bat-suburb", x = 535, y = 418 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity booty", x = 642, y = 355 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity chairman", x = 284, y = 407 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity cloudcastle", x = 587, y = 405 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity daggerfall", x = 547, y = 355 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity darkhold", x = 536, y = 467 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity darkness", x = 613, y = 390 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity demonia", x = 482, y = 455 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity desolation", x = 595, y = 492 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dionysus", x = 481, y = 469 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity downunder", x = 475, y = 307 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dragonbane", x = 362, y = 122 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity elsewhere", x = 571, y = 470 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity eternia", x = 453, y = 305 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity evergreen", x = 444, y = 295 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ezsu", x = 358, y = 315 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity farmville", x = 464, y = 301 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity fightclub", x = 299, y = 384 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity friday", x = 502, y = 367 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity garden", x = 512, y = 396 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity gothamcity", x = 298, y = 406 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity graveyard", x = 498, y = 443 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity hamppukaupunki", x = 539, y = 496 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity heaven", x = 478, y = 497 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity innsmouth", x = 442, y = 507 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity isca", x = 304, y = 420 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ixi", x = 373, y = 129 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity joensuu", x = 261, y = 435 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kalia", x = 502, y = 356 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kapilavastu", x = 318, y = 393 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kaukovainio", x = 484, y = 444 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kepustan", x = 519, y = 413 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity laiduin", x = 533, y = 601 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity lapland", x = 426, y = 301 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity liyue", x = 696, y = 691 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity macao", x = 494, y = 333 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity macedonia", x = 312, y = 365 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity manhole", x = 630, y = 752 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity melusine", x = 616, y = 425 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity midian", x = 378, y = 488 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity mielenrauha", x = 604, y = 122 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity mistfall", x = 624, y = 382 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity neo-turku", x = 296, y = 396 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity neverness", x = 311, y = 441 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nightfall", x = 335, y = 513 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nightshelter", x = 313, y = 451 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity odessa", x = 454, y = 504 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity onyx-citadel", x = 481, y = 344 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity orathdur", x = 529, y = 551 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity orion", x = 406, y = 517 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity oulu", x = 282, y = 453 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity quintinity", x = 657, y = 348 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity redwall", x = 325, y = 462 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity riverfall", x = 625, y = 81 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sacred-gardens", x = 454, y = 516 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity santillana", x = 432, y = 512 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity serpentkeep", x = 592, y = 480 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shadarii", x = 560, y = 517 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shangri-la", x = 382, y = 302 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sincity", x = 321, y = 494 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity skyforge", x = 532, y = 510 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity smithville", x = 380, y = 538 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sumucity", x = 519, y = 432 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tardis", x = 581, y = 499 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tartarus", x = 335, y = 330 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity texas", x = 390, y = 542 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity toa", x = 255, y = 418 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tormentia", x = 510, y = 431 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity transport", x = 472, y = 475 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity transylvania", x = 572, y = 426 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity twilight", x = 456, y = 568 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity unconcerned", x = 582, y = 213 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity valhalla", x = 466, y = 563 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity void", x = 305, y = 344 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity whitehall", x = 569, y = 670 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity windspyre", x = 508, y = 380 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity zhamania", x = 474, y = 484 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    desolathya = {
      { name = "city calythien", x = 285, y = 272 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned barn", x = 194, y = 334 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ancient temple of gods", x = 179, y = 472 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ancient tower", x = 382, y = 419 ,information = lwhite.."-------Rasha\\Ancient Tower\\Ruins of the Tower of Traplecktor--------midbie-------\n             entrance                                       | GRAVEYARD:\n                 |                                          |    (maze)--O \n                 |                                          |            |\n       (temple)--O--(orchard maze)--(graveyard)             |            O-O-\n                                                            |            |\n TEMPLE:      O-O  <-- search drawer 2, search drawer 3.    |            O*\n              |  \n     entrance-O-O-O <-- worship rasha (must be good aligned)\n              |    * To get into the crypt, `get ring` in the room with\n              O      the large oak tree. This will pull you into the grave, a\n no-wimpy room with a pit fiend.Party can follow by going down into the new room. \n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "apollo", x = 127, y = 284 ,information = lwhite.."-------------------------Apollo(lowbie and up)----------------------------------\n        O    E = entrance           | Lower Caves:           |Draconian Tunnels:\n	|    D = down               | O   O-O-O O   O        |   O-O Ice dragon\n Temple O                           | |\\  |    /   /         |   |  ,aggressive\n      : |                           | O O-U O O   O          |   O Captain\n      U O                           | |/ /  |  \\ / \\         |   |\n      |  \\                          | O O-O-O O-O-O O        | O O O\n      O-O-O                         |   |\\ / \\ / /|          |  \\|/\n      | | |                         | O-O O   O-O O          | O-O-O\n      D-O-U Flint                   |        / \\ /           |   |\n      | | |/        (to Lower Caves)|   O-O-O O O O <-Leader |   O\n      O-E-O-O-O-O O O O O-O-D       |  / \\   /|  /           |   |\n               \\| | |/     \\        | O   O-O O-O            |   U\n              O O-O-O O O-O O       |                        | entrance\n              |   |    \\ /  |       |From the senic loc,`enter` and `read book`.\n              O O-O O   O O O       |To exit later, type `close book`.\n              |\\  | |  / \\|/        |\n              O O-O-O-O   O         |\n                    |    /          |\n                O-O-O   O           |\nAfter killing the gully dwarf leader, take the bow and go give it to Tanis, \nwho will give you the Gem of Eternity.Then go kill the golden commander, \ngo to temple and pray in the altar, and Apollo will appear.Give the Gem Of\nEternity to Apollo and you will get the Dragon Lance.Then go to Draconian\nCaptain and kill it.After killing it you have to kill the ice dragon\nfreezing the world, it`s quite big(~350-400k), so take care. After you kill\nthe dragon, you get Rakirsai, The Blue Flame. It`s +3 con +fireprot +prot\nheadslot, very light weight. Then you must open the chests, can`t remember\nhow anymore, but it`s easy. Then put the dragonlance in the empty space that appears after opening the chests. Then an exit to south opens and you\ncan get The circlet of flame from there, it`s an +2-3 spr headslot.\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bf barracks", x = 507, y = 119 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bf castle", x = 508, y = 118 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bf prison", x = 511, y = 118 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bf seacrest", x = 510, y = 120 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "brimshire", x = 239, y = 325 ,information = lwhite.."----------------------Brimshire(Midbie to highbie parties)----------------------\n                   :                   |   church\n                   O               O   |     |\n                  /               /    |   O-O-O\n   O-path <-> forest           O-O     |     |\n  /               \\           /   \\    |     O\n O              forest <-> path    O   |     |\n                   |                   | inn-O-shop\n                   O                   |     |\n                   |                   | O   *   *\n                entrance               |  \\  |  /\n                                       |   *-O-O\n                                       |     |\n     i = casts icebolt                 |     O\n     g = golden arrow                  |    /\n     m = mm                            |   O      * = house entrance\n     p = psi blasts                    |   |\n                                       |   O\n                                       |   |\n                                       | entrance\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "buckthorn valley", x = 188, y = 387 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "burning village", x = 264, y = 275 ,information = lwhite.."-----------------------Burning Village(Newbie)------------------------------------\n        leave               | Southern fields:\n          |                 | O-entrance\n          o-northernfields  | | |\n          |                 | O-O\n    house-o-shrine          |*Use the key to free the slaves.Kill the slaver guard\n          |                 |      in the field area, and you get an item from the\n  up-mill-o-southernfields  |                       slaves after you've free them.\n----------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle of toxic", x = 368, y = 312 ,information = lwhite.."---------------------------Toxic`s Area-----------------------------------\n   DOWN                     Entrance         UP\n   O                            |            O <-- 2 aggressive, \n   |                            |            |     blocking soldiers.\n   O                      well  |            D     Death trap for low\n   |                        O   O                  level parties.\n   O-O-O                    |   |\n   |   |              O-O-O O   O\n   O O-O              |   | |   |\n   |                  O-O O-O-O-O-O\n   O-O-O              |   |     |\n     |                O-O-O     O-O\n     O                          |\n     |                          O\n     U                          |\n                              O-O-O\n                                |\n                               U/D\n--------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "caves of orac", x = 302, y = 94 ,information = lwhite.."------------------------Caves of Orac(Partied newbie to lowbie)-----------------\n                     O\n                     |\n                     O-O   O\n                      /    |\n                     O     O O\n                    / \\    | |\n                   O   O-O O-O O\n                         | |   |\n                     O-O | O   O\n                    /   \\|/   /\n                   O-O-O O   O\n                     |  \\|    \\\n                     O-O-O O---O-O-O\n                       |  \\|   |\n                       O   O---O\n                       |    \\ /\n                       O-O   O\n                          \\  |\n                           O-O\n                           |\n                           O\n                           |\n                        entrance\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "celestial caverns", x = 388, y = 112 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "d'hregal mines", x = 308, y = 279 ,information = lwhite.."-------------------------D`hregal Mines(Newbie)------------------------------\n                         O   crawl through crack\n                         |\n                         U\n                       .\n                      D\n                      |   \n                      O   O---O  get root  \n                       \\ /\n                        O\n                        |\n                        O\n	                |                         \n               miners   O---O  Overseer            \n			|                            \n	                O---O  Mary   \n	                |\n             Entrance   O\n--------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "deso-unknown #1 (closed)", x = 163, y = 275 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dalesmen", x = 229, y = 153 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "duergar temple", x = 264, y = 141 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dunamor", x = 282, y = 45 ,information = lwhite.."------------------------------------Dunamor---------------------------------\nLand of Dunamor                          |  BERUL:\n             Kaveril                     |You need a `key to Berul` to enter,\n                O                        |which can be found by killing and\n                |                        |searching Kaveril Men`s coats.\n           O--O-O-----O                  |\n           |  O-O     |                  |         pri    guar-\n           |  |       |                  |         est G  dian\n           |O-O       |                  |           O-O>O-O-O   O jacobi\n           |  |       |                  |      shop   I >    d u (prisoner, \n       O-O-O--O-O-O   O-O   O   Berul    |     keeperO I >   kaveril Baker`s \n           |  | |     |     |\\           |	   I I >G  daughter)\n           O--O-O-O-O O     O-O          |       O-O-O-O-O\n           |  | |     |     |X|\\         |   2G  I I   I I\n           O--O-O-O---O     O-O-O-O      |     O-O-O-O-O-O\n              |            /| | |/|      |       ImI I I/\n              O-O         O-O-O-O |      |  gate>O-O-O-O\n                 \\_   ___/       \\|      |  (out)I I I I\n                   \\ /            O-O=   |     O-O-O-O-O-O\n                    O                    |  horses   I    m\n                    |\\                   |	   Om\n                    O-O                  |\n                    |X|\\                 |Some huts of the Berul Men can only be\n                    O-O O    Dunamor     |entered from a certain direction.\n                    |/ \\|      Uplands   |Jacobi awakens and aggros as soon as\n                    O   O                |the lid of his coffin is moved.Kill all\n		        :	         |Berul dogs before attacking Jacobi.\n		        path (entrance)  |Ask Davelok about Berul.\n                                         |You ask Davelok about vampires.\nIn Davelok`s room, read letter;          |><    Blocked passage\n    search cabinet, get garlic.          |O - O Use `enter` between the 2 rooms.\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ferry/hamlet of windham", x = 430, y = 445 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "feldspar conglomerate camp", x = 309, y = 54 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "feldspar north camp", x = 193, y = 91 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "feldspar south camp", x = 206, y = 431 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "followers of vanion", x = 228, y = 294 ,information = lwhite.."------Followers of Vanion----Newbie, lowbie (for Vanion)------\n                            O   O\n                             \\ /\n                            U-O-O\n                              |\n                              O\n                              |\n                              E\n---------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "goblin farm", x = 338, y = 368 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hairikko forest", x = 292, y = 388 ,information = lwhite.."------Hairikko Forest--Newbie----a level limit, roughly lvl 25------\n       o `out` <--.\n                  |\n       o `hut` <--`\n       |\n    o--o--o\n       |\n    o--o--o\n       |\n       o\n       |\n o--o--o--o--o\n |  |  |  |  |\n o--o--o--o--o\n |  |  |  |  |\n o--o--o--o--o\n |\n o <-- entrance: `leave` to outside\n---------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "halls of the dead", x = 258, y = 230 ,information = lwhite.."--------------Halls of the Dead----Midbie----------------------------\n 1st floor   o*enter pit to get in 2nd floor\n             |\n         o   o\n         |   |                2nd floor:\n         o   o\n          \\ /                     o-Mo-o*go up to get in 1st floor  \n           o                      |  \n           |                      I am not sure where axidia is.\n       o-o-o-o-o-o\n           |\n           o-entrance\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "jurkajef's tower", x = 517, y = 120 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "krev estate", x = 337, y = 344 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "magerathia", x = 278, y = 211 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "meadowshire", x = 257, y = 313 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "midnight carnival", x = 202, y = 60 ,information = lwhite.."--------------Midnight Carnival---------Mostly newbie/lowbie----------------\n                            Town ------>        ?\n                             :      |           |\n                             U      |    O  ?-O-O-O-?\n                             :      |    |      |\n                             U      |  E-O------O-O\n                             :      |           | |\n                            U/D     |           O O-O\n                             |      |             | |            O\n                             O      |             U O           / \\\n                             |          /---------Cave-----> D-O   O\n                           O-O-U ------/                        \\ /\n                           |   |                                 O\n                           O-O-O   Cage       Cage\n                          /  |     |         /\n                       O-O   O     O--------O\n                             |    /          \\\n                             O   O-Cage       O-Cage\n                              \\  |            |\n                               O---O--O       O-Cage\n                                 |   /|      /\n                                 |  / |     /\n                                 | /  |    /\n                                 |/   O---O\n                                 O    |    \\\n                                      O     Cage\n                                      |\n                                      O\n                                       \\\n                                        O\n                                        |\n                                      O-O-O\n                                      | | |\n                                    O-O-O-O-O\n                                      | | |\n                                      O-O-O\n                                       /\n                                      O\n                                     /\n                                    O\n                                    |\n                                entrance\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "millie's nightmare", x = 194, y = 368 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mythical valley", x = 248, y = 385 ,information = lwhite.."--The Mythical Valley--Turbo/partied newbie--LQ29--Hermit casts Disintergrate--\n          up  down      1.Go `north`.      2. Enter ruin.\n wrathaug o   o         3.Climb tree. (When you leave a `Note` will drop down)\n              |         4.`Play dead` to enter tower.\n              o         5.`Sit throne`to enter lair of the`Prince of Darkness`.\n               \\        6.Go `Down` to enter well, \n                o--o      or `Enter desert` to enter desert maze.\n                |                desert       nemesis o--o--o\n     mountains  o                  o-----.              |\n                |                  ^     |               o--o--o\n                o--o--o         o<-o--o  |                  |\n                    \\           |  |     |                  o\n                     o          |  o<-.<-`                  |\n                     |          |     |                     o\n                     o          `->o--`                    well\n                     |             |\n                     o    tower 5  o\n                     |          |  | \n                     1--o--o    4--6 well        \n                     ruins |    |            down up      \n                           2    o              o  o\n                           |    |       castle |             \n                  .->o<-.  o    o--o--o--o--o--o--o\n                  |  |  |  |   /               |  up up/down down\n                  `--o--o--o--o                o--o    o      o\n            forest   |  |  |  |  \n                  3--o--o--o  o\n                     |  |     | down up/down up\n                     `->o     o--o     o     o--o\n                              |  \n                              o up\n             \n                              o down \n                              |\n                              o\n                              | \n                       scenic location\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "nanagich village", x = 478, y = 79 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ochimo", x = 278, y = 307 ,information = lwhite.."---------------------Land of Ochimo(Newbie)---------------------------\n         o\n         |\n         O\n         |                /\n         N           o-o-R     N* = The feared Nether Beast\n          \\         /   /|     R* = Rosy cherub\n           o       o   o o\n           |       |  /  |\n           o       o o   o\n           |       |/   /\n           o-o     o-o-o\n           | |    /\n       J   o D   o        J = Jabberwocky   D = The Deorc\n       |   |    /\n       o-o-o   o\n            \\ /\n             o\n            / \\           *will block your way further\n           /   o-o-o       find small gold pile bonuses behind them\n          /    |   |\n     o-o-o     o   u\n     | |\\     /    |\n     o-o-o   o   u-o-u\n     | | |   |    \\ /\n     o-o-o   o     B      B* = Balrog\n     |   |    \\    |      P = Portal   O* = Ochimo   L = Lung Dragon\n     o-P-o     L   O-F    F = Fire(small gold pile bonus is here)\n----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pier", x = 309, y = 49 ,information = lwhite.."--------------Pier------------\n            O     D\n            |     |\n          E-O-O-O-O-O\n              |\n              D --> ?\n-------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ranger quest area", x = 332, y = 351 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "red tides village", x = 27, y = 77 ,information = lwhite.."-----------------RED TIDES VILLAGE----------------\n                      O               | 2nd Floor\n                      |               | O-U/D-O\n              O-O-O-O-O-O-O-O O       | |     |\n                |     |   |   |       | O     O\n                O O-O-O O O---O       |-----------\n                |     | | |           | 3rd Floor\n              O-O--O--O-O-O-O         | O-U/D-O\n                      |               | |     |\n            O O O U O |  O O    O-O   | O     O\n            | | | | | O  | |    |     |-----------\n        U/D-O O O-O-O |  O O-U  O     | 4th Floor\n          |   |   |   |  |   |  |     |   U/D\n          O---O---O---O--O---O--O     |    |\n                      |               |    O\n                      O               |\n                      |               |\n                      E               |\n--------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ruins of el deagnoh", x = 175, y = 221 ,information = lwhite.."----Ruins of El Deagnoh----Newbie to lowbie---Midbie for catacombs----\nRuins               |Church cellar: | Catacombs:\n          o         | O   O         |      U\n         / \\        | |   |         |     / \\\n        D   o - t   | O-O-U-O       |    O   O\n       / \\ / \\ / \\  | |   |         |    |   |\n      o   t   o   t | O   O         |    ?   O\n     / \\ /     \\ /  |_______________|        |\n    o   t   R - o                   |        O\n     \\ / \\     /     t= tent        |       / \\\n      o   t   D      R= large ruin  |      ?   ?\n       \\ / \\ /       D= exit down   |______________\n        o   o       *move stone  *move tent  *move board\n         \\ /        *search sand *search rubble (at R) to enter cellar\n        ruins       *push stone  *enter hole (size restricted)\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "seabird inn", x = 328, y = 328 ,information = lwhite.."-------------------The Seabird(Partied newbies and lowbies)----------------------\n    First Floor:           |    Second Floor:    *Drinking musician can be found\n          up--O--O         |               O  O   by typing `climb stage` 1 north\n              |            |               |  |   from the bar where Jake is, and\n            O-O   O--O     |         down--O--O   then go 1 n.\n              |   |        |            |\n           O--O   O        |         O--O\n              |   |        |            |\n             out--O        |         O--O\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "seabirdinn", mobkind = "nil" },
      { name = "seashore tower", x = 278, y = 35 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "small well", x = 480, y = 92 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "snotling farm", x = 473, y = 191 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "soy", x = 166, y = 356 ,information = lwhite.."-------------------------------------Soy------------------------------------\n			             |          F=poisonous fountain\n				     O\n				     |\n			             O-O-O\n				    /   /\n			       O-O-O F-O   O\n 			       | | |    \\ /|\n			   O-O-O O O O-O-O O\n			  /    |   | |    / \\\n			 O     O-O-O O-O O   O\n   			/           \\  |     |\n	      outerworld             O-O-O   O\n		                     |       |\\\n				     O	     O pit\n				     |\n---------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "stone garden", x = 491, y = 478 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "sunderland", x = 243, y = 51 ,information = lwhite.."---------------Sunderland---------------Lowbie to partied mid----------------\n  Castle, First Level:               Crossroads:\n    U      O  O   Earth elemental         O\n     \\     |  |            /               \\\n      O    O  O  O  O  O  O                 O  Fairbanks\n      |    |  |  |  |  |  |                  \\\n   O--O----O--O--O--O--O--O                   O                          U\n      |    |  |  |        |                   |                          |\n      O-O  O  O  O        O                 O-O-harbor                   O\n      |    |  |  |        |                /  |                          |\n      U    O  O  |      O-O       ocean   O sewer........................O\n     /           |         \\        |    /\n    U         entrance      U       O   O\n                                    |  /\n  Castle, Second Level:           O O O\n       O--O--O--O--O              |\\|/\n             |                    O-O-O\n             D--O                 |/|\\|\n                                  O-O-O\n                                    |\n                                    D\n  Monastery:                        |\n         O-D                    D:O-O-O   Glendale\n           |                        |\n           O                        O\n           |                        |\n           O                        O\n                                   /\n     monastery O       castle     O\n             | |\\         |      /\n             H-O-O   O----O-O-O-O\n             | | |  /     |     |\n     Hamden  O-O-O-O-O-O  O     O-O-O  forest\n             | | | |\\     |     | | |\n             O-O-O O O    O     O-O-O     \n              \\|/         |     | | |\n               O      entrance  O-O-O\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "tarackia", x = 363, y = 459 ,information = lwhite.."---------Tarackia-------Suitable for HIGH level parties--------\n                 |\n                 #  # Room with Shinzhe and Steeg,\n                 |     blocking traffic along the main road.\n                 O\n                 |\n                 O\n                 |\n              entrance\n--------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of all gods", x = 220, y = 231 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "teywaer graveyard", x = 458, y = 72 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "teywaer tunnel", x = 403, y = 77 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "the warlock conclave", x = 430, y = 424 ,information = lwhite.."--------------------------------Conclave------------------------------------\n                               O\n                              / \\\n                             O   O\n                            / \\ /|\n                         O-O   O | O\n                               | | |\n                               O-O-O-(Blocked)\n                                   |\n                                   O\n                                   |\n                                   O\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "tiburcio's tower", x = 304, y = 305 ,information = lwhite.."-----------------------Tiburcio`s Tower--------------------\n                              U    ----------->      D\n                              |                      |\n                            O-O-O                  O-O-O\n                              |                      |\n                            O-O-stairs             O-O-O\n                              |                      |\n                           entrance                  U\n    Catacombs (from stairs)                          |\n          O-O-O O-O                                  |\n          |   | | |                                  V\n          O O-O-O O                                  D\n          | |                                        |\n          O-O-O O O                                O-O-O\n            |   | |                                  |\n          O-O-O-O-O                                O-O-O\n          | | | | |\n          O O-E-O O\n-------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "tinmen monastery", x = 404, y = 420 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "unholy cathedral", x = 132, y = 192 ,information = lwhite.."-----------------------------Unholy Cathedral(Lowbie to mid)--------------------\n       O-O-...               |\n       |                     |\n       D                     |\n       |                     |\n       O         A           |\n       |         |           |* At `A`, push painting to enter a hidden area.\n       O-O-0-entrance---0    |\n                 |      |    |\n                 O      D    |\n                        :    |\n                       U/D   |\n                        :    |\n                      O-O-O  |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "valley of silence", x = 360, y = 371 ,information = lwhite.."----------------Valley of Silence------------------------\n   Tower     Castle Halberdeath\n     |              |            O\n     |              |            |\n   E-O--------------O          O-U-O  ----> Up X 3  O\n                    |            |\n                    U          O-O\n                    |         TOWER\n                    O          \n--------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "well", x = 238, y = 113 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "zorn", x = 133, y = 266 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild animist", x = 328, y = 414 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild ghost liberators", x = 238, y = 87 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild loc: aelena", x = 341, y = 467 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (acid)", x = 48, y = 97 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (inner circle)", x = 37, y = 64 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild reavers", x = 164, y = 435 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tarmalen (spring)", x = 306, y = 377 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild templar", x = 403, y = 306 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tiger (deso)", x = 201, y = 153 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tree navigators", x = 79, y = 433 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer barb (deso)", x = 313, y = 292 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer priest (deso)", x = 262, y = 379 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer ranger (deso)", x = 296, y = 288 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine gargoyle", x = 230, y = 321 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine gnoll", x = 215, y = 444 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine kobold", x = 416, y = 278 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine leech", x = 32, y = 44 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine lich", x = 85, y = 464 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine minotaur", x = 473, y = 237 ,information = lwhite.."--------------Minotaur------Low to mid, good for parties--------------\n					    dark shrine\n						+\n						+\n					    void space\n						|\n			        o-o-o-o-o-o-o-o	King\n				|	|     |	|\n				o o-o-o	o   o-o	o\n				| |   |	|   |   |\n				o o-o o	o   o-o-o\n				|     |	|   |\n				o-o-o-o	o   o-o-o\n				        :	|\n			      o-o-o-o-o-o       o\n			      |   |     |       |\n			      o-o o     o       o\n				| |     |       |\n				o o o-o o-o-o-o-o\n                                | | | | |\n			      o-o o o o o\n		              |   |   | |\n			      o   o-o-o o-o-o\n			      |\n			      o\n			     /\n		       vortex\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine ogre", x = 179, y = 360 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine shadow", x = 341, y = 106 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine skeleton", x = 152, y = 473 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob midnight cavalier", x = 102, y = 371 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity beehills", x = 162, y = 324 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity camelot", x = 416, y = 433 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity daleshop", x = 230, y = 144 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity delvelinion", x = 237, y = 126 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity gehenna", x = 243, y = 73 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity harmony", x = 238, y = 359 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity highwater", x = 298, y = 48 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity irkutsk", x = 227, y = 106 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity isis", x = 253, y = 204 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kasvihuone", x = 255, y = 50 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity luostari", x = 200, y = 209 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity mausoleum", x = 78, y = 449 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity paradise", x = 253, y = 298 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity perilous", x = 295, y = 64 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity portals", x = 328, y = 318 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity postipuisto", x = 134, y = 451 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ravenloft", x = 275, y = 183 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shadowspire", x = 336, y = 97 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shire", x = 27, y = 367 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity silvermoon", x = 241, y = 60 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sky", x = 72, y = 309 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity stargate", x = 368, y = 390 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sungate", x = 352, y = 276 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tenebrae", x = 421, y = 444 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity theta", x = 276, y = 242 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tunis", x = 379, y = 409 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity vendigroth", x = 237, y = 280 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity wednesday", x = 207, y = 339 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity x", x = 345, y = 337 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    lucentium = {
      { name = "city lorenchia", x = 413, y = 153 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "city silver lake", x = 540, y = 240 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "a tale of two towers", x = 338, y = 40 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "afkadel-el-sha", x = 87, y = 156 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "anthill", x = 342, y = 140 ,information = lwhite.."------------------------Ant Hill-------------------------------------\n  Anthill surface level:  | First Level:   |*Area quest: The ant hill\n _________      O         |   O            |Find pipe,tobacco,and tinder box.\n |  /|\\  |     /|\\        |  /|\\           |Accept:Nicodemus. Rewards:a scroll.\n | O-E-O |    O-O-O       | O-D-O          |Queen has one of the items;\n |  \\|/  |      |\\|       |   |X|          |An aggro guardian ant has another;\n |   O   |      O o       |   O-O-O-*      |and the last item is hidden,\n |__POOL_|     /          |   |/           |its the hard one to find.\n   O      D-O O RIP WEBS  |   O  *entrance |\n   |      | | |           |---------------------------------------------------\n   O      O-O-O           |*Read the descriptions and you might find a reward.\n  /|\\    / \\|/       O    |*From first level, to go down type `hole`.\n O-U-O  O O-O        |    |*To go from second level to first, type `out`.\n  \\|/       |     O-U/D-O |------*In the north, `dive pool` for extra rooms.\n   O        O        |(climb oak) --------------------------------------------\n           /|\\       O        |*In the tree, something glitters...\n          O-D-U               |Full tells you `the cape(826 gold) is from\n            |X|               |the ruby drake to the east,the gauntlets(639)\n            O-O-O-entrance    |are from the sapphire drake to the w,\n            |/                |and the amulet(912) is from the blocker\n            Trap              |emerald drake 1 u from the climb oak\n------------------------------------------------------------------------------\nSecond Level:*=entrance from 1st level | Third Level: |Fourth     |Fifth\n        O     _____________       O    |       O      |    Level: |   Level:\n       /|    /            /      / \\   |      / \\     |     O-O   |       U\n      O-O   /        O   /      O   O  |     O   O    |    /   \\  |      /\n     /|  \\ /        / \\ /           |  |    /|  /|    |   O     O |     O\n  O-O-U*  u      O-O   d      O-O   O  |   O O O-O    |  /|\\   /  |    /\n   \\|X|   |\\      \\|    \\        \\ /   |  /  | | |\\   | O-U-O-O   | O-O\n    O-O   O-O      O     O        d    | O   U D O-O  |  \\|/  |   | |X|\n      |\\ /         |\\   /        /|    |  \\ / \\ /     |   O   O   | O-O\n      D-O          O u O        O |    |   O   O      |      /    |\n      |/            \\ /           |    |       |      |     O     |\n      O              O \\__________|    |       O      |           |\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "astacia", x = 295, y = 126 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "brotherhood of sorcery", x = 147, y = 374 ,information = lwhite.."----------------------Brotherhood of Sorcery (Ad Chain)-------------------------\n   The huge links of an adamantium chain raise up towards an island floating\n                        in the void... it looks like you can climb the chain.\n               |        |*Misc tips:           |Erick:Varne has a black amulet.\n               O    O   |shake bookcase        |There are two other big monsters\n               |\\   |   |enter painting        |in the area, one being St.Peter,\n               | O  |   |jump (through hole)   |guarded by two guardian angels,\n               | /  |   |move mat (to get key) |and another monster that I`ve\n               |O   |   |push wall             |never seen in the elemental area.\n               ||   |   ------------------------There are three paintings,\n               |O   |    O (apprentice   |from each you can get an amulet,\n               |    |    |    sorcerer)  |a black one,a red one,and a white one.\n          top of chain--O--O---U/D---O   |There is a room where you can insert \n                       |    |    |       |the amulets into a wall or something,\n            (drunk)O  O-O    O           |and I assume something interesting\n                        :                |happens when you insert all three.\n                (fat wizard)             |The black one from killing Varne...\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "catfolk shipyard", x = 336, y = 181 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "catfolk tree", x = 234, y = 151 ,information = lwhite.."---------------------------Catfolk Treehouse(Midbie)----------------------------\n                       O---O-O-O---O CHECK ALL MAP\n                       |   |   |   |\n                       O-O O   O O-O\n                       |           |\n                       O-O       O-O\n                       |           |\n                       O---O-O-O---O\n                             |\n                O            O            O\n           O   /|\\   O  O   /|\\   O  O   /|\\   O\n            \\ / O \\ /    \\ / O \\ /    \\ / O \\ /\n             O     O-+    O     O-+    O     O\n             |\\   /| |    |\\   /| |    |\\   /|\n  NW         | O O | |    | O O | |    | O O |     NE\n  Ring       | O O | |    | O O | |    | O O |     Ring\n             |/   \\| |    |/   \\| |    |/   \\|\n             O     O +-O--O     O +----O     O\n            / \\ O / \\    / \\ O / \\    / \\ O / \\\n           O   \\|/   O  O   \\|/   O  O   \\|/   O \n                O            O            O\n                |            |            |\n                O            O            O\n                |                         |\n                O            O            O\n           O   /|\\   O  O   /|\\   O  O   /|\\   O\n            \\ / O \\ /    \\ / O \\ /    \\ / O \\ /\n             O     O-+    O     O-+    O     O\n             |\\   /| |    |\\   /| |    |\\   /|\n  SW         | O O | |    | O O | |    | O O |      SE \n  Ring       | O O | |    | O O | |    | O O |      Ring\n             |/   \\| |    |/   \\| |    |/   \\|\n             O     O +----O     O +----O     O\n            / \\ O / \\    / \\ O / \\    / \\ O / \\\n           O   \\|/   O  O   \\|/   O  O   \\|/   O\n                O            O            O\n                |            :            |\n                O         entrance        O\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "clouds above lor", x = 357, y = 187 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "coffee forest", x = 432, y = 146 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "colosseum", x = 219, y = 88 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "cornfields", x = 392, y = 73 ,information = lwhite.."----------------------Corn Field(20-40 level parties)-------------------------\n                                   scenic location\n                                  * \n                   corn fields    |\n                         o--o--o--o     o   o  o\n                         |  |  |  |     |   |  |\n                         o--o--o  o--o--o---o--o-o     monastery\n                         |  |  |  cave  |   |  | \n                         o--o--o        o-o o  o \n                         |  |           |\n                      o  o--o     o     o \n                      |  |  |     | \n                      o--o  o--o--o--o \n                  \\   |           | barbarian village \n                   o--o--o hut    o\n                   |  | \n              lake o--o \n                   |  | beach \n                   o--o \n                  /   | \n                      o--o-o  \n                      |  |\\   troll`s cave  \n                      o  o o \n                      | \n                      o     o  \n                      |     | \n                      o--o--o--o \n                           orc`s cave  \n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "creepy house", x = 292, y = 268 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dah'bec", x = 410, y = 92 ,information = lwhite.."-----------------------------Dah`bec------------------------------------------\n          In the treehouse:  |            O     |Prison:\n            d (strike bell)  |           / \\    |   O O\n            |                |          O   O   |   : :\n          d-D-d              |         /     \\  |*O=O-O-U (to prison entryway)\n            |                |        O       O |\n            d                |         \\     /  |-----------------------------\n        O                    |          O   O   |*In the western-most prison\n        |                    :------:    \\ /    | cell, `pull lever` to open\n    O   O                    :      :     O     | passageway.\n    |  /                     :      :     |     ------------------------------\n   =O-O-d (to prison cells)  :      O     O     O-O-O-O   O O\n      |                      :       \\    |    / \\|   |   | |\n      O                      :        O   O   O   O   O-O-O-O-O\n      |                      :         \\ /|\\ /     \\  |   | |\n   *O-O                      :          O-U-O       O-O   O O\n     /:\\                     :           \\|/  |----------------------------\n    U : U                    :            O   |*In the stable with Andreas, \n      :                      :            |   | `search hay` to reveal the\n      :-----------------------            O   |  ladder for the loft.\n                             |            |   |-----------------------------\n                             |         entrance\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "door to the past", x = 400, y = 248 ,information = lwhite.."------------------------Door to the Past-------------------------------------\n	                          O*   *Mirror Monster\n                                  |\n                                  O\n                                  |\n                                  O\n                                  |\n                            O-O-O-E-O-O-O\n                                  |\n                                  O\n                                  |\n                                  O\n                                  |\n                                  O\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "draconian tower", x = 392, y = 137 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "duzelton", x = 243, y = 195 ,information = lwhite.."----------------------Duzelton(Lowbie to midbie parties)------------------------\nRoad outside city:\n         O--- entrance  You ask Librarian about books.checkout book.You ask\n        /|\\             Student about acting.You give A ticket to the theater\n       O | O            to Ticketman.ring bell.list.buy contract.\n      /  |  \\           Duzelton gate guard:  (at entrance to area).Guard says\n     O   |   O          `If you would like tickets, I need a signed contract.`\n    /    |    \\    Half-naked priest asks`Have you read the book on the altar?`\n   O   city    O\n  /             \\\n D               D\nDuzelton:\n       road         |   Duzelton:   (in-game map)\n         |          |     1      2     3     4     5     6     7     8   \n         |          |   +-----+-----+-----+     +-----+-----+-----+-----+\n   O-O-O-O-O-O-O-O  | A |               Avenida de Madrid               |\n   | | |         |  |   +     +-----+-----+-----+-----+-----+-----+     +\n   O O-O       ?-O  | B |     |  L  |  U  |                 |  T  |  R  |\n   |             |  |   +     +-----+-----+                 +-----+  e  +\n   O     ?       O  | C |  C  |                                   |  a  |\n   |     |       |  |   +  a  +     +-----+-----+-----+-----+-----+  l  +\n   O   O O-O-O-O-O  | D |  l  |     |  R  |  T      Blvd.               |\n   |   | |       |  |   +  l  +-----+-----+  o  +-----+-----+-----+     +\n   O-O-O-O O     O  | E |  e     Duzelton    r  |                 |  C  |\n   |     | |     |  |   +     +-----+-----+  r  +                 +  a  +\n   O     O O     O  | F |  C  |           |  o  |                 |  m  |\n   |     | |     |  |   +  u  +           +     +-----+           +  i  +\n   O     O-U     O  | G |  n  |           |  A  | C   |           |  n  |\n   |     |       |  |   +  a  +-----+     +  v  +-----+     +-----+  o  +\n   O-O   O     O-O  | H |     |  B  |     |  e  |           |  G  |     |\n   |     |       |  |   +     +-----+-----+     +-----+-----+-----+     +\n   O-O-O-O-O-O-O-O  | I |             Avenida de Don Juan               |\n   |       |   |    |   +-----+-----+-----+-----+-----+-----+-----+-----+\n   O       O   O    |         |  H  |                 |  S  |     |  W  |\n------------------------------------------------------------------------------\n L - Library     U - University  T - Theater        B - Bar     C - Cathedral\n H - Town Hall   S - Stables     G - General Store  W - Tower   R - Bullring\n  This area was moved to the new world, informations and quests may changed.\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dwarf warehouse", x = 134, y = 264 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "earth tower", x = 123, y = 288 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "efiilas advance camp", x = 402, y = 19 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ferry/lucentium", x = 397, y = 15 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "fire tower", x = 126, y = 291 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "fraggle village", x = 131, y = 195 ,information = lwhite.."---------Fraggle Village----max level 50-----------Newbie to Lowbie-----------\n                       O                   |*If you buy 2 doses of speed from\n                       +                   |the shady fraggle in the alley\n     O  -  O  -  O  -  O                   |and give them both to sheela, you are\n     |     +     |                         |rewarded with a random scroll.\n     O O - O - O O  +  O - U/D - Mayor     |*Secret door by ripido (~30-60k), \n       +                                   |underground rooms with 1-6k monsters,\n     | O-O-O     |                         |and more secret rooms in there. You\n           |                               |need to push wall or something to get\n     O  -  O     O  -  O                   |inside.All monsters are aggrro there.\n     +           |     |                   |\n     O           O  -  O                   |\n*When you kill Ripido, you get a `long Vanadium key` from him.  You assume it\nunlocks the door, which is does, but that door just puts you out on the street.\nHowever,if you `search floor`, you find a cellar door, which also unlocks from\nthis key.\n*When you enter 2e and there is 1 room to the north and you can run in a circle\n there (the error is from entrance 2s then you can go 2e).\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "gladiator training grounds", x = 148, y = 148 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "great central desert", x = 99, y = 114 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "harun-al-mar &amp; harun-al-kor", x = 79, y = 138 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ice tower", x = 120, y = 291 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "iron gate", x = 285, y = 45 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "jondalar's castle", x = 535, y = 92 ,information = lwhite.."---------------------------------Jondalar------------------------------------\n *O O     Kill Josef,      |2nd floor, Jondalar`s:---------------------------\n  | :     get umbrella     |    D-O    /  from *\n  O U?O   At*,`jump limb`  |    | |    |    O(`jump` again to get down)\n  | | |                    |    O-O    |    |           \n  O-O-O  Jondalar`s castle |    | :    |    O\n  :                        |    O O    |    |          Out on a limb\n beanstalk                 |           |    O\n                           |           |     \\\n                           |           |      O\n----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kara-tur", x = 49, y = 250 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kharim-el-main", x = 95, y = 141 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kundar-el-alam", x = 91, y = 132 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "land of the overworld", x = 431, y = 205 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lands of lor", x = 411, y = 50 ,information = lwhite.."----------Lands of Lor-------newbie (forest) to mid (castle and tower)----------\n                            U                 U\n                             \\               /\n               CASTLE         O------O------O\n               SECTION        |             |             2nd floor:\n                              |      U      |             \n                              |     / \\     |                  D\n In throne room (t),sit on    |    | t |    |                  |\n  throne to get to chamber    |    | | |    |                  O-O\n   behind throne.             |    O O O-O  |                  |     \n                              |    | | |    |                O-O  \n                              |  O-O O O    |               /  | \n                              |     \\|/     |              ?   ?\n                              |      O      |\n                              |      |      |\n                              O------O------O\n                             /       |       \\\n                            U        O        U\n                                     |\n                                     O\n In the hunter`s lodge(h),  Hunter`s | \n walk through the painting.   Lodge--O                         O O\n                                    /                          |\\|\n                       Outerworld -O-O- woods          woods-O O O   \n                                    \\                        |/ \\\n                                   O-O                     O-O   O\n                                   |                              \\\n                                   |                               O\n                                   |                              /|\n                FOREST             O                             O O\n                SECTION            |\\\n                                   O O\n                                     |\n                                     O          ------------------------\n                                     |         /        O\n                                Rainbow Tower /        /|\\\nPink Level:|Purple Level:|Scarlet/Blue Level:|        O O O\n   O       |   U         |   D               |         \\|/\n  / \\      |   |         |  / \\              |          O  *At mound in bullywog\n O-O-O     | O-O-O       | O * O             |          |     swamp, enter mound.\n   |       |  \\ /        |  \\ /              |       entrance\n   U       |   D         |   O               |BULLYWOG HEADQUARTERS\nAt * in the mage tower, climb stairs to get to Apleve. For Apleve, tank leads and enters first. Upon entry, tank force follows other party members. Apleve falls\neasily but summons minions if you take too long.\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lanzia", x = 426, y = 81 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "marble-sanded beach", x = 373, y = 235 ,information = lwhite.."----------------Marble-sanded Beach(Newbie)------------------------------------\n        O       O   O    |*Jellyfish are one of the few species that \n        |      / \\  |    | alchemists can dissect for tendrils.\n        O-O-O-O   O-O-O  |*Down from guard.. is a maze. \n        |      \\ / \\|    | Maze solution is w:s:n:w:2 n:kill skeleton\n        O       O   O    | Run through maze to get to skeleton.\n                    |    | Search tombstone to find diamond.\n                   out   |\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mirror mine", x = 144, y = 255 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "oasis", x = 113, y = 98 ,information = lwhite.."-------------------------Oasis-------Newbie to lowbie--------------------------\n  Main area:\n                 desert maze  | Desert maze:   *Use key to get into room behind\n                /             |        3-4-5    merchant. Blanket in room is +5\n       O   :   O              |        |   |    mastery of camping.\n        \\ /    |              |        2 7-6\n         O-----O              |        | |\n               |              |        1 8    \n               O              |       /  |     follow the numbers, \n            entrance          | (start)  9  <--search sand for the key\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "obelisk", x = 263, y = 59 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "observatory foyer", x = 393, y = 482 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "oystria", x = 441, y = 278 ,information = lwhite.."-----------------------------------Oystria(Midbie)-------------------------------\n__________________________1__________________________________1:Pier\n|...........................................................|2:Antiquities	\n|...#####...#############...#############...ggggggggggggg...|3:Palace\n|...2####...#############...############3...ggggggggggggg...|4:Armoury\n|...#####...##4#######5##...#############...ggggggggggggg...|5:Weaponsmith\n|...........................................................|6:General Shop\n|...#####..._____________...#############################...|7:Temple Entrance\n|...####6..._____________...7###########################7...|8:Magic Shop\n|...#####..._____________...#############################...|9:Clerical Shop\n|...........................................................|A:Warrior Guild\n|...#####...##8#######9##...#############...#############...|B:Justice department\n|...#####...#############...A############...B############...|C:Oystria mages\n|...#####...#############...#############...##########C##...|D:Manhole leading to\n|.D.........................................................|Oystria Thieves guild\n\\-----------------------------------------------------------/\n* Ask `a strange shadowy crabman` about manhole and he will tell you the\npassword to say when you enter manhole. Say the password and a door will open\nto Dexter Xoz, use `wave` and he will open the door to let you out.\n* A ship is needed to enter the area.\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "paladin stronghold", x = 446, y = 148 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "public gardens", x = 412, y = 137 ,information = lwhite.."-------------Public Garden---Newbie, no aggressive monsters-----------\n                                         O---O\n                                         / \\ / \\\n                        O-O-O-O-O       O---O---O\n                        |X|X|X|X|      / \\ / \\ / \\\n                        O-O-O-O-O   O-O---O---O---O\n                       /|X|X|X|X|  /   \\ / \\ / \\ /\n                      O O-O-O-O-O-O     O---O---O\n                      | |X|X|X|X|        \\ / \\ /\n                      O O-O-O-O-O         O---O\n                      | |X|X|X|X|\n                      | O-O-O-O-O\n                      |        *F = forest (overworld)\n                      F-O       also newbie post at entrance.\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pyran", x = 196, y = 305 ,information = lwhite.."----------------------------------------Pyran------------------------------------\n         *O-O-O-O        * = ascend vine / descend vine \n            |   |\n            O   O        It would help you in understanding if you have read\n            |   |        the Death Gate Cycle books..If not you should do fine.\n            O   O-O      This area is one big quest,it has certain sequences \n            |\\ /         and things should be thought out.\n            O O\n              |\n              E\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ruins of kofgaad", x = 388, y = 411 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "satyr forest", x = 337, y = 114 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "sheep pasture", x = 366, y = 284 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ship navigators", x = 631, y = 97 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shipwreck", x = 480, y = 156 ,information = lwhite.."--------------------------------Shipwreck----------------------------------------\n Upstairs    Shipwreck          Downstairs:(Third Deck)\n O-O       O---O---O     ? O    O       O   \n   |      /|       |     :/|\\   |       |\n   D*    O O---U---D     O | O  O---O---U     O\n   |       |       |     |\\|    I       |     |\n K-O       O---O---O-O-O-O O    O       O-O-O-D\n                   :           *=>turn wheel, You hear a rumbling noise\n                   :              in the distance.\n              enter crack      K=>search boxes (cabin key)\n*Explore the ship with whistle given by Alandia which can creates a bubble:\n ask Alandia about ship--ask Alandia about protection--enter crack--blow whistle\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "stagira", x = 361, y = 116 ,information = lwhite.."--------------------------------Stagira-------------------------------------\n                            E-O-O--O--O-O-O-O-O--------O\n                                |     |   |   |  O O   |\n                                |     |   |   O  | |   |\n                                |     |   |      O-U   |\n                                |     |   |        |   |\n *Lots of Undead Birds          O  O  O-O-O-O-O    O   |\n                                |  |  |       |    |   |     O\n                                O--O--O--O-O--O----O-O-O     |\n                                | O O |       |      |       O\n                                | | | |       |      |       |\n                                O O-O-O     O-O-O    O-------O-O-?\n                                | |   |       |      |       |\n                                | O   |       |      |   O-O-O-O-O\n                                O--O--O---O---O--O---O       |\n                                                             O\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "the lost pyramid", x = 224, y = 45 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "tiki bar", x = 553, y = 483 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trilloch's tower", x = 656, y = 139 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "troglodyte hut", x = 84, y = 262 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "troglodyte village", x = 87, y = 257 ,information = lwhite.."----------------------------------Trog Village-----------------------------------\n           altar\n             :\n             O*    search veil to get to altar room.\n             |\n           O-O-O\n             |\n           O-O-O\n             |\n             O\n             |\n             O    +:`jump across river`,`Search bushes`to continue to room with\n            / \\   hidden trogs.`jump across river` to try to get back or failed\n    entrance   O+             the current carries you away to another new room.\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "underdark", x = 382, y = 151 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "valley of the kings", x = 63, y = 148 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "village of shrea", x = 384, y = 99 ,information = lwhite.."------------------------------Village of Shrea------------------------------------\nVillage                     |Forest\n           Forest           |   o o <- Witch\n          /                 |   | |\n   Boy-> o                  |   o o     o    *The small boy has a problem,a dog\n         |                  |    \\|     |     took his toy and ran into the woods.\n       o-o                  |     o o   o     You`ll find the dog with the toy in\n         |                  |      \\ \\  |     front of the witch`s hut. Give the\n Inn-> o-o                  |       \\ o o o   toy back to the boy and you`ll get\n         |                  |        \\|/|/    a map showing the way to Oystria.\nShop-> o-o-o <-- Church     |         o-o\n         |                  |        / \\\n       o-o-o                |       o o-o\n         |   Fields         |      /|   |\\\n         |  /               |     / o   o o\n         o-o-o <-- Granary  |Village   / \\\n        /                   |         o o-o\n       o-o-o <-- Brewery    |\n----------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "whirlpool", x = 412, y = 204 ,information = lwhite.."---Whirlpool---Newbie--You have to `dive` to enter area--------\n  entrance                              hole\n       \\                                  |     :Catacombs\n	0-0-0-0-0-0-0-0                   O\n	| | | | | | | |                   |\n	0-0-0-0-0-0-0-0                 O-O-O\n	| | | | | | | |                 | | |\n	0-0-0-0-0-0-0-0                 O O O\n	| | | | | | |                   | | |\n	0-0-0-0-0-0-0                   O-O O\n	| | | | | | |                   | | |\n	0-0-0-0-0-0-0                   O O-O\n	  | | | | | |                   | | |\n	  0-0-0-0-0-0                   O O O\n	        | | |                   | | |\n 	        0-0-0                   O-O-O\n 	        | | |                     |  \n        	0-0-0                     O\n	        | | |                     |\n	        0-0-0                     O-O-O\n	          |                       | | |\n	         hole                     O-O-O\n  (bash wall, then `hole` to catacombs)       |  \n                                          outerworld\n---------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wind tower", x = 123, y = 294 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild alchemist", x = 436, y = 151 ,information = lwhite.."-----------Alchemist`s House------------\n  House                        Basement\n    o-o <-- Trapdoor up            Up-> o-o\n      |                        The alchemists notes have been stolen. Maybe you\n    o-o-o <-- Front door       can help him by finding them?Enter fireplace,\n      |                        pull lever to open trapdoor in study.\n      o <-- Trapdoor down      In bedroom, move mirror to reveal a safe.\nFor the combination, `look to the stars`.In basement, search containers (more than once).\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild loc: tzarakk", x = 407, y = 181 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (elec)", x = 589, y = 398 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (poison)", x = 266, y = 344 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild monk", x = 392, y = 148 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild monk special (luc)", x = 201, y = 456 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tarmalen (autumn)", x = 262, y = 210 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tiger (luc)", x = 370, y = 182 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer barb (luc)", x = 382, y = 153 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer priest (luc)", x = 250, y = 298 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer ranger (luc)", x = 411, y = 165 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine catfolk", x = 244, y = 136 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine centaur", x = 396, y = 42 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine cromagnon", x = 316, y = 254 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine cyclops", x = 332, y = 278 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine lizardman", x = 255, y = 101 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine merfolk", x = 542, y = 456 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine satyr", x = 335, y = 130 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine thrikhren", x = 393, y = 194 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine titan", x = 241, y = 227 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ss kirahvi+", x = 363, y = 157 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob jungle cavalier", x = 215, y = 294 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity actium", x = 417, y = 126 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity alliance", x = 401, y = 143 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity arcanum", x = 303, y = 117 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity asimyth", x = 379, y = 160 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity baron", x = 360, y = 147 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity bittercape", x = 254, y = 195 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity breakwater", x = 409, y = 16 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity carcassonne", x = 233, y = 171 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity castle-perilous", x = 655, y = 406 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity clockwork", x = 328, y = 65 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity conquest", x = 298, y = 177 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity copenhagen", x = 424, y = 90 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity corfinium", x = 270, y = 187 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dawnhill", x = 417, y = 63 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dementia", x = 534, y = 475 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity downtown", x = 427, y = 154 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dune", x = 78, y = 98 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity elanthia", x = 283, y = 139 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity hoven", x = 144, y = 186 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity iirimameoi", x = 389, y = 87 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity illusia", x = 146, y = 203 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity inferno", x = 417, y = 103 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kanemouke", x = 411, y = 41 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kittencity", x = 397, y = 25 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity loriah", x = 428, y = 135 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity moseisley", x = 353, y = 104 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nekropolis", x = 36, y = 199 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity norsunluutorni", x = 428, y = 193 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity pluto", x = 338, y = 301 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity providence", x = 262, y = 172 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ravensflyte", x = 314, y = 137 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity scabb", x = 397, y = 159 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shadowdale", x = 352, y = 132 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity skywatch", x = 337, y = 231 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity stormhold", x = 154, y = 327 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sumuland", x = 405, y = 70 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tarkubaz", x = 337, y = 193 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity timewalk", x = 663, y = 225 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity twigaland", x = 395, y = 97 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tylarr-farms", x = 260, y = 141 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity valimar", x = 217, y = 161 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity wayrest", x = 342, y = 421 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity wildboars", x = 58, y = 135 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity wormhole", x = 401, y = 125 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity zircus", x = 242, y = 180 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity zithroland", x = 402, y = 55 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    furnachia = {
      { name = "city rilynt'tar", x = 197, y = 85 ,information = lwhite.."-----------------------Rilynt`tar(Partied midbie)----------------------------\n  +-------------------------------+   +---------------+-------+\n  |                               |   |               |Public |    CITY\n  |   +-------+   +---+-------+   +---+   +-------+   | Works |     OF\n  |   |       @   |   |       |           | Rent  |   @       | Rilynt`tar\n  |   | bank  |   +---+-------+           | room  |   +---+---+ ----------\n  |   |-------|   |   |                   @    +--|       |   |\nW |   |       |   |   |   +---+   +---+   +----+  +   +---+---| E  *To open the\n  |   |       |   |   |   |###|   |###|   @  Pub  |   @ Slums |     stuck window\nG +   +-------+   +---+   +---+   +---+   +-------+   +-------+ G   in the slum\na @                                                         * @ a   building,\nt +-----@-+           +-@-+---+   +---+---+   +---+   +-@-----+ t   type`20 open\ne |Guards |           |   |###|   |###|   |   |   |   | Guards| e   window`.\n  +-------+-@-----+   |   +---+   +---+   |   |   |   +-------+    *Basement of\n  |               |   | Post  |   |       |   +---+   |       |     of the slum\n  |               |   +-------+   +-------+   |   |   |       |     building has\n  +               |                           |   |   |       |     a toolbox\n /   Church       ++@---+ +---+   +-------+   +---+   +-------+     with tools.\n|                 /      \\|   |   |       |                   |    *`Feed mouse`\n|     and         |Irilian|   |   +---------@-+   +-----------+     to entice the\n|                 \\  HQ  /|   |   |weapon shop|   @armour shop|     little bugger\n+   RatHaus       ++----+ +---+-@-+-----------+---+-----------+     to bring you\n \\               /           S gate                                 a key.\n  +-------------+       (Featherfoot lane)\n--------Sewers:Enter from the public works room-------------Church and RatHaus---\n-------------(turn valve).Wear suits first-----------------In the church`s wine--\n                  O-O                                    |--cellar,`search hole`-\n                     \\     562   230                     |---to reveal a door---\n                      O     O     O-O-O-O-O              |         entrance-?  O\n                       \\    |    /        |              |             |       |\n                        O   O   O         O              |     O-O-----O-------O \n                         \\  |  /          |              |       |     |\\      |\n                          O O O           O              |       D   O-D-O     O\n                           \\|/ 956        |              |       :\n                    132 O-O-O-*-O     O-O-O              |  wine cellar\n                           /|\\                           |       :\n                          O O O                          |       :\n                         /  |  \\                (13 X O) |     O-O\n                        O   O   O         O-O-O->O----O  |     |X|\n                       /    |    \\        :              |     O-O\n              O-O-O-O-O     O     O       O              |      \\|\n             /       /     127     \\      |              |       O\n            O       O               O-O-O-O              |       I\n           /       /                                     |       D \n          O       O                                      |       :\n         /         \\                                     |    tunnels \nO-O-O-O-O           O       O-O-O-O-O                    |       :\n                     \\     /                             |      U/D\n                      O   O                              |       :\n                       \\ /                               |      U/D\n                        O-O-O-O-O-O-O                    |       :\n                               \\                         |      U/D\n                                O                        |       |\n                                 \\                       |\n                                  U (to outerworld)      |\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "9th plane of hell", x = 130, y = 248 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "are fortress (east)", x = 333, y = 260 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "are fortress (south)", x = 250, y = 430 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "are fortress (west)", x = 68, y = 259 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned house", x = 299, y = 112 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned temple", x = 135, y = 204 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned village", x = 141, y = 159 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ancona manor", x = 189, y = 88 ,information = lwhite.."------------------Ancona Manor----------------------------\n                    o   o           |  Manor\n                     \\ /            | o           o\n                  o---o---o         | |           |\n                      |             |*o---o---o---o\n                   cowhouse         | |   |       |\n                      |             | o  out      o\n      o---o---o---o---o---o---o     | |\n      |   |   |   |   |   |   |     | |           o\n      o---o---o---o---o---o---o     | |           |\n	  |   |   |   |   |   |     | |       o---o---o\n	  o---o---o---o---o---o     | |       |   |\n          |   |   |                 | \\       |   o\n   o      o---o---o      manor      |   \\     |\n   |u         |   |       |         |    \\upstairs\n   o          o---o---o---o         |         |\n   |u             |   |   |         |     upstairs---o\n   o              o---o---o         |\n   |u             |   |   |         |\n  enter       o---o---o---o         |\n     \\        |   |   |   |         |\n      o-o-o-o-o---o---o---o         |\n	      |   |   |   |         |\n	      o---o---o---o         |\n	      |   |   |   |         |\n	    o-o---o---o---o         |\n              |           |         |\n        o     |           |         |\n          \\   |	          |         |\n	   cottage        o         |\n	  /	          |         |\n	o	          |         |\n	              outerworld    |\n------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "atlantis", x = 68, y = 459 ,information = lwhite.."-----------Atlantis(Midbie (prob lvl 50+ party))------------------------------\n        o o             1=Temple   --o \n        |/|                           \\\n        o o o              o--o--u  d--o\n        | | |              |           |\n        o 1 o              o--o       out\n         \\ /               |  |\n          o                o\n          |               /\n         out    *Search throne to get key to unlock the door to the catacombs.\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "black marble altar", x = 158, y = 205 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "cartwheel", x = 192, y = 143 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle brantis", x = 119, y = 168 ,information = lwhite.."--------------------------Castle Brantis(Midbie)-------------------------------\n*Nice party area, good exp for newbie to mid parties and some nice eq. \n Tons of undeads, be prepared for curses and scars.\n                  bank\n                    |\n          weaponry -O- armory\n                    |\n          O         O\n          |         |\n        O-O-O   O-O-O-O-O       O\n          |    /    |    \\      |\n   river -O----     O     ------O-O-O\n                    |           |\n               bar -O- morgue  hotel\n                    |            \n                    O   O-O   Castle Brantis, up\n                    |  /   \\ /   Tunnels under Brantis, down\n                    O-D     O\n                             \\\n                              O\n                              |\n                              O\n                              |\n                          outerworld\n-------------------------------------------------------------------------------\nCastle Brantis, upper:         |Northern Tower, Castle Brantis:\n           U (northern tower)  |         chef luciano\n           |                   |              |\n  (prison  O                   | lord decanio-D-O\n   tower)  |                   |              |\n     U     U (Brantis`s tower) |              O\n      \\    |                   |\n       O-O-O                   |Tunnels under Brantis, RED:\n           |                   |       |\n           O                   |       O\n           |                   |       |\n           O                   |       O-O* \n           |                   |       |     (*press green-return to outerworld)\n      from stairs              |   press red\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle firefox", x = 417, y = 174 ,information = lwhite.."---------------------------Castle Firefox(lowbie to high) ---------------------\n                                                        | Inside the Walls:\n              :                                         |       O-*-O \n          O---O---O                                     |      /     \\\n          |   |   |                                     |     O       O\n          O---O---O                                     |     |       |\n              |                                         |     O       O\nSupply hut ---O--- Gardener`s hut (enter fireplace to   |     |       |\n              |                    get to a safe room)  |   O-O       O-O\n     -O-      O   O   O   O                             |  /             \\\n      |       |   |   |   |                             | U               U\n  O---O---O---O---O---O---O          Sadisto Run:       | |               |\n  |           |       |   |           |/(not sure from  | O               O\n  D           |      Boby O           O       here on)  | |               |\n              |           |           |                 | O               O\n              O- Jooby  O-O           O                 | |               |\n              |                       |                 | O               O\n   Captain -O-U-O                     O                 | |               |\n              |                                         | U-O-O-O-*-O-O-O-U\n         ==ENTRANCE==                                   | *  rooms with doors\n Fireguard elite at the entrance has the key to the walls.   where the key fits\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "chaos cauldron", x = 233, y = 394 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "corabandor", x = 297, y = 299 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "darkwood", x = 176, y = 161 ,information = lwhite.."----------------------------Darkwood---------------------------------------\n                            O-O-O\n                            | | |\n                          O-O-O-O-O --> O\n                          |   | | |\n                          O   O-O-O\n                           \\  |\n                            O-O\n                              |\n                              E\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "domgroth's mansion", x = 220, y = 95 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "drow tower", x = 199, y = 81 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "elven outpost", x = 165, y = 10 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "enchanted forest", x = 166, y = 244 ,information = lwhite.."---------------------Ikar`s Enchanted Forest(newbie to mid)-------------------\n         |     *M:forest maze,leads to the earth\n        -M-     elementals if you follow the correct path.\n      |  |  |     *A:agressive                         \n    --M--U--M--   *U:climb tree                 5A--Q  O     *Q:Queen\n      | / \\ |     *HE:haggard elf                 .    |     *D:down to `U`\n   |   /   \\      *P:Prince                       UP.  D\n --M--U     U--O                                      .|\n   |   \\   /   |                1HE                  D-O-D-5A\n        \\ /    A              /  |  \\                  |\n   A--O  U  A     A          /   |   \\                 D\n      |  |  |     |         /    |    \\               /\n   O  O--O--O--O--O-O-3HE-2HE--1HE.P--4HE            O\n   |  |  |  |     |         \\    |    /\n   O--O--O--O     O          \\   |   /\n         |         \\          \\  |  /\n         O          O           3HE\n         |          |\n        out      brambles   *push knothole for temple\n                    :\n             temple entrance\n                    |\n          wes wing -O- Morgoth  <-- search pile(trash) for dread lord\n                    |  (agressive)\n             3 cleric initiates\n                    |\n  temple cleric and 2 cleric initiates(enter veil for high cleric)\n                    :\n                high cleric (has cross from magic tower quest)\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ferry/furnachia", x = 190, y = 81 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "forest of the moon", x = 167, y = 168 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "haunted mansion", x = 187, y = 116 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "infection", x = 212, y = 83 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "jungle cave", x = 251, y = 346 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kingslayer", x = 330, y = 105 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kutanakor east", x = 171, y = 236 ,information = lwhite.."---------------Mines of Kutanakor(Low to mid, good for parties)---------------\nIkar added an expanded section.Blood drinker,pulsing leggings,boots of evasion come from Kutanakor. The new section has something to do with the way to baal.\n------------------------------------------------------------------------------\nFrom East Entrance:            |Second Level:   Tricks, etc:\n        pull statue            |        O       pull statue\n            |                  |        |       pull torch\n            O-O                |      O-O       push knothole (in dusty room)\n            |  \\               |        |       pull lever (to flood caves)\n          O O   O   Grabble    |        O\n          | |   |   |          |   \\    |\n   brugge-O-O   D   O          |    O-O-U-O-\n   garthac   \\      |          |        |\n              O--O--O-Felkor   |      O-O\n             /       \\         |      | |\n            O         O-O      |    O-O-O-O-O  <-- shambling mound\n         (secret?)      |      |        | | |\n                    outerworld |        O O\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kutanakor west", x = 131, y = 236 ,information = lwhite.."---------------Mines of Kutanakor(Low to mid, good for parties)---------------\nIkar added an expanded section.Blood drinker,pulsing leggings,boots of evasion come from Kutanakor. The new section has something to do with the way to baal.\n------------------------------------------------------------------------------\n   entrance--O                         |   D   O\n	      \\                        |   |  /|\n	       O--O--O                 |   O O O\n		      \\                |   | | |\n		       U               |   O-O tough to map\n		        \\              |   |\n		         O--O--O       |\n From West Entrance:       (pull torch)|  2nd lvl:\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lost vale", x = 210, y = 440 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ndoki", x = 168, y = 331 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "necromancer's swamp", x = 270, y = 135 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "nocilis valley", x = 200, y = 201 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old fort", x = 77, y = 269 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "orc samurai", x = 209, y = 95 ,information = lwhite.."----------------Samurai(Midbie parties)--------Location of LQ 62----------------\nFortress:                                     |  Outside:\n    O-O-O-O-O-O                               |          O-O-O-O-O-O-O-O\n    |   |   | |                               |          | | | | |     |\n    O O O O-O-O O                             |          O-O-O-O-O     O\n    | | | | |   |                             |          | | | | |     |\n    E-O-O-O-O---O            O-O              |   entrance-O-O-O-X     O\n    | | | | |   |            | |              |          | | | | |     |\n    O O O-O-O-O D --->   U-O-O-O-O-O          |          O-O-O-O-O     |\n    |   | | | |   O-O-O-O  |       |          |          | | | | |     |  \n    O-O-U-O O O   |     |  O       O-O   O    |          O-b-O-O-O-O-O-O\n                  O   O-O          |     |    |  X = Fortress entrance, \n        |         |   | |        O-O-O   O    |      guarded by 2 samurai orcs\n        |         O   O-O        |   |   |    |  b = boulder, `move boulder`\n        |         |   | |        O O O-O-O    |\n        |         |   O |        | | |        |\n        +----->   O-D-O-O        O-O-O        |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "orthanc", x = 310, y = 220 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "perin's", x = 272, y = 175 ,information = lwhite.."----------Perin`s--recommend parties for anything other than Mole area-----------\n                                                      O   O\n                                                       \\ /\n                                                        O\n                                                      /   \\       O\n       Enter                                         /     \\     /\n       O-----O  To Citdel                           O       O   O\n       |  down                                     /         \\ /\n       |  O----O Skeleton                         O           O\n       |  |                                       |           |\n       |  |  O Psi Guard and Feral Man            O           O\n     __|__|__|__                                   \\         /\n     |         |      O                             O       O\n     |  Maze   |      | down                         \\     /\n     |_________|      |                               O-O-O\n          |           | up                              |\nO---------O-----------O---------------------------------O\n          |           Cave                            out\n----------O Entrance----------*To enter where the bones are, `enter exit`.-------\nperhaps the Citdel:\n    +---------------------------------------+\n    |...ppppppppppprrppppppppppp....ppp.p1..|        1. Noquar\n    |...pppppp2pppprpppppppppppp....pp..pp..|        2. Despana\n    |...pppppppppprp.ppppppppppp....ppp.pp..|        3. Eisevis\n    |...pppppppr.rpp.pppppppppppppAppp.ppp..|        4. Aleval\n    |...ppp.plll.rpp3.ppppppppppppsppppppp..|        5. Male warrior\n    |...4ppppplrrrppppppppppppppppsppppppp..|        6. Fem warrior\n    |...pppppppppppppppppppppp....sppppppp..|        7. Tomtor\n    |...pp....pppppppppppppp......s....ppp..|        8. Kilsak\n    |...ppppppp.pppp..pppssssssssssssss5p...|        E= Exit\n    |...pppssssssssssssssppppppppppppppppp..|        A= Drow city\n    |...pp6p..ppp..pppsppppppppppppppp......|\n    |...pppppp7p......E.ppppppppppppp8pp....|\n    +--------------------------------------------------------+ \nMole Cave:                      |*There are 10 maze rooms in Perin`s maze,\n           O-O-O-O-O-O-O----O   | and four exits.One is the entrance`arch`.\n           | |   |          |   | One is called `The end of the plains`.\n           O-O O O O        O   | One has exit has two mobs in it.\n           |   | | |        |   | The last exit is the castle.\n           O O-O-O-O-O-O-O  O   |*command perinsarch 3 w;4 nw;n;ne;n;ne;n\n           |     |          |   | command perinsferal 3 w;4 nw;n;ne;n;ne;sw\n         O-O     O          O   | command perinsend 3 w;4 nw;n;ne;n;se\n           |     |          |   | command perinsentrance 3 w;4 nw;n;ne;n;2 ne;n\n           O   O-O-O        O   | This means `homing sequences`.Anywhere in the\n           |     |          |   | rooms of Perin`s maze follow the sequences\n         O-O-O   O          O   | will lead to the same end.\n           |     |          |   |*Maybe sequence 3  has a trapdoor going down.\n           O  entrance      O   | `open trapdoor` takes you into a laboratory\n           |                |   | with a sinister demon that isn`t aggro at first\n           |                O   | but will aggro soon.\n           |                |   |\n           O-O-O-O-O-O------O   |\n                   |            |\n                   d            |\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "plakhstan", x = 327, y = 127 ,information = lwhite.."------------------Plakhstan------------------\n\n                 Hut (Aggros, Blocks Out)\n                /\n             O-O\n             |\n             O------O\n             |     / \\\n           O-O-O  ?   ? ---> Locked Doors\n             |\n             O\n             |\n             E\n---------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "priest guild special place", x = 298, y = 336 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rillion's castle", x = 301, y = 185 ,information = lwhite.."-------------------Rillion`s----------------\n              O              |     O O\n              |              |     | |\n      E(nter)-O-O O-O-O-O-O  | D-O-O-O-O\n              |   | | |      |   |   |\n              O-O-O-O O      |   O   O\n                  |          |\n                 U/D         |\n---------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rounce", x = 76, y = 108 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "secret jungle", x = 321, y = 339 ,information = lwhite.."-----------------Secret Jungle(Newbie solo and newbie party area)---------------\nSavage village:      |Cave:(partial, excluding tower)\n           O         |              bridge\n           |         |           O-O-O-x-O-O\n  jungle-O-O-O-chief |           |         |\n           |         |           *         O-tower(unknow how to get in)\n           |         |           |\n           |         |       O-O-O-O  * = `kill stream` to attack lava elemental\nc=cave   | c O       |       |   |    x = `kill flames` to attack fire elemental\n           | | |     |       |   O\n*=elemental| * O     |       | \n           | | |     |     wind\n           O-O-O-O   |   entrance\n           |   |     |\n           O O-O-O   |\n               |     |\n             jungle  |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "steaming cavern", x = 397, y = 304 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of aljerak", x = 279, y = 214 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of chaos", x = 220, y = 107 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "temple of the twisted prophecies", x = 98, y = 205 ,information = lwhite.."--------------Temple of Twisted Prophecies---------Midbie parties----------\nTemple, downstairs:      Temple, upstairs:\n                  |         O-O-O    \n                  O           |       *Ethereal hellion casts some aweful\n                  |         O-O-O      ep-draining spell even when not\n                  U-          |        attacked (and at invis players)\n                            O-D-O\n--------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trilloch zoo", x = 177, y = 297 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "under volcano", x = 214, y = 155 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "volcano", x = 289, y = 146 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wanderer maze", x = 312, y = 237 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "xoff's gaming den", x = 318, y = 361 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "zonni swamp", x = 143, y = 305 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild lord of chaos", x = 205, y = 120 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (fire)", x = 405, y = 308 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild monk special (furn)", x = 223, y = 234 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild nergal", x = 380, y = 218 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild wanderers", x = 311, y = 242 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer barb (furn)", x = 200, y = 118 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer monk (furn)", x = 195, y = 104 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer ranger (furn)", x = 204, y = 95 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine animist totem (furn)", x = 143, y = 161 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine barsoomian", x = 258, y = 394 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine demon", x = 200, y = 235 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine doppelganger", x = 43, y = 172 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine draconian", x = 364, y = 62 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine drow", x = 132, y = 241 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine duergar", x = 221, y = 202 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine orc", x = 325, y = 173 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #1", x = 288, y = 180 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #2", x = 182, y = 149 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #3", x = 172, y = 300 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #4", x = 74, y = 94 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #5", x = 230, y = 234 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #6", x = 49, y = 477 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #7", x = 98, y = 370 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine spider #8", x = 338, y = 348 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine troll", x = 297, y = 231 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine vampire", x = 333, y = 193 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob badlands cavalier", x = 277, y = 123 ,information = lwhite.."----------------------------Shadowkeep(Newbie to High)--------------------------\n                                             +    +\n                  The map of Shadowkeep      |Nrth|\n                    1995 / 2000 edition      +gate+\n                                             |    |\n          ,----+----+----+----+----+----+----`    `----+     The stronghold\n          |         s l a u g h t e r            Sewers|        in the\n          +    ,-----------------------------.    ,----+    eastern frontier.\n          |    | Prison Complex              |Fnt |\n+----+----`    `-----------------------------`    `----+   C    City of\n W.gate             g a r r i s o n                    | K A honor, justice\n+----+----.    ,---------.    ,---------.             -- E S      and\n          | r  | Shayedem| h  | Genstore| M a r k e t    E T unknown perils.\n          + a  |         | o  |         |  p l a c e  -- P L\n          | n  | Imposing| n  |Tow Magic|     Wll      |   E Amarth Shadowstring\n          + s  |  Conserv| o  |         |              +   Bard`s Amphitheatre,\n          | o  |Eqs      | r  | Armourer|              |   back stage:  O\n          + m  `---------`    `---------`              `----+----+      |\n          |         c a n t i c l e                              |      U-O O\n          +    ,--------------.    ,------------------------. h  +      |  /\n          |    |Clb           |    | Bank Pub       Wpnsmth | u  |  O O-O-O-O\n          +    |              |    |                        | m  +   \\  |/\n          |    |         Rent |    | Great Library    Temple| b  |    O-O-O\n          +    `--------------`    `------------------------` l  +   /| |\n          |         t a l e   t e l l e r s`                  e  |  O O O\n          +----+----+----+----+----+----+----.    ,----+----+----+      |\n                                             | Dck|                     U\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    rothikgen = {
      { name = "city shadowkeep", x = 224, y = 271 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "abandoned study", x = 213, y = 124 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ackbar's quest", x = 346, y = 296 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "amberley mansion", x = 220, y = 345 ,information = lwhite.."----------Amberley Mansion-----------\n  First Floor: | Second Floor:             | cabinet\n  O-O   O-O    |       cabinet-O   O-O     |    o       o\n    |   |      |               |   |       |    |       |\n  O-O   O-O    |               O O O-O     |    o-u/d-o-o\n    |   |      |               | | |       |    |\n    O   O      |   grandma   O-O O O-O     |    o\n     \\ /       |                \\|/        | Edward\n      U        |                 D         |\n      |        |                 |         |\n   mansion     |                 O  Ralph  |\n      :        |\n      O-house  |\n      |        |\n   entrance    |\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "anaconda ruins", x = 332, y = 405 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "barbarian arena", x = 277, y = 131 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "battlefield", x = 186, y = 311 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "beaumont hamel", x = 145, y = 185 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "campsite", x = 227, y = 139 ,information = lwhite.."--------------------------------Camp Site(Midbie)-------------------------------\n                    O (pool)      |\n                   /              |\n                  O               |*Aggressive monsies must appear in the entry\n                 /                |      room in order for the exit to appear.\n                O                 | If monsies are not present, the rest of the\n               / \\                |               area will not be accessible.\n            O-O-O *  (5 aggrs)    |\n              |   |               |\n              O   O               |\n                  |               |\n               entrance           |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle severus", x = 115, y = 216 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle of lord drauron", x = 185, y = 306 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "cavern", x = 186, y = 315 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "caverns of chaos", x = 385, y = 250 ,information = lwhite.."------------------------Caverns of Chaos---------------------------------------\n              O  (move rock somehow to continue into the area)\n             /\n          O-O* (some message is engraved on a boulder)\n             \\\n              O\n               \\ \n                entrance\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "cevi village", x = 233, y = 128 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "dark forest", x = 306, y = 161 ,information = lwhite.."----------------------Dark Forest(Partied midbie)-------------------------------\n                              O                        |   City:\n                              |                        |\n                     Sewers:  O-d                      |   Pennywise the Clown\n                                 \\                     |              |\n                                  u-O-O   O-O-O-O-O-u  \\            --d\n                                  |           |     |   \\             |\n  Forest:               O-O       O     O     O     O    \\            O\n                          |       |     |     |     |     \\           |\n              O-cross-O   O-O-O   O     O     O     O      \\____     O-O\n              |       |   |   |   |     |     |     |   |       \\     |\n              O       &-O-O   O-d.u-O-O-O-O   O-O   O-O-*=       \\    O\n              |           |       |     |     |     |   | spider  \\   |\n Entrance-O-O-O           O       O     O     O     O             /   O\n              |           |             |     |     |      ______/    |\n              O           O             O     O    ***    |   u       O\n                          |             |     |     |     |   |       |\n                        O-O-O-O-d.u-O-O-O-O-O-O           |   O-O-O-O-d-O\n  & climb ladder, climb       |   |                       |_____________________\n                              O   |    *Huge spider,aggressive, tough.\n                        O-O-O-O-O-O   ***Pennywise..but he may wander,not sure.\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "donaru", x = 344, y = 382 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "drugstore shack", x = 356, y = 269 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "duck commune", x = 139, y = 139 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "encampment1", x = 185, y = 309 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "encampment2", x = 187, y = 313 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "evil vale", x = 141, y = 113 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ferry/rothikgen", x = 265, y = 430 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "feldspar training camp", x = 278, y = 294 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "forest in the valley", x = 398, y = 285 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "giant killers", x = 28, y = 399 ,information = lwhite.."----Giant Killers---Newbie to midbie---*Very sweaty foreman(killing cloud)----\n              petting zoo              |Petting zoo:\n                  :                    | D-O-O-O-O-U*(jump in river, tread) \n                  O-O (search lockers) |     |\n  entrance        |                    |     O-O (clean coop --> caverns)\n     outerworld   |                    |     |\n	      |   |                    |   O-O\n	      O   O-O  (exa boxes)     |     |\n       	      |   |                    |  entrance\n	      O   O-O O                |-------------------------------------\n	      |\\_ |   |                |Things to do:\n	      O  \\O---O                | search dresses\n	      |                        | exa shelf\n	      O                        | jump onto shelf\n	      |                        |*  In room with colossal guard, search\n	  O-O-U-O-D                    |   grass to find a tiny grasshopper \n	  |                            |   (item, held slot).\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hack", x = 313, y = 324 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "harazam tower", x = 396, y = 255 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hell's dojo", x = 163, y = 69 ,information = lwhite.."-------------Hell`s Dojo------Partied newbie to mid-----------------------------\nFIRST LEVEL:\n                  O-O-O-O-O      |*Get key from sensai in cage, then go down\n		  IXIXIXIXI      |through door on nw corner, big ninjas see\n    (out)         O-O-O-O-O dojo |invisible, all are aggressive.\n      d   d       I\\IXIXIXI area |*Outside amnet`s hut try to climb rope and go\n  O-O-O-O-O-O-O - O-O-O-O-O      |north to meet lady elberiel, she`s ~30k. You\n                  I/IXIXIXI      |can accept quest from her.\n    O - O-O       O-O-O-O-O      |*2 east from the dojo entrance try to pull\n  ranger   u      IXIXIXIXI      |chunk and you`ll get the key to the cage.\n   hut            O-O-O-O-O      |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hill giants", x = 246, y = 84 ,information = lwhite.."--------------Hill Giants---Midbie and highbie parties-------------\nBase of the Hill:              |Middle of the Hill:\n          O-O                  |          O\n         /   \\                 |           \\\n    O-O-O    *U-O              |            O-U/D*\n       / \\\n      O   U....U/D....O\n      |               |\n      O         O-    O\n                :\\    /\n                O O-O\n                 \\ /\n                  O\n---------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "horn-durath", x = 221, y = 265 ,information = lwhite.."--------------------Tower of Horn Durath(Newbie to midbie)----------------------\n   First Level:         |Second Level:|   Third Level:          |Fourth Level:\n           O-O-O   U-D  |  U/D        |           O             |      O\n           | | |   |    |   |         |           |             |      |\n  entrance=O-O-O=O-O    | O-O         |       U/D-O-O (2 aggrs) |    O-O-O-O\n           |            |             |           |             |      | |\n           O-O          |             |           O-O           |      O U/D\n                        |             |          /|             |\n                        |             | *portal O O             |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "horsehead mountain", x = 380, y = 203 ,information = lwhite.."------Horsehead Mountain (AKA Snootlings)----lowbie/midbie solo/parties----\n              O     |Entrance = (`enter portal` to leave)\n             /      |* = Blocking ogre\n        G-O-O       |T = T the snootling\n          |         |I = You may idle/regen here safely\n  O-O     O         |N = Nathan the defender\n  | |     |         |G = Gate\n  O-O-* w O O       |t = A very old oak called Treeulf (`search tree`)\n  | |   | | |       |W = Wolves (`follow wolf`)\n  O-O   O-O-O-O-O   |H = Hut\n  | |   | | | | |   |S = Snootlings (`search box`)\n  F-O-S-O-O-O-O-G   |B = A big brown bear (idle)\n  | | | | | | | |   |F = A fox with lovely red fur (idle)\n  O-O-T-O-B-O-O-O   |w = Waterfall, `ravine` takes you to blocking ogre\n  | | | | | |       |R = A little white killer rabbit (idle)\nO-W-O-O-O-H-O       |*(idle) monsters will attack if you idle.\n| |   |             |* Exit the area at the portal (marked as E) with `enter\nt-G   Entrance      |  portal`.  The portal may do a small amount of damage \n  |   |             |  to you as you pass through.\n  O-O-O             |\n  | |               |\nO-N-O               |\n| | |               |\nO-O-I               |\n  | |               |\n  O-R               |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ice castle", x = 453, y = 31 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "inn of the four winds", x = 295, y = 384 ,information = lwhite.."-------------------------Inn of the Four Winds-------------\nFirst Floor:        |Second Floor:| Third Floor:\n        O           |     O O     |O=D=O\n        :           |     : :     | /\n  O=O---O-O         |   O=O-U/D---+\n    |   : |         |     | :     |   *  Search fireplace\n  O=U=O O |         |     | O     |\n          |         |     |       |\n        O-entrance  |   O=D=O     |\n        | |         |             |\n        O-O         |             |\n-----------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kalevala", x = 104, y = 100 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kath'vael forest", x = 231, y = 261 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "king eowyn's land", x = 220, y = 148 ,information = lwhite.."-------King Eowyn`s Land---newbie to mid-------\n                       O               O\n                        u/d          u/d\n             CASTLE      O           O\n                          \\         /\n     stairs  King    stairsO-O-O-O-O\n         O   O              \\|X|X|/\n         |   |             O-O-O-O-O\n         O-O-O              /|X|X|\\\n           |               O-O-O-O-O\n           O-O            /    |    \\\n           |             O O-O-O-O-O O\n         O-O           u/d     |     u/d\n                       O     O-O       O\n                            /|X|\n                           O-O-O\n                           |X|\\|\n                     O-O   O-O-O\n                     |X|  /\n                     O-O-O-O  FOREST\n     Dragons           |X|X|\n                     O-O-@ O         @ = out\n       O-O-O         |\\|/|X|>O\n      / /=\\ \\        O-O-O-O\n     O O O O O  Bear/|/   \\|\n     |  \\ /  | O---O  O O O\n     O   O   O  \\ /   | |/\n      \\     /    O    O-O-O-O   O\n       O-O-O          |\\   \\|  /|\n         |            O-O   O-O-O-O\n         O           /      |/|/|/|\n       crack        /       O-O-O-O\n         O     O O-O          |/|/|  POND\n         |Hydr/|/|X           O-O-O\n         O O O-O-O-O\n        / /  |X|X / SWAMP\n       O O   O-O-O\n       | |  /  |\n       O-O-O   O\n------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "kintril church", x = 420, y = 261 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lighthouse", x = 133, y = 452 ,information = lwhite.."-----------------------Lighthouse(Newbie)----------------------------\n    Lighthouse                            |Caverns: \n                        O                 |    U (to lighthouse)\n                       / \\                |    |\n                      /   \\               |    D   O\n                     /     \\        O     |    |   |\n            1       /       \\      / \\    |    O---O-O\n          O-U -->  D   U*    O   *D   O   |    |   |\n          |         \\   \\   /      \\ /    |   U/D  D\n  E       O          O   \\ /        O     |    |   |\n   \\     /|          |    O               |    O---O\n    O-O-O-O          D                    |\n         \\|        climb                  | Maze with random reset; \n          O         down                  |   here`s an example.\n----------------------------------------------------------------------\n 1:need something from one of the other ship key areas to get past the\n   forcefield at the staircase? there are 4 areas, one on each cont.\n   Maybe the thing needed is in deso, at the pier.\n----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "lonely mountain", x = 148, y = 51 ,information = lwhite.."----------Lonely Mountain-----------\nSecond Level:   |First Level:\n          :     |   entrance\n          O     |       |\n          |     |       O\n          O     |       |\n          |     | D-O-O-O\n          O\n          |\n          O\n          |\n  O=O     O\n  :       |\n  O-O-O-O-O=\n  :        \\\n well       O\n             \\:\n              O-O  (search shelves)\n              |\n              O-U  (to first level)\n------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "marble shrine(?)", x = 252, y = 334 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mirkhold", x = 321, y = 220 ,information = lwhite.."----------------------------Town of Mirkhold-----------------------------\n      Temple           |Temple:             |   Secret room:\n        :              |        O           |   Morator Cain\n        O-O-O          |        :  key?     |        |\n        |              |        O         O |        O  (2 elder spirits)\n        O              |        |         | |        |\n        |              |        U  ...... D |     stairs\n    O-O-O-O            |        |           |        |\n    |   |              |    O-O-O-O=O       |     stairs\n    O-O O   O          |        |           |        |\n    |   |   |          | Temple entrance    |   secret room\n    O-O-O-O-O          |--------------------------------------------------\n        :              |\n entrance  (open gate) | *In temple library, `move book` to reveal lever.\n--------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "moongate", x = 353, y = 200 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mushroom hill", x = 166, y = 198 ,information = lwhite.."---------------------------Mushroom Hill(Midbie)--------------------------------\n            | | |\n           -S-O-O-             *`S` is where you arrive after typing `bushes` in\n        | | | | | | |           the outerworld.\n       -O-O-O-G-O-O-O-         * It is easy to walk `off the map`,\n        | | | | | | |            Use `exits` frequently.\n       -O-O-O- -O-O-O-         *It seems that `G`shrooms are tougher than the `g`\n        | | |   | | |           `g` ones.which block the ways into the center.\n     -O-O-O-     -O-O-O-\n      | | |       | | |\n     -O-g-    R    -G-O-            R = replicator mushroom\n      | | |       | | |\n     -O-O-O-     -O-O-O-\n        | | |   | | |           * Mushrooms can be skinned to produce vegetation\n       -O-O-O- -O-O-O-            about half of the time, so the area is an easy\n        | | | | | | |             place to score some kgs of vegetation for\n       -O-O-O-g-O-O-O-            merch/alchs.\n        | | | | | | |\n           -O-O-O-\n            | | |\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "navigator maze", x = 352, y = 269 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "noran's attic", x = 340, y = 398 ,information = lwhite.."------------------Noran`s Castle-----newbie (solo and party)---------------\n              O \n              | \n              O \n              | \n           3*U/D \n              | \n              O      1*  type `swim`, then `dive` to get to Kaffrer Filter. \n              |      2*  aggresive Durty Orc is here. \n              O      3*  to `U` Noran the ex-wizard, nice newbie cash mosie. \n              | \n              O \n              | \n          1*O-O \n              | \n              O-O-O*2 \n              | \n              O \n              | \n            ENTER \n----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "norse cave", x = 386, y = 184 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "norse village", x = 425, y = 231 ,information = lwhite.."-------------------Norse Village(newbie to midbie)--------------------\n 		           O     Pelitar   (hardest,eq dester)  \n			   |\n			   O-O   Felcar    (bit harder)\n			   |\n                 Alton   O-O-O   Gudruk    (bit harder)\n			   |\n                Ashfor   O-O-O   Reswald   (harder)		     \n                           |\n                Gevies   O-O-O   Bettie    (both easy)  		    \n			  / \\\n                  entrance   O   Felix     (second hardest,eq dester)\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "nun maze (nw)", x = 258, y = 255 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old copper mine", x = 76, y = 158 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old forest", x = 240, y = 330 ,information = lwhite.."--------------Old Forest------------\n                O-O-O-O-O=O-O\n                |\n                O  \n                |\n            O-O=O\n            |   I\n          O-O-O O O-O-O\n          | | | | | | |\n        O+O-O-O-O-O-O-O\n          | | |   | | |\n          O-O-O   O-O-O\n            |\n            O\n            |\n         entrance\n------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pauper's castle", x = 62, y = 315 ,information = lwhite.."-------------------------Pauper`s Castle---partied mid-------------------------\n                 |\n   reservation-O-O     *To get to the mapped area: n, w, w from tree, wait till\n                 |      you fall down to elementals, then say `open portal`.\n--------------entrance---------------------------------------------------------\nThe Maze area:                   Old Indian Reservation:\n           o     o\n          /     /\n         o   o-o   \n         |  /  |\n         o o   o   o-o\n         | |   |  /  |\n o o o   o o   o o   o o-o\n | | |  / /   /  |    /   \\\n o-o-o-x-o-o-o   o-o-o     o\n | | | |    \\   /     \\   /\n * o o o     o-o       o-o\n |     |     |  \\         * - move boxes or push barrels to go to nosractic\n o     o     o   o        x - Tarmalen Priestess, the only\n       |      \\  |            summable/relocable/dimdoorable room.\n       o       o-o \n       |\n       o\n       |\n       o\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "perilous forest", x = 319, y = 396 ,information = lwhite.."----------Perilous Forest-----Newbie to lowbie-----good soloing place------------\n                 O   O       | E - entrance                  | Church: Danger!\n                /|\\ / \\      | V - village   C - church      | Hard aggressives.\n               O-O-O-O-O     | * - army camp,                |      |\n              / \\| |\\| |\\    |   several aggressives         |    O-O- \n     T-O   O-O   O-O-*-O O   | H - hut   T - tunnel          |      |\n     |  \\  |  \\   \\| | |/    |                               |   entrance\n     O   O O O O-O-O-O-O-O   |*Leader says `Please, help me. |------------------\n    / \\ / \\| | |    \\| |/    | Go to the hills and return the| Village:\n   O   O C-O-O-O-O O-O-O     | symbol of this village, the   |        barkeeper\n   |       | | | |\\|  \\|     | statue. I will reward you.    |    O-E-O\n   O-O-H   O-E-O-O O   O     |*Church:die soon for the weak. |      |\n    \\|    /   / \\|/ \\ /|     |                               |    O-O-O\n     O---O   O   O   V-O     |                               |      |\n                     | |     |                               |    O-O-O leader\n                     O-O     |                               |cleric\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "plateau of tsang (closed)", x = 336, y = 102 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "psi quest area", x = 200, y = 270 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "roth-unknown #1 (closed)", x = 398, y = 340 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rendburg", x = 222, y = 71 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ruins of unta'r trinit", x = 428, y = 213 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "smurville", x = 218, y = 255 ,information = lwhite.."------------Smurfville--Newbie to lowbie------------\n		      o\n		      |\n		    o-o-o\n		    | | |\n		    o-o-o-o   o-o\n		    | |	|       |\n		    o o o       o\n		      |         I\n		      o         o\n		      |	       /\n		      o       o\n		      |       |\n		      o---o---o\n		      |   |   |\n		      o---o---o\n		      |   |   |\n		      o---o---o\n		      |   |   |\n		      o---o---o\n	              |	      |\n		      o       |\n			      |\n			      |\n		          shadowgate\n			      |\n		          outerworld\n----------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "snow peaked mountain", x = 158, y = 147 ,information = lwhite.."------Snow Peaked Mountain--Midbie or higher, some tough aggressives----\n                 |\n                 *     * = room with aggrs (incompletely mapped)\n                 |\n               O-*-O                     ?\n                 | |                     :\n               O-O-O-U ---> Up X 4 --->  O  ---> Up x 2 --->\n                 |   |\n                 *   O\n                     |\n                     E\n-------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "snow devils", x = 257, y = 245 ,information = lwhite.."----------------Snow Devils(Midbie and up, solo and parties)---------------------\n                        O---Daedalus\n                        |   |\n                        O---wolf\n                        |   |\n                        O---snowman\n                       /\n                      snowdevil   \n                     /       *To open Daedalus` portal, drop the wings in the\n                    O         room where you kill Daedalus and press the button.\n                   /          The portal only lasts for a short time (perhaps 2\n                  O           minutes) before it disappears.\n                  |\n                  O-Outerworld\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "spider cave", x = 392, y = 294 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "stonehenge", x = 358, y = 186 ,information = lwhite.."----------Stonehenge----------level quest 61-------------------\n             ?   *The herb shop is very safe to visit,\n            /    *the area quest is suitable for lvl 50+ party.\n           O-?\n           |\n           O-O-O\n           | | |\n           O-O-O\n           | | |\n           O-O-O\n           | |\n           | O\n           |\n         O-U-O\n           |\n           O\n-----------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "syggax base camp", x = 265, y = 437 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "syggax fields camp", x = 87, y = 343 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "syggax forest camp", x = 358, y = 285 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "taiga", x = 288, y = 60 ,information = lwhite.."-----------------------Taiga (aka Tundra)------lowbie to mid--------------------\n                        O-O\n                        |\\|\\\n           mammoths   O-O-O-O\n                     /| |X|\\|\\\n                  O-O-O O-O-O-O\n                  | |/| | |\\| |\n                O O-O-O @-@-O-O          @ = additional exits      \n                |\\ \\|X| | | | |\n                O-O O-O O-O-O-O\n               /| |    /| | | |\\\n            O-O-O-O-O-O-O-O-O-O-O* sabretooth\n            |X|X| |      \\|X| | |                 \n            O-O-O-O O-O-O O-O-O-O\n              | |/| | | | |X| | |\n              O-O-O O-O-O O-O-O-O\n              | |/  | | |   | | |\\\n              O-O O-O-O-O-O O-O-O-O\n                  |     | | |/\n          deer  O-O O-O O-O-O\n                | | | |   |/  lynx\n                O-O O-O-O-O\n                    | |/    *Riitu exclaims `Sometimes Riitu has lotsss fun\n          tarpan  O-O-O      by surfing with the ice floe!`\n                    |       *Riitu exclaims`The river bringsss the floesss near\n                entrance     the ssshore and Riitu jumps on them for a ride!`\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trader's house", x = 286, y = 107 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "treehouse winery", x = 412, y = 96 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "village of aldor", x = 84, y = 112 ,information = lwhite.."-----------Village of Aldor--------------\n                :  *see the right part to continue the exploring...\n            O-O-O  move wood, enter gap (to enter and exit)\n            |\\|/          |   O-O-O     |Tunnel with aggressive kobolds\n            O-O           |  /  |  \\    |\n             /|\\          | O   C   O   |C = commander\n            / O O         |  \\     /    |\n           /   \\          |   \\   /     |\n    O   O /     O-O   hut |    \\ /      |\n     \\ / /       \\        |     O       |\n      O-O       O O O     |     |       |\n                 \\|/      |     O       |\n    farmhouse     O-O-O   |_____:_______|*start here\n                  |     bakery\n              O O O\n              | | |\n              O-O-A=O-*  aggr ant          A = alley\n              | | |      in alley\n              O O O-O\n                  |\n   Elder`s hut  H-O-O  *search bookshelves  *read potions and poisons\n                  |\n                  O\n                  |\n              entrance\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wormhole", x = 412, y = 243 ,information = lwhite.."------------Worm Hole---Mostly newbie----randomly generated---------------\n* Peer does not work in this area.\n* Sometimes, you will `slip on some slime` and move in a random direction.\n* Earthworms are not aggressive, but do block exits, sometimes\n  preventing you from leaving a room.\n* Earthworms grow from one size to the next, so if you are trapped by\n  a small earthworm and you do not want to teleport out and start over,\n  kill it while it is still small.\n---------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild barbarian", x = 370, y = 244 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild beastmaster", x = 128, y = 169 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild loc: kharim", x = 257, y = 233 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (asphyx)", x = 84, y = 396 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild mage (cold)", x = 297, y = 72 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild monk special (roth)", x = 277, y = 283 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild navigator", x = 340, y = 273 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild nun", x = 248, y = 255 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild psionicist", x = 168, y = 281 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild riftwalker cave", x = 163, y = 225 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tarmalen (winter)", x = 149, y = 108 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "guild tiger (roth)", x = 236, y = 348 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer priest (roth)", x = 170, y = 195 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "trainer ranger (roth)", x = 218, y = 285 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine brownie", x = 77, y = 372 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine duck", x = 137, y = 148 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine giant", x = 331, y = 123 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine gnome", x = 327, y = 264 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine moomin", x = 269, y = 314 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine penguin", x = 338, y = 71 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine valar", x = 237, y = 246 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine windshriek forest", x = 110, y = 427 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shrine wolfman", x = 103, y = 201 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "ss swe+", x = 227, y = 260 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob athanel", x = 437, y = 219 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob bufloogh", x = 395, y = 254 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob cyclon", x = 423, y = 239 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob goathead", x = 397, y = 236 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob red hawk", x = 399, y = 264 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob silver", x = 376, y = 260 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "mob skyrider cavalier", x = 246, y = 45 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity atlantis", x = 219, y = 308 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity batdiamondinc", x = 282, y = 207 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity bullerbyn", x = 236, y = 231 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity castle-ewige", x = 35, y = 372 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity compton", x = 386, y = 268 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity crabfroth", x = 149, y = 249 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity darkvale", x = 262, y = 160 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity darkwoods", x = 301, y = 220 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity deimos", x = 236, y = 243 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dentistador", x = 183, y = 293 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity destiny", x = 318, y = 384 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity dragonsleap", x = 210, y = 288 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity fevre", x = 371, y = 123 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity giza-plateau", x = 243, y = 302 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity gomorra", x = 334, y = 385 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity grayskull", x = 136, y = 469 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity hayhead", x = 304, y = 381 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity herdville", x = 128, y = 188 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity highwood", x = 287, y = 259 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity huntingcamp", x = 235, y = 271 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity iron-islands", x = 113, y = 276 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity islay", x = 110, y = 49 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity ithilien", x = 74, y = 86 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity junkyard", x = 175, y = 317 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kauhajoki", x = 240, y = 363 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kelly", x = 206, y = 246 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity kostovalikapale", x = 270, y = 232 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity loserville", x = 227, y = 317 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity manadrain", x = 246, y = 241 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity mossad", x = 423, y = 134 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nampa", x = 253, y = 438 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nieuw-amsterdam", x = 175, y = 269 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity nitroplut", x = 244, y = 140 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity otieno", x = 168, y = 290 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity phatt", x = 37, y = 397 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity pielavesj", x = 369, y = 55 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity portal", x = 299, y = 208 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity rautasaari", x = 201, y = 168 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity revalanneva", x = 336, y = 250 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity rivendell", x = 353, y = 258 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity saturday", x = 231, y = 289 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity sepulchre", x = 275, y = 250 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity shimville", x = 280, y = 236 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity teamonetwenty", x = 210, y = 265 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity thalarion", x = 405, y = 214 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity tortuga", x = 110, y = 187 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity valgerville", x = 227, y = 329 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity wihneland", x = 201, y = 261 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity xanadu", x = 261, y = 281 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pcity xian", x = 122, y = 50 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    renard = {
      { name = "renardy harbour", x = 47, y = 36 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "st. patric's abbe", x = 20, y = 21 ,information = lwhite.."incomplete"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
    unknownow = {
      { name = "akira", x = 0, y = 0 ,information = lwhite.."--------------------------------------------\nSecret rooms omitted.Rooms marked with `k` have a mob with a key.\nThe old man`s story:The man looks very excited that someone has finally come to talk to him.  He immediately starts to tell you the history of this realm.  He begins:...\nNotes:  - Shake web, paper falls from it.  Paper says `Modar`.\n  Entrance to Akira:   Level 1 of Cave:\n  entrance                     E\n     :                         |\n    U/D                        o\n     :                        /|\\\n    U/D                      o o o   k\n     :                       | | |   |\n    U/D-cave                 o o o   o\n     :                      /| | |\\ /\n   trail                   / o o o o\n  Level 2 of Cave:        / /  | |\n  o o                    o o   o o-D\n  | |                   /   \\\n  U-o-o-o              o     o\n  | |                   \\   /\n  o o                    o-k\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "amazons/alch tower/mist", x = 0, y = 0 ,information = lwhite.."-----------------------------------------------------------------------------\n  tunnel:U       |    1st floor:  o-o-o        |   2nd floor:  |  3rd floor:\n         |       |                  |          |     o  o  o   |      o\n         O       |                  D          |      \\ | /    |      |\n         |       |                  |          |    o--d/u--o  | o--d/u--o\n         O       |                  o          |      / : \\    |      |\n         |       |                  :          |     o  o  o   |      o\n         o       |                  o          |-----------------------------\n         |       |                  |          |         4th floor:\n         o       |        maze      o   o o-o  |            d:?\n         |       |        | | |    /|\\  | :    |-----------------------------\n         o       |    leave-o-o:o-o-o-o:o-U-o  |  : = door/gate\n         |       |        | | | |  \\|/  : | :  |     (several different keys)\n         o-o-o   |        maze  o   o   o o o  |  ? = unknown (gasp!)\n         |       |-----------------------------------------------------------\n         o       |from the paths `leave` room(from misty woods entrance), go:\n         |       |`n,w,n,w,n,w` to get to amazons se corner\n       leave     |`3 n,e,d` to get to mouth of the underground orc cavern\n-----------------------------------------------------------------------------\n   Amazons:            |  Misty Woods Caverns: |\n    to gagnorog        |  o-o o-o o-o   o-o    | U = up\n         |             |    |   | | |   |      | : = door\n   o-o-o-o-o-o-o       |  o-o o-o-o o-o-o      | ? = unknown\n   |     :     |       |  |   |   |   |        | X = u/d\n   o U o-o-o-U o       |  o-o o o-o-o o o-o    | (the four up rooms in the corners\n   | |   |     |       |  |   |       | |      |  are just one-room dead ends)\n   o o ?:o ? o o       |  o-o-o-o-o   o-o o    |\n   | |   | : | |       |  |   |         | |    |\n   o:o-o-X-o-o:o       |  o o-o-o o-o-o-o o    |\n   | | : |   | |       |    |   |   |     |    |\n   o o ? o:? o o       |  o-o-o o-U o o o o    |\n   |     |   | |       |    |   |   | | | |    |\n   o U-o-o-o U o       |  o-o-o o o-o-o o-o    |\n   |     :     |       |    |   |         |    |\n   o-o-o-o-o-o-o       |  o-o-o o   o-o-o-o    |\n         |             |    |   |     |        |\n    to gagnorog        |  o-o-o-o-o-o-o-o      |\n-----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "crimson brigade", x = 0, y = 0 ,information = lwhite.."-------------------Crimson Brigade(no aggressives)--------------------------\n                  O                D           O-O\n                  |                |           |U|\n        O-O O-O-O-O-O O          U-O-O-O-O-O-O-O\\O\n        | | |       | |            |           |D\n        O-O-O       O-O            O O         O\n            |       |              | |         |\n        O-O O       O-O            O-O-O-O-O-O-O\n          | |       |              |     |     |  \n          O-O-O     O-O            O     O     O\n            |       | |            |           |\n          O-O-O-O-O-O-O            O           O\n            | | | | | |            |           |\n        O-O-O-O-O-O-O-O-O-O      U-O-O-O-O-O-O-O-U\n        |U/D    |      U/D|        |           |\n        O-O     O       O-O        D           D\n                |\n               OUT\n---------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "the dump", x = 0, y = 0 ,information = lwhite.."-----------------------The Dump(Newbie, lowbie)--------------------------------\n  Main Area       Climb Heap\n     O-O            D-O   *There is a lower level in the dump where there is\n       |              |    some kind of a cave.You need to enter hole in heap\n     O-O-O            D    and go down.There is at least 1 mob.\n       |      *jump planking (takes 400 to 800 hp, drops you 1 ne of entrance)\n    entrance   get pillow,climb heap,search money(on heap),search items.\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "bat city dungeons", x = 0, y = 0 ,information = lwhite.."---------------------Bat City Dungeons(Partied low to mid)-----------------\n D <--Rainbow Colored Portal\n |       |                     O\n O       |			\\ /\n |       |			 O       O= (only the pure may pass)\n O       |	       |        /       /\n |       |	       O-O-O-O-O-O-O-O-O O= (only the pure may pass)\n O       |		       |       |/\n |       |		 ?pad  O-O-O-O-O\n O       |		       |\n |       |		       O\n O       |			\\\n |       |			 U\n U       |\n :       \n outerworld\n--------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "frozen valley", x = 0, y = 0 ,information = lwhite.."-------------Frozen Valley--------Midbie parties------------------------------\n            blizzard                     O   O   O\n               |                         |   |   |\n      (cave) 3-O-blizzard                O   O   O\n   |           |                         |   |   |\n   *-O-*-O-*-2-O-O-D(miner`s hut)--------U-O-O-O-O\n               |                    *  agr monsie\n               1 -> enter hut       2  enter car\n               |                    3  climb out\n            entrance                Cave:entrance-O\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "glade", x = 0, y = 0 ,information = lwhite.."--------------------------Glade(Newbie solo)--------------------------\n                       O-O-O-O\n                       | | | |\n                     O-O-O-O-O-O\n                     | | | | | |\n                   O-O-O-O-O-O-O\n                   | | | | | | |\n                   O-O-O-O-O-O-O\n                     | | | | |\n                     O-O-O-O-O\n                     | | | |\n                     O-O-O-O---- entrance\n-----------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "goblin caves", x = 0, y = 0 ,information = lwhite.."-----Goblin Caves---Newbie---requires the player be of size 60 or smaller----\n               0\n               |\n             0-0-0-0   0\n               |   |   |\n             0-0   0-0-0\n             |     |   |\n             0-0-E-0   0         E = entrance\n             |   |     |\n             0-0 0   0-0\n               | |   |\n               0-0-0-0\n                     |\n                     0\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "castle halberdheath", x = 0, y = 0 ,information = lwhite.."-------Castle Halberdheath------Home of LQ 49, Ivory Blades----------\nFirst Floor:                  |Second Floor:   | Third Floor:\n        O                     |      |         |     :\n	|                     |	     O         |     O\n	O                     |	     |         |     |\n	|                     | O-O-U/D-O-O    |O-O=U/D-O-O\n O-O-stairs-O=? (locked area) |      |         |     :\n	|                     |	     O         |     O\n	O                     |      |         |     |\n	|                     |      O         |     O\n	O                     |      |         |     |\n	|                     |	     O         |\n	O                     |	     |\n	|                     |	     O <-- food and water\n     entrance                 |\n---------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "hobbit farmhouse", x = 0, y = 0 ,information = lwhite.."--Hobbit Farmhouse---newbie--Village of Shrea has some nice newbie cash items--\n              O   O\n              :    \\\n              O   O O\n              |  / \\ \\\n              O O   \\ \\   O\n               \\     \\ \\ /\n                \\---O-O-O \n                     \\ / \\           Forest\n                    O-O-O O-O\n                    |    /|/|\\    |*In shack, search sacks to find the trapdoor\n                    O   O O-O O   | that leads to the cellar.\n                           /|     |*Yumra holds the key to the wife`s treasures.\n                          O O     |*In farmhouse bedroom:  make bed, sleep on\n                          |       | bed, move mirror (to hide/reveal safe).\n                        O=O       | In sitting room, enter fireplace.  Look at\n                          |       | chimney.  Pull lever to operate the\n                    O U=O=O       | trapdoor below the telescope.\n                    | | | |       |*To get a map, give the soldier from the\n                    O-O O | O-O   | mongrel dog in the forest to the lost boy in\n                          | :     | the Village of Shrea.\n                        O-O-U-O      Village of Shrea\n                          |\n                          |   O-O-O\n                          |   |X|X|\n                        U=O=O O-O-O\n                          |  /\n                          O-O-U\n                         /  \n                        / D        O\n                       /  |        |\\\n   O-U     entrance   O-O-O    |---O O-O\n     |            |  /    |    |      X|\n   O-O-O-O-O--O-O-O-O     O    |     O |\n     |            |            |     | |\n  basement      O-O            |     O |\n                  |\\           |       |\n                 =O O-O-O      |       O\n                  | |X|X|      |      /\n                O-O O-O-O      | O-O-O\n               /    |          |   |\n              O   cellar-------|   O\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "joseph's", x = 0, y = 0 ,information = lwhite.."---------------------------------------------------\n        o  <-- Bodor the master archer\n        |\n        o\n        |\n  o-o-o-o-o-o-up\n        |\n        o           ( `=` and `I` are locked doors ) \n        |\n        o           o-o\n        I          /\n      o-o-o   o-o-o-o-o\n      | | |   |    \\\n    o=o-o-o=o-o-o   o\n    | | | |   |     |\n    o o-o-o   o     o   <-- lizard man gladiator\n        I     \n        o\n        |\n        o\n        |			    \n      o-o-o\n      | | |\n      o-o-o\n      | | |\n      o-o-o\n        |\n        o\n---------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "katvil forest", x = 0, y = 0 ,information = lwhite.."--------------------------Katvil Forest--------------------\n                               O\n                               |\n                     U     O   O\n                     |     |   |\n                 O-O-O-E-O-O-O-O\n                 |     |   |\n                 O     O   O-O-O-O O-O\n                               |   | |\n                               O-O-O-O-O-O\n                                   | | |\n                                   O-O O       O-O\n                                       |       | |\n                                     O-O-O-O-O-O-O\n                                           |\n                                           O\n-----------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "old bat city", x = 0, y = 0 ,information = lwhite.."-------------------Old Bat City(newbie to mid)---------------------------------\n  Old Bat City:              |The Catacombs:\n                out          |*Map randomly generated, changing each boot.\n                 ^           | The catacomb map shown is just an example.\n                 |           |  map G1 (ground level):\n                 o     o     |  o o-o-o-out            (D) \n                 |     |     |  | |               o o / |\n           C-o-o-o-----o-o   |  o-dd-----\\down    | | | d\n                 |     |     |  |         \\-(U)-u-u-u | |\n    C=catacombs  |   o-o-o   |  o-DD---             |/  o\n OCP=old central |     |     |    |    \\            U   |\n     park        |   o o     |  D-o     \\ down          o\n                 |   |       |  |\\______ \\----(U)-u-o   |\n               o-o---o-o     |  o-o     \\               o\n              /  |    \\      |           \\down          |\n       out<--o--OCP----o->out|  o-o-o-o-o \\             o\n              \\  |    /      |        |    \\\n             o-o-o---o-o     |      o-o-o   \\    *lots of aggressive monsters\n              /  |    \\      |        |      |   *`u`or`d`lead to a dead end of\n             o   o-o-o o     |    o-o-o-o o /     one or two rooms\n                 |     |     |        |   |/\n                 o     o     |      o-U--(U)-o-o\n                       |     |        |\\     |\n                       o-o   |      o-o \\    o\n------------------------------           \\________\n                                            d-o   \\             o \n                                              |    \\            |\n                                            o o  o |         o-(U)-o\n                                            | |  |/            /|\n                                 (U)---     o-o-(D)    _______/ o\n                                  |    \\    | |  |    /\n                                  U-o   ---DD o  o   /         o  u--o\n                                  |              |  /          |  |\n *room with two exits             o-o            o-dd-o-o-D    o-(U) o\n  portal(OCP),maze(catacombs).    |              | |       \\_____/|  |\n  It also has a sparkling         o          o-o-o o--o   o       o--o\n  dragon(nonagr) blocks way       |              | |      |       |\n  trough the portal.   <--------enter        o-d-o o--o-o-o       o-o\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "pig farm", x = 0, y = 0 ,information = lwhite.."------------------Pig Farm----------------\n                  O-O\n                 /| |\\\n                O-O-O-O\n                  |\n              O-O-O-O-O\n                |   |\n                | O |   O\n                O | |   |\n                | O-O---D  ---->  U-O\n                | |\n                O-O-O-O\n                    |\n                    E\n-------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rain forest", x = 0, y = 0 ,information = lwhite.."--------------Rain Forest----------Newbie to partied lowbie-----------------\n                                    O-lord-O  (touch painting)\n                                    |\n                O-O-O-O-O-O-O-T-O-cave\n                | | | |       | |\n                O-O-O-O       O-O   *At the `T`, climb tree to get to\n                | | | |       | |    the baboon village.\n    entrance -O-O-O-O-O       O-O\n                | | | |         |\n                O-O-O-O         O\n                                |\n                                O\n                                I\n                              O-O-O\n                                |\n                                O\n                                |\n                                O-O\n                                |\n                                O\n----------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "reavers", x = 0, y = 0 ,information = lwhite.."---------Reavers---------Good for partied lowbies to midbies---------\n   `1st` floor:       down from there:\n       d                     \n       ;                 ? o-o   ?\n       u o               : |  \\ /\n       | |               o o   o  <-- (aggro, blocking) necromancer \n       o-o--o ?           \\|    \\    ______________________________\n         |  | :            u     ?   | O	(Entrance Reddist)\n    o-o--o  o o            |         | |\n    | |  |    |            o         |U/D	(Level 1)\n    o-o-u/d-o-o-o          |         | |\n      |  |  | |            o-o       |U/D 	(Level 2, a torch)\n      o--o  o o              |       | |\n      |  |                   o:?     |U/D      (Level 3, see left)\n   ?1:o--o-o                         |-----------------------------\n         | |                ?1:  O-O\n         o-o:?                   |\n         :       :=door          O\n         ?       ?=unknown\n--------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "rudraprayag", x = 0, y = 0 ,information = lwhite.."---Rudraprayag---Midbie parties---\n     O\n     |\n     O       entrance\n      \\     /\n       O-O-O\n           |\n           O       O-O\n           |       |\n           O   O-O-O\n            \\ /  | |\n             O   O-O\n             |\n             O\n            /\n           O \n           |\n           O\n           |\n           O\n           |\n           O    You can climb ladder\n           |    just before the bridge.\n       O   O \n       :    \\ \n       O=O   O=O\n        / \\: |\n       O   O-O=O-O\n           |\n         O=O\n           |\n           O   O\n          / \\  |\n     O-O=O   O-O\n         |\n         O\n         |\n         *\n          \\\n           *\n           |\n     O-O-O-O\n     | |    \\\n     O-O     O \n             |\n             O\n             :\n----------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shadowdale / dalesman", x = 0, y = 0 ,information = lwhite.."--Shadowdale/Dalesman--partied lowbie to mid--beware the agressive guards--\nGround Floor:                           |First Floor:\n                    Doorway/Hall        |                   Stairway 2\n                          .             |             O-O-O-O   O\n                           .            |                \\|X|  / \n         River      Stairway 2   Drain  |                 O-O-O \n           O-O-O-O-----=-----O---O      |                 |/ / \\ \n               |\\            |   |      |                 O O   O \n               O-O           |   |      |                 |      \n               |\\            |   |      |                 |  \n               | \\       O   |   O      |               O |     O O\n               |  \\      =   |  /|      |  Stairway 1   | |     | |\n               |   =     O-, O-O O      |           O-O-O-O-O-O-O-O \n               |    \\    = | |X|        |           | |   |   | \n               =     O   O `-O-O        |           O O   O-O O O O \n               |    /|\\     /           |    Stairway to     \\| | |\n               |   / O =   =            |    River room.      O-O-O\n               |  /     \\ /             |    (One way)        | | |\n               | /       O              |                     | O O\n  Stairway 1   |/        |              |                     | \n           O-O-O         |              |                     O-O\n           |X|X|         |              |\n           O-O-O         |              |\n             |           |              |  *In room with static wall, \n             =           |              |   `enter wall`.\n             |           |              |  *In room with latch on wall,\n           O-O-O         |              |   `flip latch`to reveal the armoury.\n           |X|X|                        |\n           O-O-O---- entrance           |\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "shadowkeep prison", x = 0, y = 0 ,information = lwhite.."------------------Shadowkeep Prison----Newbie to partied mid--------------------\n SHADOWKEEP PRISON          BOTTOM LEVELS\n         O              O       O    *In the bathroom, you can do the obvious\n        /|\\             |       |     and be rewarded with a toilet-candy.\n       O | O        U   O-O-O   O              O\n       | D |         \\  | |     |              |           O-O\n       O | O          O-O-O-O-O-O-D ---->  O-O-O-U  --->   | |\n        \\|/          /  | |     |          | |             O O\n         O          O   O-O     O          O O             | |\n         |              |       |          | |             O-O\n         O-O            O       O          ? ?\n         |        *One of the rooms in the 3rd basement floor requires an\n       O-E         Antidepression Pill to escape.\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "swamp", x = 0, y = 0 ,information = lwhite.."-------------------------------Swamp----Newbie-----------------------------------\nSwamp		Inside Center               Hole\no-o-o               o-o-o                      o\n|   |                 |                   exit hole\no   o               o-o   o\n| | |                 |   |    *In the room between two locked doors,`worship`.\no-o-o                 o-o-o    *In the eastern locked room, get interesting jar\n|x|x|                 |   \\hole\no-o-o               o-o-o\n  |                   |\n  o\n  |\n  o\n---------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "vulcan", x = 0, y = 0 ,information = lwhite.."-----------------Vulcan (Volcano)------Lowbie to mid------------------\n                                                     O Hera\n                                                     |\n                                                     O\n                                                     |\n                              O                      O\n                             / \\                     ` golden gate\n              O             O   O P -ride pegasus-   O\n             /|\\           d \\ /\n            /out\\          u  O\n           /  O  \\         O\n          /   |   \\        d \n         /  O-O-O  \\      climb up\n        O   +   d   O      +\n         \\       u\n          \\       O                   Misc. commands in area:\n           \\      |                   accept (king)\n            \\   O-O-O                 climb up\n             \\    |                   ride pegasus\n              O   O\n          start\n-------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wainamoinen", x = 0, y = 0 ,information = lwhite.."----------------Wainamoinen-------------Midbie and up--------------------\n                                               |Alternate O O ~ O\n                     |                         |map       | | | |\n                    -O-                        |          O-O-O-O-~\n                 | | |  maze                   |          | | | |\n                 O-O-O- area   ---->  kalevala |      ~   | ~ ~ ~\n                 | | |                    O    |      |   |\n                 O-O-O-                   |    |    ~-O O O-O*\n             | | | | |                  O-O-O  |      | | |\n            -O-O-O-O                    | |    |    ~-O-O-O-O\n             | | | |                  O * O-O  |      | | | |\n             O-O-O-O-O-O              | | |    |  ~-O-O-O-O-O-O-O\n               | | | | |              O-O-O-O  |    |   | | | | |\n             O-O-O-*-O-O                       |    ~   O-O-E-O-O\n               | | | |      * = entrance       |          | | |\n               O-O-O-O                         |        O-O-O-O\n------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "wizard of Oz", x = 0, y = 0 ,information = lwhite.."------------Wizard of Oz----Newbie----but blorts are aggro be careful----------\n     L 0\n     | |\n     O-0                L=Blort Leader\n       |                D=Dorothy and Toto\n       0-0-0            B=Bambi\n       |                E=Entrance\n       0-0 0-X          X=Exit - type enter balloon to leave \n         | |\n       E-0-0-0    * To leave the area, enter the hot air balloon.\n         | |      * Wells can be entered by using `climb well`.\n         0 0-D    * Trees can be climbed by using `climb tree`.\n         |        * Wolverine sometimes follows you.\n         0        * There are secrets in this area..explore to figure them out.\n         |\n         B\n-------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "soaring woodhelvin", x = 0, y = 0 ,information = lwhite.."------------------------Soaring Woodhelvin----------------------\n                                    U\n                                   / \\\n                                  O   O\n                                   \\ /\n                                    O\n                                    ^\n                                    |\n                       U            U            O\n                      / \\          / \\          / \\\n                     O   O  <--   U   U   -->  O   O\n                      \\ /          \\ /          \\ /\n                       O            E            O\n-----------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "zebell's", x = 0, y = 0 ,information = lwhite.."---------------------Zebell`s-----------Partied low to mid-----------------------\n               |                            O\n               O-O~~jump window        / \\\n               |                 window   O\n               O                       \\ /\n               |                     |      O~~climb tree,\n               O~~~path              |      enter to get to plane of hades:\n               |                     |    O (Evil Priest of Knights of Darkness)\n               O                     |    |\n               |                     |    U ~~ go up to get to By-tor\n            entrance                 |    |\n               |                     |    O\n               O                     |    |\n               |                     |    O\n           O-O-O-O-O                 |    |\n             | | | |                 |    O-Ravine of the Dead\n             O-O-O-O-O-O-O-black oak |    |\n             | | | |                 |    O (path, off)\n             O-O-O-O                 |\n             | | | |                 |\n             O-O-O-O                 |\n               |                     |\n--------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
      { name = "island (wrebies)", x = 0, y = 0 ,information = lwhite.."----------------Island (Wrebies)-----------Newbie to lowbie--------------------\n         O-O-O               |Southwestern Tower:|  Cave:\n         | | |               |  O-O-U2           |     entrance\n         O U O               |  | | |            |         :\n         |   |               |  O D O            |       U/D-O\n         O-O-O               |  |   |            |        |  |\n           |                 | 1U-O-O            |        O--D\n           O                 |                   |	     :\n           |                 |1st Floor of Tower:|          U/D\n           O  stone golems   | O-D               | 	     :\n           |                 | | |               |           U-O-O\n           O                 | O-U               |\n           |                 |                   |\n           O                 |2nd Floor of Tower:|  *The two golems at the\n           |                 | O-O               |   entrance to the golem tower\n      cave-O-O   O O O       | | |               |   block the gate.\n           | |   | | |       | U-D               |  *You must kill them to get\n           O-O-O-O-O-O-O     |                   |   the horn, then blow the\n           |     | | | |     |3rd Floor of Tower:|   horn to open the gates.\n           O     O O O O     | D-O               |\n           |                 |                   |\n       entrance              |                   |\n------------------------------------------------------------------------------\n"..lwhite2.."\n", bottonset = "nil", mobkind = "nil" },
    },
  }
  
  if string.sub(val, 1, 6) == "search" then
    if locations.unknownow then
      for i, city in pairs(locations.unknownow) do
        if city.name:find(val:lower():match("search%s(.+)")) then
         if option_portrait then
          AppendLineToWindow('batscmsgwindow',city.information)
         else
          Note(city.information)
         end
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
              if option_portrait then
                AppendLineToWindow('batscmsgwindow',nearestCity.information)
              else
                Note(nearestCity.information)
              end
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
              if option_portrait then
                AppendLineToWindow('batscmsgwindow',nearestCity.information)
              else
                Note(nearestCity.information)
              end
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
              if option_portrait then
                AppendLineToWindow('batscmsgwindow',nearestCity.information)
              else
                Note(nearestCity.information)
              end
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