local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local OtterModule = require(CorePackages.Packages.Otter)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local WithStyleFunction = UIBloxModule.Style.withStyle
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local config = { dampingRatio = 1, frequency = 3.5 }
local ArrowNav = RoactModule.PureComponent:extend("ArrowNav")
ArrowNav.validateProps = TModule.intersection(TModule.strictInterface({
	AnchorPoint = TModule.optional(TModule.Vector2),
	Position = TModule.optional(TModule.UDim2),
	Image = TModule.table,
	Visible = TModule.optional(TModule.union(TModule.boolean, TModule.table)),
	navDirection = TModule.optional(TModule.string),
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
}), function(p1)
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

function ArrowNav.init(p1)
	-- upvalues: RunService (copy), ConstantsModule (copy), OtterModule (copy)
	p1.holdConn = nil
	p1.timeOfInputBegan = 0
	
	function p1:handleInputBegan(p2)
		-- upvalues: p1 (copy)
		(p1.props.onPressHoldInputBegan or p1.onPressHoldInputBegan)(p2, p1.props.navDirection)
	end
	
	function p1:handleInputEnded(p2)
		-- upvalues: p1 (copy)
		(p1.props.onPressHoldInputEnded or p1.onPressHoldInputEnded)(p2, p1.props.navDirection)
	end
	
	function p1.getNewCanvasPosition(X): Vector2
		-- upvalues: p1 (copy)
		return p1.props.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(X, 0)
	end
	
	function p1.disconnectHoldConn()
		-- upvalues: p1 (copy)
		if p1.holdConn ~= nil then
			p1.holdConn:Disconnect()
			p1.holdConn = nil
			
			return
		end
	end
	
	function p1.onPressHoldInputBegan(Input, ISLEFT)
		-- upvalues: p1 (copy), RunService (upval), ConstantsModule (upval)
		if Input.UserInputState == Enum.UserInputState.Begin then
			p1.timeOfInputBegan = tick()
			p1.disconnectHoldConn()
			p1.holdConn = RunService.RenderStepped:connect(function(DeltaTime)
				-- upvalues: p1 (upval), ConstantsModule (upval), ISLEFT (copy)
				p1.props.defaultUseProps.updateCanvasPosition((p1.getNewCanvasPosition((if ISLEFT == ConstantsModule.NavigationDirection.IS_LEFT then -1 else 1) * 500 * DeltaTime * (tick() - p1.timeOfInputBegan) ^ 2)))
			end)
			
			return
		end
	end
	
	function p1.onPressHoldInputEnded(Input, p2)
		-- upvalues: p1 (copy), OtterModule (upval)
		if Input.UserInputState ~= Enum.UserInputState.End then return end
		local Current = p1.props.defaultUseProps.scrollingFrameRef.current
		
		if tick() - p1.timeOfInputBegan <= 0.5 then
			if p1.motor then
				p1.motor:destroy()
			end
			p1:setMotor(Current.CanvasPosition.X)
			p1.motor:setGoal(p1:getGoal(p2))
		else
			p1.motor:setGoal(OtterModule.instant(Current.CanvasPosition.X))
		end
		p1.disconnectHoldConn()
	end
end

function ArrowNav.getGoal(p1, p2)
	-- upvalues: OtterModule (copy), config (copy)
	return OtterModule.spring(p1:getScrollToLocation(p2), config)
end

function ArrowNav.didMount(p1)
	p1:setMotor(0)
end

function ArrowNav.setMotor(p1, X)
	-- upvalues: OtterModule (copy)
	p1.motor = OtterModule.createSingleMotor(X)
	p1.motor:onStep(function(X)
		-- upvalues: p1 (copy)
		p1.props.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
	end)
	p1.motor:onComplete(function(X)
		-- upvalues: p1 (copy)
		p1.props.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
	end)
end

function ArrowNav.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetButton (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetButton (upval), p1 (copy)
		return RoactModule.createElement(ImageSetButton, {
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

function ArrowNav.willUnmount(p1)
	p1.disconnectHoldConn()
	
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

function ArrowNav.getScrollToLocation(p1, ISLEFT): number
	-- upvalues: ConstantsModule (copy)
	local Current = p1.props.defaultUseProps.scrollingFrameRef.current
	local ButtonPadding: number = p1.props.defaultUseProps.buttonPadding
	local List = {}
	local ButtonRefs = p1.props.defaultUseProps.buttonRefs
	local ButtonWidth = p1.props.defaultUseProps.buttonWidth
	local NumButtons = p1.props.defaultUseProps.numButtons
	local PadOutsideEdges = p1.props.defaultUseProps.padOutsideEdges
	
	if ButtonWidth and NumButtons then
		List = table.create(NumButtons, ButtonWidth)
	else
		for _, buttonRef in ButtonRefs do
			table.insert(List, buttonRef.current and buttonRef.current.Size.X.Offset or 0)
		end
	end
	local Total = 0
	
	if ISLEFT == ConstantsModule.NavigationDirection.IS_LEFT then
		local XDelta = Current.CanvasPosition.X - Current.AbsoluteSize.X * 0.4
		
		for _, value in List do
			if Total + value + ButtonPadding < XDelta then
				Total = Total + value + ButtonPadding
				continue
			end
		end
		return Total
	else
		local NewX = Current.CanvasPosition.X + Current.AbsoluteSize.X * 0.4
		Total = -Current.AbsoluteSize.X
		
		if PadOutsideEdges then
			Total += ButtonPadding
		end
		for _, value1 in List do
			if NewX < Total then
				return Total
			end
			Total = Total + value1 + ButtonPadding
		end
	end
	return Total
end

return ArrowNav