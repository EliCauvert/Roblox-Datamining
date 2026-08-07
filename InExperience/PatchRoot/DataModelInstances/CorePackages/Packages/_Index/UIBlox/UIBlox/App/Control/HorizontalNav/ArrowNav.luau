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
}), function(p0) --[[ line: 63 ]]
	if p0.defaultUseProps then
		if p0.defaultUseProps.buttonRefs ~= nil then
			if p0.defaultUseProps.buttonWidth ~= nil then
				return false, "Cannot set both buttonWidth and buttonRefs"
			elseif p0.defaultUseProps.numButtons ~= nil then
				return false, "Cannot set both numButtons and buttonRefs"
			elseif p0.defaultUseProps.buttonWidth ~= nil and p0.defaultUseProps.numButtons == nil then
				return false, "If setting buttonWidth must also set numButtons"
			elseif p0.defaultUseProps.buttonWidth == nil and p0.defaultUseProps.numButtons ~= nil then
				return false, "If setting numButtons must also set buttonWidth"
			elseif p0.defaultUseProps.buttonRefs == nil and p0.defaultUseProps.buttonWidth == nil and p0.defaultUseProps.numButtons == nil then
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

function arrowNav.init(p1) --[[ line: 97 ]]
	p1.holdConn = nil
	p1.timeOfInputBegan = 0
	
	function p1.handleInputBegan(_, p2) --[[ line: 101 ]]
		-- upvalues: p1 (ref)
		local navDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputBegan then
			p1.props.onPressHoldInputBegan(p2, navDirection)
			
			return
		end
		p1:onPressHoldInputBegan(p2, navDirection)
	end
	
	function p1.handleInputEnded(_, p3) --[[ line: 110 ]]
		-- upvalues: p1 (ref)
		local navDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputEnded then
			p1.props.onPressHoldInputEnded(p3, navDirection)
			
			return
		end
		p1:onPressHoldInputEnded(p3, navDirection)
	end
end

function arrowNav.getGoal(p4, p5) --[[ line: 120 ]]
	-- upvalues: otterModule (ref), t (ref)
	return otterModule.spring(p4:getScrollToLocation(p5), t)
end

function arrowNav.didMount(p6) --[[ line: 124 ]]
	p6:setMotor(0)
end

function arrowNav.setMotor(value, p7) --[[ line: 128 ]]
	-- upvalues: otterModule (ref)
	value.motor = otterModule.createSingleMotor(p7)
	value.motor:onStep(function(p8) --[[ line: 130 ]]
		-- upvalues: value (ref)
		value.props.defaultUseProps.updateCanvasPosition(Vector2.new(p8, 0))
	end)
	value.motor:onComplete(function(p9) --[[ line: 133 ]]
		-- upvalues: value (ref)
		value.props.defaultUseProps.updateCanvasPosition(Vector2.new(p9, 0))
	end)
end

