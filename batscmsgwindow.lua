--sc information
--potion
local luajava = luajava
local System = luajava.bindClass("java.lang.System")
local View = luajava.bindClass("android.view.View")
local Context = luajava.bindClass("android.content.Context")
local HorizontalScrollView = luajava.bindClass("android.widget.HorizontalScrollView")
local ScrollView = luajava.bindClass("android.widget.ScrollView")
local FrameLayout = luajava.bindClass("android.widget.FrameLayout")
local ImageView = luajava.bindClass("android.widget.ImageView")
local Drawable = luajava.bindClass("android.graphics.drawable.Drawable")
local GradientDrawable = luajava.bindClass("android.graphics.drawable.GradientDrawable")
local RelativeLayoutParams = luajava.bindClass("android.widget.RelativeLayout$LayoutParams")
local RelativeLayout = luajava.bindClass("android.widget.RelativeLayout")
local LinearLayout = luajava.bindClass("android.widget.LinearLayout")
local LinearLayoutParams = luajava.bindClass("android.widget.LinearLayout$LayoutParams")
local MotionEvent = luajava.bindClass("android.view.MotionEvent")
local Array = luajava.bindClass("java.lang.reflect.Array")
local Color = luajava.bindClass("android.graphics.Color")
local File = luajava.bindClass("java.io.File")
local BitmapDrawable = luajava.bindClass("android.graphics.drawable.BitmapDrawable")
local ImageButton = luajava.bindClass("android.widget.ImageButton")
local Button = luajava.bindClass("android.widget.Button")
local TextView = luajava.bindClass("android.widget.TextView")
local TranslateAnimation = luajava.bindClass("android.view.animation.TranslateAnimation")
local AnimatedRelativeLayout = luajava.bindClass("com.offsetnull.bt.window.AnimatedRelativeLayout")
local RectF = luajava.bindClass("android.graphics.RectF")
local RoundRectShape = luajava.bindClass("android.graphics.drawable.shapes.RoundRectShape")
local ShapeDrawable = luajava.bindClass("android.graphics.drawable.ShapeDrawable")
local LayerDrawable = luajava.bindClass("android.graphics.drawable.LayerDrawable")
local StateListDrawable = luajava.bindClass("android.graphics.drawable.StateListDrawable")
local R_attr = luajava.bindClass("android.R$attr")
local Class = luajava.bindClass("java.lang.Class")
local Gravity = luajava.bindClass("android.view.Gravity")
local Integer = luajava.bindClass("java.lang.Integer")
local Float = luajava.bindClass("java.lang.Float")
local Byte = luajava.bindClass("java.lang.Byte")
local Typeface = luajava.bindClass("android.graphics.Typeface")

IntegerInstance = luajava.new(Integer,0)
IntegerClass = IntegerInstance:getClass()
RawInteger = IntegerClass.TYPE
FloatInstance = luajava.new(Float,0)
FloatClass = FloatInstance:getClass()
RawFloat = FloatClass.TYPE
ByteInstance = luajava.new(Byte,0)
ByteClass = ByteInstance:getClass()
RawByte = ByteClass.TYPE

local context = view:getContext()
local vibrator = context:getSystemService(Context.VIBRATOR_SERVICE)
local DisplayView = view
local density = GetDisplayDensity()
local WRAP_CONTENT = LinearLayoutParams.WRAP_CONTENT
local MATCH_PARENT = LinearLayoutParams.FILL_PARENT
local wm = context:getSystemService(Context.WINDOW_SERVICE)
local display = wm:getDefaultDisplay()
local displayWidth = display:getWidth()
local displayHeight = display:getHeight()

function vibratetime(val)
  vibrator:vibrate(tonumber(val))
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

rootnewView = DisplayView:getParentView()

iconwidth = 120
iconheight = iconwidth
hpheight = 40
textsize = 4*density
chatwidth = 740
option_portrait = GetOptionValue("portrait")

if option_portrait == "true" then
iconsize = displayWidth / 8
iconsize2 = iconsize/3*2 - 4
singleWidth = displayWidth / 2
barheight = iconsize2 + 3*hpheight + 4
barwidth = displayWidth-2*iconwidth
mapwindowHeight = 480
mapwindowWidth = displayWidth
else
iconsize2 = (displayWidth - 68 - 320) / 8
iconsize = iconsize2 / 2 * 3 - 4
singleWidth = (displayHeight - chatwidth) / 2
barheight = 3*hpheight + 4
barwidth = (displayHeight - chatwidth)-2*iconwidth
mapwindowHeight = iconsize2 * 8 - 2
mapwindowWidth = chatwidth - 4 - iconsize
end

--Note(singleWidth.."+"..barheight)

--Note(displayWidth..displayHeight)

function stoptgtgag()
  PluginXCallS("stoptargetgagserver","")
end

function stoptargetgag()
  ScheduleCallback(105,"stoptgtgag",300)
end

 barView = luajava.new(RelativeLayout,DisplayView:getContext())
 barParams = luajava.new(RelativeLayoutParams, barwidth, barheight)
 barParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
 barParams:setMargins(iconwidth, 0, 0, 0)
 barView:setLayoutParams(barParams)
 
 HPView = luajava.new(RelativeLayout,DisplayView:getContext())
 SPView = luajava.new(RelativeLayout,DisplayView:getContext())
 EPView = luajava.new(RelativeLayout,DisplayView:getContext())
 EXPView = luajava.new(RelativeLayout,DisplayView:getContext())
 
 
 bg_HPView = luajava.new(RelativeLayout,DisplayView:getContext())
 bg_SPView = luajava.new(RelativeLayout,DisplayView:getContext())
 bg_EPView = luajava.new(RelativeLayout,DisplayView:getContext())
 bg_EXPView = luajava.new(RelativeLayout,DisplayView:getContext())
 
 tv_HPView = luajava.new(TextView,DisplayView:getContext())
 tv_SPView = luajava.new(TextView,DisplayView:getContext())
 tv_EPView = luajava.new(TextView,DisplayView:getContext())

barView:setId(900100)
HPView:setId(900101)
SPView:setId(900102)
EPView:setId(900103)
EXPView:setId(900104)

bg_HPView:setId(900106)
bg_SPView:setId(900107)
bg_EPView:setId(900108)
bg_EXPView:setId(900109)

tv_HPView:setId(900111)
tv_SPView:setId(900112)
tv_EPView:setId(900113)

barView:addView(HPView)
barView:addView(EXPView)
barView:addView(SPView)
barView:addView(EPView)

barView:addView(bg_HPView)
barView:addView(bg_EXPView)
barView:addView(bg_SPView)
barView:addView(bg_EPView)

barView:addView(tv_HPView)
barView:addView(tv_SPView)
barView:addView(tv_EPView)

 singleParams_1 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
 singleParams_1:addRule(RelativeLayout.ALIGN_PARENT_TOP)
 singleParams_1:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 HPView:setLayoutParams(singleParams_1)
 singleParams_4 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
 singleParams_4:addRule(RelativeLayout.BELOW,900101)
 singleParams_4:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 EXPView:setLayoutParams(singleParams_4)
 singleParams_2 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_2:addRule(RelativeLayout.BELOW,900104)
 singleParams_2:addRule(RelativeLayout.LEFT_OF,900103)
 SPView:setLayoutParams(singleParams_2)
 singleParams_3 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_3:addRule(RelativeLayout.BELOW,900104)
 singleParams_3:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 EPView:setLayoutParams(singleParams_3)
 
 
 singleParams_5 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
 singleParams_5:addRule(RelativeLayout.ALIGN_PARENT_TOP)
 singleParams_5:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 --singleParams_5:addRule(RelativeLayout.CENTER_HORIZONTAL)
 bg_HPView:setLayoutParams(singleParams_5)
 singleParams_8 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
 singleParams_8:addRule(RelativeLayout.BELOW,900101)
 singleParams_8:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 bg_EXPView:setLayoutParams(singleParams_8)
 singleParams_6 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_6:addRule(RelativeLayout.BELOW,900104)
 singleParams_6:addRule(RelativeLayout.ALIGN_LEFT,900102)
 --singleParams_6:addRule(RelativeLayout.LEFT_OF,900103)
 bg_SPView:setLayoutParams(singleParams_6)
 singleParams_7 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_7:addRule(RelativeLayout.BELOW,900104)
 singleParams_7:addRule(RelativeLayout.RIGHT_OF,900102)
 bg_EPView:setLayoutParams(singleParams_7)
 
 singleParams_10 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
 singleParams_10:addRule(RelativeLayout.ALIGN_PARENT_TOP)
 singleParams_10:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
 tv_HPView:setLayoutParams(singleParams_10)
 
 singleParams_11 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_11:addRule(RelativeLayout.BELOW,900104)
 singleParams_11:addRule(RelativeLayout.LEFT_OF,900103)
 tv_SPView:setLayoutParams(singleParams_11)
 singleParams_12 = luajava.new(RelativeLayoutParams,singleWidth-iconwidth,hpheight)
 singleParams_12:addRule(RelativeLayout.BELOW,900104)
 singleParams_12:addRule(RelativeLayout.RIGHT_OF,900102)
 tv_EPView:setLayoutParams(singleParams_12)
 

--local font = Typeface.create(Typeface.MONOSPACE, Typeface.DEFAULT_BOLD)
tv_HPView:setTextSize(textsize)
tv_HPView:setGravity(Gravity.CENTER_HORIZONTAL)
tv_HPView:setTypeface(Typeface.MONOSPACE)
--tv_HPView:setTypeface(Typeface.DEFAULT_BOLD)
tv_SPView:setTextSize(textsize)
tv_SPView:setGravity(Gravity.CENTER)
tv_SPView:setTypeface(Typeface.MONOSPACE)

