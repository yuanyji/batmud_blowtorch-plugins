--debugPrint("package path:"..package.path)
--package.path = "/mnt/sdcard/BlowTorch/?.lua"

require("serialize")

RegisterSpecialCommand("setcbt","set_showcombat")

local current_version = 14

scWindow = GetWindowTokenByName("combat")
AppendWindowSettings("combat")
scWindowName = "combat"

currentChannel = "main"
buffers = {}
buffers[currentChannel] = scWindow:getBuffer()

combatjudge = false
function set_showcombat(val)
	if(val == "true") then
		combatjudge = true
	else
		combatjudge = false
	end
	showcombat()
end

function showcombat()
	if combatjudge then
		WindowXCallS(scWindowName,"combatbarshow")
	else
		WindowXCallS(scWindowName,"combatbargone")
	end
end



function OnOptionChanged(key,value)
	--Note("\n scWindow in on option changed, key:"..key.."\n")
	local func = optionsTable[key]
	if(func ~= nil) then
		func(value)
	end
end



function setWindowSize_portrait(size)
	--Note("\nin setWindowSize()"..size.."\n")
	local layouts = scWindow:getLayouts()
	local keys = layouts:keySet()
	local iterator = keys:iterator()
	while(iterator:hasNext()) do
		local key = iterator:next()
		local layoutGroup = layouts:get(key)
		layoutGroup:setPortraitHeight(tonumber(size))
	end


end


function setWindowSize_landscape(size)
	--Note("\nin setWindowSize()"..size.."\n")
	local layouts = scWindow:getLayouts()
	local keys = layouts:keySet()
	local iterator = keys:iterator()
	while(iterator:hasNext()) do
		local key = iterator:next()
		local layoutGroup = layouts:get(key)
		layoutGroup:setLandscapeHeight(tonumber(size))
	end


end

function setExtraGag(val)
	if(val == "true") then
		option_gag_extra = true
	else
		option_gag_extra = false
	end
end

function setExtraAdd(val)
	if(val == "true") then
		option_add_extra = true
	else
		option_add_extra = false
	end
end

optionsTable = {}
optionsTable.height_portrait = setWindowSize_portrait
optionsTable.height_landscape = setWindowSize_landscape
optionsTable.gag_extra = setExtraGag
optionsTable.add_extra = setExtraAdd

--RegisterSpecialCommand("http","testHttp")

function EchoText(text)
	AppendLineToWindow(scWindowName,text)
end

