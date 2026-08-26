local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent.Core
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local otterModule = require(parent_1.Otter)
local button = require(core.ImageSet.ImageSetComponent).Button
local withStyleModule = require(core.Style.withStyle)
local navigationDirectionModule = require(script.Parent.NavigationDirection)
local t = { dampingRatio = 1, frequency = 3.5 }
local arrowNav = roactModule.PureComponent:extend("ArrowNav")
arrowNav.validateProps = tModule.intersection(tModule.strictInterface({
	AnchorPoint = tModule.optional(tModule.Vector2),
	Position = tModule.optional(tModule.UDim2),
	Image = tModule.table,
	Visible = tModule.optional(tModule.union(tModule.boolean, tModule.table)),
	navDirection = tModule.optional(tModule.userdata),
	onPressHoldInputBegan = tModule.optional(tModule.callback),
	onPressHoldInputEnded = tModule.optional(tModule.callback),
	defaultUseProps = tModule.optional(tModule.strictInterface({
		scrollingFrameRef = tModule.table,
		buttonRefs = tModule.optional(tModule.table),
		buttonWidth = tModule.optional(tModule.number),
		numButtons = tModule.optional(tModule.number),
		padOutsideEdges = tModule.optional(tModule.boolean),
		buttonPadding = tModule.number,
		updateCanvasPosition = tModule.callback
	}))
}), function(p1)
	if p1.defaultUseProps then
		if p1.defaultUseProps.buttonRefs ~= nil then
			if p1.defaultUseProps.buttonWidth ~= nil then
				return false, "Cannot set both buttonWidth and buttonRefs"
			elseif p1.defaultUseProps.numButtons ~= nil then
				return false, "Cannot set both numButtons and buttonRefs"
			elseif p1.defaultUseProps.buttonWidth ~= nil and p1.defaultUseProps.numButtons == nil then
				return false, "If setting buttonWidth must also set numButtons"
			elseif p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons ~= nil then
				return false, "If setting numButtons must also set buttonWidth"
			elseif p1.defaultUseProps.buttonRefs == nil and p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons == nil then
				return false, "Must set either buttonRefs or (buttonWidth and numButtons)"
			end
		end
	end
	return true
end)
arrowNav.defaultProps = {
	Visible = true,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0)
}

function arrowNav.init(p1)
	p1.holdConn = nil
	p1.timeOfInputBegan = 0
	
	function p1.handleInputBegan(_, p2)
		-- upvalues: p1 (ref)
		local navDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputBegan then
			p1.props.onPressHoldInputBegan(p2, navDirection)
			
			return
		end
		p1:onPressHoldInputBegan(p2, navDirection)
	end
	
	function p1.handleInputEnded(_, p2)
		-- upvalues: p1 (ref)
		local navDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputEnded then
			p1.props.onPressHoldInputEnded(p2, navDirection)
			
			return
		end
		p1:onPressHoldInputEnded(p2, navDirection)
	end
end

function arrowNav.getGoal(p1, p2)
	-- upvalues: otterModule (ref), t (ref)
	return otterModule.spring(p1:getScrollToLocation(p2), t)
end

function arrowNav.didMount(p1)
	p1:setMotor(0)
end

function arrowNav.setMotor(value, p1)
	-- upvalues: otterModule (ref)
	value.motor = otterModule.createSingleMotor(p1)
	value.motor:onStep(function(p2)
		-- upvalues: value (ref)
		value.props.defaultUseProps.updateCanvasPosition(Vector2.new(p2, 0))
	end)
	value.motor:onComplete(function(p2)
		-- upvalues: value (ref)
		value.props.defaultUseProps.updateCanvasPosition(Vector2.new(p2, 0))
	end)
end

function arrowNav.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), button (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), button (copy), p1 (ref)
		return roactModule.createElement(button, {
			AnchorPoint = p1.props.AnchorPoint,
			Position = p1.props.Position,
			Image = p1.props.Image,
			Visible = p1.props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = p2.Theme.IconEmphasis.Color,
			Size = UDim2.fromOffset(36, 36),
			[roactModule.Event.InputBegan] = p1.handleInputBegan,
			[roactModule.Event.InputEnded] = p1.handleInputEnded
		})
	end)
