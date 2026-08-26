local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)

local function _(p1)
	local var1 = p1.UserInputType == Enum.UserInputType.Touch
	local var2 = p1.UserInputType == Enum.UserInputType.MouseButton1
	local var3 = p1.UserInputType == Enum.UserInputType.MouseButton2
	
	return var1, var2 or var3, var2, var3
end

local interactionFrame = roactModule.PureComponent:extend("InteractionFrame")
interactionFrame.defaultProps = { Visible = true }
interactionFrame.validateProps = tModule.interface({
	panByPixels = tModule.callback,
	rotateByPixels = tModule.callback,
	setAngularVelocityByPixels = tModule.callback,
	zoomToPoint = tModule.callback,
	doubleTap = tModule.optional(tModule.callback),
	Size = tModule.optional(tModule.UDim2),
	Position = tModule.optional(tModule.UDim2),
	Visible = tModule.optional(tModule.boolean),
	ZIndex = tModule.optional(tModule.number)
})

function interactionFrame.disconnectEvents(p1)
	p1.inputChangedConnection:Disconnect()
	p1.inputEndedConnection:Disconnect()
	p1.renderSteppedConnection:Disconnect()
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.renderSteppedConnection = nil
end

function interactionFrame.getActiveInput(p1, p2)
	local var1 = p2.UserInputType == Enum.UserInputType.Touch
	local var2 = p2.UserInputType == Enum.UserInputType.MouseMovement or (p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.MouseButton2)
	
	if not var2 and not var1 then return end
	local var3 = nil
	
	if var2 then
		var3 = p1.activeMouseInput
		
		return var3
	elseif var1 then
		var3 = p1.activeTouchInputs[p2]
	end
	return var3
end

function interactionFrame.removeActivePointerInput(p1, p2, p3)
	-- upvalues: userInputService (ref)
	if p3 then
		if not userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and not userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
		p1.activeMouseInput = nil
	else
		p1.activeTouchInputs[p2] = nil
		p1.numActiveTouchInputs -= 1
	end
	p1.numActiveInputs -= 1
	
	if p1.numActiveInputs == 0 then
		p1:disconnectEvents()
	end
end

function interactionFrame.handleDoubleTap(p1, p2, p3)
	if p1.lastPrimaryPointerInputBeganPosition then
		if p1.props.doubleTap and (p1.lastPrimaryPointerInputBeganPosition - p2.Position).Magnitude < 30 and p3 - p1.lastPrimaryPointerInputBeganTime < 0.25 then
			p1.props.doubleTap()
		end
	end
	p1.lastPrimaryPointerInputBeganPosition = p2.Position
	p1.lastPrimaryPointerInputBeganTime = p3
end

function interactionFrame.addActivePointerInput(p1, p2, p3, p4)
	-- upvalues: cryoModule (ref), userInputService (ref), runService (ref)
	if p1:getActiveInput(p2) then return end
	local t = { lastPosition = p2.Position, lastTime = p4 }
	
	if p3 then
		p1.activeMouseInput = t
	else
		p1.activeTouchInputs[p2] = cryoModule.Dictionary.join(t, {
			lastDeltaTime = 0,
			lastDeltaPosition = Vector3.new(0, 0, 0)
		})
		p1.numActiveTouchInputs += 1
	end
	p1.numActiveInputs += 1
	
	if p1.numActiveInputs == 1 then
		p1.props.setAngularVelocityByPixels(0)
		p1.inputChangedConnection = userInputService.InputChanged:Connect(p1.onInputChanged)
		p1.inputEndedConnection = userInputService.InputEnded:Connect(p1.onInputEnded)
		p1.renderSteppedConnection = runService.RenderStepped:Connect(p1.setInputNotChanged)
	end
end

