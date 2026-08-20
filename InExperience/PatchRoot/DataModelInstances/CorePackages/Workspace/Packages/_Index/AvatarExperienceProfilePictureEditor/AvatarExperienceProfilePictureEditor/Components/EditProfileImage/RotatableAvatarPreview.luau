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

local function _(p0) --[[ line: 48 | named "stopAnimatorTracks" ]]
	if not p0 then return end
	for i, v in p0:GetPlayingAnimationTracks() do
		v:Stop(0)
	end
end

return function(p1) --[[ line: 57 | named "RotatableAvatarPreview" ]]
	-- upvalues: useTokens (ref), cameraMath (ref), reactModule (ref), frameCloseupPreviewCameraModule (ref), avatarViewportModule (ref), useRotatableOrbitViewport (ref), applyCloseupPreviewPoseModule (ref), view (ref), avatarViewportScene (ref), previewCutoutOverlayModule (ref), loading (ref), iconSize (ref), viewportInteractionOverlay (ref)
	local var7 = useTokens()
	local cutoutSize = p1.cutoutSize
	local width = p1.width
	local height = p1.height
	local cutoutTopOffset = p1.cutoutTopOffset
	local var8 = cameraMath.clampDistanceScale(p1.distanceScale)
	local var9 = reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: height (ref), cutoutTopOffset (ref), cutoutSize (ref)
		return {
			viewportHeight = height,
			cutoutTopOffset = cutoutTopOffset,
			cutoutDiameter = cutoutSize
		}
	end, { height, cutoutTopOffset, cutoutSize })
	local var10 = reactModule.useRef(0)
	local var11 = useRotatableOrbitViewport({
		gamepadActionName = "EditProfileRotatableAvatarPreviewOrbit",
		modelSource = reactModule.useMemo(function() --[[ line: 89 ]]
			-- upvalues: avatarViewportModule (copy), p1 (ref)
			return avatarViewportModule.ModelSources.fromUserId(p1.userId)
		end, { p1.userId }),
		distanceScale = var8,
		fieldOfViewDeg = p1.fieldOfViewDeg,
		fieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg,
		committedYRotDeg = p1.committedYRotDeg,
		onYRotDegChanged = p1.onYRotDegChanged,
		onDistanceScaleChanged = p1.onDistanceScaleChanged,
		layout = var9,
		frameCloseupPreviewCamera = reactModule.useMemo(function() --[[ line: 74 ]]
			-- upvalues: frameCloseupPreviewCameraModule (copy), var9 (ref)
			return function(p2) --[[ line: 75 ]]
				-- upvalues: frameCloseupPreviewCameraModule (copy), var9 (copy)
				return frameCloseupPreviewCameraModule({
					character = p2.character,
					yRotDeg = p2.yRotDeg,
					distanceScale = p2.distanceScale,
					layout = var9,
					fieldOfViewDeg = p2.config.fieldOfViewDeg,
					fieldOfViewForDistanceScaleDeg = p2.config.fieldOfViewForDistanceScaleDeg
				})
			end
		end, { var9 })
	})
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var11 (ref), var10 (ref), p1 (ref), applyCloseupPreviewPoseModule (copy)
		if var11.modelLoader.isReady and var11.modelLoader.model then
			var10.current += 1
			local current = var10.current
			local model = var11.modelLoader.model
			local emoteAssetId = p1.emoteAssetId
			task.spawn(function() --[[ line: 117 ]]
				-- upvalues: model (ref), applyCloseupPreviewPoseModule (copy), emoteAssetId (ref), var10 (copy), current (ref), var11 (copy)
				local humanoid = model:FindFirstChildOfClass("Humanoid")
				local var13 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
				
				if var13 then
					for i, v in var13:GetPlayingAnimationTracks() do
						v:Stop(0)
					end
				end
				applyCloseupPreviewPoseModule(model, emoteAssetId)
				
				if var10.current == current then
					var11.frameCamera({ tween = true })
					
					return
				end
			end)
			
			return function() --[[ line: 128 ]]
				-- upvalues: var10 (copy)
				var10.current += 1
			end
		end
	end, {
		p1.emoteAssetId,
		var11.modelLoader.isReady,
		var11.modelLoader.model,
		var11.frameCamera
	})
	local surface300 = var7.Color.Surface.Surface_300
	
	return reactModule.createElement(view, {
		Size = if p1.fillContainer then UDim2.fromScale(1, 1) else UDim2.fromOffset(width, height),
		backgroundStyle = surface300
	}, {
		Viewport = reactModule.createElement(avatarViewportScene, {
			size = UDim2.fromScale(1, 1),
			backgroundColor3 = surface300.Color3,
			backgroundTransparency = surface300.Transparency or 0,
			refs = var11.refs
		}),
		CutoutOverlay = reactModule.createElement(previewCutoutOverlayModule, {
			width = width,
			height = height,
			cutoutSize = cutoutSize,
			cutoutTopOffset = cutoutTopOffset,
			frameImage = p1.frameImage
		}),
		LoadingSpinner = if var11.modelLoader.isLoading then reactModule.createElement(view, {
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
			inputHandlers = var11.inputHandlers
		})
	})
end