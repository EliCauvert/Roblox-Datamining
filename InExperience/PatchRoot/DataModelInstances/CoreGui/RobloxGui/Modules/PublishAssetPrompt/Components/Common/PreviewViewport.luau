local animationClipProviderService = game:GetService("AnimationClipProvider")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local emptyState = UIBloxModule.App.Indicator.EmptyState
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local shortcutBar = UIBloxModule.App.Navigation.ShortcutBar
local inputType = UIBloxModule.Core.Enums.InputType
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local inputTypeConstants = require(corePackagesService.Workspace.Packages.InputType).InputTypeConstants
local gamepadUtils = require(corePackagesService.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local interactionFrameModule = require(script.Parent.InteractionFrame)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local images = UIBloxModule.App.ImageSet.Images
local previewShrink = images["icons/actions/previewShrink"]
local reset = images["icons/actions/reset"]
local _ = {
	LOADING = "loading",
	SUCCESSFULLY_LOADED = "successfullyLoaded",
	FAILED_TO_LOAD = "failedToLoad"
}
local previewViewport = roactModule.PureComponent:extend("PreviewViewport")
previewViewport.validateProps = tModule.strictInterface({
	asset = tModule.union(tModule.instanceOf("Model"), tModule.instanceIsA("AnimationClip")),
	closePreviewView = tModule.callback
})

local function _(p0) --[[ line: 70 | named "isGamepadInput" ]]
	-- upvalues: getInputGroup (ref), inputTypeConstants (ref)
	return getInputGroup(p0) == inputTypeConstants.Gamepad
end

function previewViewport.init(p1) --[[ line: 75 ]]
	-- upvalues: userInputService (ref), getInputGroup (ref), inputTypeConstants (ref), roactModule (ref)
	p1:setState({
		loadingState = "loading",
		cameraMoved = false,
		isGamepad = getInputGroup(userInputService:GetLastInputType()) == inputTypeConstants.Gamepad
	})
	p1.ref = roactModule.createRef()
	p1.zoomFactor = 0.8
	p1.cameraDegreesAngle = Vector2.new(0, 0)
	p1.cameraPanInPixels = Vector2.new(0, 0)
	p1.cameraRef = roactModule.createRef()
	p1.worldModelRef = roactModule.createRef()
	local var15, var16 = roactModule.createBinding(CFrame.new())
	p1.cameraCFrameBinding = var15
	p1.updateCameraCFrameBinding = var16
	local var17, var18 = roactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding = var17
	p1.updateCameraFocusBinding = var18
	
	function p1.panByPixels(p2) --[[ line: 93 ]]
		-- upvalues: p1 (ref)
		p1.cameraPanInPixels += p2
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.rotateByPixels(p3) --[[ line: 102 ]]
		-- upvalues: p1 (ref)
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X - p3.Y, p1.cameraDegreesAngle.Y - p3.X)
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.storeInput(_, p4, p5) --[[ line: 115 ]]
		-- upvalues: p1 (ref)
		p1.inputState = p4
		p1.inputObject = p5
		
		return Enum.ContextActionResult.Sink
	end
	
	function p1.rotateByRadians(p6) --[[ line: 123 ]]
		-- upvalues: p1 (ref)
		if not p1.model:FindFirstChild("HumanoidRootPart") then return end
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X % 360, (p1.cameraDegreesAngle.Y + -p6 * 180 / 3.14159265359) % 360)
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.setAngularVelocityByPixels(_) --[[ line: 142 ]] end
	
	function p1.zoomToPoint(p7, p8) --[[ line: 145 ]]
		-- upvalues: p1 (ref)
		local var19 = 0.9 ^ p7
		local var20 = p1.zoomFactor * var19
		
		if var20 ~= math.clamp(var20, 0.3, 10) then return end
		p1.zoomFactor = var20
		
		if p8 then
			local var21 = (p8 - (p1.absolutePosition + p1.absoluteSize / 2)) * Vector2.new(1, -1) * -1
			p1.cameraPanInPixels = var21 - (var21 - p1.cameraPanInPixels) * var19
		end
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.onRetryLoading() --[[ line: 170 ]]
		-- upvalues: p1 (ref)
		p1:processAsset()
	end
	
	function p1.onResetButtonPressed() --[[ line: 174 ]]
		-- upvalues: p1 (ref)
		p1:resetCameraPosition()
	end
end

function previewViewport.setLoadingState(value, p9) --[[ line: 179 ]]
	value:setState({ loadingState = p9 })
end