tv_EPView:setTextSize(textsize)
tv_EPView:setGravity(Gravity.CENTER)
tv_EPView:setTypeface(Typeface.MONOSPACE)
--bg_EXPView:setBackgroundColor(Color:argb(100,108,250,102))
--bg_SPMaxView:setBackgroundColor(Color:argb(110,360,284,452))
--bg_EPMaxView:setBackgroundColor(Color:argb(110,400,224,132))

rootnewView:addView(barView)

ENMView1 = luajava.new(RelativeLayout,DisplayView:getContext())
ENMView2 = luajava.new(RelativeLayout,DisplayView:getContext())
ENMView1:setId(900105)
ENMView2:setId(900110)
singleParams_9 = luajava.new(RelativeLayoutParams,barwidth,20)
singleParams_9:addRule(RelativeLayout.ABOVE, 900100)
singleParams_9:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
singleParams_9:setMargins(iconwidth, 0, 0, 0)
ENMView2:setLayoutParams(singleParams_9)
singleParams_19 = luajava.new(RelativeLayoutParams,barwidth,20)
singleParams_19:addRule(RelativeLayout.ABOVE, 900110)
singleParams_19:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
singleParams_19:setMargins(iconwidth, 0, 0, 0)
ENMView1:setLayoutParams(singleParams_19)
rootnewView:addView(ENMView1)
rootnewView:addView(ENMView2)
--imguri = GetPluginInstallDirectory().."/bg.jpg"
--resources = view:getContext():getResources()
--target = luajava.new(BitmapDrawable,resources,imguri)
--inputView:setBackgroundColor(Color:argb(100,358,100,100))


innerDividerView = rootnewView:findViewById(40)
innerDividerViewLayoutParams = innerDividerView:getLayoutParams()
topDividerView2 = luajava.new(View,innerDividerView:getContext())
if option_portrait == "true" then
topDividerView2Params = luajava.new(RelativeLayoutParams,innerDividerViewLayoutParams.width,1)
else
topDividerView2Params = luajava.new(RelativeLayoutParams,displayHeight-chatwidth,1)
end
topDividerView2:setId(9107)
topDividerView2:setLayoutParams(topDividerView2Params)
topDividerView2:setBackgroundColor(Color:argb(255,136,136,136))
rootnewView:addView(topDividerView2)
topDividerView2LayoutParams = topDividerView2:getLayoutParams()
topDividerView2LayoutParams:addRule(RelativeLayout.ABOVE,900105)
topDividerView2LayoutParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
topDividerView2:setLayoutParams(topDividerView2LayoutParams)

--ENMView1:setBackgroundColor(Color:argb(1,1,0,1))
--ENMView2:setBackgroundColor(Color:argb(1,1,0,1))
ENMView1:setVisibility(View.GONE)
ENMView2:setVisibility(View.GONE)

tv_EXPView = luajava.new(TextView,DisplayView:getContext())
tv_EXPView:setId(900114)
barView:addView(tv_EXPView)
singleParams_13 = luajava.new(RelativeLayoutParams,barwidth,hpheight)
singleParams_13:addRule(RelativeLayout.BELOW,900101)
singleParams_13:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
tv_EXPView:setLayoutParams(singleParams_13)
tv_EXPView:setTextSize(textsize)
tv_EXPView:setGravity(Gravity.CENTER)
tv_EXPView:setTypeface(Typeface.MONOSPACE)

function hpbargone()
barView:setVisibility(View.GONE)
end
function hpbarshow()
barView:setVisibility(View.VISIBLE)
end

difexp = ": "
function sethpbar(strall)
str= {}
a = __split(strall, ",")
for k,v in pairs(a) do
	table.insert(str,v)	
end

fillnum = str[1]
crthp = str[2]
difhp = str[3]
crtsp = str[4]
difsp = str[5]
crtep = str[6]
difep = str[7]
crtexp = str[8]
difexp1 = str[9]
if difexp1 ~= ":" then
difexp = difexp1
end
exppool = str[10]
eqset = str[11]
weight = str[12]
parry = str[13]
target = str[14]
continent = str[15]
xcoords = tonumber(str[16])
ycoords = tonumber(str[17])
maxhp = tonumber(str[18])
maxsp = tonumber(str[19])
maxep = tonumber(str[20])
hppercent = string.format("%d%%", crthp / maxhp *100)
if tonumber(difhp:gsub(":", "").."0") > 0 and tonumber(difsp:gsub(":", "").."0") > 0 and tonumber(difep:gsub(":", "").."0") > 0 then
 ticknum = 30
end

bg_SPView:setBackgroundColor(Color:argb(50,0,100,0))
bg_EPView:setBackgroundColor(Color:argb(10,0,0,10))
tv_SPView:setTextColor(Color:argb(1,1,1,1))
tv_EPView:setTextColor(Color:argb(10,10,10,0))
tv_EXPView:setTextColor(Color:argb(1,1,1,1))
tv_HPView:setTextColor(Color:argb(1,1,1,1))
lowhp = 250
if tonumber(crthp) <= lowhp then
bg_HPView:setBackgroundColor(Color:argb(10,10,10,0))
--tv_HPView:setTextColor(Color:argb(1,1,1,1))
else
bg_HPView:setBackgroundColor(Color:argb(1,1,0,0))
--tv_HPView:setTextColor(Color:argb(1,1,1,0))
end

--if tonumber(crthp) <= 832 then
crthpW = crthp / maxhp * (barwidth)
--crthpW_mParams = luajava.new(RelativeLayoutParams,0,barheight)
--crthpW_mParams:addRule(RelativeLayout.ALIGN_LEFT,900101)
--bg_SPMaxView:setLayoutParams(SPEPW_mParams)
crthpWParams = luajava.new(RelativeLayoutParams,crthpW,hpheight)
crthpWParams:addRule(RelativeLayout.ALIGN_PARENT_TOP)
crthpWParams:addRule(RelativeLayout.ALIGN_LEFT,900101)
--crthpWParams:addRule(RelativeLayout.CENTER_HORIZONTAL)
--else
--crthpW = displayWidth
--crthpWParams = luajava.new(RelativeLayoutParams,crthpW,40)
--crthpWParams:addRule(RelativeLayout.ALIGN_PARENT_TOP)
--end

bg_HPView:setLayoutParams(crthpWParams)
tv_SPView:setText(hppercent..string.format("%-4s",difhp:gsub(":", "")))
tv_EPView:setText("δX"..string.format("%-8s",difexp:gsub(":", ""))..eqset)
--string.format("%s",)
--"HP:"..string.format("%-5s",crthp).."δhp"..string.format("%-5s",difhp)...."pl:"..string.format("%-7s",exppool).."δS"..string.format("%-5s",difsp).."δE"..string.format("%-5s",difep)..
--tv_SPView:setText(continent)
--tv_EPView:setText(xcoords.." "..ycoords)
-- bg_EPMaxView:setBackgroundColor(Color:argb(100,100,284,232))
-- end

crtspW = crtsp / maxsp * (singleWidth - iconwidth)
crtspWParams = luajava.new(RelativeLayoutParams,crtspW,hpheight)
crtspWParams:addRule(RelativeLayout.BELOW,900104)
crtspWParams:addRule(RelativeLayout.ALIGN_LEFT,900102)


bg_SPView:setLayoutParams(crtspWParams)
--jingEPW_mParams = luajava.new(RelativeLayoutParams,0,barheight)
--jingEPW_mParams:addRule(RelativeLayout.RIGHT_OF,900103)
--bg_EPMaxView:setLayoutParams(jingEPW_mParams)
--crtspWParams:addRule(RelativeLayout.LEFT_OF,900103)
--tv_SPView:setText("SP:"..crtsp.."/"..difsp)


crtepW = crtep / maxep * (singleWidth - iconwidth)
crtepWParams = luajava.new(RelativeLayoutParams,crtepW,hpheight)
crtepWParams:addRule(RelativeLayout.BELOW,900104)
crtepWParams:addRule(RelativeLayout.RIGHT_OF,900102)
bg_EPView:setLayoutParams(crtepWParams)
--tv_EPView:setText("EP:"..crtep.."/"..difep)

bg_EXPView:setBackgroundColor(Color:argb(50,0,50,70))
crtexpW = crtexp / 2500000 * (barwidth)
crtexpWParams = luajava.new(RelativeLayoutParams,crtexpW,hpheight)
crtexpWParams:addRule(RelativeLayout.BELOW,900101)
crtexpWParams:addRule(RelativeLayout.ALIGN_LEFT,900104)
bg_EXPView:setLayoutParams(crtexpWParams)

--tv_EXPView:setText("EXP:"..string.format("%-8s",crtexp).."pool:"..string.format("%-7s",exppool).."EQ:"..string.format("%-2s",eqset).."W:"..string.format("%-4s",weight).."PR:"..string.format("%-3s",parry).."TGT"..string.format("%-20s",target))
end


function promptatton()
tv_HPView:setText("You are now turn ON the att.")
end
function promptattoff()
tv_HPView:setText("You are now turn OFF the att.")
end

