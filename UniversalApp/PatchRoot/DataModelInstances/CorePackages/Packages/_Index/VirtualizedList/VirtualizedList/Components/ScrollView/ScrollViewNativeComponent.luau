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

function scrollViewNativeComponent.init(p1, p2)
	-- upvalues: reactModule (ref), t (ref), otterModule (ref)
	p1.props = p2
	p1._nativeRef = reactModule.createRef()
	p1.lastScrollEventTime = 0
	p1.animationConfig = if p1.props.animationConfig then p1.props.animationConfig else t
	p1.motor = otterModule.createGroupMotor({ x = 0, y = 0 })
	p1.motorStepDisconnect = p1.motor:onStep(function(p3)
		-- upvalues: p1 (ref)
		p1._nativeRef.current.CanvasPosition = Vector2.new(p3.x, p3.y)
	end)
	
	function p0._nativeRef.animateScrollTo(p3, p4)
		-- upvalues: p1 (ref)
		p1:_startAnimatedScroll(p3, p4)
	end
end

function scrollViewNativeComponent._validateAnimatedScrollInputs(p1, p2, p3)
	-- upvalues: console (ref)
	if not p1._nativeRef.current then
		console.error("scrollTo animation failed: ScrollViewNativeComponent._nativeRef instance is undefined")
	end
	if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.X then
		if p1._nativeRef.current.AbsoluteCanvasSize.X < p2 then
			console.warn("scrollTo animation goal out of bounds, setting X goal to: " .. tostring(p1._nativeRef.current.AbsoluteCanvasSize.X - p1._nativeRef.current.AbsoluteWindowSize.X))
			
			return
		elseif p2 < 0 then
			console.warn("scrollTo animation goal out of bounds, setting X goal to: 0")
			
			return
		end
	elseif p1._nativeRef.current.AbsoluteCanvasSize.Y < p3 then
		console.warn("scrollTo animation goal out of bounds, setting Y goal to: " .. tostring(p1._nativeRef.current.AbsoluteCanvasSize.Y - p1._nativeRef.current.AbsoluteWindowSize.Y))
		
		return
	elseif p3 < 0 then
		console.warn("scrollTo animation goal out of bounds, setting Y goal to: 0")
	end
end

function scrollViewNativeComponent._startAnimatedScroll(p1, p2, p3)
	-- upvalues: otterModule (ref)
	if _G.__DEV__ then
		p1:_validateAnimatedScrollInputs(p2, p3)
	end
	local canvasPosition = p1._nativeRef.current.CanvasPosition
	p1.motor:setGoal({
		x = otterModule.instant(canvasPosition.X),
		y = otterModule.instant(canvasPosition.Y)
	})
	p1.motor:step(0)
	p1.motor:setGoal({
		x = otterModule.spring(p2, p1.animationConfig),
		y = otterModule.spring(p3, p1.animationConfig)
	})
end

function scrollViewNativeComponent.render(p1)
	-- upvalues: array (ref), object (ref), change (ref), event (ref), reactModule (ref)
	local assign = object.assign
	assign = assign({
		Name = "RCTScrollView",
		ScrollingEnabled = p1.props.scrollEnabled ~= nil or p1.props.scrollEnabled,
		Size = UDim2.new(1, 0, 1, 0),
		CanvasPosition = p1.props.CanvasPosition,
		CanvasSize = p1.props.CanvasSize or UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = p1.props.AutomaticCanvasSize or Enum.AutomaticSize.XY,
		ScrollBarThickness = if p1.props.horizontal and p1.props.showsHorizontalScrollIndicator == false or not p1.props.horizontal and p1.props.showsVerticalScrollIndicator == false then 0 else nil,
		ref = p1._nativeRef,
		[change.AbsoluteWindowSize] = p1.props.onLayout,
		[change.CanvasPosition] = function(p2)
			-- upvalues: p1 (ref)
			local var1 = os.clock() * 1000
			
			if (p1.props.scrollEventThrottle or 0) < var1 - p1.lastScrollEventTime then
				p1.props.onScroll(p2)
				p1.lastScrollEventTime = var1
			end
		end,
		[event.InputBegan] = function(p2, p3)
			-- upvalues: p1 (ref)
			if (p3.UserInputType == Enum.UserInputType.MouseWheel or p3.UserInputType == Enum.UserInputType.Touch) and p1.motor ~= nil then
				p1.motor:stop()
			end
			if p3.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchStart(p2, p3)
			end
		end,
		[event.InputEnded] = function(p2, p3)
			-- upvalues: p1 (ref)
			if p3.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchEnd(p2, p3)
			end
		end,
		[event.InputChanged] = function(p2, p3)
			-- upvalues: p1 (ref)
			if p3.UserInputType == Enum.UserInputType.Touch then
				p1.props.onTouchMove(p2, p3)
			end
		end,
		[event.SelectionChanged] = if p1.props.onSelectionChanged then function(p2, p3, p4, p5)
			-- upvalues: p1 (ref)
			p1.props.onSelectionChanged(p2, p3, p4, p5)
		end else nil
	}, if array.isArray(p1.props.style) then array.reduce(p1.props.style, function(p2, p3)
		-- upvalues: object (copy)
		return object.assign(p2, p3)
	end, {}) else p1.props.style)
	
	return reactModule.createElement("ScrollingFrame", assign, {
		Layout = if p1.props.inverted and not p1.props.getItemLayout then reactModule.createElement("UIListLayout", {
			HorizontalAlignment = if p1.props.horizontal then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center,
			VerticalAlignment = if p1.props.horizontal then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom
		}) else nil,
		[1] = p1.props.children
	})
end

function scrollViewNativeComponent.willUnmount(p1)
	if p1.motor ~= nil then
		p1.motor:destroy()
	end
	if p1.motorStepDisconnect ~= nil then
		p1.motorStepDisconnect()
	end
end

return scrollViewNativeComponent