function previewViewport.clampOffsets(value) --[[ line: 185 ]]
	value.zoomFactor = math.clamp(value.zoomFactor, 0.3, 10)
	value.cameraDegreesAngle = Vector2.new(math.clamp(value.cameraDegreesAngle.X, if value.props.asset and value.props.asset:IsA("AnimationClip") then value:angleToMakeBasePlateParallel() else -80, 80), value.cameraDegreesAngle.Y)
	local maxValue = math.max(value.zoomFactor * value.modelExtentsSize.X / 2 / value:pointsToPixelsFactor(), value.absoluteSize.X / 2)
	local maxValue_1 = math.max(value.zoomFactor * value.modelExtentsSize.Y / 2 / value:pointsToPixelsFactor(), value.absoluteSize.Y / 2)
	value.cameraPanInPixels = Vector2.new(math.clamp(value.cameraPanInPixels.X, -maxValue, maxValue), math.clamp(value.cameraPanInPixels.Y, -maxValue_1, maxValue_1))
end

function previewViewport.angleToMakeBasePlateParallel(vectorA) --[[ line: 211 ]]
	return -math.deg(math.asin(math.clamp((vectorA.modelExtentsSize.Y / 2 + vectorA:pointsToPixelsFactor() / vectorA.zoomFactor * vectorA.cameraPanInPixels.Y) / (vectorA.cameraDistance / vectorA.zoomFactor), -0.99, 0.99)))
end

function previewViewport.processAsset(value) --[[ line: 230 ]]
	-- upvalues: playersService (ref), animationClipProviderService (ref)
	local asset = value.props.asset
	
	if not asset then return end
	if asset:IsA("AnimationClip") then
		value:setLoadingState("loading")
		task.spawn(function() --[[ line: 239 ]]
			-- upvalues: playersService (copy), value (ref), asset (ref), animationClipProviderService (copy)
			local ok, status = pcall(function() --[[ line: 240 ]]
				-- upvalues: playersService (copy)
				return playersService:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
			end)
			local var25 = if ok then playersService:CreateHumanoidModelFromDescriptionAsync(status, Enum.HumanoidRigType.R15) else nil
			
			if not value.isMounted or asset ~= value.props.asset then return end
			if not var25 then
				value:setLoadingState("failedToLoad")
				
				return
			end
			value.model = var25
			value:addModelToViewportIfNeeded()
			local var26 = animationClipProviderService:RegisterActiveAnimationClip(asset)
			value.animation = Instance.new("Animation")
			value.animation.AnimationId = var26
			local humanoid = value.model:FindFirstChildWhichIsA("Humanoid")
			
			if humanoid then
				humanoid:LoadAnimation(value.animation):Play()
			end
			value:setLoadingState("successfullyLoaded")
		end)
		
		return
	elseif asset:IsA("Model") or asset:IsA("Accessory") then
		if asset:IsA("Accessory") then
			local model = Instance.new("Model")
			asset:Clone().Parent = model
			value.model = model
		else
			value.model = asset:Clone()
		end
		value.model.Parent = nil
		value:addModelToViewportIfNeeded()
		value:setLoadingState("successfullyLoaded")
	end
end

function previewViewport.addModelToViewportIfNeeded(p10) --[[ line: 293 ]]
	if p10.model ~= nil and p10.model.Parent ~= nil then return end
	if p10.worldModelRef:getValue() and p10.model ~= nil then
		p10.model.Parent = p10.worldModelRef:getValue()
		p10:resetCameraPosition()
		
		if p10.props.asset and p10.props.asset:IsA("AnimationClip") then
			p10.baseplate = Instance.new("Part")
			p10.baseplate.Size = Vector3.new(8, 0.5, 8)
			p10.baseplate.Transparency = 0.6
			p10.baseplate.Parent = p10.worldModelRef:getValue()
			p10.baseplate.Position = p10.modelCFrame.Position + Vector3.new(0, -p10.modelExtentsSize.Y / 2, 0) + Vector3.new(0, -0.25, 0)
		end
	end
end

local _ = function(p11, p12) --[[ line: 315 | named "getCameraDistance" ]]
	return math.max(p12.X, p12.Y) / 2 * (1 / math.tan(math.rad(p11) / 2)) + p12.Z / 2
end

local _ = function(value, p13, p14) --[[ line: 325 | named "rotateVectorAround" ]]
	return CFrame.fromAxisAngle(p14, p13):VectorToWorldSpace(value)
end

