local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)

local function _(p0) --[[ line: 15 | named "splitInputType" ]]
	local var7 = p0.UserInputType == Enum.UserInputType.Touch
	local var8 = p0.UserInputType == Enum.UserInputType.MouseButton1
	local var9 = p0.UserInputType == Enum.UserInputType.MouseButton2
	
	return var7, var8 or var9, var8, var9
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

function interactionFrame.disconnectEvents(p1) --[[ line: 43 ]]
	p1.inputChangedConnection:Disconnect()
	p1.inputEndedConnection:Disconnect()
	p1.renderSteppedConnection:Disconnect()
	p1.inputChangedConnection = nil
	p1.inputEndedConnection = nil
	p1.renderSteppedConnection = nil
end

function interactionFrame.getActiveInput(p2, p3) --[[ line: 52 ]]
	local var10 = p3.UserInputType == Enum.UserInputType.Touch
	local var11 = p3.UserInputType == Enum.UserInputType.MouseMovement or (p3.UserInputType == Enum.UserInputType.MouseButton1 or p3.UserInputType == Enum.UserInputType.MouseButton2)
	
	if not var11 and not var10 then return end
	local var12 = nil
	
	if var11 then
		var12 = p2.activeMouseInput
		
		return var12
	elseif var10 then
		var12 = p2.activeTouchInputs[p3]
	end
	return var12
end

function interactionFrame.removeActivePointerInput(p4, p5, p6) --[[ line: 71 ]]
	-- upvalues: userInputService (ref)
	if p6 then
		if not userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and not userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
		p4.activeMouseInput = nil
	else
		p4.activeTouchInputs[p5] = nil
		p4.numActiveTouchInputs -= 1
	end
	p4.numActiveInputs -= 1
	
	if p4.numActiveInputs == 0 then
		p4:disconnectEvents()
	end
end

function interactionFrame.handleDoubleTap(p7, p8, p9) --[[ line: 94 ]]
	if p7.lastPrimaryPointerInputBeganPosition then
		if p7.props.doubleTap and (p7.lastPrimaryPointerInputBeganPosition - p8.Position).Magnitude < 30 and p9 - p7.lastPrimaryPointerInputBeganTime < 0.25 then
			p7.props.doubleTap()
		end
	end
	p7.lastPrimaryPointerInputBeganPosition = p8.Position
	p7.lastPrimaryPointerInputBeganTime = p9
end

function interactionFrame.addActivePointerInput(p10, p11, p12, p13) --[[ line: 112 ]]
	-- upvalues: cryoModule (ref), userInputService (ref), runService (ref)
	if p10:getActiveInput(p11) then return end
	local t = { lastPosition = p11.Position, lastTime = p13 }
	
	if p12 then
		p10.activeMouseInput = t
	else
		p10.activeTouchInputs[p11] = cryoModule.Dictionary.join(t, {
			lastDeltaTime = 0,
			lastDeltaPosition = Vector3.new(0, 0, 0)
		})
		p10.numActiveTouchInputs += 1
	end
	p10.numActiveInputs += 1
	
	if p10.numActiveInputs == 1 then
		p10.props.setAngularVelocityByPixels(0)
		p10.inputChangedConnection = userInputService.InputChanged:Connect(p10.onInputChanged)
		p10.inputEndedConnection = userInputService.InputEnded:Connect(p10.onInputEnded)
		p10.renderSteppedConnection = runService.RenderStepped:Connect(p10.setInputNotChanged)
	end
end

