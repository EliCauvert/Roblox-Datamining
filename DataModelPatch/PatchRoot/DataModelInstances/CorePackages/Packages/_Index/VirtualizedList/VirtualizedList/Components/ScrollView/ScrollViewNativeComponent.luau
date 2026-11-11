local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Console = LuauPolyfillModule.console
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent.React)
local Change = ReactModule.Change
local Event = ReactModule.Event
local OtterModule = require(Parent.Otter)
local config = { restingPositionLimit = 1, restingVelocityLimit = 10 }
local ScrollViewNativeComponent = ReactModule.Component:extend("ScrollViewNativeComponent")

function ScrollViewNativeComponent.init(p1, Props)
	-- upvalues: ReactModule (copy), config (copy), OtterModule (copy)
	p1.props = Props
	p1._nativeRef = ReactModule.createRef()
	p1.lastScrollEventTime = 0
	p1.animationConfig = if p1.props.animationConfig then p1.props.animationConfig else config
	p1.motor = OtterModule.createGroupMotor({ x = 0, y = 0 })
	p1.motorStepDisconnect = p1.motor:onStep(function(Vector)
		-- upvalues: p1 (copy)
		p1._nativeRef.current.CanvasPosition = Vector2.new(Vector.x, Vector.y)
	end)
	
	function p1._nativeRef.animateScrollTo(p2, p3)
		-- upvalues: p1 (copy)
		p1:_startAnimatedScroll(p2, p3)
	end
end

function ScrollViewNativeComponent._validateAnimatedScrollInputs(p1, p2: number, p3: number)
	-- upvalues: Console (copy)
	if not p1._nativeRef.current then
		Console.error("scrollTo animation failed: ScrollViewNativeComponent._nativeRef instance is undefined")
	end
	if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.X then
		if p1._nativeRef.current.AbsoluteCanvasSize.X < p2 then
			Console.warn("scrollTo animation goal out of bounds, setting X goal to: " .. tostring(p1._nativeRef.current.AbsoluteCanvasSize.X - p1._nativeRef.current.AbsoluteWindowSize.X))
			
			return
		end
		if p2 < 0 then
			Console.warn("scrollTo animation goal out of bounds, setting X goal to: 0")
			
			return
		end
	elseif p1._nativeRef.current.AbsoluteCanvasSize.Y < p3 then
		Console.warn("scrollTo animation goal out of bounds, setting Y goal to: " .. tostring(p1._nativeRef.current.AbsoluteCanvasSize.Y - p1._nativeRef.current.AbsoluteWindowSize.Y))
		
		return
	else
		if p3 < 0 then
			Console.warn("scrollTo animation goal out of bounds, setting Y goal to: 0")
		end
	end
end

function ScrollViewNativeComponent._startAnimatedScroll(p1, p2, p3)
	-- upvalues: OtterModule (copy)
	if _G.__DEV__ then
		p1:_validateAnimatedScrollInputs(p2, p3)
	end
	local CanvasPosition = p1._nativeRef.current.CanvasPosition
	p1.motor:setGoal({
		x = OtterModule.instant(CanvasPosition.X),
		y = OtterModule.instant(CanvasPosition.Y)
	})
	p1.motor:step(0)
	p1.motor:setGoal({
		x = OtterModule.spring(p2, p1.animationConfig),
		y = OtterModule.spring(p3, p1.animationConfig)
	})
end

function ScrollViewNativeComponent.render(p1)
	-- upvalues: Array (copy), Object (copy), Change (copy), Event (copy), ReactModule (copy)
	return ReactModule.createElement("ScrollingFrame", Object.assign({
		Name = "RCTScrollView",
		ScrollingEnabled = p1.props.scrollEnabled == nil or p1.props.scrollEnabled,
		Size = UDim2.new(1, 0, 1, 0),
		CanvasPosition = p1.props.CanvasPosition,
		CanvasSize = p1.props.CanvasSize or UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = p1.props.AutomaticCanvasSize or Enum.AutomaticSize.XY,
		ScrollBarThickness = if p1.props.horizontal and p1.props.showsHorizontalScrollIndicator == false then 0 elseif p1.props.horizontal or p1.props.showsVerticalScrollIndicator ~= false then nil else 0,
		ref = p1._nativeRef,
		[Change.AbsoluteWindowSize] = p1.props.onLayout,
		[Change.CanvasPosition] = function(p2)
			-- upvalues: p1 (copy)
			local ScaledClockTime = os.clock() * 1000
			
			if (p1.props.scrollEventThrottle or 0) < ScaledClockTime - p1.lastScrollEventTime then
				p1.props.onScroll(p2)
				p1.lastScrollEventTime = ScaledClockTime
			end
		end,
		[Event.InputBegan] = function(p2, Input)
			-- upvalues: p1 (copy)
			if (Input.UserInputType == Enum.UserInputType.MouseWheel or Input.UserInputType == Enum.UserInputType.Touch) and p1.motor ~= nil then
				p1.motor:stop()
			end
			if Input.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchStart(p2, Input)
			end
		end,
		[Event.InputEnded] = function(p2, Input)
			-- upvalues: p1 (copy)
			if Input.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchEnd(p2, Input)
			end
		end,
		[Event.InputChanged] = function(p2, Input)
			-- upvalues: p1 (copy)
			if Input.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchMove(p2, Input)
			end
		end,
		[Event.SelectionChanged] = if p1.props.onSelectionChanged then function(p2, p3, p4, p5)
			-- upvalues: p1 (copy)
			p1.props.onSelectionChanged(p2, p3, p4, p5)
		end else nil
	}, if Array.isArray(p1.props.style) then Array.reduce(p1.props.style, function(p2, p3)
		-- upvalues: Object (upval)
		return Object.assign(p2, p3)
	end, {}) else p1.props.style), {
		Layout = if p1.props.inverted and not p1.props.getItemLayout then ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = if p1.props.horizontal then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center,
			VerticalAlignment = if p1.props.horizontal then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom
		}) else nil,
		[1] = p1.props.children
	})
end

function ScrollViewNativeComponent.willUnmount(p1)
	if p1.motor ~= nil then
		p1.motor:destroy()
	end
	if p1.motorStepDisconnect ~= nil then
		p1.motorStepDisconnect()
	end
end

return ScrollViewNativeComponent