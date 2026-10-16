local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)

local function _(Input) --[[ Line: 15 | Named "splitInputType" ]]
	local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
	local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
	
	return Input.UserInputType == Enum.UserInputType.Touch, IsUserInputTypeMatch or IsUserInputTypeMatch1, IsUserInputTypeMatch, IsUserInputTypeMatch1
end

local InteractionFrame = RoactModule.PureComponent:extend("InteractionFrame")
InteractionFrame.defaultProps = { Visible = true }
InteractionFrame.validateProps = TModule.interface({
	panByPixels = TModule.callback,
	rotateByPixels = TModule.callback,
	setAngularVelocityByPixels = TModule.callback,
	zoomToPoint = TModule.callback,
	doubleTap = TModule.optional(TModule.callback),
	Size = TModule.optional(TModule.UDim2),
	Position = TModule.optional(TModule.UDim2),
	Visible = TModule.optional(TModule.boolean),
	ZIndex = TModule.optional(TModule.number)
})

function InteractionFrame.disconnectEvents(p1) --[[ Line: 43 ]]
	p1.inputChangedConnection:Disconnect()
	p1.inputEndedConnection:Disconnect()
	p1.renderSteppedConnection:Disconnect()
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.renderSteppedConnection = nil
end

function InteractionFrame.getActiveInput(p1, Input) --[[ Line: 52 ]]
	local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton2
	local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.Touch
	local IsUserInputTypeMatch2: boolean = Input.UserInputType == Enum.UserInputType.MouseButton1 or IsUserInputTypeMatch
	local IsUserInputTypeMatch3: boolean = Input.UserInputType == Enum.UserInputType.MouseMovement or IsUserInputTypeMatch2
	
	if not IsUserInputTypeMatch3 and not IsUserInputTypeMatch1 then return end
	local ActiveMouseInput = nil
	
	if IsUserInputTypeMatch3 then
		ActiveMouseInput = p1.activeMouseInput
		
		return ActiveMouseInput
	end
	if IsUserInputTypeMatch1 then
		ActiveMouseInput = p1.activeTouchInputs[Input]
	end
	return ActiveMouseInput
end

function InteractionFrame.removeActivePointerInput(p1, Input, p2) --[[ Line: 71 ]]
	-- upvalues: UserInputService (copy)
	if p2 then
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
		p1.activeMouseInput = nil
	else
		p1.activeTouchInputs[Input] = nil
		p1.numActiveTouchInputs -= 1
	end
	p1.numActiveInputs -= 1
	
	if p1.numActiveInputs == 0 then
		p1:disconnectEvents()
	end
end

function InteractionFrame.handleDoubleTap(p1, Input, LastPrimaryPointerInputBeganTime) --[[ Line: 94 ]]
	if p1.lastPrimaryPointerInputBeganPosition then
		local LastPrimaryPointerInputBeganPositionDelta = p1.lastPrimaryPointerInputBeganPosition - Input.Position
		local LastPrimaryPointerInputBeganTimeDelta = LastPrimaryPointerInputBeganTime - p1.lastPrimaryPointerInputBeganTime
		
		if p1.props.doubleTap and LastPrimaryPointerInputBeganPositionDelta.Magnitude < 30 and LastPrimaryPointerInputBeganTimeDelta < 0.25 then
			p1.props.doubleTap()
		end
	end
	p1.lastPrimaryPointerInputBeganPosition = Input.Position
	p1.lastPrimaryPointerInputBeganTime = LastPrimaryPointerInputBeganTime
end

function InteractionFrame.addActivePointerInput(p1, Input, p2, LastTime) --[[ Line: 112 ]]
	-- upvalues: CryoModule (copy), UserInputService (copy), RunService (copy)
	if p1:getActiveInput(Input) then return end
	local ActiveMouseInput = { lastPosition = Input.Position, lastTime = LastTime }
	
	if p2 then
		p1.activeMouseInput = ActiveMouseInput
	else
		p1.activeTouchInputs[Input] = CryoModule.Dictionary.join(ActiveMouseInput, {
			lastDeltaTime = 0,
			lastDeltaPosition = vector.create(0, 0, 0)
		})
		p1.numActiveTouchInputs += 1
	end
	p1.numActiveInputs += 1
	
	if p1.numActiveInputs == 1 then
		p1.props.setAngularVelocityByPixels(0)
		p1.inputChangedConnection = UserInputService.InputChanged:Connect(p1.onInputChanged)
		p1.inputEndedConnection = UserInputService.InputEnded:Connect(p1.onInputEnded)
		p1.renderSteppedConnection = RunService.RenderStepped:Connect(p1.setInputNotChanged)
	end
end