function processscanhp(val)
--if fillnum == "1" then
    if val == "round over" then
    tv_HPView:setText("")
    Note(bmagenta.."      >>Bravo! You've vanished your foe!<<".."\n            >>EXP:"..crtexp.."  pl:"..exppool.."<<"..lwhite.."\n######################################################\n")
    tv_EXPView:setText("")
    ENMView1:setVisibility(View.GONE)
    ENMView2:setVisibility(View.GONE)
    setmainportrait("reset")
    setenmportraitmsg("reset")
    else
    tv_HPView:setText(string.format("%-42s",val))
    local a = val:match(".-%((%d+)%%%)")
    local b = val:match(".-%(%d+%%%).-%((%d+)%%%)")
    if a then
        ENMView1:setBackgroundColor(Color:argb(1,1,0,1))
        crtenm1W = tonumber(a) * (barwidth) / 100
        crtenm1WParams = luajava.new(RelativeLayoutParams,crtenm1W,20)
        crtenm1WParams:addRule(RelativeLayout.ABOVE, 900110)
        crtenm1WParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
        crtenm1WParams:setMargins(iconwidth, 0, 0, 0)
        ENMView1:setLayoutParams(crtenm1WParams)
        ENMView1:setVisibility(View.VISIBLE)
    else
        ENMView1:setVisibility(View.GONE)
    end
    if b then
        ENMView2:setBackgroundColor(Color:argb(1,1,1,0))
        crtenm2W = tonumber(b) * (barwidth) / 100
        crtenm2WParams = luajava.new(RelativeLayoutParams,crtenm2W,20)
        crtenm2WParams:addRule(RelativeLayout.ABOVE, 900100)
        crtenm2WParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
        crtenm2WParams:setMargins(iconwidth, 0, 0, 0)
        ENMView2:setLayoutParams(crtenm2WParams)
        ENMView2:setVisibility(View.VISIBLE)
    else
        ENMView2:setVisibility(View.GONE)
    end
    end
--else
end
function processscansp(val)
tv_SPView:setText(val)
end
function processscanep(val)
tv_EPView:setText(val)
end
function processscanexp(val)
tv_EXPView:setText(val)
end

function __split(str, reps)
	local r = {}
	if str == nil then return nil end
	string.gsub(str, "[^"..reps.."]+", function(w) table.insert(r, w) end)
	return r
end

local frameLayout = luajava.new(FrameLayout, context)
frameLayout:setId(900205)

function setDisplayViewHeight(val)
if val == "true" then
frame_Params = luajava.new(RelativeLayoutParams,mapwindowWidth,mapwindowHeight)
frame_Params:addRule(RelativeLayout.ABOVE,40)
frameLayout:setLayoutParams(frame_Params)
barParams = barView:getLayoutParams()
barParams:addRule(RelativeLayout.ABOVE,900205)
barView:setLayoutParams(barParams)
else
frame_Params = luajava.new(RelativeLayoutParams,mapwindowWidth,mapwindowHeight)
frame_Params:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
--DisplayViewParams:addRule(RelativeLayout.BELOE,5959595)
frame_Params:addRule(RelativeLayout.ABOVE,40)
--DisplayViewParams:addRule(RelativeLayout.RIGHT_OF,900100)
frameLayout:setLayoutParams(frame_Params)
barParams = barView:getLayoutParams()
barParams:addRule(RelativeLayout.ABOVE,40)
barView:setLayoutParams(barParams)
end
--mapwindowHeight = frameLayout:getLayoutParams().height 
--mapwindowWidth = frameLayout:getLayoutParams().width
--Note(mapwindowHeight..mapwindowWidth)
end
--[[DisplayView:setId(900205)
rootnewView:removeView(view)
rootnewView:addView(DisplayView)
function setDisplayViewHeight(val)
if val == "true" then
DisplayViewParams = luajava.new(RelativeLayoutParams,WRAP_CONTENT,464)
DisplayViewParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
DisplayViewParams:addRule(RelativeLayout.ABOVE,40)
DisplayView:setLayoutParams(DisplayViewParams)
barParams = barView:getLayoutParams()
barParams:addRule(RelativeLayout.ABOVE,900205)
barView:setLayoutParams(barParams)
else
--option_portrait = false
--setsizepl("false")
DisplayViewParams = luajava.new(RelativeLayoutParams,chatwidth - 4 - iconsize,iconsize2 * 8 - 2)
DisplayViewParams:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
--DisplayViewParams:addRule(RelativeLayout.BELOE,5959595)
DisplayViewParams:addRule(RelativeLayout.ABOVE,40)
--DisplayViewParams:addRule(RelativeLayout.RIGHT_OF,900100)
DisplayView:setLayoutParams(DisplayViewParams)
barParams = barView:getLayoutParams()
barParams:addRule(RelativeLayout.ABOVE,40)
barView:setLayoutParams(barParams)
end
--DisplayView:invalidate()
--DisplayView:requestLayout()
--DisplayView:invalidate()
end]]
PluginXCallS("set_portrait_landscape")

local frameLayout2 = luajava.new(FrameLayout, context)
local horizontalscrollView = luajava.new(HorizontalScrollView, context)
local scrollView = luajava.new(ScrollView, context)
DisplayViewParams = luajava.new(RelativeLayoutParams,15000,22200)
DisplayView:setLayoutParams(DisplayViewParams)
DisplayView:setTextSelectionEnabled(false)
DisplayView:setScrollingEnabled(false)
--rootnewView = DisplayView:getParentView()
rootnewView:removeView(DisplayView)
rootnewView:addView(frameLayout)
frameLayout:addView(scrollView)
scrollView:addView(horizontalscrollView)
horizontalscrollView:addView(frameLayout2)
frameLayout2:addView(DisplayView)
--------------------------------------------------------------------
playerPosition = luajava.new(RelativeLayout, context)
playerPositionParams = luajava.new(RelativeLayoutParams, 18, 30)
--circleParams1:addRule(RelativeLayout.CENTER_HORIZONTAL)
playerPositionParams:addRule(RelativeLayout.ABOVE,40)
playerPositionParams:addRule(RelativeLayout.ALIGN_PARENT_RIGHT)
--playerPositionParams:setMargins(mapwindowWidth / 2, 0, 0, mapwindowHeight / 2)
playerPositionParams:setMargins(0, 0, mapwindowWidth/2, mapwindowHeight/2+4-60)
playerPosition:setLayoutParams(playerPositionParams)

-- 创建圆形的背景
circleDrawable = luajava.new(GradientDrawable)
circleDrawable:setShape(GradientDrawable.OVAL)
circleDrawable:setColor(Color:argb(1,1,0,0))
circleDrawable:setStroke(1, Color:argb(255,136,136,136))

-- 设置窗口的背景为圆形背景
playerPosition:setBackground(circleDrawable)
rootnewView:addView(playerPosition)
------------------------------------------------------------------
RefreshTime = System:currentTimeMillis()
newpositionX = 0
newpositionY = 0
function updatePosition(loc)
local AcceptTime = System:currentTimeMillis()
local TimeInterval = AcceptTime - RefreshTime
if TimeInterval > 30 then
RefreshTime = AcceptTime
local newposition= {}
xyd = __split(loc, ",")
for k,v in pairs(xyd) do
	table.insert(newposition,v)	
end
local currentTextHeight = DisplayView:getLineSize()
local currentTextWidth = currentTextHeight * 3 / 5
newpositionX = tonumber(newposition[1]) * currentTextWidth - mapwindowWidth / 2
newpositionY = 22200 - (tonumber(newposition[4]) - tonumber(newposition[2]) + tonumber(newposition[3])) * currentTextHeight - mapwindowHeight / 2 - 60
horizontalscrollView:setScrollX(newpositionX)
scrollView:setScrollY(newpositionY)
--
end
end

--local mapheight = DisplayViewParams.height
--local maplines = DisplayView:getBuffer():getBrokenLineCount()
--DisplayView:addText("\27[35;1m"..maplines.."\nnew:",true)
--DisplayView:CalculatedLinesInWindow()
--scrollView:setScrollY(mapheight)

local pinchZoomListener = {}
--local pointerId1, pointerId2
local distance
touchStartTime = 0
function pinchZoomListener.onTouch(v, e)
    local x1, y1
    local x2, y2
   -- local X, Y
    local action = e:getActionMasked()
    local pointerCount = e:getPointerCount()
    if action == MotionEvent.ACTION_POINTER_DOWN and pointerCount == 2 then
        --DisplayView:clearAllText()
        --touchStartTime = System:currentTimeMillis()
        SendToServer(".clearbuttons")
        x1, y1 = e:getX(0), e:getY(0)
        x2, y2 = e:getX(1), e:getY(1)
       -- X = horizontalscrollView:getScrollX()
       -- Y = scrollView:getScrollY()
        --Note("\n"..x1.."+"..y1.."+"..x2.."+"..y2)
        -- 计算两个指针的距离
        distance = math.abs(x2 - x1) + math.abs(y2 - y1)
        v:onTouchEvent(e)
		return true
    elseif action == MotionEvent.ACTION_MOVE and pointerCount == 2 then
        --now = System:currentTimeMillis()
		--timeDelta = now - touchStartTime
		--if(timeDelta < 30) then
		--	return true
		--end
		--touchStartTime = now
        x1, y1 = e:getX(0), e:getY(0)
        x2, y2 = e:getX(1), e:getY(1)
        -- 计算两个指针的距离
        local newDistance = math.abs(x2 - x1) + math.abs(y2 - y1)
        -- 计算放大/缩小比例
        local scalestep = newDistance > distance and 1 or -1
        
        -- 调整文字大小
        local currentTextSize = DisplayView:getLineSize()
        local newTextSize = (currentTextSize + scalestep) < 31 and (currentTextSize + scalestep) > 1 and (currentTextSize + scalestep) or currentTextSize
        DisplayView:setCharacterSizes(newTextSize, 0)
        --if X and Y then
        --horizontalscrollView:setScrollX(X)
       -- scrollView:setScrollY(Y)
       -- end
        --Note("\n"..newTextSize)
        -- 更新距离
        distance = newDistance
        v:onTouchEvent(e)
		return true
    elseif action == MotionEvent.ACTION_POINTER_UP and pointerCount == 2 then
          if continent == "Laenor" then
            PositionDelta = 24
            PositionTotal = 730
          elseif continent == "Furnachia" then
            PositionDelta = 0
            PositionTotal = 480
          elseif continent == "Rothikgen" then
            PositionDelta = 0
            PositionTotal = 480
          elseif continent == "Lucentium" then
            PositionDelta = 0
            PositionTotal = 500
          elseif continent == "Desolathya" then
            PositionDelta = 0
            PositionTotal = 530
          end
          if xcoords then
          updatePosition(xcoords..","..ycoords..","..PositionDelta..","..PositionTotal)
          end
          --horizontalscrollView:setScrollX(-100)
          --scrollView:setScrollY(22100)
        --x1, y1 = e:getX(0), e:getY(0)
        --x2, y2 = e:getX(1), e:getY(1)
        --Note("\n"..x1.."+"..y1.."+"..x2.."+"..y2)
        --DisplayView:setCharacterSizes(10, 0)
        --DisplayView:jumpToStart()
        --DisplayView:jumpToZero()
        --horizontalscrollView:setScrollX(0)
        --scrollView:setScrollY(Y)
        --maplines = DisplayView:getBuffer():getBrokenLineCount()
        --DisplayView:addText("\27[32;1m\27[0;33m"..maplines.."\nnew:",true)
