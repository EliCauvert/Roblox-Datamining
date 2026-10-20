local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local ColorsModule = require(Parent.Colors)
local CharacterModelPoolModule = require(Parent.CharacterModelPool)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local FFlagEnableNewAvatarViewportPropsModule = require(Parent.Flags.FFlagEnableNewAvatarViewportProps)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagEnableInExperienceUIPCVRFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableInExperienceUIPCVRFix
local FFlagEnableInspectAndBuyV2RootFlag = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local AvatarViewport = RoactModule.PureComponent:extend("AvatarViewport")

function AvatarViewport.init(p1)
	-- upvalues: RoactModule (copy)
	p1.viewportFrameRef = RoactModule.createRef()
	p1.worldModelRef = RoactModule.createRef()
	p1.connections = {}
	p1.xRotation = 0
	p1.yRotation = 0
	p1.rotationDeltaX = 0
	p1.rotationDeltaY = 0
	p1.mouseOrTouchDown = false
	p1.delta = 0
	p1.keys = {}
	p1.lastPosition = vector.create(0, 0, 0)
	p1.viewportCamera = Instance.new("Camera")
	p1.viewportCamera.CameraType = Enum.CameraType.Scriptable
	p1.model = p1.props.model
	p1.lastInputTime = 2
	p1.initialHrpPosition = if p1.props.model == nil then nil else p1.props.model.HumanoidRootPart.Position or nil
end

function AvatarViewport.didMount(p1)
	-- upvalues: CharacterModelPoolModule (copy)
	if p1.props.humanoidDescription and p1.model then
		p1.viewportCamera.Parent = p1.viewportFrameRef.current
		p1.viewportFrameRef.current.CurrentCamera = p1.viewportCamera
		p1:setRotation()
		p1.characterModelPool = CharacterModelPoolModule.new(p1.worldModelRef, p1.initialHrpPosition, p1.model.Humanoid.RigType)
	end
	p1.isMounted = true
	p1:handleSpin()
	p1:setUpGamepad()
end

function AvatarViewport.didUpdate(p1, p2, _)
	-- upvalues: FFlagEnableNewAvatarViewportPropsModule (copy)
	if p1.props.visible and p1.props.humanoidDescription ~= p2.humanoidDescription and p1.model then
		if FFlagEnableNewAvatarViewportPropsModule and p1.props.resetCameraAndAutoRotationOnModelChange then
			p1.xRotation = 0
			p1.yRotation = 0
			
			if not p1.props.disableAutoRotation then
				p1.lastInputTime = tick()
			end
		end
		coroutine.wrap(function()
			-- upvalues: p1 (copy)
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

function AvatarViewport.setRotation(p1)
	-- upvalues: FFlagEnableNewAvatarViewportPropsModule (copy)
	local Model = p1.model
	
	if Model then
		local HumanoidRootPart = Model.HumanoidRootPart
		local InitialHrpPosition = p1.initialHrpPosition or HumanoidRootPart.Position
		local ToolOffset = nil
		
		if FFlagEnableNewAvatarViewportPropsModule and p1.props.offsetOptions then
			ToolOffset = if p1.model:FindFirstChildOfClass("Tool") then p1.props.offsetOptions.toolOffset else p1.props.offsetOptions.defaultCameraOffset
		else
			local View = p1.props.views[p1.props.view]
			ToolOffset = if p1.model:FindFirstChildOfClass("Tool") then View.ToolOffset else View.DefaultCameraOffset
		end
		p1.viewportCamera.CFrame = CFrame.new((CFrame.new(InitialHrpPosition) * CFrame.Angles(0, -p1.yRotation, 0) * CFrame.Angles(p1.xRotation, 0, 0) * ToolOffset).p, InitialHrpPosition)
		
		if FFlagEnableNewAvatarViewportPropsModule and p1.props.cameraFieldOfView then
			p1.viewportCamera.FieldOfView = p1.props.cameraFieldOfView
		end
	end
end

function AvatarViewport.render(p1)
	-- upvalues: RoactModule (copy), ColorsModule (copy), FFlagEnableNewAvatarViewportPropsModule (copy), UserInputService (copy)
	local SetScrollingEnabledFunction = p1.props.setScrollingEnabled
	
	return RoactModule.createElement("ViewportFrame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.props.position,
		Size = p1.props.size,
		BackgroundTransparency = p1.props.backgroundTransparency,
		BackgroundColor3 = ColorsModule.Graphite,
		BorderSizePixel = 0,
		Active = true,
		Visible = p1.props.visible,
		[RoactModule.Ref] = p1.viewportFrameRef,
		[RoactModule.Event.InputBegan] = function(_, Input)
			-- upvalues: p1 (copy), FFlagEnableNewAvatarViewportPropsModule (upval), SetScrollingEnabledFunction (copy), UserInputService (upval)
			if Input.UserInputState == Enum.UserInputState.Begin then
				p1.mouseOrTouchDown = true
				p1.lastPosition = Input.Position
				
				if FFlagEnableNewAvatarViewportPropsModule then
					if SetScrollingEnabledFunction then
						SetScrollingEnabledFunction(false)
					end
				else
					SetScrollingEnabledFunction(false)
				end
				local InputEndedConnection = UserInputService.InputEnded:connect(function(Input, _)
					-- upvalues: p1 (upval), FFlagEnableNewAvatarViewportPropsModule (upval), SetScrollingEnabledFunction (upval)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						if p1.mouseOrTouchDown then
							p1.mouseOrTouchDown = false
							p1.lastInputTime = tick()
							p1:removeConnections()
						end
						if not FFlagEnableNewAvatarViewportPropsModule then
							SetScrollingEnabledFunction(true)
						elseif SetScrollingEnabledFunction then
							SetScrollingEnabledFunction(true)
							
							return
						end
					end
				end)
				table.insert(p1.connections, (UserInputService.InputChanged:connect(function(Input, _)
					-- upvalues: p1 (upval)
					if Input.UserInputType == Enum.UserInputType.MouseMovement and p1.mouseOrTouchDown or Input.UserInputType == Enum.UserInputType.Touch then
						local PositionDelta = Input.Position - p1.lastPosition
						p1.lastPosition = Input.Position
						p1.yRotation += PositionDelta.x * 0.0065
						p1.xRotation += PositionDelta.y * 0.0065
						p1.lastInputTime = tick()
					end
				end)))
				table.insert(p1.connections, InputEndedConnection)
			end
		end
	}, {
		WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef })
	})
