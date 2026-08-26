local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local colorsModule = require(parent.Colors)
local characterModelPoolModule = require(parent.CharacterModelPool)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local fFlagEnableNewAvatarViewportPropsModule = require(parent.Flags.FFlagEnableNewAvatarViewportProps)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagEnableInExperienceUIPCVRFix = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableInExperienceUIPCVRFix
local fFlagEnableInspectAndBuyV2RootFlag = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local avatarViewport = roactModule.PureComponent:extend("AvatarViewport")

function avatarViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.viewportFrameRef = roactModule.createRef()
	p1.worldModelRef = roactModule.createRef()
	p1.connections = {}
	p1.xRotation = 0
	p1.yRotation = 0
	p1.rotationDeltaX = 0
	p1.rotationDeltaY = 0
	p1.mouseOrTouchDown = false
	p1.delta = 0
	p1.keys = {}
	p1.lastPosition = Vector3.new(0, 0, 0)
	p1.viewportCamera = Instance.new("Camera")
	p1.viewportCamera.CameraType = Enum.CameraType.Scriptable
	p1.model = p1.props.model
	p1.lastInputTime = 2
	p1.initialHrpPosition = if p1.props.model ~= nil then p1.props.model.HumanoidRootPart.Position else nil
end

function avatarViewport.didMount(p1)
	-- upvalues: characterModelPoolModule (ref)
	if p1.props.humanoidDescription and p1.model then
		p1.viewportCamera.Parent = p1.viewportFrameRef.current
		p1.viewportFrameRef.current.CurrentCamera = p1.viewportCamera
		p1:setRotation()
		p1.characterModelPool = characterModelPoolModule.new(p1.worldModelRef, p1.initialHrpPosition, p1.model.Humanoid.RigType)
	end
	p1.isMounted = true
	p1:handleSpin()
	p1:setUpGamepad()
end

function avatarViewport.didUpdate(p1, p2, _)
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref)
	if p1.props.visible and p1.props.humanoidDescription ~= p2.humanoidDescription and p1.model then
		if fFlagEnableNewAvatarViewportPropsModule and p1.props.resetCameraAndAutoRotationOnModelChange then
			p1.xRotation = 0
			p1.yRotation = 0
			
			if not p1.props.disableAutoRotation then
				p1.lastInputTime = tick()
			end
		end
		coroutine.wrap(function()
			-- upvalues: p1 (ref)
			p1.characterModelPool:maybeUpdateCharacter(p1.props.humanoidDescription)
		end)()
	end
	p1.gamepadRotating = false
	p1.viewportCamera.Parent = p1.viewportFrameRef.current
	p1.viewportFrameRef.current.CurrentCamera = p1.viewportCamera
	
	if p1.props.gamepadEnabled ~= p2.gamepadEnabled then
		if p1.props.gamepadEnabled then
			p1:setUpGamepad()
			
			return
		end
		p1:unbindActions()
	end
end

function avatarViewport.setRotation(value)
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref)
	local model = value.model
	
	if model then
		local var1
		local initialHrpPosition = value.initialHrpPosition or model.HumanoidRootPart.Position
		local _ = nil
		
		if fFlagEnableNewAvatarViewportPropsModule and value.props.offsetOptions then
			var1 = if value.model:FindFirstChildOfClass("Tool") then value.props.offsetOptions.toolOffset else value.props.offsetOptions.defaultCameraOffset
		else
			local _ = nil
			local view = value.props.views[value.props.view]
			var1 = if value.model:FindFirstChildOfClass("Tool") then view.ToolOffset else view.DefaultCameraOffset
		end
		value.viewportCamera.CFrame = CFrame.new((CFrame.new(initialHrpPosition) * CFrame.Angles(0, -value.yRotation, 0) * CFrame.Angles(value.xRotation, 0, 0) * var1).p, initialHrpPosition)
		
		if fFlagEnableNewAvatarViewportPropsModule and value.props.cameraFieldOfView then
			value.viewportCamera.FieldOfView = value.props.cameraFieldOfView
		end
	end
end