function previewViewport.resetCameraPosition(value) --[[ line: 329 ]]
	if not value.model then return end
	value.modelCFrame = value.model:GetModelCFrame()
	value.initialLookVector = value.modelCFrame.lookVector
	local humanoidRootPart = value.model:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		value.initialLookVector = humanoidRootPart.CFrame.lookVector
	end
	value.modelExtentsSize = value.model:GetExtentsSize()
	local modelExtentsSize = value.modelExtentsSize
	value.cameraDistance = math.max(modelExtentsSize.X, modelExtentsSize.Y) / 2 * 3.732050807569 + modelExtentsSize.Z / 2
	
	if value.props.asset and value.props.asset:IsA("AnimationClip") then
		value.cameraDegreesAngle = Vector2.new(0, 0)
		value.zoomFactor = 0.75
	else
		value.cameraDegreesAngle = Vector2.new(5, 20)
		value.zoomFactor = 0.8
	end
	value.cameraPanInPixels = Vector2.new(0, 0)
	value:updateCameraPosition()
	
	if value.state.cameraMoved then
		value:setState({ cameraMoved = false })
	end
end

function previewViewport.pointsToPixelsFactor(p15) --[[ line: 363 ]]
	return if p15.absoluteSize == nil or p15.modelExtentsSize == nil or (p15.absoluteSize.Y == 0 or p15.modelExtentsSize.Y == 0) or p15.modelExtentsSize.X == 0 then 1 else math.max(p15.modelExtentsSize.X, p15.modelExtentsSize.Y) / p15.absoluteSize.Y
end

function previewViewport.updateCameraPosition(p16) --[[ line: 378 ]]
	if p16.absoluteSize == nil or p16.cameraDistance == nil then
		return
	end
	local cFrame = CFrame.new(p16.modelCFrame.p + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(p16.cameraDegreesAngle.Y)):VectorToWorldSpace(CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(p16.cameraDegreesAngle.X)):VectorToWorldSpace(p16.initialLookVector)) * (p16.cameraDistance / p16.zoomFactor), p16.modelCFrame.p)
	local var30 = p16:pointsToPixelsFactor() / p16.zoomFactor
	p16.updateCameraCFrameBinding(cFrame + cFrame.UpVector * var30 * p16.cameraPanInPixels.Y + cFrame.RightVector * var30 * p16.cameraPanInPixels.X)
	p16.updateCameraFocusBinding(p16.modelCFrame)
end

local t = {
	resetViewButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"),
	loadingFailedText = robloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
}

