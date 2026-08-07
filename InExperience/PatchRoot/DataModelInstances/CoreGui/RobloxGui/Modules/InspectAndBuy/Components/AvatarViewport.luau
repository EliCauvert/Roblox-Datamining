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

function avatarViewport.init(p0) --[[ line: 30 ]]
	-- upvalues: roactModule (ref)
	p0.viewportFrameRef = roactModule.createRef()
	p0.worldModelRef = roactModule.createRef()
	p0.connections = {}
	p0.xRotation = 0
	p0.yRotation = 0
	p0.rotationDeltaX = 0
	p0.rotationDeltaY = 0
	p0.mouseOrTouchDown = false
	p0.delta = 0
	p0.keys = {}
	p0.lastPosition = Vector3.new(0, 0, 0)
	p0.viewportCamera = Instance.new("Camera")
	p0.viewportCamera.CameraType = Enum.CameraType.Scriptable
	p0.model = p0.props.model
	p0.lastInputTime = 2
	p0.initialHrpPosition = if p0.props.model ~= nil then p0.props.model.HumanoidRootPart.Position else nil
end

function avatarViewport.didMount(p1) --[[ line: 49 ]]
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

function avatarViewport.didUpdate(p2, p3, _) --[[ line: 64 ]]
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref)
	if p2.props.visible and p2.props.humanoidDescription ~= p3.humanoidDescription and p2.model then
		if fFlagEnableNewAvatarViewportPropsModule and p2.props.resetCameraAndAutoRotationOnModelChange then
			p2.xRotation = 0
			p2.yRotation = 0
			
			if not p2.props.disableAutoRotation then
				p2.lastInputTime = tick()
			end
		end
		coroutine.wrap(function() --[[ line: 75 ]]
			-- upvalues: p2 (ref)
			p2.characterModelPool:maybeUpdateCharacter(p2.props.humanoidDescription)
		end)()
	end
	p2.gamepadRotating = false
	p2.viewportCamera.Parent = p2.viewportFrameRef.current
	p2.viewportFrameRef.current.CurrentCamera = p2.viewportCamera
	
	if p2.props.gamepadEnabled ~= p3.gamepadEnabled then
		if p2.props.gamepadEnabled then
			p2:setUpGamepad()
			
			return
		end
		p2:unbindActions()
	end
end

function avatarViewport.setRotation(value) --[[ line: 94 ]]
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref)
	local model = value.model
	
	if model then
		local var13
		local initialHrpPosition = value.initialHrpPosition or model.HumanoidRootPart.Position
		local _ = nil
		
		if fFlagEnableNewAvatarViewportPropsModule and value.props.offsetOptions then
			var13 = if value.model:FindFirstChildOfClass("Tool") then value.props.offsetOptions.toolOffset else value.props.offsetOptions.defaultCameraOffset
		else
			local _ = nil
			local view = value.props.views[value.props.view]
			var13 = if value.model:FindFirstChildOfClass("Tool") then view.ToolOffset else view.DefaultCameraOffset
		end
		value.viewportCamera.CFrame = CFrame.new((CFrame.new(initialHrpPosition) * CFrame.Angles(0, -value.yRotation, 0) * CFrame.Angles(value.xRotation, 0, 0) * var13).p, initialHrpPosition)
		
		if fFlagEnableNewAvatarViewportPropsModule and value.props.cameraFieldOfView then
			value.viewportCamera.FieldOfView = value.props.cameraFieldOfView
		end
	end
end

function avatarViewport.render(p4) --[[ line: 135 ]]
	-- upvalues: roactModule (ref), colorsModule (ref), fFlagEnableNewAvatarViewportPropsModule (ref), userInputService (ref)
	local setScrollingEnabled = p4.props.setScrollingEnabled
	
	return roactModule.createElement("ViewportFrame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p4.props.position,
		Size = p4.props.size,
		BackgroundTransparency = p4.props.backgroundTransparency,
		BackgroundColor3 = colorsModule.Graphite,
		BorderSizePixel = 0,
		Active = true,
		Visible = p4.props.visible,
		[roactModule.Ref] = p4.viewportFrameRef,
		[roactModule.Event.InputBegan] = function(_, p5) --[[ line: 152 ]]
			-- upvalues: p4 (ref), fFlagEnableNewAvatarViewportPropsModule (copy), setScrollingEnabled (ref), userInputService (copy)
			if p5.UserInputState == Enum.UserInputState.Begin then
				p4.mouseOrTouchDown = true
				p4.lastPosition = p5.Position
				
				if not fFlagEnableNewAvatarViewportPropsModule then
					setScrollingEnabled(false)
				elseif setScrollingEnabled then
					setScrollingEnabled(false)
				end
				local inputEndedConnection = userInputService.InputEnded:connect(function(p6, _) --[[ line: 179 ]]
					-- upvalues: p4 (copy), fFlagEnableNewAvatarViewportPropsModule (copy), setScrollingEnabled (copy)
					if p6.UserInputType == Enum.UserInputType.MouseButton1 or p6.UserInputType == Enum.UserInputType.Touch then
						if p4.mouseOrTouchDown then
							p4.mouseOrTouchDown = false
							p4.lastInputTime = tick()
							p4:removeConnections()
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
				table.insert(p4.connections, userInputService.InputChanged:connect(function(p7, _) --[[ line: 166 ]]
					-- upvalues: p4 (copy)
					if p7.UserInputType == Enum.UserInputType.MouseMovement and p4.mouseOrTouchDown or p7.UserInputType == Enum.UserInputType.Touch then
						local var15 = p7.Position - p4.lastPosition
						p4.lastPosition = p7.Position
						p4.yRotation += var15.x * 0.0065
						p4.xRotation += var15.y * 0.0065
						p4.lastInputTime = tick()
					end
				end))
				table.insert(p4.connections, inputEndedConnection)
			end
		end
	}, {
		WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p4.worldModelRef })
	})