--DisplayView:CalculatedLinesInWindow()
        --scrollView:setScrollY(mapheight)
        v:onTouchEvent(e)
		return true    
    end

    return false
end

local pinchZoomListener_cb = luajava.createProxy("android.view.View$OnTouchListener", pinchZoomListener)
horizontalscrollView:setOnTouchListener(pinchZoomListener_cb)

inputView = rootnewView:findViewById(6666)
function inputviewchange(bottom)
inputViewLayoutParams = inputView:getLayoutParams()
inputViewLayoutParams:addRule(RelativeLayout.ABOVE,9108)
--inputViewLayoutParams:setMargins(0, 0, 0, iconheight)
--inputView:setLayoutParams(inputViewLayoutParams)
if option_portrait == "true" then
  inputViewLayoutParams:setMargins(0, 0, 0, tonumber(bottom))
else
inputViewLayoutParams:setMargins(0, 0, chatwidth, tonumber(bottom))
end
inputView:setLayoutParams(inputViewLayoutParams)
end
inputviewchange(0)

local pinchZoomListener2 = {}
--local pointerId1, pointerId2
local distance2
function pinchZoomListener2.onTouch(v, e)
    local x1, y1
    local x2, y2
    local action = e:getActionMasked()
    local pointerCount = e:getPointerCount()
    if action == MotionEvent.ACTION_POINTER_DOWN and pointerCount == 2 then
        touchStartTime = System:currentTimeMillis()
        --DisplayView:clearAllText()
        --SendToServer(".clearbuttons")
        --inputView:setTextSelectionEnabled(false)
        x1, y1 = e:getX(0), e:getY(0)
        x2, y2 = e:getX(1), e:getY(1)
        --Note("\n"..x1.."+"..y1.."+"..x2.."+"..y2)
        -- 计算两个指针的距离
        distance2 = math.abs(x2 - x1) + math.abs(y2 - y1)
        v:onTouchEvent(e)
		return true
    end
    if action == MotionEvent.ACTION_MOVE and pointerCount == 2 then
        now = System:currentTimeMillis()
		timeDelta = now - touchStartTime
		if(timeDelta < 60) then
			return true
		end
		touchStartTime = now
        x1, y1 = e:getX(0), e:getY(0)
        x2, y2 = e:getX(1), e:getY(1)
        -- 计算两个指针的距离
        local newDistance2 = math.abs(x2 - x1) + math.abs(y2 - y1)
        -- 计算放大/缩小比例
        local scalestep = newDistance2 > distance2 and 1 or -1
        
        -- 根据比例调整文字大小
        local currentTextSize2 = inputView:getLineSize()
        local newTextSize2 = (currentTextSize2 + scalestep) < 40 and (currentTextSize2 + scalestep) > 23 and (currentTextSize2 + scalestep) or currentTextSize2
        inputView:setCharacterSizes(newTextSize2, 0)
        -- 更新距离
        distance2 = newDistance2
        v:onTouchEvent(e)
		return true
    end
    if action == MotionEvent.ACTION_POINTER_UP and pointerCount == 2 then
        x1, y1 = e:getX(0), e:getY(0)
        x2, y2 = e:getX(1), e:getY(1)
        local currentTextSize3 = inputView:getLineSize()
        inputView:setCharacterSizes(currentTextSize3 - 2, 2)
        --Note("\n"..x1.."+"..y1.."+"..x2.."+"..y2)
        --DisplayView:jumpToStart()
        inputView:jumpToZero()
        --inputView:setTextSelectionEnabled(true)
        v:onTouchEvent(e)
		return true    
    end
    return false
end

local pinchZoomListener2_cb = luajava.createProxy("android.view.View$OnTouchListener", pinchZoomListener2)
inputView:setOnTouchListener(pinchZoomListener2_cb)

--setDisplayViewHeight("true")
--DisplayViewParams = luajava.new(RelativeLayoutParams,WRAP_CONTENT,464)

--[[DisplayHolder = luajava.new(LinearLayout,context)
DisplayView:addView(DisplayHolder)
DisplayHolderParams = luajava.new(LinearLayoutParams,WRAP_CONTENT,604)
DisplayHolderParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
DisplayHolderParams:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
DisplayHolder:setLayoutParams(DisplayHolderParams)]]



--[[local tv_DisplayView = luajava.new(TextView,DisplayView:getContext())
tv_DisplayView:setLayoutParams(DisplayViewParams)
tv_DisplayView:setTextSize(8*density)
tv_DisplayView:setGravity(Gravity.CENTER)
tv_DisplayView:setTypeface(Typeface.MONOSPACE)
tv_DisplayView:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_DisplayView)]]
--tv_DisplayView:setText("wgdgwwgmgmgmgmgmgmgwgwgtgmgdg1d123mgwgw")
----------------------------图像-------------------------------

local portrait = luajava.new(RelativeLayout,context)
portraitParams = luajava.new(RelativeLayoutParams,iconwidth,iconheight)
portraitParams:addRule(RelativeLayout.ALIGN_TOP,900100)
portraitParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
portrait:setLayoutParams(portraitParams)
portrait:setId(900203)
portrait:setBackgroundColor(Color:argb(255,0,0,0))
portrait:requestLayout()

icons = {
    portraits = {"minotaur_male_web.jpg", "monitor_male.jpg", "INV_Misc_Head_Dragon_Nexus.jpg"
    },
    spells = {"Spell_Frost_Stun.jpg", "Spell_Frost_Stun.jpg"
    },
    skills = {
    },
    status = {"Stun.jpg", "Ability_Warrior_OffensiveStance.jpg", "Spell_AnimaMaldraxxus_Buff.jpg"
    },
    items = {"INV_Misc_Bag_26_Spellfire.jpg"
    },
    mounts = {"Ability_Mount_TwilightDrakeMount_red.jpg"
    },
    sceneries = {
    },
    buttons = {"armor.jpg","book.jpg","ride.jpg","TimeStop.jpg","heal.jpg","charge.jpg","RapidKilling.jpg","Invisibilty.jpg","travel.jpg"
    },
}
function setportrait(imgwindow, class, order)
if type(order) == "number" then
for i, types in pairs(icons) do
  if i == class then
    Icon = types[order]
  end
end
imguri = GetPluginInstallDirectory().."/Icons/"..class.."/"..Icon
else
imguri = GetPluginInstallDirectory().."/Icons/"..class.."/"..order
end
resources = view:getContext():getResources()
target = luajava.new(BitmapDrawable,resources,imguri)
imgwindow:setImageDrawable(target)
end

local imageview = luajava.new(ImageView,context)
imageview:setLayoutParams(portraitParams)
imageview:setBackgroundColor(Color:argb(255,358,350,352))
imageview:setId(900204)
rootnewView:addView(imageview)
setportrait(imageview, "portraits", 1)
--:setImageDrawable(target)
imageview2 = luajava.new(ImageView,context)
imageview2Param = luajava.new(RelativeLayoutParams,iconwidth,iconheight)
imageview2Param:addRule(RelativeLayout.ALIGN_TOP,900100)
imageview2Param:addRule(RelativeLayout.RIGHT_OF, 900100)
imageview2:setLayoutParams(imageview2Param)
imageview2:setBackgroundColor(Color:argb(255,358,350,352))
imageview2:setId(900206)
rootnewView:addView(imageview2)
setportrait(imageview2, "mounts", 1)

local tv_imageview = luajava.new(TextView,DisplayView:getContext())
tv_imageview:setLayoutParams(portraitParams)
tv_imageview:setTextSize(6*density)
tv_imageview:setGravity(Gravity.CENTER)
tv_imageview:setTypeface(Typeface.MONOSPACE)
tv_imageview:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_imageview)