function interactionFrame.init(p1)
	-- upvalues: userInputService (ref)
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
	
	function p14.handleScroll(_, p2)
		-- upvalues: p1 (ref), userInputService (copy)
		if p2.UserInputType == Enum.UserInputType.MouseWheel then
			p1.props.zoomToPoint(-p2.Position.Z, userInputService:GetMouseLocation())
		end
	end
	
	function p14.setInputNotChanged(_)
		-- upvalues: p1 (ref)
		for i, v in p1.activeTouchInputs do
			v.changedThisFrame = false
		end
	end
	
	function p14.onInputChanged(p2, _)
		-- upvalues: p1 (ref), userInputService (copy)
		local var1 = p2.UserInputType == Enum.UserInputType.MouseMovement
		local var2 = p2.UserInputType == Enum.UserInputType.Touch
		
		if not var1 and not var2 then return end
		local var3 = p1:getActiveInput(p2)
		
		if not var3 then return end
		local currentTime = tick()
		local var4 = currentTime - var3.lastTime
		local var5 = p2.Position - var3.lastPosition
		local var6 = Vector2.new(var5.X, var5.Y) * Vector2.new(-1, 1)
		local mouseButton2 = userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		
		if (var1 and userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or var2 and p1.numActiveTouchInputs == 1) and currentTime - p1.lastPanTime > 0.1 then
			p1.props.rotateByPixels(-var6)
		end
		if var1 and mouseButton2 or var2 and p1.numActiveTouchInputs == 2 then
			p1.props.panByPixels(var6 / p1.numActiveInputs)
			p1.lastPanTime = currentTime
		end
		var3.lastPosition = p2.Position
		var3.lastTime = currentTime
		
		if var2 then
			if var3.changedThisFrame then
				var3.lastDeltaPosition = var5 + var3.lastDeltaPosition
				var3.lastDeltaTime = var4 + var3.lastDeltaTime
				
				return
			end
			var3.lastDeltaPosition = var5
			var3.lastDeltaTime = var4
			var3.changedThisFrame = true
		end
	end
	
	function p14.onInputEnded(p2, _)
		-- upvalues: p1 (ref)
		local var1 = p2.UserInputType == Enum.UserInputType.Touch
		local var2 = p2.UserInputType == Enum.UserInputType.MouseButton1
		local var3 = var2 or p2.UserInputType == Enum.UserInputType.MouseButton2
		
		if not var1 and not var3 then return end
		local var4 = p1:getActiveInput(p2)
		
		if not var4 then return end
		local currentTime = tick()
		
		if (var1 and var4.changedThisFrame or var2) and (p1.numActiveInputs == 1 and currentTime - p1.lastPanTime > 0.1) then
			local var5, var6
			local _ = nil
			local _ = nil
			
			if var2 then
				var5 = p2.Position - var4.lastPosition
				var6 = currentTime - var4.lastTime
			else
				var5 = var4.lastDeltaPosition
				var6 = var4.lastDeltaTime
			end
			p1.props.setAngularVelocityByPixels(var5.X / var6)
		end
		p1:removeActivePointerInput(p2, var3)
	end
	
	function p14.onInputBegan(p2, p3)
		-- upvalues: p1 (ref)
		p1.handleScroll(p2, p3)
		local var1 = p3.UserInputType == Enum.UserInputType.Touch
		local var2 = p3.UserInputType == Enum.UserInputType.MouseButton1
		local var3 = var2 or p3.UserInputType == Enum.UserInputType.MouseButton2
		
		if not var1 and not var3 then return end
		local currentTime = tick()
		
		if var1 or var2 then
			p1:handleDoubleTap(p3, currentTime)
		end
		p1:addActivePointerInput(p3, var3, currentTime)
	end
	
	function p14.onTouchPinch(_, p2, _, _, p3)
		-- upvalues: p1 (ref)
		if p2[2] == nil then return end
		if p3 == Enum.UserInputState.Begin then
			p1.lastPinchDistance = (p2[1] - p2[2]).Magnitude
			
			return
		end
		local magnitude = (p2[1] - p2[2]).Magnitude
		local var1 = magnitude - p1.lastPinchDistance
		p1.lastPinchDistance = magnitude
		p1.props.zoomToPoint(var1 * -0.05, (p2[1] + p2[2]) / 2)
	end
end

function interactionFrame.willUnmount(p2)
	if p2.inputChangedConnection then
		p2:disconnectEvents()
	end
end

function interactionFrame.render(p2)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.props.Size or UDim2.new(1, 0, 1, 0),
		Position = p2.props.Position,
		ZIndex = p2.props.ZIndex,
		Visible = p2.props.Visible,
		Active = true,
		[roactModule.Event.InputBegan] = p2.onInputBegan,
		[roactModule.Event.InputChanged] = p2.handleScroll,
		[roactModule.Event.TouchPinch] = p2.onTouchPinch
	}, p2.props[roactModule.Children])
end

return interactionFrame