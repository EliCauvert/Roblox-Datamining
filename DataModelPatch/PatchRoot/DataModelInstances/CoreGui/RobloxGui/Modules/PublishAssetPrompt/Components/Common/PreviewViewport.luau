local AnimationClipProvider = game:GetService("AnimationClipProvider")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ShortcutBar = UIBloxModule.App.Navigation.ShortcutBar
local InputType = UIBloxModule.Core.Enums.InputType
local GetInputGroupFunction = require(CorePackages.Workspace.Packages.InputType).getInputGroup
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local InputTypeConstants = require(CorePackages.Workspace.Packages.InputType).InputTypeConstants
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local InteractionFrameModule = require(script.Parent.InteractionFrame)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local Images = UIBloxModule.App.ImageSet.Images
local IconsActionsPreviewShrink = Images["icons/actions/previewShrink"]
local IconsActionsReset = Images["icons/actions/reset"]
local PreviewViewport = RoactModule.PureComponent:extend("PreviewViewport")
PreviewViewport.validateProps = TModule.strictInterface({
	asset = TModule.union(TModule.instanceOf("Model"), TModule.instanceIsA("AnimationClip")),
	closePreviewView = TModule.callback
})

local function _(p1): boolean
	-- upvalues: GetInputGroupFunction (copy), InputTypeConstants (copy)
	return GetInputGroupFunction(p1) == InputTypeConstants.Gamepad
end

function PreviewViewport.init(p1)
	-- upvalues: UserInputService (copy), GetInputGroupFunction (copy), InputTypeConstants (copy), RoactModule (copy)
	p1:setState({
		loadingState = "loading",
		cameraMoved = false,
		isGamepad = GetInputGroupFunction((UserInputService:GetLastInputType())) == InputTypeConstants.Gamepad
	})
	p1.ref = RoactModule.createRef()
	p1.zoomFactor = 0.8
	p1.cameraDegreesAngle = Vector2.new(0, 0)
	p1.cameraPanInPixels = Vector2.new(0, 0)
	p1.cameraRef = RoactModule.createRef()
	p1.worldModelRef = RoactModule.createRef()
	p1.cameraCFrameBinding, p1.updateCameraCFrameBinding = RoactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding, p1.updateCameraFocusBinding = RoactModule.createBinding(CFrame.new())
	
	function p1.panByPixels(p2)
		-- upvalues: p1 (copy)
		p1.cameraPanInPixels += p2
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.rotateByPixels(Vector)
		-- upvalues: p1 (copy)
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X - Vector.Y, p1.cameraDegreesAngle.Y - Vector.X)
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1:storeInput(InputState, InputObject)
		-- upvalues: p1 (copy)
		p1.inputState = InputState
		p1.inputObject = InputObject
		
		return Enum.ContextActionResult.Sink
	end
	
	function p1.rotateByRadians(p2)
		-- upvalues: p1 (copy)
		if not p1.model:FindFirstChild("HumanoidRootPart") then return end
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X % 360, (p1.cameraDegreesAngle.Y + -p2 * 180 / 3.141592653589793) % 360)
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1:setAngularVelocityByPixels() end
	
	function p1.zoomToPoint(p2: number, p3)
		-- upvalues: p1 (copy)
		local v1 = 0.9 ^ p2
		local ScaledZoomFactor = p1.zoomFactor * v1
		
		if ScaledZoomFactor ~= math.clamp(ScaledZoomFactor, 0.3, 10) then return end
		p1.zoomFactor = ScaledZoomFactor
		
		if p3 then
			local ScaledAbsolutePosition = (p3 - (p1.absolutePosition + p1.absoluteSize / 2)) * Vector2.new(1, -1) * -1
			p1.cameraPanInPixels = ScaledAbsolutePosition - (ScaledAbsolutePosition - p1.cameraPanInPixels) * v1
		end
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.onRetryLoading()
		-- upvalues: p1 (copy)
		p1:processAsset()
	end
	
	function p1.onResetButtonPressed()
		-- upvalues: p1 (copy)
		p1:resetCameraPosition()
	end
end

function PreviewViewport.setLoadingState(p1, LoadingState)
	p1:setState({ loadingState = LoadingState })
end