function setmainportrait(val)
  if val == "STUN 1" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("1")
  elseif val == "STUN 2" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("2")
  elseif val == "STUN 3" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("3")
    imgmessage(imageview, "wimpy now", "eq", 0, 0, 0, 0, 0, 0)
  elseif val == "STUN 4" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("4")
  elseif val == "STUN 5" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("5")
  elseif val == "STUN 6" then
    setportrait(imageview, "status", 1)
    tv_imageview:setText("6")
  elseif val == "buff" then
    setportrait(imageview, "status", 3)
    imgmessage(imageview, "buff1;/WindowXCallS(\"batscmsgwindow\",\"setmainportrait\", \"reset\")", "buff2;/WindowXCallS(\"batscmsgwindow\",\"setmainportrait\", \"reset\")", 0, 0, 0, 0, 0, 0)
    tv_imageview:setText("BUFF")
  elseif val == "reset" then
    setportrait(imageview, "portraits", 1)
    tv_imageview:setText("")
    imgmessage(imageview, ".loadset bags", "eq", "items", 1, ".loadset Brief", "eq", "portraits", 1)
  end
end

function getFilesInPath(path)
    --local cmd = string.format('dir "%s" /b', path)  -- Windows系统使用dir命令
    local cmd = string.format('ls "%s"', path)  -- macOS和Linux系统使用ls命令

    local fileNames = {}
    local handle = io.popen(cmd)
    if handle then
        for file in handle:lines() do
            table.insert(fileNames, file)
        end
        handle:close()
    end

    return table.concat(fileNames, ",")
end
local iconpath = GetPluginInstallDirectory().."/Icons/"
local portraitsname = __split(getFilesInPath(iconpath.."portraits"), ",")
local petsname = __split(getFilesInPath(iconpath.."pets"), ",")
local mountsname = __split(getFilesInPath(iconpath.."mounts"), ",")
local spellsname = __split(getFilesInPath(iconpath.."spells"), ",")
local weaponsname = __split(getFilesInPath(iconpath.."weapons"), ",")
local abilitiesname = __split(getFilesInPath(iconpath.."abilities"), ",")
local itemsname = __split(getFilesInPath(iconpath.."items"), ",")
local guidesname = __split(getFilesInPath(iconpath.."guides"), ",")

function setenmportrait(enemy)
     local portraitfind = false
     for i, enmportrait in ipairs(portraitsname) do
         if enmportrait:lower():find(enemy:lower()) then
            setportrait(imageview2, "portraits", enmportrait)
            portraitfind = true
            break
         end
     end
     if portraitfind == false then
         for i, enmportrait in ipairs(petsname) do
             if enmportrait:lower():find(enemy:lower()) then
                setportrait(imageview2, "pets", enmportrait)
                portraitfind = true
                break
             end
         end
     end
     if portraitfind == false then
        setportrait(imageview2, "status", 2)
     end
end

function setenmportraitmsg(val)
  if val == "reset" then
  setportrait(imageview2, "mounts", 1)
  imgmessage(imageview2, ".dmgifs on;.loadset rctgt;blook", ".tgton on;grep -q -A 1 'Niubi' blook", "status", 2, ".dmgifs off;.loadset Brief", ".tgton on;grep -q -A 1 'Niubi' blook", "mounts", 1)
  setmainportrait("reset")
  SendToServer("target clear")
  else
  imgmessage(imageview2, ".dmgifs on;var1 "..val, "/WindowXCallS(\"batscmsgwindow\",\"setenmportraitmsg\", \"reset\")", 0, 0, 0, 0, 0, 0)
  setmainportrait("buff")
  end
end



------------------------------------测试-------------------------------
-- 创建切换功能的多功能按键
function imgmessage(imgwindowx, pmessage1, fmessage1, type1, order1, pmessage2, fmessage2, type2, order2)
local longPressListener = {}
local moveDelta = 0
--local moveTotal = 0
local moveLast1 = 0
local moveLast2 = 0
function longPressListener.onTouch(v,e)
	action = e:getAction()
	if(action == MotionEvent.ACTION_DOWN) then
		moveLast1 = e:getY()
		moveLast2 = e:getX()
		v:onTouchEvent(e)
		return true
--[[	elseif( action == MotionEvent.ACTION_MOVE) then
		moveDelta = e:getY() - moveLast
		moveLast = e:getY()
		moveTotal = moveTotal + moveDelta
		if(moveTotal > 10) then
			SendToServer(message2)	
		end
		v:onTouchEvent(e)
		return true]]
	elseif(action == MotionEvent.ACTION_UP) then
		moveDelta = math.abs(e:getY() - moveLast1) + math.abs(e:getX() - moveLast2)
		v:onTouchEvent(e)
		if(moveDelta < 30) then
		    if pmessage1 ~= 0 then
			SendToServer(pmessage1)
			end
			if order1 ~= 0 then
    			setportrait(imgwindowx, type1, order1)
    			imgmessage(imgwindowx, pmessage2, fmessage2, type2, order2, pmessage1, fmessage1, type1, order1)
			--changeportrait(imgwindowx)
			elseif order1 == 0 and pmessage2 ~= 0 then
			    imgmessage(imgwindowx, pmessage2, fmessage2, type1, order1, pmessage1, fmessage1, type2, order2)
			end
	    elseif(moveDelta > 50) then
	        SendToServer(fmessage1)
	        --local VibrationEffect = vibrator.VibrationEffect()
	        vibrator:vibrate(20, HEAVY)
	        --vibrator:vibrate(os.VibrationEffect.createOneShot(50, VibrationEffect.DEFAULT))
		end
		moveDelta = 0
		return true
	end
	return false
end
longPressListener_cb = luajava.createProxy("android.view.View$OnTouchListener",longPressListener)
imgwindowx:setOnTouchListener(longPressListener_cb)
end

-- 创建四个方向滑动及点击均发送命令的多功能按键
function imgmessage5items(imgwindowy, pmsg, fupmsg, fdownmsg, fleftmsg, frightmsg)
local longPressListener = {}
local moveDeltaX = 0
local moveDeltaY = 0
--local moveTotal = 0
local moveLast1 = 0
local moveLast2 = 0
function longPressListener.onTouch(v,e)
	action = e:getAction()
	if(action == MotionEvent.ACTION_DOWN) then
		moveLast1 = e:getY()
		moveLast2 = e:getX()
		v:onTouchEvent(e)
		return true
--[[	elseif( action == MotionEvent.ACTION_MOVE) then
		moveDelta = e:getY() - moveLast
		moveLast = e:getY()
		moveTotal = moveTotal + moveDelta
		if(moveTotal > 10) then
			SendToServer(message2)	
		end
		v:onTouchEvent(e)
		return true]]
	elseif(action == MotionEvent.ACTION_UP) then
		moveDeltaY = e:getY() - moveLast1
		moveDeltaX = e:getX() - moveLast2
		v:onTouchEvent(e)
		if(math.abs(moveDeltaX) < 20 and math.abs(moveDeltaY) < 20) then
		  SendToServer(pmsg)
	    elseif(math.abs(moveDeltaX) < 50 and moveDeltaY < -50) then
	      SendToServer(fupmsg)
	      vibrator:vibrate(15)
	    elseif(math.abs(moveDeltaX) < 50 and moveDeltaY > 50) then
	      SendToServer(fdownmsg)
	      vibrator:vibrate(15)
	    elseif(math.abs(moveDeltaY) < 50 and moveDeltaX < -50) then
	      SendToServer(fleftmsg)
	      vibrator:vibrate(15)
	    elseif(math.abs(moveDeltaY) < 50 and moveDeltaX > 50) then
	      SendToServer(frightmsg)
	      vibrator:vibrate(15)
		end
		moveDeltaX = 0
		moveDeltaY = 0
		return true
	end
	return false
end
longPressListener_cb = luajava.createProxy("android.view.View$OnTouchListener",longPressListener)
imgwindowy:setOnTouchListener(longPressListener_cb)
end

buttonview0 = luajava.new(ImageView,context)
buttonview0Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview0Param:addRule(RelativeLayout.ALIGN_BOTTOM,900100)
buttonview0Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
else
buttonview0Param:addRule(RelativeLayout.BELOW,5959595)
buttonview0Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
--end
--setbt0position()
buttonview0:setLayoutParams(buttonview0Param)
buttonview0:setBackgroundColor(Color:argb(1,1,1,1))
buttonview0:setId(900300)
rootnewView:addView(buttonview0)
setportrait(buttonview0, "buttons", 9)

buttonview1 = luajava.new(ImageView,context)
buttonview1Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview1Param:addRule(RelativeLayout.RIGHT_OF,900300)
else
buttonview1Param:addRule(RelativeLayout.BELOW,900300)
buttonview1Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
--buttonview1Param:setMargins(iconsize, 0, 0, 0)
buttonview1:setLayoutParams(buttonview1Param)
buttonview1:setBackgroundColor(Color:argb(1,1,1,1))
buttonview1:setId(900301)
rootnewView:addView(buttonview1)
setportrait(buttonview1, "buttons", 1)

buttonview2 = luajava.new(ImageView,context)
buttonview2Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview2Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview2Param:addRule(RelativeLayout.RIGHT_OF,900301)
else
buttonview2Param:addRule(RelativeLayout.BELOW,900301)
buttonview2Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview2:setLayoutParams(buttonview2Param)
buttonview2:setBackgroundColor(Color:argb(1,1,1,1))
buttonview2:setId(900302)
rootnewView:addView(buttonview2)
setportrait(buttonview2, "buttons", 2)

buttonview3 = luajava.new(ImageView,context)
buttonview3Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview3Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview3Param:addRule(RelativeLayout.RIGHT_OF,900302)
else
buttonview3Param:addRule(RelativeLayout.BELOW,900302)
buttonview3Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview3:setLayoutParams(buttonview3Param)
buttonview3:setBackgroundColor(Color:argb(1,1,1,1))
buttonview3:setId(900303)
rootnewView:addView(buttonview3)
setportrait(buttonview3, "buttons", 3)