function previewViewport.render(p17) --[[ line: 412 ]]
	-- upvalues: inputType (ref), images (ref), robloxTranslatorModule (ref), roactModule (ref), guiService (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeConstants (ref), button (ref), buttonType (ref), reset (ref), previewShrink (ref), shortcutBar (ref), skeleton (ref), emptyState (ref), t (ref), interactionFrameModule (ref), constantsModule (ref)
	local loadingState = p17.state.loadingState
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[roactModule.Ref] = p17.ref,
		[roactModule.Change.AbsoluteSize] = function(p18) --[[ line: 457 ]]
			-- upvalues: p17 (ref)
			p17.absoluteSize = p18.AbsoluteSize
			p17:updateCameraPosition()
		end,
		[roactModule.Change.AbsolutePosition] = function(p19) --[[ line: 461 ]]
			-- upvalues: guiService (copy), p17 (ref)
			p17.absolutePosition = p19.absolutePosition + guiService:GetGuiInset()
		end
	}, {
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p20) --[[ line: 468 ]]
				-- upvalues: p17 (ref), getInputGroup (copy), inputTypeConstants (copy)
				p17:setState({
					isGamepad = getInputGroup(p20) == inputTypeConstants.Gamepad
				})
			end
		}) or nil,
		ButtonFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0)
		}, {
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 24),
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			ResetViewButton = if p17.state.cameraMoved and not p17.state.isGamepad then roactModule.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.fromOffset(36, 36),
				position = UDim2.fromScale(0, 1),
				anchorPoint = Vector2.new(0, 1),
				icon = reset,
				onActivated = p17.onResetButtonPressed
			}) else nil,
			ShrinkPreviewButton = roactModule.createElement(button, {
				buttonType = buttonType.PrimarySystem,
				size = UDim2.fromOffset(36, 36),
				icon = previewShrink,
				position = UDim2.fromScale(1, 1),
				anchorPoint = Vector2.new(1, 1),
				onActivated = p17.props.closePreviewView
			})
		}),
		TooltipHint = if p17.props.asset:IsA("Model") then roactModule.createElement(shortcutBar, {
			transitionDelaySeconds = 2,
			position = UDim2.fromScale(0.5, 0.9),
			anchorPoint = Vector2.new(0.5, 1),
			items = {
				{
					icon = {
						[inputType.MouseAndKeyboard] = images["icons/controls/mouse/scroll"],
						[inputType.Gamepad] = images["icons/controls/keys/xboxRSVertical"]
					},
					text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Zoom")
				},
				{
					icon = {
						[inputType.MouseAndKeyboard] = images["icons/controls/mouse/clickLeft"],
						[inputType.Gamepad] = images["icons/controls/keys/xboxRSHorizontal"]
					},
					text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Rotate")
				},
				{
					icon = {
						[inputType.MouseAndKeyboard] = images["icons/controls/mouse/clickRight"]
					},
					text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Pan")
				},
				{
					icon = {
						[inputType.Gamepad] = images["icons/controls/keys/xboxY"]
					},
					text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.ResetView")
				},
				{
					icon = {
						[inputType.Gamepad] = images["icons/controls/keys/xboxB"]
					},
					text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.Close")
				}
			}
		}) else nil,
		ShimmerFrame = loadingState == "loading" and roactModule.createElement(skeleton, {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		LoadingFailed = loadingState == "failedToLoad" and roactModule.createElement(emptyState, {
			text = t.loadingFailedText,
			size = UDim2.fromScale(1, 1),
			onActivated = p17.onRetryLoading
		}),
		InteractionFrame = roactModule.createElement(interactionFrameModule, {
			ZIndex = -1,
			Size = UDim2.fromScale(1, 1),
			Visible = loadingState == "successfullyLoaded",
			panByPixels = p17.panByPixels,
			rotateByPixels = p17.rotateByPixels,
			setAngularVelocityByPixels = p17.setAngularVelocityByPixels,
			zoomToPoint = p17.zoomToPoint
		}, {
			ViewportFrame = roactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = constantsModule.ViewportLightColor,
				Ambient = constantsModule.ViewportLightAmbient,
				LightDirection = constantsModule.ViewportLightDirection,
				CurrentCamera = p17.cameraRef
			}, {
				Camera = roactModule.createElement("Camera", {
					CameraType = Enum.CameraType.Scriptable,
					FieldOfView = 30,
					HeadLocked = true,
					VRTiltAndRollEnabled = true,
					CFrame = p17.cameraCFrameBinding,
					Focus = p17.cameraFocusBinding,
					[roactModule.Ref] = p17.cameraRef
				}),
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p17.worldModelRef })
			})
		})
	})
end

function previewViewport.setUpGamepad(value) --[[ line: 568 ]]
	-- upvalues: contextActionService (ref), runService (ref), gamepadUtils (ref)
	contextActionService:UnbindCoreAction("PreviewViewportClose")
	contextActionService:UnbindCoreAction("PreviewViewportReset")
	contextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	contextActionService:BindCoreAction("PreviewViewportClose", value.props.closePreviewView, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("PreviewViewportReset", function() --[[ line: 579 ]]
		-- upvalues: value (ref)
		value:resetCameraPosition()
	end, false, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("PreviewViewportRotateAndZoom", value.storeInput, false, Enum.KeyCode.Thumbstick2)
	value.gamePadConnection = runService.RenderStepped:Connect(function(p21) --[[ line: 589 ]]
		-- upvalues: value (ref), gamepadUtils (copy)
		if value.inputState == Enum.UserInputState.Change and value.inputObject then
			gamepadUtils.rotateAndZoom(value.inputObject, p21, value.setAngularVelocityByPixels, value.rotateByRadians, value.zoomToPoint)
		end
	end)
end

function previewViewport.didMount(p22) --[[ line: 602 ]]
	-- upvalues: guiService (ref)
	local guiInset = guiService:GetGuiInset()
	p22.isMounted = true
	p22.absolutePosition = p22.ref.current.AbsolutePosition + guiInset
	p22:processAsset()
	p22:setUpGamepad()
end

function previewViewport.cleanupGamepad(p23) --[[ line: 610 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("PreviewViewportClose")
	contextActionService:UnbindCoreAction("PreviewViewportReset")
	contextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	
	if p23.gamePadConnection then
		p23.gamePadConnection:Disconnect()
	end
end

function previewViewport.willUnmount(p24) --[[ line: 619 ]]
	p24.isMounted = false
	p24:cleanupGamepad()
end

function previewViewport.didUpdate(p25, p26) --[[ line: 624 ]]
	if p25.props.asset ~= p26.asset then
		if p25.model ~= nil then
			p25.model.Parent = nil
			p25.model = nil
		end
		if p25.baseplate ~= nil then
			p25.baseplate.Parent = nil
			p25.baseplate:Destroy()
		end
		p25:processAsset()
	end
end

return previewViewport