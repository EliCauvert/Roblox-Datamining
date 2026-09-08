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
local makeupPreviewUtilsModule = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
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
	closePreviewView = tModule.callback,
	isMakeupPreview = tModule.optional(tModule.boolean)
})

local function _(p1)
	-- upvalues: getInputGroup (ref), inputTypeConstants (ref)
	return getInputGroup(p1) == inputTypeConstants.Gamepad
end

function previewViewport.init(p1)
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
	local var1, var2 = roactModule.createBinding(CFrame.new())
	p1.cameraCFrameBinding = var1
	p1.updateCameraCFrameBinding = var2
	local var3, var4 = roactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding = var3
	p1.updateCameraFocusBinding = var4
	
	function p1.panByPixels(p2)
		-- upvalues: p1 (ref)
		p1.cameraPanInPixels += p2
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.rotateByPixels(p2)
		-- upvalues: p1 (ref)
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X - p2.Y, p1.cameraDegreesAngle.Y - p2.X)
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.storeInput(_, p2, p3)
		-- upvalues: p1 (ref)
		p1.inputState = p2
		p1.inputObject = p3
		
		return Enum.ContextActionResult.Sink
	end
	
	function p1.rotateByRadians(p2)
		-- upvalues: p1 (ref)
		if not p1.model:FindFirstChild("HumanoidRootPart") then return end
		p1.cameraDegreesAngle = Vector2.new(p1.cameraDegreesAngle.X % 360, (p1.cameraDegreesAngle.Y + -p2 * 180 / 3.14159265359) % 360)
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.setAngularVelocityByPixels(_) end
	
	function p1.zoomToPoint(p2, p3)
		-- upvalues: p1 (ref)
		local var5 = 0.9 ^ p2
		local var6 = p1.zoomFactor * var5
		
		if var6 ~= math.clamp(var6, 0.3, 10) then return end
		p1.zoomFactor = var6
		
		if p3 then
			local var7 = (p3 - (p1.absolutePosition + p1.absoluteSize / 2)) * Vector2.new(1, -1) * -1
			p1.cameraPanInPixels = var7 - (var7 - p1.cameraPanInPixels) * var5
		end
		p1:clampOffsets()
		p1:updateCameraPosition()
		
		if not p1.state.cameraMoved then
			p1:setState({ cameraMoved = true })
		end
	end
	
	function p1.onRetryLoading()
		-- upvalues: p1 (ref)
		p1:processAsset()
	end
	
	function p1.onResetButtonPressed()
		-- upvalues: p1 (ref)
		p1:resetCameraPosition()
	end
end

function previewViewport.setLoadingState(value, p1)
	value:setState({ loadingState = p1 })
end

function previewViewport.clampOffsets(value)
	value.zoomFactor = math.clamp(value.zoomFactor, 0.3, 10)
	value.cameraDegreesAngle = Vector2.new(math.clamp(value.cameraDegreesAngle.X, if value.props.asset and value.props.asset:IsA("AnimationClip") then value:angleToMakeBasePlateParallel() else -80, 80), value.cameraDegreesAngle.Y)
	local maxValue = math.max(value.zoomFactor * value.modelExtentsSize.X / 2 / value:pointsToPixelsFactor(), value.absoluteSize.X / 2)
	local maxValue_1 = math.max(value.zoomFactor * value.modelExtentsSize.Y / 2 / value:pointsToPixelsFactor(), value.absoluteSize.Y / 2)
	value.cameraPanInPixels = Vector2.new(math.clamp(value.cameraPanInPixels.X, -maxValue, maxValue), math.clamp(value.cameraPanInPixels.Y, -maxValue_1, maxValue_1))
end

function previewViewport.angleToMakeBasePlateParallel(vectorA)
	return -math.deg(math.asin(math.clamp((vectorA.modelExtentsSize.Y / 2 + vectorA:pointsToPixelsFactor() / vectorA.zoomFactor * vectorA.cameraPanInPixels.Y) / (vectorA.cameraDistance / vectorA.zoomFactor), -0.99, 0.99)))
end