end

function arrowNav.willUnmount(p1)
	p1:disconnectHoldConn()
	
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

function arrowNav.getNewCanvasPosition(p1, p2)
	return p1.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(p2, 0)
end

function arrowNav.disconnectHoldConn(p1)
	if p1.holdConn == nil then
		return
	end
	p1.holdConn:Disconnect()
	p1.holdConn = nil
end

function arrowNav.onPressHoldInputBegan(p1, p2, p3)
	-- upvalues: runService (ref), navigationDirectionModule (ref)
	if p2.UserInputState == Enum.UserInputState.Begin then
		p1.timeOfInputBegan = tick()
		p1:disconnectHoldConn()
		p1.holdConn = runService.RenderStepped:connect(function(p4)
			-- upvalues: p1 (ref), navigationDirectionModule (copy), p3 (ref)
			p1.props.defaultUseProps.updateCanvasPosition(p1:getNewCanvasPosition((if p3 == navigationDirectionModule.IsLeft then -1 else 1) * 500 * p4 * (tick() - p1.timeOfInputBegan) ^ 2))
		end)
		
		return
	end
end

function arrowNav.onPressHoldInputEnded(p1, p2, p3)
	-- upvalues: otterModule (ref)
	if p2.UserInputState ~= Enum.UserInputState.End then return end
	local current = p1.props.defaultUseProps.scrollingFrameRef.current
	
	if tick() - p1.timeOfInputBegan <= 0.5 then
		if p1.motor then
			p1.motor:destroy()
		end
		p1:setMotor(current.CanvasPosition.X)
		p1.motor:setGoal(p1:getGoal(p3))
	else
		p1.motor:setGoal(otterModule.instant(current.CanvasPosition.X))
	end
	p1:disconnectHoldConn()
end

function arrowNav.getScrollToLocation(p1, p2)
	-- upvalues: navigationDirectionModule (ref)
	local buttonSizes = p1:getButtonSizes()
	
	return if p2 == navigationDirectionModule.IsLeft then p1:getScrollToLeftLocation(buttonSizes) else p1:getScrollToRightLocation(buttonSizes)
end

function arrowNav.getButtonSizes(p1)
	local buttonRefs = p1.props.defaultUseProps.buttonRefs
	local buttonWidth = p1.props.defaultUseProps.buttonWidth
	local numButtons = p1.props.defaultUseProps.numButtons
	
	if buttonWidth and numButtons then
		return table.create(numButtons, buttonWidth)
	end
	local t = {}
	
	for i, v in ipairs(buttonRefs) do
		table.insert(t, if v.current then v.current.AbsoluteSize.X else 0)
	end
	return t
end

function arrowNav.getScrollToLeftLocation(p2, p3)
	local current = p2.props.defaultUseProps.scrollingFrameRef.current
	local buttonPadding = p2.props.defaultUseProps.buttonPadding
	local var1 = current.CanvasPosition.X - current.AbsoluteSize.X * 0.4
	local var2 = 0
	
	for i, v in ipairs(p3) do
		if var1 > var2 + v + buttonPadding then
			var2 += v + buttonPadding
			continue
		end
		return var2
	end
	return var2
end

function arrowNav.getScrollToRightLocation(p4, p5)
	local current = p4.props.defaultUseProps.scrollingFrameRef.current
	local buttonPadding = p4.props.defaultUseProps.buttonPadding
	local padOutsideEdges = p4.props.defaultUseProps.padOutsideEdges
	local var3 = current.CanvasPosition.X + current.AbsoluteSize.X * 0.4
	local var4 = -current.AbsoluteSize.X
	
	if padOutsideEdges then
		var4 += buttonPadding
	end
	for i, v in ipairs(p5) do
		if var3 >= var4 then
			var4 += v + buttonPadding
			continue
		end
		return var4
	end
	return var4
end

return arrowNav