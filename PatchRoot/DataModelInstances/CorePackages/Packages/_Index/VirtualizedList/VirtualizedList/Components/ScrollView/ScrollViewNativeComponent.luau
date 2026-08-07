-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local console = luauPolyfillModule.console
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent.React)
local change = reactModule.Change
local event = reactModule.Event
local otterModule = require(parent.Otter)
local t = { restingPositionLimit = 1, restingVelocityLimit = 10 }
local scrollViewNativeComponent = reactModule.Component:extend("ScrollViewNativeComponent")

function scrollViewNativeComponent.init(p0, p1) --[[ line: 62 ]]
	-- upvalues: reactModule (ref), t (ref), otterModule (ref)
	p0.props = p1
	p0._nativeRef = reactModule.createRef()
	p0.lastScrollEventTime = 0
	p0.animationConfig = if p0.props.animationConfig then p0.props.animationConfig else t
	p0.motor = otterModule.createGroupMotor({ x = 0, y = 0 })
	p0.motorStepDisconnect = p0.motor:onStep(function(p2) --[[ line: 74 ]]
		-- upvalues: p0 (ref)
		p0._nativeRef.current.CanvasPosition = Vector2.new(p2.x, p2.y)
	end)
	
	function p0._nativeRef.animateScrollTo(p3, p4) --[[ line: 78 ]]
		-- upvalues: p0 (ref)
		p0:_startAnimatedScroll(p3, p4)
	end
end

function scrollViewNativeComponent._validateAnimatedScrollInputs(p5, p6, p7) --[[ line: 83 ]]
	-- upvalues: console (ref)
	if not p5._nativeRef.current then
		console.error("scrollTo animation failed: ScrollViewNativeComponent._nativeRef instance is undefined")
	end
	if p5._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.X then
		if p5._nativeRef.current.AbsoluteCanvasSize.X < p6 then
			console.warn("scrollTo animation goal out of bounds, setting X goal to: " .. tostring(p5._nativeRef.current.AbsoluteCanvasSize.X - p5._nativeRef.current.AbsoluteWindowSize.X))
			
			return
		elseif p6 < 0 then
			console.warn("scrollTo animation goal out of bounds, setting X goal to: 0")
			
			return
		end
	elseif p5._nativeRef.current.AbsoluteCanvasSize.Y < p7 then
		console.warn("scrollTo animation goal out of bounds, setting Y goal to: " .. tostring(p5._nativeRef.current.AbsoluteCanvasSize.Y - p5._nativeRef.current.AbsoluteWindowSize.Y))
		
		return
	elseif p7 < 0 then
		console.warn("scrollTo animation goal out of bounds, setting Y goal to: 0")
	end
end

function scrollViewNativeComponent._startAnimatedScroll(p8, p9, p10) --[[ line: 113 ]]
	-- upvalues: otterModule (ref)
	if _G.__DEV__ then
		p8:_validateAnimatedScrollInputs(p9, p10)
	end
	local canvasPosition = p8._nativeRef.current.CanvasPosition
	p8.motor:setGoal({
		x = otterModule.instant(canvasPosition.X),
		y = otterModule.instant(canvasPosition.Y)
	})
	p8.motor:step(0)
	p8.motor:setGoal({
		x = otterModule.spring(p9, p8.animationConfig),
		y = otterModule.spring(p10, p8.animationConfig)
	})
end

function scrollViewNativeComponent.render(p11) --[[ line: 136 ]]
	-- upvalues: array (ref), object (ref), change (ref), event (ref), reactModule (ref)
	local assign = object.assign
	assign = assign({
		Name = "RCTScrollView",
		ScrollingEnabled = p11.props.scrollEnabled ~= nil or p11.props.scrollEnabled,
		Size = UDim2.new(1, 0, 1, 0),
		CanvasPosition = p11.props.CanvasPosition,
		CanvasSize = p11.props.CanvasSize or UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = p11.props.AutomaticCanvasSize or Enum.AutomaticSize.XY,
		ScrollBarThickness = if p11.props.horizontal and p11.props.showsHorizontalScrollIndicator == false or not p11.props.horizontal and p11.props.showsVerticalScrollIndicator == false then 0 else nil,
		ref = p11._nativeRef,
		[change.AbsoluteWindowSize] = p11.props.onLayout,
		[change.CanvasPosition] = function(p12) --[[ line: 157 ]]
			-- upvalues: p11 (ref)
			local var5 = os.clock() * 1000
			
			if (p11.props.scrollEventThrottle or 0) < var5 - p11.lastScrollEventTime then
				p11.props.onScroll(p12)
				p11.lastScrollEventTime = var5
			end
		end,
		[event.InputBegan] = function(p13, p14) --[[ line: 165 ]]
			-- upvalues: p11 (ref)
			if (p14.UserInputType == Enum.UserInputType.MouseWheel or p14.UserInputType == Enum.UserInputType.Touch) and p11.motor ~= nil then
				p11.motor:stop()
			end
			if p14.UserInputType == Enum.UserInputType.Touch then
				p11.props.onTouchStart(p13, p14)
			end
		end,
		[event.InputEnded] = function(p15, p16) --[[ line: 179 ]]
			-- upvalues: p11 (ref)
			if p16.UserInputType == Enum.UserInputType.Touch then
				p11.props.onTouchEnd(p15, p16)
			end
		end,
		[event.InputChanged] = function(p17, p18) --[[ line: 184 ]]
			-- upvalues: p11 (ref)
			if p18.UserInputType == Enum.UserInputType.Touch then
				p11.props.onTouchMove(p17, p18)
			end
		end,
		[event.SelectionChanged] = if p11.props.onSelectionChanged then function(p19, p20, p21, p22) --[[ line: 190 ]]
			-- upvalues: p11 (ref)
			p11.props.onSelectionChanged(p19, p20, p21, p22)
		end else nil
	}, if array.isArray(p11.props.style) then array.reduce(p11.props.style, function(p23, p24) --[[ line: 138 ]]
		-- upvalues: object (copy)
		return object.assign(p23, p24)
	end, {}) else p11.props.style)
	
	return reactModule.createElement("ScrollingFrame", assign, {
		Layout = if p11.props.inverted and not p11.props.getItemLayout then reactModule.createElement("UIListLayout", {
			HorizontalAlignment = if p11.props.horizontal then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center,
			VerticalAlignment = if p11.props.horizontal then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom
		}) else nil,
		[1] = p11.props.children
	})
end

function scrollViewNativeComponent.willUnmount(p25) --[[ line: 212 ]]
	if p25.motor ~= nil then
		p25.motor:destroy()
	end
	if p25.motorStepDisconnect ~= nil then
		p25.motorStepDisconnect()
	end
end

return scrollViewNativeComponent