function arrowNav.render(p10) --[[ line: 138 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), button (ref)
	return withStyleModule(function(p11) --[[ line: 139 ]]
		-- upvalues: roactModule (copy), button (copy), p10 (ref)
		return roactModule.createElement(button, {
			AnchorPoint = p10.props.AnchorPoint,
			Position = p10.props.Position,
			Image = p10.props.Image,
			Visible = p10.props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = p11.Theme.IconEmphasis.Color,
			Size = UDim2.fromOffset(36, 36),
			[roactModule.Event.InputBegan] = p10.handleInputBegan,
			[roactModule.Event.InputEnded] = p10.handleInputEnded
		})
	end)
end

function arrowNav.willUnmount(p12) --[[ line: 155 ]]
	p12:disconnectHoldConn()
	
	if p12.motor then
		p12.motor:destroy()
		p12.motor = nil
	end
end

function arrowNav.getNewCanvasPosition(p13, p14) --[[ line: 163 ]]
	return p13.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(p14, 0)
end

function arrowNav.disconnectHoldConn(p15) --[[ line: 168 ]]
	if p15.holdConn == nil then
		return
	end
	p15.holdConn:Disconnect()
	p15.holdConn = nil
end

function arrowNav.onPressHoldInputBegan(p16, p17, p18) --[[ line: 176 ]]
	-- upvalues: runService (ref), navigationDirectionModule (ref)
	if p17.UserInputState == Enum.UserInputState.Begin then
		p16.timeOfInputBegan = tick()
		p16:disconnectHoldConn()
		p16.holdConn = runService.RenderStepped:connect(function(p19) --[[ line: 182 ]]
			-- upvalues: p16 (ref), navigationDirectionModule (copy), p18 (ref)
			p16.props.defaultUseProps.updateCanvasPosition(p16:getNewCanvasPosition((if p18 == navigationDirectionModule.IsLeft then -1 else 1) * 500 * p19 * (tick() - p16.timeOfInputBegan) ^ 2))
		end)
		
		return
	end
end

function arrowNav.onPressHoldInputEnded(p20, p21, p22) --[[ line: 191 ]]
	-- upvalues: otterModule (ref)
	if p21.UserInputState ~= Enum.UserInputState.End then return end
	local current = p20.props.defaultUseProps.scrollingFrameRef.current
	
	if tick() - p20.timeOfInputBegan <= 0.5 then
		if p20.motor then
			p20.motor:destroy()
		end
		p20:setMotor(current.CanvasPosition.X)
		p20.motor:setGoal(p20:getGoal(p22))
	else
		p20.motor:setGoal(otterModule.instant(current.CanvasPosition.X))
	end
	p20:disconnectHoldConn()
end

function arrowNav.getScrollToLocation(p23, p24) --[[ line: 209 ]]
	-- upvalues: navigationDirectionModule (ref)
	local buttonSizes = p23:getButtonSizes()
	
	return if p24 == navigationDirectionModule.IsLeft then p23:getScrollToLeftLocation(buttonSizes) else p23:getScrollToRightLocation(buttonSizes)
end

function arrowNav.getButtonSizes(p25) --[[ line: 219 ]]
	local buttonRefs = p25.props.defaultUseProps.buttonRefs
	local buttonWidth = p25.props.defaultUseProps.buttonWidth
	local numButtons = p25.props.defaultUseProps.numButtons
	
	if buttonWidth and numButtons then
		return table.create(numButtons, buttonWidth)
	end
	local t = {}
	
	for i, v in ipairs(buttonRefs) do
		table.insert(t, if v.current then v.current.AbsoluteSize.X else 0)
	end
	return t
end

function arrowNav.getScrollToLeftLocation(p26, p27) --[[ line: 236 ]]
	local current = p26.props.defaultUseProps.scrollingFrameRef.current
	local buttonPadding = p26.props.defaultUseProps.buttonPadding
	local var10 = current.CanvasPosition.X - current.AbsoluteSize.X * 0.4
	local var11 = 0
	
	for i, v in ipairs(p27) do
		if var10 > var11 + v + buttonPadding then
			var11 += v + buttonPadding
			continue
		end
		return var11
	end
	return var11
end

function arrowNav.getScrollToRightLocation(p28, p29) --[[ line: 253 ]]
	local current = p28.props.defaultUseProps.scrollingFrameRef.current
	local buttonPadding = p28.props.defaultUseProps.buttonPadding
	local padOutsideEdges = p28.props.defaultUseProps.padOutsideEdges
	local var12 = current.CanvasPosition.X + current.AbsoluteSize.X * 0.4
	local var13 = -current.AbsoluteSize.X
	
	if padOutsideEdges then
		var13 += buttonPadding
	end
	for i, v in ipairs(p29) do
		if var12 >= var13 then
			var13 += v + buttonPadding
			continue
		end
		return var13
	end
	return var13
end

return arrowNav