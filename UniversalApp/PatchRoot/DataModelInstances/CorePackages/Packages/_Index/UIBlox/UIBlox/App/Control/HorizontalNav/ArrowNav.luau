local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent.Core
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local OtterModule = require(Parent1.Otter)
local Button = require(Core.ImageSet.ImageSetComponent).Button
local WithStyleModule = require(Core.Style.withStyle)
local NavigationDirectionModule = require(script.Parent.NavigationDirection)
local config = { dampingRatio = 1, frequency = 3.5 }
local ArrowNav = RoactModule.PureComponent:extend("ArrowNav")
ArrowNav.validateProps = TModule.intersection(TModule.strictInterface({
	AnchorPoint = TModule.optional(TModule.Vector2),
	Position = TModule.optional(TModule.UDim2),
	Image = TModule.table,
	Visible = TModule.optional(TModule.union(TModule.boolean, TModule.table)),
	navDirection = TModule.optional(TModule.userdata),
	onPressHoldInputBegan = TModule.optional(TModule.callback),
	onPressHoldInputEnded = TModule.optional(TModule.callback),
	defaultUseProps = TModule.optional(TModule.strictInterface({
		scrollingFrameRef = TModule.table,
		buttonRefs = TModule.optional(TModule.table),
		buttonWidth = TModule.optional(TModule.number),
		numButtons = TModule.optional(TModule.number),
		padOutsideEdges = TModule.optional(TModule.boolean),
		buttonPadding = TModule.number,
		updateCanvasPosition = TModule.callback
	}))
}), function(p1) --[[ Line: 63 ]]
	if p1.defaultUseProps then
		if p1.defaultUseProps.buttonRefs ~= nil then
			if p1.defaultUseProps.buttonWidth ~= nil then
				return false, "Cannot set both buttonWidth and buttonRefs"
			elseif p1.defaultUseProps.numButtons ~= nil then
				return false, "Cannot set both numButtons and buttonRefs"
			end
		end
		if p1.defaultUseProps.buttonWidth ~= nil and p1.defaultUseProps.numButtons == nil then
			return false, "If setting buttonWidth must also set numButtons"
		elseif p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons ~= nil then
			return false, "If setting numButtons must also set buttonWidth"
		elseif p1.defaultUseProps.buttonRefs == nil and p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons == nil then
			return false, "Must set either buttonRefs or (buttonWidth and numButtons)"
		end
	end
	return true
end)
ArrowNav.defaultProps = {
	Visible = true,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0)
}

function ArrowNav.init(p1) --[[ Line: 97 ]]
	p1.holdConn = nil
	p1.timeOfInputBegan = 0
	
	function p1:handleInputBegan(Input) --[[ Line: 101 ]]
		-- upvalues: p1 (copy)
		local NavDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputBegan then
			p1.props.onPressHoldInputBegan(Input, NavDirection)
			
			return
		else
			p1:onPressHoldInputBegan(Input, NavDirection)
		end
	end
	
	function p1:handleInputEnded(Input) --[[ Line: 110 ]]
		-- upvalues: p1 (copy)
		local NavDirection = p1.props.navDirection
		
		if p1.props.onPressHoldInputEnded then
			p1.props.onPressHoldInputEnded(Input, NavDirection)
			
			return
		else
			p1:onPressHoldInputEnded(Input, NavDirection)
		end
	end
end

function ArrowNav.getGoal(p1, p2) --[[ Line: 120 ]]
	-- upvalues: OtterModule (copy), config (copy)
	return OtterModule.spring(p1:getScrollToLocation(p2), config)
end

function ArrowNav.didMount(p1) --[[ Line: 124 ]]
	p1:setMotor(0)
end

function ArrowNav.setMotor(p1, X) --[[ Line: 128 ]]
	-- upvalues: OtterModule (copy)
	p1.motor = OtterModule.createSingleMotor(X)
	p1.motor:onStep(function(X) --[[ Line: 130 ]]
		-- upvalues: p1 (copy)
		p1.props.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
	end)
	p1.motor:onComplete(function(X) --[[ Line: 133 ]]
		-- upvalues: p1 (copy)
		p1.props.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
	end)
end