function avatarViewport.render(p1)
	-- upvalues: roactModule (ref), colorsModule (ref), fFlagEnableNewAvatarViewportPropsModule (ref), userInputService (ref)
	local setScrollingEnabled = p1.props.setScrollingEnabled
	
	return roactModule.createElement("ViewportFrame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.props.position,
		Size = p1.props.size,
		BackgroundTransparency = p1.props.backgroundTransparency,
		BackgroundColor3 = colorsModule.Graphite,
		BorderSizePixel = 0,
		Active = true,
		Visible = p1.props.visible,
		[roactModule.Ref] = p1.viewportFrameRef,
		[roactModule.Event.InputBegan] = function(_, p2)
			-- upvalues: p1 (ref), fFlagEnableNewAvatarViewportPropsModule (copy), setScrollingEnabled (ref), userInputService (copy)
			if p2.UserInputState == Enum.UserInputState.Begin then
				p1.mouseOrTouchDown = true
				p1.lastPosition = p2.Position
				
				if not fFlagEnableNewAvatarViewportPropsModule then
					setScrollingEnabled(false)
				elseif setScrollingEnabled then
					setScrollingEnabled(false)
				end
				local inputEndedConnection = userInputService.InputEnded:connect(function(p3, _)
					-- upvalues: p1 (copy), fFlagEnableNewAvatarViewportPropsModule (copy), setScrollingEnabled (copy)
					if p3.UserInputType == Enum.UserInputType.MouseButton1 or p3.UserInputType == Enum.UserInputType.Touch then
						if p1.mouseOrTouchDown then
							p1.mouseOrTouchDown = false
							p1.lastInputTime = tick()
							p1:removeConnections()
						end
						if fFlagEnableNewAvatarViewportPropsModule then
							if setScrollingEnabled then
								setScrollingEnabled(true)
								
								return
							end
						else
							setScrollingEnabled(true)
						end
					end
				end)
				table.insert(p1.connections, userInputService.InputChanged:connect(function(p3, _)
					-- upvalues: p1 (copy)
					if p3.UserInputType == Enum.UserInputType.MouseMovement and p1.mouseOrTouchDown or p3.UserInputType == Enum.UserInputType.Touch then
						local var1 = p3.Position - p1.lastPosition
						p1.lastPosition = p3.Position
						p1.yRotation += var1.x * 0.0065
						p1.xRotation += var1.y * 0.0065
						p1.lastInputTime = tick()
					end
				end))
				table.insert(p1.connections, inputEndedConnection)
			end
		end
	}, {
		WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef })
	})
end

function avatarViewport.handleSpin(p1)
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref), runService (ref)
	local var1 = false
	spawn(function()
		-- upvalues: p1 (ref), fFlagEnableNewAvatarViewportPropsModule (copy), var1 (write), runService (copy)
		while p1.isMounted do
			if tick() - p1.lastInputTime <= 2 or p1.mouseOrTouchDown or p1.gamepadRotating then
				var1 = false
			elseif not fFlagEnableNewAvatarViewportPropsModule or not p1.props.disableAutoRotation then
				var1 = true
			end
			local function _(p2, p3)
				p2 %= 6.28318530718
				
				if p2 > 3.14159265359 then
					p2 += p3
					
					if p2 > 6.28318530718 then
						return 0
					end
				else
					p2 -= p3
					
					return if p2 < 0 then 0 else p2
				end
			end
			
			if var1 then
				local var2
				local var3 = p1.xRotation % 6.28318530718
				
				if var3 > 3.14159265359 then
					var3 += 0.03490658504
					
					if var3 > 6.28318530718 then
						var2 = 0
					else
						p1.xRotation = var2
						p1.yRotation += 0.012217304764
					end
				else
					var3 -= 0.03490658504
					var2 = if var3 < 0 then 0 else var3
				end
			elseif p1.gamepadRotating then
				p1.yRotation += p1.delta * p1.rotationDeltaY
				p1.xRotation += p1.delta * p1.rotationDeltaX
			end
			p1:setRotation()
			p1.delta = runService.RenderStepped:wait()
		end
	end)
end

function avatarViewport.setUpGamepad(value)
	-- upvalues: isInExperienceUIVREnabled (ref), fFlagEnableInExperienceUIPCVRFix (ref), isSpatial (ref), fFlagEnableInspectAndBuyV2RootFlag (ref), userInputService (ref), contextActionService (ref)
	if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and (isSpatial() and fFlagEnableInspectAndBuyV2RootFlag) then return end
	if userInputService.GamepadEnabled then
		local vector2 = Vector2.new(0, 0)
		contextActionService:UnbindCoreAction("RotateModel")
		contextActionService:BindCoreAction("RotateModel", function(_, p2, p3)
			-- upvalues: vector2 (write), value (ref)
			if p2 == Enum.UserInputState.Change then
				vector2 = p3.Position or vector2
				vector2 = Vector2.new(vector2.X, vector2.Y)
				
				if math.abs(vector2.X) > 0.2 or math.abs(vector2.Y) > 0.2 then
					value.lastInputTime = tick()
					value.gamepadRotating = true
					value.rotationDeltaY = 3 * vector2.X
					value.rotationDeltaX = 3 * vector2.Y
				else
					value.gamepadRotating = false
				end
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA)
	end
end

function avatarViewport.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("RotateModel")
end

function avatarViewport.removeConnections(p2)
	for i, v in pairs(p2.connections) do
		v:disconnect()
	end
end

function avatarViewport.willUnmount(p3)
	p3.isMounted = false
	
	if p3.characterModelPool then
		p3.characterModelPool:onDestroy()
	end
	p3:unbindActions()
	p3:removeConnections()
end

return roactRoduxModule.UNSTABLE_connect2(function(p3, _)
	return {
		view = p3.view,
		tryingOnInfo = p3.tryingOnInfo,
		gamepadEnabled = p3.gamepadEnabled
	}
end)(function(p3)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), cryoModule (ref), avatarViewport (ref)
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p4)
			-- upvalues: cryoModule (copy), p3 (ref), roactModule (copy), avatarViewport (copy)
			return roactModule.createElement(avatarViewport, cryoModule.Dictionary.join(p3, { views = p4 }))
		end
	})
end)