function previewViewport.processAsset(value)
	-- upvalues: playersService (ref), animationClipProviderService (ref)
	local asset = value.props.asset
	
	if not asset then return end
	if asset:IsA("AnimationClip") then
		value:setLoadingState("loading")
		task.spawn(function()
			-- upvalues: playersService (copy), value (ref), asset (ref), animationClipProviderService (copy)
			local ok, status = pcall(function()
				-- upvalues: playersService (copy)
				return playersService:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
			end)
			local var1 = if ok then playersService:CreateHumanoidModelFromDescriptionAsync(status, Enum.HumanoidRigType.R15) else nil
			
			if not value.isMounted or asset ~= value.props.asset then return end
			if not var1 then
				value:setLoadingState("failedToLoad")
				
				return
			end
			value.model = var1
			value:addModelToViewportIfNeeded()
			local var2 = animationClipProviderService:RegisterActiveAnimationClip(asset)
			value.animation = Instance.new("Animation")
			value.animation.AnimationId = var2
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

function previewViewport.addModelToViewportIfNeeded(p1)
	if p1.model ~= nil and p1.model.Parent ~= nil then return end
	if p1.worldModelRef:getValue() and p1.model ~= nil then
		p1.model.Parent = p1.worldModelRef:getValue()
		p1:resetCameraPosition()
		
		if p1.props.asset and p1.props.asset:IsA("AnimationClip") then
			p1.baseplate = Instance.new("Part")
			p1.baseplate.Size = Vector3.new(8, 0.5, 8)
			p1.baseplate.Transparency = 0.6
			p1.baseplate.Parent = p1.worldModelRef:getValue()
			p1.baseplate.Position = p1.modelCFrame.Position + Vector3.new(0, -p1.modelExtentsSize.Y / 2, 0) + Vector3.new(0, -0.25, 0)
		end
	end
end

local _ = function(p1, p2)
	return math.max(p2.X, p2.Y) / 2 * (1 / math.tan(math.rad(p1) / 2)) + p2.Z / 2
end

local _ = function(value, p1, p2)
	return CFrame.fromAxisAngle(p2, p1):VectorToWorldSpace(value)
end

function previewViewport.resetCameraPosition(value)
	-- upvalues: makeupPreviewUtilsModule (ref)
	if not value.model then return end
	local var1 = nil
	local var2 = nil
	
	if value.props.isMakeupPreview then
		local headPreviewCameraData, headPreviewCameraData_1 = makeupPreviewUtilsModule.getHeadPreviewCameraData(value.model)
		var1 = headPreviewCameraData
		var2 = headPreviewCameraData_1
	end
	value.modelCFrame = var1 or value.model:GetModelCFrame()
	value.initialLookVector = value.modelCFrame.lookVector
	local humanoidRootPart = value.model:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		value.initialLookVector = humanoidRootPart.CFrame.lookVector
	end
	value.modelExtentsSize = var2 or value.model:GetExtentsSize()
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

function previewViewport.pointsToPixelsFactor(p1)
	return if p1.absoluteSize == nil or p1.modelExtentsSize == nil or (p1.absoluteSize.Y == 0 or p1.modelExtentsSize.Y == 0) or p1.modelExtentsSize.X == 0 then 1 else math.max(p1.modelExtentsSize.X, p1.modelExtentsSize.Y) / p1.absoluteSize.Y
end

function previewViewport.updateCameraPosition(p1)
	if p1.absoluteSize == nil or p1.cameraDistance == nil then
		return
	end
	local cFrame = CFrame.new(p1.modelCFrame.p + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(p1.cameraDegreesAngle.Y)):VectorToWorldSpace(CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(p1.cameraDegreesAngle.X)):VectorToWorldSpace(p1.initialLookVector)) * (p1.cameraDistance / p1.zoomFactor), p1.modelCFrame.p)
	local var1 = p1:pointsToPixelsFactor() / p1.zoomFactor
	p1.updateCameraCFrameBinding(cFrame + cFrame.UpVector * var1 * p1.cameraPanInPixels.Y + cFrame.RightVector * var1 * p1.cameraPanInPixels.X)
	p1.updateCameraFocusBinding(p1.modelCFrame)
end

local t = {
	resetViewButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"),
	loadingFailedText = robloxTranslatorModule:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
}