end

function AvatarViewport.handleSpin(p1)
	-- upvalues: FFlagEnableNewAvatarViewportPropsModule (copy), RunService (copy)
	local Flag = false
	spawn(function()
		-- upvalues: p1 (copy), FFlagEnableNewAvatarViewportPropsModule (upval), Flag (ref), RunService (upval)
		while p1.isMounted do
			if tick() - p1.lastInputTime > 2 and not p1.mouseOrTouchDown and not p1.gamepadRotating then
				if not FFlagEnableNewAvatarViewportPropsModule or not p1.props.disableAutoRotation then
					Flag = true
				end
			else
				Flag = false
			end
			local function _(p2: number, Amount: number): number
				local Total = p2 % 6.283185307179586
				
				if Total > 3.141592653589793 then
					Total += Amount
					
					if Total > 6.283185307179586 then
						return 0
					end
				else
					Total -= Amount
					
					if Total < 0 then
						return 0
					end
				end
				return Total
			end
			
			if Flag then
				local XRotationRemainder = p1.xRotation % 6.283185307179586
				local XRotation = nil
				local NewXRotationRemainder = nil
				repeat
					if XRotationRemainder > 3.141592653589793 then
						NewXRotationRemainder = XRotationRemainder + 0.03490658503988659
						
						if NewXRotationRemainder > 6.283185307179586 then
							XRotation = 0
							break
						end
					else
						NewXRotationRemainder = XRotationRemainder - 0.03490658503988659
						
						if NewXRotationRemainder < 0 then
							XRotation = 0
							break
						end
					end
					XRotation = NewXRotationRemainder
				until true
				p1.xRotation = XRotation
				p1.yRotation += 0.012217304763960306
			elseif p1.gamepadRotating then
				p1.yRotation += p1.delta * p1.rotationDeltaY
				p1.xRotation += p1.delta * p1.rotationDeltaX
			end
			p1:setRotation()
			p1.delta = RunService.RenderStepped:wait()
		end
	end)
end

function AvatarViewport.setUpGamepad(p2)
	-- upvalues: IsInExperienceUIVREnabled (copy), FFlagEnableInExperienceUIPCVRFix (copy), IsSpatialFunction (copy), FFlagEnableInspectAndBuyV2RootFlag (copy), UserInputService (copy), ContextActionService (copy)
	if IsInExperienceUIVREnabled and FFlagEnableInExperienceUIPCVRFix and IsSpatialFunction() and FFlagEnableInspectAndBuyV2RootFlag then return end
	if UserInputService.GamepadEnabled then
		local _Vector2 = Vector2.new(0, 0)
		ContextActionService:UnbindCoreAction("RotateModel")
		ContextActionService:BindCoreAction("RotateModel", function(_, UserInputState, p3)
			-- upvalues: _Vector2 (ref), p2 (copy)
			if UserInputState == Enum.UserInputState.Change then
				_Vector2 = p3.Position or _Vector2
				_Vector2 = Vector2.new(_Vector2.X, _Vector2.Y)
				
				if math.abs(_Vector2.X) > 0.2 or math.abs(_Vector2.Y) > 0.2 then
					p2.lastInputTime = tick()
					p2.gamepadRotating = true
					p2.rotationDeltaY = 3 * _Vector2.X
					p2.rotationDeltaX = 3 * _Vector2.Y
				else
					p2.gamepadRotating = false
				end
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA)
	end
end

function AvatarViewport:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("RotateModel")
end

function AvatarViewport.removeConnections(p2)
	for _, connection in pairs(p2.connections) do
		connection:disconnect()
	end
end

function AvatarViewport.willUnmount(p3)
	p3.isMounted = false
	
	if p3.characterModelPool then
		p3.characterModelPool:onDestroy()
	end
	p3:unbindActions()
	p3:removeConnections()
end

return RoactRoduxModule.UNSTABLE_connect2(function(p3, _)
	return {
		view = p3.view,
		tryingOnInfo = p3.tryingOnInfo,
		gamepadEnabled = p3.gamepadEnabled
	}
end)(function(p3)
	-- upvalues: RoactModule (copy), InspectAndBuyContextModule (copy), CryoModule (copy), AvatarViewport (copy)
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(Views)
			-- upvalues: CryoModule (upval), p3 (copy), RoactModule (upval), AvatarViewport (upval)
			return RoactModule.createElement(AvatarViewport, (CryoModule.Dictionary.join(p3, { views = Views })))
		end
	})
end)