function interactionFrame.init(p14) --[[ line: 141 ]]
	-- upvalues: userInputService (ref)
	p14.inputChangedConnection = nil
	p14.inputEndedConnection = nil
	p14.lastPinchDistance = 1
	p14.lastPanTime = 0
	p14.lastPrimaryPointerInputBeganTime = 0
	p14.lastPrimaryPointerInputBeganPosition = nil
	p14.activeTouchInputs = {}
	p14.numActiveTouchInputs = 0
	p14.activeMouseInput = nil
	p14.numActiveInputs = 0
	
	function p14.handleScroll(_, p15) --[[ line: 156 ]]
		-- upvalues: p14 (ref), userInputService (copy)
		if p15.UserInputType == Enum.UserInputType.MouseWheel then
			p14.props.zoomToPoint(-p15.Position.Z, userInputService:GetMouseLocation())
		end
	end
	
	function p14.setInputNotChanged(_) --[[ line: 163 ]]
		-- upvalues: p14 (ref)
		for i, v in p14.activeTouchInputs do
			v.changedThisFrame = false
		end
	end
	
	function p14.onInputChanged(p16, _) --[[ line: 169 ]]
		-- upvalues: p14 (ref), userInputService (copy)
		local var14 = p16.UserInputType == Enum.UserInputType.MouseMovement
		local var15 = p16.UserInputType == Enum.UserInputType.Touch
		
		if not var14 and not var15 then return end
		local var16 = p14:getActiveInput(p16)
		
		if not var16 then return end
		local currentTime = tick()
		local var18 = currentTime - var16.lastTime
		local var19 = p16.Position - var16.lastPosition
		local var20 = Vector2.new(var19.X, var19.Y) * Vector2.new(-1, 1)
		local mouseButton2 = userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		
		if (var14 and userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or var15 and p14.numActiveTouchInputs == 1) and currentTime - p14.lastPanTime > 0.1 then
			p14.props.rotateByPixels(-var20)
		end
		if var14 and mouseButton2 or var15 and p14.numActiveTouchInputs == 2 then
			p14.props.panByPixels(var20 / p14.numActiveInputs)
			p14.lastPanTime = currentTime
		end
		var16.lastPosition = p16.Position
		var16.lastTime = currentTime
		
		if var15 then
			if var16.changedThisFrame then
				var16.lastDeltaPosition = var19 + var16.lastDeltaPosition
				var16.lastDeltaTime = var18 + var16.lastDeltaTime
				
				return
			end
			var16.lastDeltaPosition = var19
			var16.lastDeltaTime = var18
			var16.changedThisFrame = true
		end
	end
	
	function p14.onInputEnded(p17, _) --[[ line: 221 ]]
		-- upvalues: p14 (ref)
		local var22 = p17.UserInputType == Enum.UserInputType.Touch
		local var23 = p17.UserInputType == Enum.UserInputType.MouseButton1
		local var23_1 = var23 or p17.UserInputType == Enum.UserInputType.MouseButton2
		
		if not var22 and not var23_1 then return end
		local var25 = p14:getActiveInput(p17)
		
		if not var25 then return end
		local currentTime = tick()
		
		if (var22 and var25.changedThisFrame or var23) and (p14.numActiveInputs == 1 and currentTime - p14.lastPanTime > 0.1) then
			local var27, var28
			local _ = nil
			local _ = nil
			
			if var23 then
				var27 = p17.Position - var25.lastPosition
				var28 = currentTime - var25.lastTime
			else
				var27 = var25.lastDeltaPosition
				var28 = var25.lastDeltaTime
			end
			p14.props.setAngularVelocityByPixels(var27.X / var28)
		end
		p14:removeActivePointerInput(p17, var23_1)
	end
	
	function p14.onInputBegan(p18, p19) --[[ line: 259 ]]
		-- upvalues: p14 (ref)
		p14.handleScroll(p18, p19)
		local var29 = p19.UserInputType == Enum.UserInputType.Touch
		local var30 = p19.UserInputType == Enum.UserInputType.MouseButton1
		local var30_1 = var30 or p19.UserInputType == Enum.UserInputType.MouseButton2
		
		if not var29 and not var30_1 then return end
		local currentTime = tick()
		
		if var29 or var30 then
			p14:handleDoubleTap(p19, currentTime)
		end
		p14:addActivePointerInput(p19, var30_1, currentTime)
	end
	
	function p14.onTouchPinch(_, p20, _, _, p21) --[[ line: 279 ]]
		-- upvalues: p14 (ref)
		if p20[2] == nil then return end
		if p21 == Enum.UserInputState.Begin then
			p14.lastPinchDistance = (p20[1] - p20[2]).Magnitude
			
			return
		end
		local magnitude = (p20[1] - p20[2]).Magnitude
		local var33 = magnitude - p14.lastPinchDistance
		p14.lastPinchDistance = magnitude
		p14.props.zoomToPoint(var33 * -0.05, (p20[1] + p20[2]) / 2)
	end
end

function interactionFrame.willUnmount(p22) --[[ line: 296 ]]
	if p22.inputChangedConnection then
		p22:disconnectEvents()
	end
end

function interactionFrame.render(p23) --[[ line: 302 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p23.props.Size or UDim2.new(1, 0, 1, 0),
		Position = p23.props.Position,
		ZIndex = p23.props.ZIndex,
		Visible = p23.props.Visible,
		Active = true,
		[roactModule.Event.InputBegan] = p23.onInputBegan,
		[roactModule.Event.InputChanged] = p23.handleScroll,
		[roactModule.Event.TouchPinch] = p23.onTouchPinch
	}, p23.props[roactModule.Children])
end

return interactionFrame