function previewViewport.render(p1)
	-- upvalues: inputType (ref), images (ref), robloxTranslatorModule (ref), roactModule (ref), guiService (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeConstants (ref), button (ref), buttonType (ref), reset (ref), previewShrink (ref), shortcutBar (ref), skeleton (ref), emptyState (ref), t (ref), interactionFrameModule (ref), constantsModule (ref)
	local loadingState = p1.state.loadingState
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[roactModule.Ref] = p1.ref,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			p1.absoluteSize = p2.AbsoluteSize
			p1:updateCameraPosition()
		end,
		[roactModule.Change.AbsolutePosition] = function(p2)
			-- upvalues: guiService (copy), p1 (ref)
			p1.absolutePosition = p2.absolutePosition + guiService:GetGuiInset()
		end
	}, {
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: p1 (ref), getInputGroup (copy), inputTypeConstants (copy)
				p1:setState({
					isGamepad = getInputGroup(p2) == inputTypeConstants.Gamepad
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
			ResetViewButton = if p1.state.cameraMoved and not p1.state.isGamepad then roactModule.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.fromOffset(36, 36),
				position = UDim2.fromScale(0, 1),
				anchorPoint = Vector2.new(0, 1),
				icon = reset,
				onActivated = p1.onResetButtonPressed
			}) else nil,
			ShrinkPreviewButton = roactModule.createElement(button, {
				buttonType = buttonType.PrimarySystem,
				size = UDim2.fromOffset(36, 36),
				icon = previewShrink,
				position = UDim2.fromScale(1, 1),
				anchorPoint = Vector2.new(1, 1),
				onActivated = p1.props.closePreviewView
			})
		}),
		TooltipHint = if p1.props.asset:IsA("Model") then roactModule.createElement(shortcutBar, {
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
			onActivated = p1.onRetryLoading
		}),
		InteractionFrame = roactModule.createElement(interactionFrameModule, {
			ZIndex = -1,
			Size = UDim2.fromScale(1, 1),
			Visible = loadingState == "successfullyLoaded",
			panByPixels = p1.panByPixels,
			rotateByPixels = p1.rotateByPixels,
			setAngularVelocityByPixels = p1.setAngularVelocityByPixels,
			zoomToPoint = p1.zoomToPoint
		}, {
			ViewportFrame = roactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				LightColor = constantsModule.ViewportLightColor,
				Ambient = constantsModule.ViewportLightAmbient,
				LightDirection = constantsModule.ViewportLightDirection,
				CurrentCamera = p1.cameraRef
			}, {
				Camera = roactModule.createElement("Camera", {
					CameraType = Enum.CameraType.Scriptable,
					FieldOfView = 30,
					HeadLocked = true,
					VRTiltAndRollEnabled = true,
					CFrame = p1.cameraCFrameBinding,
					Focus = p1.cameraFocusBinding,
					[roactModule.Ref] = p1.cameraRef
				}),
				WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef })
			})
		})
	})
end

function previewViewport.setUpGamepad(value)
	-- upvalues: contextActionService (ref), runService (ref), gamepadUtils (ref)
	contextActionService:UnbindCoreAction("PreviewViewportClose")
	contextActionService:UnbindCoreAction("PreviewViewportReset")
	contextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	contextActionService:BindCoreAction("PreviewViewportClose", value.props.closePreviewView, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("PreviewViewportReset", function()
		-- upvalues: value (ref)
		value:resetCameraPosition()
	end, false, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("PreviewViewportRotateAndZoom", value.storeInput, false, Enum.KeyCode.Thumbstick2)
	value.gamePadConnection = runService.RenderStepped:Connect(function(p1)
		-- upvalues: value (ref), gamepadUtils (copy)
		if value.inputState == Enum.UserInputState.Change and value.inputObject then
			gamepadUtils.rotateAndZoom(value.inputObject, p1, value.setAngularVelocityByPixels, value.rotateByRadians, value.zoomToPoint)
		end
	end)
end

function previewViewport.didMount(p1)
	-- upvalues: guiService (ref)
	local guiInset = guiService:GetGuiInset()
	p1.isMounted = true
	p1.absolutePosition = p1.ref.current.AbsolutePosition + guiInset
	p1:processAsset()
	p1:setUpGamepad()
end

function previewViewport.cleanupGamepad(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("PreviewViewportClose")
	contextActionService:UnbindCoreAction("PreviewViewportReset")
	contextActionService:UnbindCoreAction("PreviewViewportRotateAndZoom")
	
	if p1.gamePadConnection then
		p1.gamePadConnection:Disconnect()
	end
end

function previewViewport.willUnmount(p1)
	p1.isMounted = false
	p1:cleanupGamepad()
end

function previewViewport.didUpdate(p1, p2)
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

return previewViewport