buttonview4 = luajava.new(ImageView,context)
buttonview4Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview4Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview4Param:addRule(RelativeLayout.RIGHT_OF,900303)
else
buttonview4Param:addRule(RelativeLayout.BELOW,900303)
buttonview4Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview4:setLayoutParams(buttonview4Param)
buttonview4:setBackgroundColor(Color:argb(1,1,1,1))
buttonview4:setId(900304)
rootnewView:addView(buttonview4)
setportrait(buttonview4, "buttons", 4)

buttonview5 = luajava.new(ImageView,context)
buttonview5Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview5Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview5Param:addRule(RelativeLayout.RIGHT_OF,900304)
else
buttonview5Param:addRule(RelativeLayout.BELOW,900304)
buttonview5Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview5:setLayoutParams(buttonview5Param)
buttonview5:setBackgroundColor(Color:argb(1,1,1,1))
buttonview5:setId(900305)
rootnewView:addView(buttonview5)
setportrait(buttonview5, "buttons", 5)

buttonview6 = luajava.new(ImageView,context)
buttonview6Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview6Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview6Param:addRule(RelativeLayout.RIGHT_OF,900305)
else
buttonview6Param:addRule(RelativeLayout.BELOW,900305)
buttonview6Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview6:setLayoutParams(buttonview6Param)
buttonview6:setBackgroundColor(Color:argb(1,1,1,1))
buttonview6:setId(900306)
rootnewView:addView(buttonview6)
setportrait(buttonview6, "buttons", 6)

--[[buttonview7 = luajava.new(ImageView,context)
buttonview7Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview7Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview7Param:addRule(RelativeLayout.RIGHT_OF,900306)
else
buttonview7Param:addRule(RelativeLayout.BELOW,900306)
buttonview7Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview7:setLayoutParams(buttonview7Param)
buttonview7:setBackgroundColor(Color:argb(1,1,1,1))
buttonview7:setId(900307)
rootnewView:addView(buttonview7)
setportrait(buttonview7, "buttons", 7)]]

buttonview8 = luajava.new(ImageView,context)
buttonview8Param = luajava.new(RelativeLayoutParams,iconsize,iconsize2)
if option_portrait == "true" then
buttonview8Param:addRule(RelativeLayout.ALIGN_BOTTOM,900300)
buttonview8Param:addRule(RelativeLayout.RIGHT_OF,900306)
else
buttonview8Param:addRule(RelativeLayout.BELOW,900306)
buttonview8Param:addRule(RelativeLayout.RIGHT_OF,900206)
end
buttonview8:setLayoutParams(buttonview8Param)
buttonview8:setBackgroundColor(Color:argb(1,1,1,1))
buttonview8:setId(900308)
rootnewView:addView(buttonview8)
setportrait(buttonview8, "buttons", 8)


------------teamview set --------

tv_buttonview1 = luajava.new(TextView,DisplayView:getContext())
tv_buttonview1Param = luajava.new(RelativeLayoutParams,iconwidth,iconwidth)
--tv_buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,900100)
tv_buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,9107)
tv_buttonview1Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
--tv_buttonview1Param:setMargins(0, 0, 0, iconsize2 + iconheight)
tv_buttonview1:setLayoutParams(tv_buttonview1Param)
tv_buttonview1:setTextSize(4*density)
tv_buttonview1:setGravity(Gravity.CENTER_HORIZONTAL)
tv_buttonview1:setTypeface(Typeface.MONOSPACE)
tv_buttonview1:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_buttonview1)
--tv_buttonview1:setText("1\n2\n3")

--[[if option_portrait == "true" then
teamviewwidth = (barwidth-2*iconwidth)/3
else
teamviewwidth = (barwidth-iconwidth)/3
end]]
teamviewwidth = (barwidth-2*iconwidth)/3
teamviewwidth2 = teamviewwidth/2
tv_teamviewParam = luajava.new(RelativeLayoutParams,teamviewwidth,40)

teamview11 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview11Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview11Param:addRule(RelativeLayout.ABOVE,9107)
teamview11Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview11Param:setMargins(iconwidth, 0, 0, 80)
teamview11:setLayoutParams(teamview11Param)
teamview11:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview11 = luajava.new(TextView,DisplayView:getContext())
tv_teamview11:setLayoutParams(tv_teamviewParam)
tv_teamview11:setTextSize(2*density)
tv_teamview11:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview11:setTypeface(Typeface.MONOSPACE)
tv_teamview11:setTextColor(Color:argb(1,1,1,1))
--tv_teamview11:setText("12231\n2856666662856666666666")

teamview11hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview11hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview11hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview11hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview11hp:setLayoutParams(teamview11hpParam)
teamview11hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview11sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview11spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview11spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview11spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview11sp:setLayoutParams(teamview11spParam)
teamview11sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview11ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview11epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview11epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview11epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview11epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview11ep:setLayoutParams(teamview11epParam)
teamview11ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview11:addView(teamview11sp)
teamview11:addView(teamview11hp)
teamview11:addView(teamview11ep)
teamview11:addView(tv_teamview11)
rootnewView:addView(teamview11)
teamview11:setVisibility(View.GONE)

teamview21 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview21Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview21Param:addRule(RelativeLayout.ABOVE,9107)
teamview21Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview21Param:setMargins(iconwidth, 0, 0, 40)
teamview21:setLayoutParams(teamview21Param)
teamview21:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview21 = luajava.new(TextView,DisplayView:getContext())
tv_teamview21:setLayoutParams(tv_teamviewParam)
tv_teamview21:setTextSize(2*density)
tv_teamview21:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview21:setTypeface(Typeface.MONOSPACE)
tv_teamview21:setTextColor(Color:argb(1,1,1,1))

teamview21hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview21hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview21hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview21hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview21hp:setLayoutParams(teamview21hpParam)
teamview21hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview21sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview21spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview21spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview21spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview21sp:setLayoutParams(teamview21spParam)
teamview21sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview21ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview21epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview21epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview21epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview21epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview21ep:setLayoutParams(teamview21epParam)
teamview21ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview21:addView(teamview21sp)
teamview21:addView(teamview21hp)
teamview21:addView(teamview21ep)
teamview21:addView(tv_teamview21)
rootnewView:addView(teamview21)
teamview21:setVisibility(View.GONE)

teamview31 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview31Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview31Param:addRule(RelativeLayout.ABOVE,9107)
teamview31Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview31Param:setMargins(iconwidth, 0, 0, 0)
teamview31:setLayoutParams(teamview31Param)
teamview31:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview31 = luajava.new(TextView,DisplayView:getContext())
tv_teamview31:setLayoutParams(tv_teamviewParam)
tv_teamview31:setTextSize(2*density)
tv_teamview31:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview31:setTypeface(Typeface.MONOSPACE)
tv_teamview31:setTextColor(Color:argb(1,1,1,1))

teamview31hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview31hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview31hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview31hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview31hp:setLayoutParams(teamview31hpParam)
teamview31hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview31sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview31spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview31spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview31spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview31sp:setLayoutParams(teamview31spParam)
teamview31sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview31ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview31epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview31epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview31epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview31epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview31ep:setLayoutParams(teamview31epParam)
teamview31ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview31:addView(teamview31sp)
teamview31:addView(teamview31hp)
teamview31:addView(teamview31ep)
teamview31:addView(tv_teamview31)
rootnewView:addView(teamview31)
teamview31:setVisibility(View.GONE)

tv_buttonview2 = luajava.new(TextView,DisplayView:getContext())
tv_buttonview2Param = luajava.new(RelativeLayoutParams,iconwidth,iconwidth)
--tv_buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,900100)
tv_buttonview2Param:addRule(RelativeLayout.ALIGN_BOTTOM,9107)
tv_buttonview2Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
tv_buttonview2Param:setMargins(iconwidth+teamviewwidth, 0, 0, 0)
tv_buttonview2:setLayoutParams(tv_buttonview2Param)
tv_buttonview2:setTextSize(4*density)
tv_buttonview2:setGravity(Gravity.CENTER_HORIZONTAL)
tv_buttonview2:setTypeface(Typeface.MONOSPACE)
tv_buttonview2:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_buttonview2)

teamview12 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview12Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview12Param:addRule(RelativeLayout.ABOVE,9107)
teamview12Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview12Param:setMargins(2*iconwidth+teamviewwidth, 0, 0, 80)
teamview12:setLayoutParams(teamview12Param)
teamview12:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview12 = luajava.new(TextView,DisplayView:getContext())
tv_teamview12:setLayoutParams(tv_teamviewParam)
tv_teamview12:setTextSize(2*density)
tv_teamview12:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview12:setTypeface(Typeface.MONOSPACE)
tv_teamview12:setTextColor(Color:argb(1,1,1,1))

teamview12hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview12hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview12hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview12hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview12hp:setLayoutParams(teamview12hpParam)
teamview12hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview12sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview12spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview12spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview12spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview12sp:setLayoutParams(teamview12spParam)
teamview12sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview12ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview12epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview12epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview12epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview12epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview12ep:setLayoutParams(teamview12epParam)
teamview12ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview12:addView(teamview12sp)
teamview12:addView(teamview12hp)
teamview12:addView(teamview12ep)
teamview12:addView(tv_teamview12)
rootnewView:addView(teamview12)
teamview12:setVisibility(View.GONE)