function PreviewViewport.clampOffsets(p1)
	p1.zoomFactor = math.clamp(p1.zoomFactor, 0.3, 10)
	p1.cameraDegreesAngle = Vector2.new(math.clamp(p1.cameraDegreesAngle.X, if p1.props.asset and p1.props.asset:IsA("AnimationClip") then p1:angleToMakeBasePlateParallel() else -80, 80), p1.cameraDegreesAngle.Y)
	local Largest = math.max(p1.zoomFactor * p1.modelExtentsSize.X / 2 / p1:pointsToPixelsFactor(), p1.absoluteSize.X / 2)
	local Largest1 = math.max(p1.zoomFactor * p1.modelExtentsSize.Y / 2 / p1:pointsToPixelsFactor(), p1.absoluteSize.Y / 2)
	p1.cameraPanInPixels = Vector2.new(math.clamp(p1.cameraPanInPixels.X, -Largest, Largest), (math.clamp(p1.cameraPanInPixels.Y, -Largest1, Largest1)))
end

function PreviewViewport.angleToMakeBasePlateParallel(p1)
	return -math.deg((math.asin((math.clamp((p1.modelExtentsSize.Y / 2 + p1:pointsToPixelsFactor() / p1.zoomFactor * p1.cameraPanInPixels.Y) / (p1.cameraDistance / p1.zoomFactor), -0.99, 0.99)))))
end

function PreviewViewport.processAsset(p1)
	-- upvalues: Players (copy), AnimationClipProvider (copy)
	local Asset = p1.props.asset
	
	if not Asset then return end
	if Asset:IsA("AnimationClip") then
		p1:setLoadingState("loading")
		task.spawn(function()
			-- upvalues: Players (upval), p1 (copy), Asset (copy), AnimationClipProvider (upval)
			local Success, Result = pcall(function()
				-- upvalues: Players (upval)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:GetHumanoidDescriptionFromOutfitIdAsync(1342485078) else Players:GetHumanoidDescriptionFromOutfitId(1342485078)
			end)
			local HumanoidModelFromDescriptionAsync = if Success then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Result, Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(Result, Enum.HumanoidRigType.R15) else nil
			
			if not p1.isMounted or Asset ~= p1.props.asset then return end
			if not HumanoidModelFromDescriptionAsync then
				p1:setLoadingState("failedToLoad")
				
				return
			end
			p1.model = HumanoidModelFromDescriptionAsync
			p1:addModelToViewportIfNeeded()
			local RegisterActiveAnimationClipResult = AnimationClipProvider:RegisterActiveAnimationClip(Asset)
			p1.animation = Instance.new("Animation")
			p1.animation.AnimationId = RegisterActiveAnimationClipResult
			local Humanoid = p1.model:FindFirstChildWhichIsA("Humanoid")
			
			if Humanoid then
				Humanoid:LoadAnimation(p1.animation):Play()
			end
			p1:setLoadingState("successfullyLoaded")
		end)
		
		return
	end
	if Asset:IsA("Model") or Asset:IsA("Accessory") then
		if Asset:IsA("Accessory") then
			local Model = Instance.new("Model")
			Asset:Clone().Parent = Model
			p1.model = Model
		else
			p1.model = Asset:Clone()
		end
		p1.model.Parent = nil
		p1:addModelToViewportIfNeeded()
		p1:setLoadingState("successfullyLoaded")
	end
end

function PreviewViewport.addModelToViewportIfNeeded(p1)
	if p1.model ~= nil and p1.model.Parent ~= nil then return end
	if p1.worldModelRef:getValue() and p1.model ~= nil then
		p1.model.Parent = p1.worldModelRef:getValue()
		p1:resetCameraPosition()
		
		if p1.props.asset and p1.props.asset:IsA("AnimationClip") then
			p1.baseplate = Instance.new("Part")
			p1.baseplate.Size = vector.create(8, 0.5, 8)
			p1.baseplate.Transparency = 0.6
			p1.baseplate.Parent = p1.worldModelRef:getValue()
			p1.baseplate.Position = p1.modelCFrame.Position + Vector3.new(0, -p1.modelExtentsSize.Y / 2, 0) + vector.create(0, -0.25, 0)
		end
	end
end

local _ = function(Degrees: number, Vector): number
	return math.max(Vector.X, Vector.Y) / 2 * (1 / math.tan(math.rad(Degrees) / 2)) + Vector.Z / 2
end

local _ = function(p1, Angle, Axis)
	return CFrame.fromAxisAngle(Axis, Angle):VectorToWorldSpace(p1)
end

function PreviewViewport.resetCameraPosition(p1)
	if not p1.model then return end
	p1.modelCFrame = p1.model:GetModelCFrame()
	p1.initialLookVector = p1.modelCFrame.lookVector
	local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
	
	if HumanoidRootPart then
		p1.initialLookVector = HumanoidRootPart.CFrame.lookVector
	end
	p1.modelExtentsSize = p1.model:GetExtentsSize()
	local ModelExtentsSize = p1.modelExtentsSize
	p1.cameraDistance = math.max(ModelExtentsSize.X, ModelExtentsSize.Y) / 2 * 3.7320508075688776 + ModelExtentsSize.Z / 2
	
	if p1.props.asset and p1.props.asset:IsA("AnimationClip") then
		p1.cameraDegreesAngle = Vector2.new(0, 0)
		p1.zoomFactor = 0.75
	else
		p1.cameraDegreesAngle = Vector2.new(5, 20)
		p1.zoomFactor = 0.8
	end
	p1.cameraPanInPixels = Vector2.new(0, 0)
	p1:updateCameraPosition()
	
	if p1.state.cameraMoved then
		p1:setState({ cameraMoved = false })
	end