end

function avatarViewport.handleSpin(p8) --[[ line: 214 ]]
	-- upvalues: fFlagEnableNewAvatarViewportPropsModule (ref), runService (ref)
	local var16 = false
	spawn(function() --[[ line: 216 ]]
		-- upvalues: p8 (ref), fFlagEnableNewAvatarViewportPropsModule (copy), var16 (write), runService (copy)
		while p8.isMounted do
			if tick() - p8.lastInputTime <= 2 or p8.mouseOrTouchDown or p8.gamepadRotating then
				var16 = false
			elseif not fFlagEnableNewAvatarViewportPropsModule or not p8.props.disableAutoRotation then
				var16 = true
			end
			local function _(p9, p10) --[[ line: 231 | named "returnToDefaultPosition" ]]
				p9 %= 6.28318530718
				
				if p9 > 3.14159265359 then
					p9 += p10
					
					if p9 > 6.28318530718 then
						return 0
					end
				else
					p9 -= p10
					
					return if p9 < 0 then 0 else p9
				end
			end
			
			if var16 then
				local var18
				local var17 = p8.xRotation % 6.28318530718
				
				if var17 > 3.14159265359 then
					var17 += 0.03490658504
					
					if var17 > 6.28318530718 then
						var18 = 0
					else
						p8.xRotation = var18
						p8.yRotation += 0.012217304764
					end
				else
					var17 -= 0.03490658504
					var18 = if var17 < 0 then 0 else var17
				end
			elseif p8.gamepadRotating then
				p8.yRotation += p8.delta * p8.rotationDeltaY
				p8.xRotation += p8.delta * p8.rotationDeltaX
			end
			p8:setRotation()
			p8.delta = runService.RenderStepped:wait()
		end
	end)
end

function avatarViewport.setUpGamepad(value) --[[ line: 261 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), fFlagEnableInExperienceUIPCVRFix (ref), isSpatial (ref), fFlagEnableInspectAndBuyV2RootFlag (ref), userInputService (ref), contextActionService (ref)
	if isInExperienceUIVREnabled and fFlagEnableInExperienceUIPCVRFix and (isSpatial() and fFlagEnableInspectAndBuyV2RootFlag) then return end
	if userInputService.GamepadEnabled then
		local vector2 = Vector2.new(0, 0)
		contextActionService:UnbindCoreAction("RotateModel")
		contextActionService:BindCoreAction("RotateModel", function(_, p11, p12) --[[ line: 277 ]]
			-- upvalues: vector2 (write), value (ref)
			if p11 == Enum.UserInputState.Change then
				vector2 = p12.Position or vector2
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

function avatarViewport.unbindActions(_) --[[ line: 296 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("RotateModel")
end

function avatarViewport.removeConnections(p13) --[[ line: 300 ]]
	for i, v in pairs(p13.connections) do
		v:disconnect()
	end
end

function avatarViewport.willUnmount(p14) --[[ line: 306 ]]
	p14.isMounted = false
	
	if p14.characterModelPool then
		p14.characterModelPool:onDestroy()
	end
	p14:unbindActions()
	p14:removeConnections()
end

return roactRoduxModule.UNSTABLE_connect2(function(p17, _) --[[ line: 325 ]]
	return {
		view = p17.view,
		tryingOnInfo = p17.tryingOnInfo,
		gamepadEnabled = p17.gamepadEnabled
	}
end)(function(p15) --[[ line: 316 | named "AvatarViewportWrapper" ]]
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), cryoModule (ref), avatarViewport (ref)
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p16) --[[ line: 318 ]]
			-- upvalues: cryoModule (copy), p15 (ref), roactModule (copy), avatarViewport (copy)
			return roactModule.createElement(avatarViewport, cryoModule.Dictionary.join(p15, { views = p16 }))
		end
	})
end)