teamview22 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview22Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview22Param:addRule(RelativeLayout.ABOVE,9107)
teamview22Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview22Param:setMargins(2*iconwidth+teamviewwidth, 0, 0, 40)
teamview22:setLayoutParams(teamview22Param)
teamview22:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview22 = luajava.new(TextView,DisplayView:getContext())
tv_teamview22:setLayoutParams(tv_teamviewParam)
tv_teamview22:setTextSize(2*density)
tv_teamview22:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview22:setTypeface(Typeface.MONOSPACE)
tv_teamview22:setTextColor(Color:argb(1,1,1,1))

teamview22hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview22hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview22hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview22hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview22hp:setLayoutParams(teamview22hpParam)
teamview22hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview22sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview22spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview22spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview22spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview22sp:setLayoutParams(teamview22spParam)
teamview22sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview22ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview22epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview22epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview22epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview22epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview22ep:setLayoutParams(teamview22epParam)
teamview22ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview22:addView(teamview22sp)
teamview22:addView(teamview22hp)
teamview22:addView(teamview22ep)
teamview22:addView(tv_teamview22)
rootnewView:addView(teamview22)
teamview22:setVisibility(View.GONE)

teamview32 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview32Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview32Param:addRule(RelativeLayout.ABOVE,9107)
teamview32Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview32Param:setMargins(2*iconwidth+teamviewwidth, 0, 0, 0)
teamview32:setLayoutParams(teamview32Param)
teamview32:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview32 = luajava.new(TextView,DisplayView:getContext())
tv_teamview32:setLayoutParams(tv_teamviewParam)
tv_teamview32:setTextSize(2*density)
tv_teamview32:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview32:setTypeface(Typeface.MONOSPACE)
tv_teamview32:setTextColor(Color:argb(1,1,1,1))

teamview32hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview32hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview32hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview32hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview32hp:setLayoutParams(teamview32hpParam)
teamview32hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview32sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview32spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview32spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview32spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview32sp:setLayoutParams(teamview32spParam)
teamview32sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview32ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview32epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview32epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview32epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview32epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview32ep:setLayoutParams(teamview32epParam)
teamview32ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview32:addView(teamview32sp)
teamview32:addView(teamview32hp)
teamview32:addView(teamview32ep)
teamview32:addView(tv_teamview32)
rootnewView:addView(teamview32)
teamview32:setVisibility(View.GONE)

tv_buttonview3 = luajava.new(TextView,DisplayView:getContext())
tv_buttonview3Param = luajava.new(RelativeLayoutParams,iconwidth,iconwidth)
--tv_buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,900100)
tv_buttonview3Param:addRule(RelativeLayout.ALIGN_BOTTOM,9107)
tv_buttonview3Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
tv_buttonview3Param:setMargins(2*iconwidth+2*teamviewwidth, 0, 0, 0)
tv_buttonview3:setLayoutParams(tv_buttonview3Param)
tv_buttonview3:setTextSize(4*density)
tv_buttonview3:setGravity(Gravity.CENTER_HORIZONTAL)
tv_buttonview3:setTypeface(Typeface.MONOSPACE)
tv_buttonview3:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_buttonview3)

teamview13 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview13Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview13Param:addRule(RelativeLayout.ABOVE,9107)
teamview13Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview13Param:setMargins(3*iconwidth+2*teamviewwidth, 0, 0, 80)
teamview13:setLayoutParams(teamview13Param)
teamview13:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview13 = luajava.new(TextView,DisplayView:getContext())
tv_teamview13:setLayoutParams(tv_teamviewParam)
tv_teamview13:setTextSize(2*density)
tv_teamview13:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview13:setTypeface(Typeface.MONOSPACE)
tv_teamview13:setTextColor(Color:argb(1,1,1,1))

teamview13hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview13hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview13hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview13hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview13hp:setLayoutParams(teamview13hpParam)
teamview13hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview13sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview13spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview13spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview13spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview13sp:setLayoutParams(teamview13spParam)
teamview13sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview13ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview13epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview13epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview13epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview13epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview13ep:setLayoutParams(teamview13epParam)
teamview13ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview13:addView(teamview13sp)
teamview13:addView(teamview13hp)
teamview13:addView(teamview13ep)
teamview13:addView(tv_teamview13)
rootnewView:addView(teamview13)
teamview13:setVisibility(View.GONE)

teamview23 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview23Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview23Param:addRule(RelativeLayout.ABOVE,9107)
teamview23Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview23Param:setMargins(3*iconwidth+2*teamviewwidth, 0, 0, 40)
teamview23:setLayoutParams(teamview23Param)
teamview23:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview23 = luajava.new(TextView,DisplayView:getContext())
tv_teamview23:setLayoutParams(tv_teamviewParam)
tv_teamview23:setTextSize(2*density)
tv_teamview23:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview23:setTypeface(Typeface.MONOSPACE)
tv_teamview23:setTextColor(Color:argb(1,1,1,1))

teamview23hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview23hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview23hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview23hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview23hp:setLayoutParams(teamview23hpParam)
teamview23hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview23sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview23spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview23spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview23spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview23sp:setLayoutParams(teamview23spParam)
teamview23sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview23ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview23epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview23epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview23epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview23epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview23ep:setLayoutParams(teamview23epParam)
teamview23ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview23:addView(teamview23sp)
teamview23:addView(teamview23hp)
teamview23:addView(teamview23ep)
teamview23:addView(tv_teamview23)
rootnewView:addView(teamview23)
teamview23:setVisibility(View.GONE)

teamview33 = luajava.new(RelativeLayout,DisplayView:getContext())
teamview33Param = luajava.new(RelativeLayoutParams,teamviewwidth,40)
teamview33Param:addRule(RelativeLayout.ABOVE,9107)
teamview33Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview33Param:setMargins(3*iconwidth+2*teamviewwidth, 0, 0, 0)
teamview33:setLayoutParams(teamview33Param)
teamview33:setBackgroundColor(Color:argb(3000,0,0,0))
tv_teamview33 = luajava.new(TextView,DisplayView:getContext())
tv_teamview33:setLayoutParams(tv_teamviewParam)
tv_teamview33:setTextSize(2*density)
tv_teamview33:setGravity(Gravity.CENTER_HORIZONTAL)
tv_teamview33:setTypeface(Typeface.MONOSPACE)
tv_teamview33:setTextColor(Color:argb(1,1,1,1))

teamview33hp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview33hpParam = luajava.new(RelativeLayoutParams,teamviewwidth,20)
teamview33hpParam:addRule(RelativeLayout.ALIGN_PARENT_TOP)
teamview33hpParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview33hp:setLayoutParams(teamview33hpParam)
teamview33hp:setBackgroundColor(Color:argb(1,20,0,10))

teamview33sp = luajava.new(RelativeLayout,DisplayView:getContext())
teamview33spParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview33spParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview33spParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview33sp:setLayoutParams(teamview33spParam)
teamview33sp:setBackgroundColor(Color:argb(1,0,100,0))

teamview33ep = luajava.new(RelativeLayout,DisplayView:getContext())
teamview33epParam = luajava.new(RelativeLayoutParams,teamviewwidth2,20)
teamview33epParam:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
teamview33epParam:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
teamview33epParam:setMargins(teamviewwidth2, 0, 0, 0)
teamview33ep:setLayoutParams(teamview33epParam)
teamview33ep:setBackgroundColor(Color:argb(1,0,0,1))

teamview33:addView(teamview33sp)
teamview33:addView(teamview33hp)
teamview33:addView(teamview33ep)
teamview33:addView(tv_teamview33)
rootnewView:addView(teamview33)
teamview33:setVisibility(View.GONE)

tv_buttonview4 = luajava.new(TextView,DisplayView:getContext())
tv_buttonview4Param = luajava.new(RelativeLayoutParams,iconwidth,iconwidth)
--tv_buttonview1Param:addRule(RelativeLayout.ALIGN_BOTTOM,900100)
tv_buttonview4Param:addRule(RelativeLayout.ALIGN_BOTTOM,9107)
tv_buttonview4Param:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
tv_buttonview4Param:setMargins(3*iconwidth+3*teamviewwidth, 0, 0, 0)
tv_buttonview4:setLayoutParams(tv_buttonview4Param)
tv_buttonview4:setTextSize(12*density)
tv_buttonview4:setGravity(Gravity.CENTER_HORIZONTAL)
tv_buttonview4:setTypeface(Typeface.MONOSPACE)
tv_buttonview4:setTextColor(Color:argb(1,1,1,1))
rootnewView:addView(tv_buttonview4)


ticknum = 30
function ticktick()
    ticknum = ticknum - 1
    if ticknum == 0 then
      ticknum = 30
      RefreshTime = System:currentTimeMillis()
    end
    if ticknum <= 6 then
    tv_buttonview4:setText(string.format("%2s", tostring(ticknum)))
    else
    tv_buttonview4:setText("")
    end
    ScheduleCallback(102,"ticktick",1000)
end

ticktick()

function teamviewset(teamviewX, percent, type)
        if type == "hp" then
        altteamviewXParams = luajava.new(RelativeLayoutParams,teamviewwidth*percent,20)
        else
        altteamviewXParams = luajava.new(RelativeLayoutParams,teamviewwidth2*percent,20)
        end
        altteamviewXParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
        if type == "hp" then
          altteamviewXParams:addRule(RelativeLayout.ALIGN_PARENT_TOP)
        elseif type == "sp" then
          altteamviewXParams:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
        elseif type == "ep" then
          altteamviewXParams:addRule(RelativeLayout.ALIGN_PARENT_BOTTOM)
          altteamviewXParams:setMargins(teamviewwidth2, 0, 0, 0)
        end
        teamviewX:setLayoutParams(altteamviewXParams)
end

