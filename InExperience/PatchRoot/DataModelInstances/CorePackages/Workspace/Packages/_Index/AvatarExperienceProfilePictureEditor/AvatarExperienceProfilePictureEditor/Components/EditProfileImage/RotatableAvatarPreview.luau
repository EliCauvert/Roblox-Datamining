local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarViewportModule = require(Parent.AvatarViewport)
local ApplyCloseupPreviewPoseModule = require(AvatarExperienceProfilePictureEditor.Shared.applyCloseupPreviewPose)
local FrameCloseupPreviewCameraModule = require(AvatarExperienceProfilePictureEditor.Shared.frameCloseupPreviewCamera)
local PreviewCutoutOverlayModule = require(script.Parent.PreviewCutoutOverlay)
local ProfilePictureCameraControlBarModule = require(script.Parent.ProfilePictureCameraControlBar)
local UseRotatableAvatarPreviewViewModelModule = require(script.Parent.useRotatableAvatarPreviewViewModel)
local FFlagEditProfileImageCameraControlBarModule = require(AvatarExperienceProfilePictureEditor.Flags.FFlagEditProfileImageCameraControlBar)
local FFlagEditProfileImageRigTypeOverride = require(Parent.SharedFlags).FFlagEditProfileImageRigTypeOverride
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CameraMath = AvatarViewportModule.CameraMath
local UseRotatableOrbitViewportFunction = AvatarViewportModule.useRotatableOrbitViewport
local AvatarViewportScene = AvatarViewportModule.AvatarViewportScene
local ViewportInteractionOverlay = AvatarViewportModule.ViewportInteractionOverlay

local function _(p1) --[[ Line: 55 | Named "stopAnimatorTracks" ]]
	if not p1 then return end
	for _, playingAnimationTrack in p1:GetPlayingAnimationTracks() do
		playingAnimationTrack:Stop(0)
	end
end