function ArrowNav.render(p1) --[[ Line: 138 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), Button (copy)
	return WithStyleModule(function(p2) --[[ Line: 139 ]]
		-- upvalues: RoactModule (upval), Button (upval), p1 (copy)
		return RoactModule.createElement(Button, {
			AnchorPoint = p1.props.AnchorPoint,
			Position = p1.props.Position,
			Image = p1.props.Image,
			Visible = p1.props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = p2.Theme.IconEmphasis.Color,
			Size = UDim2.fromOffset(36, 36),
			[RoactModule.Event.InputBegan] = p1.handleInputBegan,
			[RoactModule.Event.InputEnded] = p1.handleInputEnded
		})
	end)
end

function ArrowNav.willUnmount(p1) --[[ Line: 155 ]]
	p1:disconnectHoldConn()
	
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

function ArrowNav.getNewCanvasPosition(p1, X): Vector2 --[[ Line: 163 ]]
	return p1.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(X, 0)
end

function ArrowNav.disconnectHoldConn(p1) --[[ Line: 168 ]]
	if p1.holdConn ~= nil then
		p1.holdConn:Disconnect()
		p1.holdConn = nil
		
		return
	end
end

function ArrowNav.onPressHoldInputBegan(p1, Input, NavDirection) --[[ Line: 176 ]]
	-- upvalues: RunService (copy), NavigationDirectionModule (copy)
	if Input.UserInputState == Enum.UserInputState.Begin then
		p1.timeOfInputBegan = tick()
		p1:disconnectHoldConn()
		p1.holdConn = RunService.RenderStepped:connect(function(DeltaTime) --[[ Line: 182 ]]
			-- upvalues: p1 (copy), NavigationDirectionModule (upval), NavDirection (copy)
			p1.props.defaultUseProps.updateCanvasPosition((p1:getNewCanvasPosition((if NavDirection == NavigationDirectionModule.IsLeft then -1 else 1) * 500 * DeltaTime * (tick() - p1.timeOfInputBegan) ^ 2)))
		end)
		
		return
	end
end

function ArrowNav.onPressHoldInputEnded(p1, Input, NavDirection) --[[ Line: 191 ]]
	-- upvalues: OtterModule (copy)
	if Input.UserInputState ~= Enum.UserInputState.End then return end
	local Current = p1.props.defaultUseProps.scrollingFrameRef.current
	
	if tick() - p1.timeOfInputBegan <= 0.5 then
		if p1.motor then
			p1.motor:destroy()
		end
		p1:setMotor(Current.CanvasPosition.X)
		p1.motor:setGoal(p1:getGoal(NavDirection))
	else
		p1.motor:setGoal(OtterModule.instant(Current.CanvasPosition.X))
	end
	p1:disconnectHoldConn()
end

function ArrowNav.getScrollToLocation(p1, IsLeft) --[[ Line: 209 ]]
	-- upvalues: NavigationDirectionModule (copy)
	local ButtonSizes = p1:getButtonSizes()
	
	return if IsLeft == NavigationDirectionModule.IsLeft then p1:getScrollToLeftLocation(ButtonSizes) else p1:getScrollToRightLocation(ButtonSizes)
end

function ArrowNav.getButtonSizes(p1) --[[ Line: 219 ]]
	local ButtonRefs = p1.props.defaultUseProps.buttonRefs
	local ButtonWidth = p1.props.defaultUseProps.buttonWidth
	local NumButtons = p1.props.defaultUseProps.numButtons
	
	if ButtonWidth and NumButtons then
		return table.create(NumButtons, ButtonWidth)
	end
	local List = {}
	
	for _, buttonRef in ipairs(ButtonRefs) do
		table.insert(List, buttonRef.current and buttonRef.current.AbsoluteSize.X or 0)
	end
	return List
end

function ArrowNav.getScrollToLeftLocation(p2, ButtonSizes): number --[[ Line: 236 ]]
	local Current = p2.props.defaultUseProps.scrollingFrameRef.current
	local ButtonPadding: number = p2.props.defaultUseProps.buttonPadding
	local XDelta = Current.CanvasPosition.X - Current.AbsoluteSize.X * 0.4
	local Total = 0
	
	for _, buttonSize in ipairs(ButtonSizes) do
		if XDelta <= Total + buttonSize + ButtonPadding then
			return Total
		end
		Total += buttonSize + ButtonPadding
	end
	return Total
end

function ArrowNav.getScrollToRightLocation(p3, ButtonSizes) --[[ Line: 253 ]]
	local Current = p3.props.defaultUseProps.scrollingFrameRef.current
	local ButtonPadding = p3.props.defaultUseProps.buttonPadding
	local NewX = Current.CanvasPosition.X + Current.AbsoluteSize.X * 0.4
	local Negated = -Current.AbsoluteSize.X
	
	if p3.props.defaultUseProps.padOutsideEdges then
		Negated += ButtonPadding
	end
	for _, buttonSize in ipairs(ButtonSizes) do
		if NewX < Negated then
			return Negated
		end
		Negated += buttonSize + ButtonPadding
	end
	return Negated
end

return ArrowNav