message11=""
message21=""
message31=""
message12=""
message22=""
message32=""
message13=""
message23=""
message33=""
function tvbuttonviewtext(message, position)
if position == "1.1" then
message11 = message
elseif position == "2.1" then
message21 = message
elseif position == "3.1" then
message31 = message
elseif position == "1.2" then
message12 = message
elseif position == "2.2" then
message22 = message
elseif position == "3.2" then
message32 = message
elseif position == "1.3" then
message13 = message
elseif position == "2.3" then
message23 = message
elseif position == "3.3" then
message33 = message
end
tv_buttonview1:setText(string.format("%s\n%s\n%s", message11, message21, message31))
tv_buttonview2:setText(string.format("%s\n%s\n%s", message12, message22, message32))
tv_buttonview3:setText(string.format("%s\n%s\n%s", message13, message23, message33))
end

function teamviewgone()
  teamview11:setVisibility(View.GONE)
  teamview12:setVisibility(View.GONE)
  teamview13:setVisibility(View.GONE)
  teamview21:setVisibility(View.GONE)
  teamview22:setVisibility(View.GONE)
  teamview23:setVisibility(View.GONE)
  teamview31:setVisibility(View.GONE)
  teamview32:setVisibility(View.GONE)
  teamview33:setVisibility(View.GONE)
  --tv_buttonview1:setVisibility(View.GONE)
  --tv_buttonview2:setVisibility(View.GONE)
  --tv_buttonview3:setVisibility(View.GONE)
  inputviewchange(0)
  message11=""
  message21=""
  message31=""
  message12=""
  message22=""
  message32=""
  message13=""
  message23=""
  message33=""
  tvbuttonviewtext()
end

--SendToServer("/WindowXCallS(\"batscmsgwindow\",\"inputviewchange\",\"0\")")
function teamviewprocesswindow(val)
    local str_team= {}
    local a = __split(val, ",")
    for k,v in pairs(a) do
	  table.insert(str_team,v)	
    end

    local position = str_team[1]
    local player = str_team[2]
    local status2 = str_team[3]
    local Php = tonumber(str_team[4])
    local Phpmax = tonumber(str_team[5])
    local Psp = tonumber(str_team[6])
    local Pspmax = tonumber(str_team[7])
    local Pep = tonumber(str_team[8])
    local Pepmax = tonumber(str_team[9])
    local Pexp = tonumber(str_team[10])
    local Plevel = str_team[11]
    local hppct = Php / Phpmax
    local sppct = Psp / Pspmax
    local eppct = Pep / Pepmax
    inputviewchange(iconheight)
    tvbuttonviewtext(status2.."|"..Plevel, position)
    CancelCallback(103)
    if position == "1.1" then
        teamview11:setVisibility(View.VISIBLE)
        tv_teamview11:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview11hp, hppct, "hp")
        teamviewset(teamview11sp, sppct, "sp")
        teamviewset(teamview11ep, eppct, "ep")
    elseif position == "1.2" then
        teamview12:setVisibility(View.VISIBLE)
        tv_teamview12:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview12hp, hppct, "hp")
        teamviewset(teamview12sp, sppct, "sp")
        teamviewset(teamview12ep, eppct, "ep")
    elseif position == "1.3" then
        teamview13:setVisibility(View.VISIBLE)
        tv_teamview13:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview13hp, hppct, "hp")
        teamviewset(teamview13sp, sppct, "sp")
        teamviewset(teamview13ep, eppct, "ep")
    elseif position == "2.1" then
        teamview21:setVisibility(View.VISIBLE)
        tv_teamview21:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview21hp, hppct, "hp")
        teamviewset(teamview21sp, sppct, "sp")
        teamviewset(teamview21ep, eppct, "ep")
    elseif position == "2.2" then
        teamview22:setVisibility(View.VISIBLE)
        tv_teamview22:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview22hp, hppct, "hp")
        teamviewset(teamview22sp, sppct, "sp")
        teamviewset(teamview22ep, eppct, "ep")
    elseif position == "2.3" then
        teamview23:setVisibility(View.VISIBLE)
        tv_teamview23:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview23hp, hppct, "hp")
        teamviewset(teamview23sp, sppct, "sp")
        teamviewset(teamview23ep, eppct, "ep")
    elseif position == "3.1" then
        teamview31:setVisibility(View.VISIBLE)
        tv_teamview31:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview31hp, hppct, "hp")
        teamviewset(teamview31sp, sppct, "sp")
        teamviewset(teamview31ep, eppct, "ep")
    elseif position == "3.2" then
        teamview32:setVisibility(View.VISIBLE)
        tv_teamview32:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview32hp, hppct, "hp")
        teamviewset(teamview32sp, sppct, "sp")
        teamviewset(teamview32ep, eppct, "ep")
    elseif position == "3.3" then
        teamview33:setVisibility(View.VISIBLE)
        tv_teamview33:setText(string.format("%s:%s >%s\n%-7s%7s",player,Php,Pexp,Psp,Pep))
        teamviewset(teamview33hp, hppct, "hp")
        teamviewset(teamview33sp, sppct, "sp")
        teamviewset(teamview33ep, eppct, "ep")   
    end
    ScheduleCallback(103,"teamviewgone",9000)
end

--| 1.2  Potion         ldr  835( 835)  326( 326) 300(300) |  50 |            0 |
------------teamview set --------

---------imgmessage setting-----press command > flip command > icon change after press > press command after change > flip command after change > icon change again after press -------
imgmessage(imageview, ".loadset bags", "eq", "items", 1, ".loadset Brief", "eq", "portraits", 1)
imgmessage(imageview2, ".dmgifs on;.loadset rctgt;blook", ".tgton on;grep -q -A 1 'Niubi' blook", "status", 2, ".dmgifs off;.loadset Brief", ".tgton on;grep -q -A 1 'Niubi' blook", "mounts", 1)
imgmessage5items(barView, "sc;score", ".keyboard party create ;pss", "show summary;ps;.keyboard disband", "ucmn;.kb cbm", "sot")

imgmessage5items(buttonview0, ".loadset Brief;set 23 on", ".loadset travel", "sc;.kb .wis ", "sc;.kb .wis except ", "sc;.kb .wis nearest ")
imgmessage(buttonview1, "gagoutput eqset defset;/Note(\"\\27[1m\\n-------EQ ------- >>> Default\\27[0m\\n\\n\");gagoutput eqset command sprset put <item> in frame;/WindowXCallS(\"batscmsgwindow\",\"processscanep\", \"Default <<<-- EQ --\")", "gagoutput eqset command sprset get <item> from frame;gagoutput eqset replacing sprset;/Note(\"\\27[1m\\n-------EQ ------- >>> Spr\\27[0m\\n\\n\");/WindowXCallS(\"batscmsgwindow\",\"processscanep\", \"Spr <<<-- EQ --\")", 0, 0, 0, 0, 0, 0)
imgmessage5items(buttonview2, "ccatch change", ".kb .seq ", ".kb .smon ", ".kb .swiki ", ".kb .swiki ")
imgmessage(buttonview3, ".timer info 300;rideniubi", "dismount;lead niubi;.kb release niubi;sleep", 0, 0, 0, 0, 0, 0)
imgmessage(buttonview4, ".loadset default", ".loadset default", 0, 0, 0, 0, 0, 0)
imgmessage5items(buttonview5, "clw", ".keyboard cure ", ".keyboard cure ", "show effects", "show effects")
imgmessage5items(buttonview6, "var1", "var2", "var3", "var4", "var5")
--imgmessage(buttonview7, "var2", "var4", 0, 0, 0, 0, 0, 0)
imgmessage5items(buttonview8, "brief brief;set 23 on", "brief verbose", "brief weather", "set 23 off",  "set 23 on")
--imgmessage(tv_buttonview4, 0, "/WindowXCallS(\"batscmsgwindow\",\"inputviewchangeswitch\")", 0, 0, 0, 0, 0, 0)

inputviewfold = true
function inputviewchangeswitch()
     if inputviewfold then
         inputviewfold = false
         inputviewchange(120)
     else
         inputviewfold = true
         inputviewchange(0)
     end
 end
---------------------------------------

--[[iconExLogic = {
    index1 = {
      {classify = 1, pressmsg = ".loadset bags", flipmsg = "eq", extype1 = "items", exnum1 = 1, extype2 = 0, exnum2 = 0},
      {classify = 2, pressmsg = ".loadset Brief", flipmsg = "eq", extype = "items", exnum = 1, extype2 = 0, exnum2 = 0}
    },
    index2 = {
    
    }
}]]





--[[
local clicker = {}
function clicker.onClick(v)
    SendToServer(message)
	return true
end
clicker_cb = luajava.createProxy("android.view.View$OnClickListener",clicker)
imgwindowx:setOnClickListener(clicker_cb)

function longPressListener.onTouch(v,e)
	action = e:getAction()
	if(action == MotionEvent.ACTION_DOWN) then
		ScheduleCallback(100,"doExpand",1000)
		moveLast = e:getY()
		moveTotal = 0
		v:onTouchEvent(e)
		return true
	elseif( action == MotionEvent.ACTION_MOVE) then
		moveDelta = e:getY() - moveLast
		moveLast = e:getY()
		moveTotal = moveTotal + moveDelta
		if(moveTotal > 30) then
			CancelCallback(100)
		end
		v:onTouchEvent(e)
		return true
	elseif(action == MotionEvent.ACTION_UP) then
		v:onTouchEvent(e) 
		moveTotal = 0
		CancelCallback(100)
		return true
	end
	return false
end
longPressListener_cb = luajava.createProxy("android.view.View$OnTouchListener",longPressListener)
chatOutputView:setOnTouchListener(longPressListener_cb)
]]