end

function PreviewViewport.pointsToPixelsFactor(p1)
	return if p1.absoluteSize == nil or p1.modelExtentsSize == nil or p1.absoluteSize.Y == 0 or p1.modelExtentsSize.Y == 0 or p1.modelExtentsSize.X == 0 then 1 else math.max(p1.modelExtentsSize.X, p1.modelExtentsSize.Y) / p1.absoluteSize.Y
end

function PreviewViewport.updateCameraPosition(p1)
	if p1.absoluteSize ~= nil and p1.cameraDistance ~= nil then
		local _CFrame = CFrame.new(p1.modelCFrame.p + CFrame.fromAxisAngle(vector.create(0, 1, 0), (math.rad(p1.cameraDegreesAngle.Y))):VectorToWorldSpace((CFrame.fromAxisAngle(vector.create(1, 0, 0), (math.rad(p1.cameraDegreesAngle.X))):VectorToWorldSpace(p1.initialLookVector))) * (p1.cameraDistance / p1.zoomFactor), p1.modelCFrame.p)
		local PointsToPixelsFactorResultRatio = p1:pointsToPixelsFactor() / p1.zoomFactor
		p1.updateCameraCFrameBinding(_CFrame + _CFrame.UpVector * PointsToPixelsFactorResultRatio * p1.cameraPanInPixels.Y + _CFrame.RightVector * PointsToPixelsFactorResultRatio * p1.cameraPanInPixels.X)
		p1.updateCameraFocusBinding(p1.modelCFrame)
		
		return
	end
end

local config = {
	resetViewButtonText = RobloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"),
	loadingFailedText = RobloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
}

function PreviewViewport.render(p1)
	-- upvalues: InputType (copy), Images (copy), RobloxTranslatorModule (copy), RoactModule (copy), GuiService (copy), ExternalEventConnection (copy), UserInputService (copy), GetInputGroupFunction (copy), InputTypeConstants (copy), Button (copy), ButtonType (copy), IconsActionsReset (copy), IconsActionsPreviewShrink (copy), ShortcutBar (copy), Skeleton (copy), EmptyState (copy), config (copy), InteractionFrameModule (copy), ConstantsModule (copy)
	local LoadingState = p1.state.loadingState
	local Items = {
		{
			icon = {
				[InputType.MouseAndKeyboard] = Images["icons/controls/mouse/scroll"],
				[InputType.Gamepad] = Images["icons/controls/keys/xboxRSVertical"]
			},
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Zoom")
		},
		{
			icon = {
				[InputType.MouseAndKeyboard] = Images["icons/controls/mouse/clickLeft"],
				[InputType.Gamepad] = Images["icons/controls/keys/xboxRSHorizontal"]
			},
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Rotate")
		},
		{
			icon = {
				[InputType.MouseAndKeyboard] = Images["icons/controls/mouse/clickRight"]
			},
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Pan")
		},
		{
			icon = {
				[InputType.Gamepad] = Images["icons/controls/keys/xboxY"]
			},
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.ResetView")
		},
		{
			icon = {
				[InputType.Gamepad] = Images["icons/controls/keys/xboxB"]
			},
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Close")
		}
	}
	local NoIsGamepad: boolean = p1.state.cameraMoved and not p1.state.isGamepad
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[RoactModule.Ref] = p1.ref,
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: p1 (copy)
			p1.absoluteSize = Frame.AbsoluteSize
			p1:updateCameraPosition()
		end,
		[RoactModule.Change.AbsolutePosition] = function(p2)
			-- upvalues: GuiService (upval), p1 (copy)
			p1.absolutePosition = p2.absolutePosition + GuiService:GetGuiInset()
		end
	}, {
		LastInputTypeConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: p1 (copy), GetInputGroupFunction (upval), InputTypeConstants (upval)
				p1:setState({
					isGamepad = GetInputGroupFunction(p2) == InputTypeConstants.Gamepad
				})
			end
		}) or nil,
		ButtonFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0)
		}, {
			UIPadding = RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 24),
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			ResetViewButton = if NoIsGamepad then RoactModule.createElement(Button, {
				buttonType = ButtonType.Secondary,
				size = UDim2.fromOffset(36, 36),
				position = UDim2.fromScale(0, 1),
				anchorPoint = Vector2.new(0, 1),
				icon = IconsActionsReset,
				onActivated = p1.onResetButtonPressed
			}) else nil,
			ShrinkPreviewButton = RoactModule.createElement(Button, {
				buttonType = ButtonType.PrimarySystem,
				size = UDim2.fromOffset(36, 36),
				icon = IconsActionsPreviewShrink,
				position = UDim2.fromScale(1, 1),
				anchorPoint = Vector2.new(1, 1),
				onActivated = p1.props.closePreviewView
			})
		}),
		TooltipHint = if p1.props.asset:IsA("Model") then RoactModule.createElement(ShortcutBar, {
			transitionDelaySeconds = 2,
			position = UDim2.fromScale(0.5, 0.9),
			anchorPoint = Vector2.new(0.5, 1),
			items = Items
		}) else nil,
		ShimmerFrame = LoadingState == "loading" and RoactModule.createElement(Skeleton, {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		LoadingFailed = LoadingState == "failedToLoad" and RoactModule.createElement(EmptyState, {
			text = config.loadingFailedText,
			size = UDim2.fromScale(1, 1),
			onActivated = p1.onRetryLoading
		}),
		InteractionFrame = RoactModule.createElement(InteractionFrameModule, {
			ZIndex = -1,
			Size = UDim2.fromScale(1, 1),
			Visible = LoadingState == "successfullyLoaded",
			panByPixels = p1.panByPixels,
			rotateByPixels = p1.rotateByPixels,
			setAngularVelocityByPixels = p1.setAngularVelocityByPixels,
			zoomToPoint = p1.zoomToPoint
		}, {
			ViewportFrame = RoactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = ConstantsModule.ViewportLightColor,
				Ambient = ConstantsModule.ViewportLightAmbient,
				LightDirection = ConstantsModule.ViewportLightDirection,
				CurrentCamera = p1.cameraRef
			}, {
				Camera = RoactModule.createElement("Camera", {
					CameraType = Enum.CameraType.Scriptable,
					FieldOfView = 30,
					HeadLocked = true,
					VRTiltAndRollEnabled = true,
					CFrame = p1.cameraCFrameBinding,
					Focus = p1.cameraFocusBinding,
					[RoactModule.Ref] = p1.cameraRef
				}),
				WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef })
			})
		})
	})