return function(p2) --[[ Line: 64 | Named "RotatableAvatarPreview" ]]
	-- upvalues: UseTokensFunction (copy), CameraMath (copy), FFlagEditProfileImageCameraControlBarModule (copy), UseRotatableAvatarPreviewViewModelModule (copy), ReactModule (copy), FrameCloseupPreviewCameraModule (copy), FFlagEditProfileImageRigTypeOverride (copy), AvatarViewportModule (copy), UseRotatableOrbitViewportFunction (copy), ApplyCloseupPreviewPoseModule (copy), View (copy), AvatarViewportScene (copy), PreviewCutoutOverlayModule (copy), Loading (copy), IconSize (copy), ProfilePictureCameraControlBarModule (copy), ViewportInteractionOverlay (copy)
	local UseTokensResult = UseTokensFunction()
	local CutoutSize = p2.cutoutSize
	local Width = p2.width
	local Height = p2.height
	local CutoutTopOffset = p2.cutoutTopOffset
	local ClampDistanceScaleResult = CameraMath.clampDistanceScale(p2.distanceScale)
	local UseRotatableAvatarPreviewViewModelModuleResult = if FFlagEditProfileImageCameraControlBarModule then UseRotatableAvatarPreviewViewModelModule({
		isDisabled = p2.isCameraControlBarDisabled,
		distanceScale = ClampDistanceScaleResult,
		committedYRotDeg = p2.committedYRotDeg,
		onDistanceScaleChanged = p2.onDistanceScaleChanged,
		onYRotDegChanged = p2.onYRotDegChanged
	}) else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 83 ]]
		-- upvalues: Height (copy), CutoutTopOffset (copy), CutoutSize (copy)
		return {
			viewportHeight = Height,
			cutoutTopOffset = CutoutTopOffset,
			cutoutDiameter = CutoutSize
		}
	end, { Height, CutoutTopOffset, CutoutSize })
	local UseRefResult = ReactModule.useRef(0)
	local UseRotatableOrbitViewportResult = UseRotatableOrbitViewportFunction({
		gamepadActionName = "EditProfileRotatableAvatarPreviewOrbit",
		modelSource = ReactModule.useMemo(function() --[[ Line: 109 ]]
			-- upvalues: FFlagEditProfileImageRigTypeOverride (upval), p2 (copy), AvatarViewportModule (upval)
			return if FFlagEditProfileImageRigTypeOverride and p2.rigTypeOverride then AvatarViewportModule.ModelSources.fromUserIdWithRigType(p2.userId, p2.rigTypeOverride) else AvatarViewportModule.ModelSources.fromUserId(p2.userId)
		end, {
			p2.userId,
			if FFlagEditProfileImageRigTypeOverride then p2.rigTypeOverride or false else nil
		}),
		distanceScale = ClampDistanceScaleResult,
		fieldOfViewDeg = p2.fieldOfViewDeg,
		fieldOfViewForDistanceScaleDeg = p2.fieldOfViewForDistanceScaleDeg,
		committedYRotDeg = p2.committedYRotDeg,
		onYRotDegChanged = p2.onYRotDegChanged,
		onDistanceScaleChanged = p2.onDistanceScaleChanged,
		layout = UseMemoResult,
		frameCloseupPreviewCamera = ReactModule.useMemo(function() --[[ Line: 93 ]]
			-- upvalues: FrameCloseupPreviewCameraModule (upval), UseMemoResult (copy)
			return function(p3) --[[ Line: 94 ]]
				-- upvalues: FrameCloseupPreviewCameraModule (upval), UseMemoResult (upval)
				return FrameCloseupPreviewCameraModule({
					character = p3.character,
					yRotDeg = p3.yRotDeg,
					distanceScale = p3.distanceScale,
					layout = UseMemoResult,
					fieldOfViewDeg = p3.config.fieldOfViewDeg,
					fieldOfViewForDistanceScaleDeg = p3.config.fieldOfViewForDistanceScaleDeg
				})
			end
		end, { UseMemoResult })
	})
	ReactModule.useEffect(function() --[[ Line: 135 ]]
		-- upvalues: UseRotatableOrbitViewportResult (copy), UseRefResult (copy), p2 (copy), ApplyCloseupPreviewPoseModule (upval)
		if not UseRotatableOrbitViewportResult.modelLoader.isReady or not UseRotatableOrbitViewportResult.modelLoader.model then return end
		UseRefResult.current += 1
		local Current = UseRefResult.current
		local Model = UseRotatableOrbitViewportResult.modelLoader.model
		local EmoteAssetId = p2.emoteAssetId
		task.spawn(function() --[[ Line: 145 ]]
			-- upvalues: Model (copy), ApplyCloseupPreviewPoseModule (upval), EmoteAssetId (copy), UseRefResult (upval), Current (copy), UseRotatableOrbitViewportResult (upval)
			local Humanoid = Model:FindFirstChildOfClass("Humanoid")
			local Animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
			
			if Animator then
				for _, playingAnimationTrack in Animator:GetPlayingAnimationTracks() do
					playingAnimationTrack:Stop(0)
				end
			end
			ApplyCloseupPreviewPoseModule(Model, EmoteAssetId)
			
			if UseRefResult.current == Current then
				UseRotatableOrbitViewportResult.frameCamera({ tween = true })
				
				return
			end
		end)
		
		return function() --[[ Line: 156 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current += 1
		end
	end, {
		p2.emoteAssetId,
		UseRotatableOrbitViewportResult.modelLoader.isReady,
		UseRotatableOrbitViewportResult.modelLoader.model,
		UseRotatableOrbitViewportResult.frameCamera
	})
	local Surface300 = UseTokensResult.Color.Surface.Surface_300
	
	return ReactModule.createElement(View, {
		Size = if p2.fillContainer then UDim2.fromScale(1, 1) else UDim2.fromOffset(Width, Height),
		backgroundStyle = Surface300
	}, {
		Viewport = ReactModule.createElement(AvatarViewportScene, {
			size = UDim2.fromScale(1, 1),
			backgroundColor3 = Surface300.Color3,
			backgroundTransparency = Surface300.Transparency or 0,
			refs = UseRotatableOrbitViewportResult.refs
		}),
		CutoutOverlay = ReactModule.createElement(PreviewCutoutOverlayModule, {
			width = Width,
			height = Height,
			cutoutSize = CutoutSize,
			cutoutTopOffset = CutoutTopOffset,
			frameImage = p2.frameImage
		}),
		LoadingSpinner = if UseRotatableOrbitViewportResult.modelLoader.isLoading then ReactModule.createElement(View, {
			tag = "align-x-center align-y-center size-full",
			ZIndex = 5
		}, {
			Spinner = ReactModule.createElement(Loading, { size = IconSize.Large })
		}) else nil,
		CameraControlBar = if UseRotatableAvatarPreviewViewModelModuleResult and UseRotatableAvatarPreviewViewModelModuleResult.showCameraControlBar then ReactModule.createElement(ProfilePictureCameraControlBarModule, {
			zIndex = 6,
			topOffset = CutoutTopOffset,
			onZoomIn = UseRotatableAvatarPreviewViewModelModuleResult.onZoomIn,
			onZoomOut = UseRotatableAvatarPreviewViewModelModuleResult.onZoomOut,
			onRotateLeft = UseRotatableAvatarPreviewViewModelModuleResult.onRotateLeft,
			onRotateRight = UseRotatableAvatarPreviewViewModelModuleResult.onRotateRight
		}) else nil,
		InteractionOverlay = ReactModule.createElement(ViewportInteractionOverlay, {
			name = "InteractionOverlay",
			zIndex = 5,
			size = UDim2.fromOffset(CutoutSize, CutoutSize),
			position = UDim2.fromOffset(math.max(0, (math.floor((Width - CutoutSize) / 2 + 0.5))), CutoutTopOffset),
			inputHandlers = UseRotatableOrbitViewportResult.inputHandlers
		})
	})
end