function InteractionFrame.init(p1) --[[ Line: 141 ]]
	-- upvalues: UserInputService (copy)
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.lastPinchDistance = 1
	p1.lastPanTime = 0
	p1.lastPrimaryPointerInputBeganTime = 0
	p1.lastPrimaryPointerInputBeganPosition = nil
	p1.activeTouchInputs = {}
	p1.numActiveTouchInputs = 0
	p1.activeMouseInput = nil
	p1.numActiveInputs = 0
	
	function p1:handleScroll(Input) --[[ Line: 156 ]]
		-- upvalues: p1 (copy), UserInputService (upval)
		if Input.UserInputType == Enum.UserInputType.MouseWheel then
			p1.props.zoomToPoint(-Input.Position.Z, UserInputService:GetMouseLocation())
		end
	end
	
	function p1:setInputNotChanged() --[[ Line: 163 ]]
		-- upvalues: p1 (copy)
		for _, activeTouchInput in p1.activeTouchInputs do
			activeTouchInput.changedThisFrame = false
		end
	end
	
	function p1.onInputChanged(Input, _) --[[ Line: 169 ]]
		-- upvalues: p1 (copy), UserInputService (upval)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseMovement
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.Touch
		
		if not IsUserInputTypeMatch and not IsUserInputTypeMatch1 then return end
		local ActiveInput = p1:getActiveInput(Input)
		
		if not ActiveInput then return end
		local CurrentTime = tick()
		local CurrentTimeDelta = CurrentTime - ActiveInput.lastTime
		local PositionDelta = Input.Position - ActiveInput.lastPosition
		local ScaledVector = Vector2.new(PositionDelta.X, PositionDelta.Y) * Vector2.new(-1, 1)
		local IsMouseButtonPressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
		local IsMouseButtonPressed1 = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		local IsCurrentTimeAbove = CurrentTime - p1.lastPanTime > 0.1
		
		if (IsUserInputTypeMatch and IsMouseButtonPressed or IsUserInputTypeMatch1 and p1.numActiveTouchInputs == 1) and IsCurrentTimeAbove then
			p1.props.rotateByPixels(-ScaledVector)
		end
		if IsUserInputTypeMatch and IsMouseButtonPressed1 or IsUserInputTypeMatch1 and p1.numActiveTouchInputs == 2 then
			p1.props.panByPixels(ScaledVector / p1.numActiveInputs)
			p1.lastPanTime = CurrentTime
		end
		ActiveInput.lastPosition = Input.Position
		ActiveInput.lastTime = CurrentTime
		
		if IsUserInputTypeMatch1 then
			if ActiveInput.changedThisFrame then
				ActiveInput.lastDeltaPosition = PositionDelta + ActiveInput.lastDeltaPosition
				ActiveInput.lastDeltaTime = CurrentTimeDelta + ActiveInput.lastDeltaTime
				
				return
			end
			ActiveInput.lastDeltaPosition = PositionDelta
			ActiveInput.lastDeltaTime = CurrentTimeDelta
			ActiveInput.changedThisFrame = true
		end
	end
	
	function p1.onInputEnded(Input, _) --[[ Line: 221 ]]
		-- upvalues: p1 (copy)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
		local IsUserInputTypeMatch2 = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch3: boolean = IsUserInputTypeMatch or IsUserInputTypeMatch1
		
		if not IsUserInputTypeMatch2 and not IsUserInputTypeMatch3 then return end
		local ActiveInput = p1:getActiveInput(Input)
		
		if not ActiveInput then return end
		local CurrentTime = tick()
		local CurrentTimeDelta = CurrentTime - p1.lastPanTime
		local IsCurrentTimeDeltaAbove: boolean = p1.numActiveInputs == 1 and CurrentTimeDelta > 0.1
		
		if (IsUserInputTypeMatch2 and ActiveInput.changedThisFrame or IsUserInputTypeMatch) and IsCurrentTimeDeltaAbove then
			local PositionDelta = nil
			local CurrentTimeDelta1 = nil
			if IsUserInputTypeMatch then
				PositionDelta = Input.Position - ActiveInput.lastPosition
				CurrentTimeDelta1 = CurrentTime - ActiveInput.lastTime
			else
				PositionDelta = ActiveInput.lastDeltaPosition
				CurrentTimeDelta1 = ActiveInput.lastDeltaTime
			end
			p1.props.setAngularVelocityByPixels(PositionDelta.X / CurrentTimeDelta1)
		end
		p1:removeActivePointerInput(Input, IsUserInputTypeMatch3)
	end
	
	function p1.onInputBegan(p2, Input) --[[ Line: 259 ]]
		-- upvalues: p1 (copy)
		p1.handleScroll(p2, Input)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton2
		local IsUserInputTypeMatch2 = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch3: boolean = IsUserInputTypeMatch or IsUserInputTypeMatch1
		
		if not IsUserInputTypeMatch2 and not IsUserInputTypeMatch3 then return end
		local CurrentTime = tick()
		
		if IsUserInputTypeMatch2 or IsUserInputTypeMatch then
			p1:handleDoubleTap(Input, CurrentTime)
		end
		p1:addActivePointerInput(Input, IsUserInputTypeMatch3, CurrentTime)
	end
	
	function p1:onTouchPinch(Entry, _, _, UserInputState) --[[ Line: 279 ]]
		-- upvalues: p1 (copy)
		if Entry[2] == nil then return end
		if UserInputState == Enum.UserInputState.Begin then
			p1.lastPinchDistance = (Entry[1] - Entry[2]).Magnitude
			
			return
		else
			local Distance = (Entry[1] - Entry[2]).Magnitude
			p1.lastPinchDistance = Distance
			p1.props.zoomToPoint((Distance - p1.lastPinchDistance) * -0.05, (Entry[1] + Entry[2]) / 2)
		end
	end
end

function InteractionFrame.willUnmount(p2) --[[ Line: 296 ]]
	if p2.inputChangedConnection then
		p2:disconnectEvents()
	end
end

function InteractionFrame.render(p2) --[[ Line: 302 ]]
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.props.Size or UDim2.new(1, 0, 1, 0),
		Position = p2.props.Position,
		ZIndex = p2.props.ZIndex,
		Visible = p2.props.Visible,
		Active = true,
		[RoactModule.Event.InputBegan] = p2.onInputBegan,
		[RoactModule.Event.InputChanged] = p2.handleScroll,
		[RoactModule.Event.TouchPinch] = p2.onTouchPinch
	}, p2.props[RoactModule.Children])
end

return InteractionFrame