end

function PreviewViewport.setUpGamepad(p1)
	-- upvalues: ContextActionService (copy), RunService (copy), GamepadUtils (copy)
	ContextActionService:UnbindCoreAction("PreviewViewportClose")
	ContextActionService:UnbindCoreAction("PreviewViewportReset")
	ContextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	ContextActionService:BindCoreAction("PreviewViewportClose", p1.props.closePreviewView, false, Enum.KeyCode.ButtonB)
	ContextActionService:BindCoreAction("PreviewViewportReset", function()
		-- upvalues: p1 (copy)
		p1:resetCameraPosition()
	end, false, Enum.KeyCode.ButtonY)
	ContextActionService:BindCoreAction("PreviewViewportRotateAndZoom", p1.storeInput, false, Enum.KeyCode.Thumbstick2)
	p1.gamePadConnection = RunService.RenderStepped:Connect(function(DeltaTime)
		-- upvalues: p1 (copy), GamepadUtils (upval)
		if p1.inputState == Enum.UserInputState.Change and p1.inputObject then
			GamepadUtils.rotateAndZoom(p1.inputObject, DeltaTime, p1.setAngularVelocityByPixels, p1.rotateByRadians, p1.zoomToPoint)
		end
	end)
end

function PreviewViewport.didMount(p1)
	-- upvalues: GuiService (copy)
	p1.isMounted = true
	p1.absolutePosition = p1.ref.current.AbsolutePosition + GuiService:GetGuiInset()
	p1:processAsset()
	p1:setUpGamepad()
end

function PreviewViewport.cleanupGamepad(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("PreviewViewportClose")
	ContextActionService:UnbindCoreAction("PreviewViewportReset")
	ContextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	
	if p1.gamePadConnection then
		p1.gamePadConnection:Disconnect()
	end
end

function PreviewViewport.willUnmount(p1)
	p1.isMounted = false
	p1:cleanupGamepad()
end

function PreviewViewport.didUpdate(p1, p2)
	if p1.props.asset ~= p2.asset then
		if p1.model ~= nil then
			p1.model.Parent = nil
			p1.model = nil
		end
		if p1.baseplate ~= nil then
			p1.baseplate.Parent = nil
			p1.baseplate:Destroy()
		end
		p1:processAsset()
	end
end

return PreviewViewport