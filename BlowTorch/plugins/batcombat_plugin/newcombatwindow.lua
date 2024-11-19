
--
-- Top level utility constants
--respath = GetPluginInstallDirectory().."/icons"
local context = view:getContext()
local density = GetDisplayDensity()
local InterChangeView = view

local current_version = 14

local luajava = luajava
--
-- Classes needed by the script to do android-esque ui things.
local System = luajava.bindClass("java.lang.System")
local View = luajava.bindClass("android.view.View")
local Context = luajava.bindClass("android.content.Context")
local HorizontalScrollView = luajava.bindClass("android.widget.HorizontalScrollView")
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
--
-- Utility 'java primitive array' creation code
local Integer = luajava.bindClass("java.lang.Integer")
local Float = luajava.bindClass("java.lang.Float")
local Byte = luajava.bindClass("java.lang.Byte")

local IntegerInstance = luajava.new(Integer,0)
local IntegerClass = IntegerInstance:getClass()
local RawInteger = IntegerClass.TYPE

local FloatInstance = luajava.new(Float,0)
local FloatClass = FloatInstance:getClass()
local RawFloat = FloatClass.TYPE

local ByteInstance = luajava.new(Byte,0)
local ByteClass = ByteInstance:getClass()
local RawByte = ByteClass.TYPE

height_portrait = tonumber(GetOptionValue("height_portrait"))
height_landscape = tonumber(GetOptionValue("height_landscape"))
chatwidth = 740


local WRAP_CONTENT = LinearLayoutParams.WRAP_CONTENT
local MATCH_PARENT = LinearLayoutParams.FILL_PARENT


local wm = context:getSystemService(Context.WINDOW_SERVICE)
local display = wm:getDefaultDisplay()
local displayWidth = display:getWidth()
local displayHeight = display:getHeight()

local rootView = InterChangeView:getParentView()
InterChangeView:setId(9999595)
rootView:removeView(view)
rootView:addView(InterChangeView)



splitedMapView = rootView:findViewById(6666)
splitedMapViewLayoutParams = splitedMapView:getLayoutParams()
function setCombatViewPosition(val)
if val == "true" then
option_portrait = true
InterChangeViewLayoutParams = luajava.new(RelativeLayoutParams,displayWidth,height_portrait)
InterChangeViewLayoutParams:addRule(RelativeLayout.ABOVE,9107)
InterChangeViewLayoutParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
InterChangeViewLayoutParams:setMargins(0, 0, 0, 120)
InterChangeView:setLayoutParams(InterChangeViewLayoutParams)
splitedMapViewLayoutParams1 = splitedMapViewLayoutParams
splitedMapViewLayoutParams1:addRule(RelativeLayout.ABOVE,InterChangeView:getId())
splitedMapView:setLayoutParams(splitedMapViewLayoutParams1)
elseif val == "false" then
option_portrait = false
InterChangeViewLayoutParams = luajava.new(RelativeLayoutParams,displayHeight-chatwidth,height_landscape)
InterChangeViewLayoutParams:addRule(RelativeLayout.ABOVE,9107)
InterChangeViewLayoutParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
InterChangeViewLayoutParams:setMargins(0, 0, 0, 120)
InterChangeView:setLayoutParams(InterChangeViewLayoutParams)
splitedMapViewLayoutParams2 = splitedMapViewLayoutParams
splitedMapViewLayoutParams2:addRule(RelativeLayout.ABOVE,InterChangeView:getId())
splitedMapView:setLayoutParams(splitedMapViewLayoutParams2)
end
InterChangeView:setVisibility(View.GONE)
end





innerDividerView = rootView:findViewById(40)
innerDividerViewLayoutParams = innerDividerView:getLayoutParams()
topDividerView3 = luajava.new(View,innerDividerView:getContext())
if option_portrait then
topDividerView3Params = luajava.new(RelativeLayoutParams,innerDividerViewLayoutParams.width,3)
else
topDividerView3Params = luajava.new(RelativeLayoutParams,displayHeight-chatwidth,3)
end
topDividerView3:setId(9108)
topDividerView3:setLayoutParams(topDividerView3Params)
topDividerView3:setBackgroundColor(Color:argb(255,136,136,136))
rootView:addView(topDividerView3)
topDividerView3LayoutParams = topDividerView3:getLayoutParams()
topDividerView3LayoutParams:addRule(RelativeLayout.ABOVE,InterChangeView:getId())
topDividerView3LayoutParams:addRule(RelativeLayout.ALIGN_PARENT_LEFT)
topDividerView3:setLayoutParams(topDividerView3LayoutParams)

function combatbargone()
InterChangeView:setVisibility(View.GONE)
end
function combatbarshow()
InterChangeView:setVisibility(View.VISIBLE)
end


function EchoText(text)
	PluginXCallS("EchoText",text)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--[[diameter = displayWidth / 6
circleView1 = luajava.new(RelativeLayout, rootView:getContext())
circleParams1 = luajava.new(RelativeLayoutParams, diameter, diameter)
--circleParams1:addRule(RelativeLayout.CENTER_HORIZONTAL)
circleParams1:setMargins(diameter, 800, 0, 0)
circleView1:setLayoutParams(circleParams1)

-- 创建圆形的背景
circleDrawable = luajava.new(GradientDrawable)
circleDrawable:setShape(GradientDrawable.OVAL)
circleDrawable:setColor(Color:argb(1,1,0,0))
circleDrawable:setStroke(1, Color:argb(255,136,136,136))

-- 设置窗口的背景为圆形背景
circleView1:setBackground(circleDrawable)
rootView:addView(circleView1)
circleView1:setVisibility(View.GONE)

function circleviewset(val)
    circleView1:setVisibility(View.VISIBLE)
    if val == "STUN 1" then
    circleView1:setVisibility(View.VISIBLE)
    else
    circleView1:setVisibility(View.GONE)
    end
end]]

drawable = luajava.newInstance("android.graphics.drawable.BitmapDrawable",context:getResources(),"/storage/emulated/0/BlowTorch/Icons/spells/Achievement_TheNighthold_SpellbladeAluriel.jpg")
function menuClicked()
   Note("Menu Item Clicked!")
end

AddOptionCallback("menuClicked","Click Me!",drawable)