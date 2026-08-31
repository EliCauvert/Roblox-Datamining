local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarViewportModule = require(parent.AvatarViewport)
local applyCloseupPreviewPoseModule = require(avatarExperienceProfilePictureEditor.Shared.applyCloseupPreviewPose)
local frameCloseupPreviewCameraModule = require(avatarExperienceProfilePictureEditor.Shared.frameCloseupPreviewCamera)
local previewCutoutOverlayModule = require(script.Parent.PreviewCutoutOverlay)
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local cameraMath = avatarViewportModule.CameraMath
local useRotatableOrbitViewport = avatarViewportModule.useRotatableOrbitViewport
local avatarViewportScene = avatarViewportModule.AvatarViewportScene
local viewportInteractionOverlay = avatarViewportModule.ViewportInteractionOverlay

local function _(p1)
	if not p1 then return end
	for i, v in p1:GetPlayingAnimationTracks() do
		v:Stop(0)
	end
end

return function(p2)
	-- upvalues: useTokens (ref), cameraMath (ref), reactModule (ref), frameCloseupPreviewCameraModule (ref), avatarViewportModule (ref), useRotatableOrbitViewport (ref), applyCloseupPreviewPoseModule (ref), view (ref), avatarViewportScene (ref), previewCutoutOverlayModule (ref), loading (ref), iconSize (ref), viewportInteractionOverlay (ref)
	local var1 = useTokens()
	local cutoutSize = p2.cutoutSize
	local width = p2.width
	local height = p2.height
	local cutoutTopOffset = p2.cutoutTopOffset
	local var2 = cameraMath.clampDistanceScale(p2.distanceScale)
	local var3 = reactModule.useMemo(function()
		-- upvalues: height (ref), cutoutTopOffset (ref), cutoutSize (ref)
		return {
			viewportHeight = height,
			cutoutTopOffset = cutoutTopOffset,
			cutoutDiameter = cutoutSize
		}
	end, { height, cutoutTopOffset, cutoutSize })
	local var4 = reactModule.useRef(0)
	local var5 = useRotatableOrbitViewport({
		gamepadActionName = "EditProfileRotatableAvatarPreviewOrbit",
		modelSource = reactModule.useMemo(function()
			-- upvalues: avatarViewportModule (copy), p2 (ref)
			return avatarViewportModule.ModelSources.fromUserId(p2.userId)
		end, { p2.userId }),
		distanceScale = var2,
		fieldOfViewDeg = p2.fieldOfViewDeg,
		fieldOfViewForDistanceScaleDeg = p2.fieldOfViewForDistanceScaleDeg,
		committedYRotDeg = p2.committedYRotDeg,
		onYRotDegChanged = p2.onYRotDegChanged,
		onDistanceScaleChanged = p2.onDistanceScaleChanged,
		layout = var3,
		frameCloseupPreviewCamera = reactModule.useMemo(function()
			-- upvalues: frameCloseupPreviewCameraModule (copy), var3 (ref)
			return function(p3)
				-- upvalues: frameCloseupPreviewCameraModule (copy), var3 (copy)
				return frameCloseupPreviewCameraModule({
					character = p3.character,
					yRotDeg = p3.yRotDeg,
					distanceScale = p3.distanceScale,
					layout = var3,
					fieldOfViewDeg = p3.config.fieldOfViewDeg,
					fieldOfViewForDistanceScaleDeg = p3.config.fieldOfViewForDistanceScaleDeg
				})
			end
		end, { var3 })
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), p2 (ref), applyCloseupPreviewPoseModule (copy)
		if var5.modelLoader.isReady and var5.modelLoader.model then
			var4.current += 1
			local current = var4.current
			local model = var5.modelLoader.model
			local emoteAssetId = p2.emoteAssetId
			task.spawn(function()
				-- upvalues: model (ref), applyCloseupPreviewPoseModule (copy), emoteAssetId (ref), var4 (copy), current (ref), var5 (copy)
				local humanoid = model:FindFirstChildOfClass("Humanoid")
				local var6 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
				
				if var6 then
					for i, v in var6:GetPlayingAnimationTracks() do
						v:Stop(0)
					end
				end
				applyCloseupPreviewPoseModule(model, emoteAssetId)
				
				if var4.current == current then
					var5.frameCamera({ tween = true })
					
					return
				end
			end)
			
			return function()
				-- upvalues: var4 (copy)
				var4.current += 1
			end
		end
	end, {
		p2.emoteAssetId,
		var5.modelLoader.isReady,
		var5.modelLoader.model,
		var5.frameCamera
	})
	local surface300 = var1.Color.Surface.Surface_300
	
	return reactModule.createElement(view, {
		Size = if p2.fillContainer then UDim2.fromScale(1, 1) else UDim2.fromOffset(width, height),
		backgroundStyle = surface300
	}, {
		Viewport = reactModule.createElement(avatarViewportScene, {
			size = UDim2.fromScale(1, 1),
			backgroundColor3 = surface300.Color3,
			backgroundTransparency = surface300.Transparency or 0,
			refs = var5.refs
		}),
		CutoutOverlay = reactModule.createElement(previewCutoutOverlayModule, {
			width = width,
			height = height,
			cutoutSize = cutoutSize,
			cutoutTopOffset = cutoutTopOffset,
			frameImage = p2.frameImage
		}),
		LoadingSpinner = if var5.modelLoader.isLoading then reactModule.createElement(view, {
			tag = "align-x-center align-y-center size-full",
			ZIndex = 5
		}, {
			Spinner = reactModule.createElement(loading, { size = iconSize.Large })
		}) else nil,
		InteractionOverlay = reactModule.createElement(viewportInteractionOverlay, {
			name = "InteractionOverlay",
			zIndex = 5,
			size = UDim2.fromOffset(cutoutSize, cutoutSize),
			position = UDim2.fromOffset(math.max(0, math.floor((width - cutoutSize) / 2 + 0.5)), cutoutTopOffset),
			inputHandlers = var5.inputHandlers
		})
	})
end