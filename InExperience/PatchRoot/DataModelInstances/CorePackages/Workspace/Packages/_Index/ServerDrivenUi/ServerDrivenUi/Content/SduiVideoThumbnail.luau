local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local videoUtilsModule = require(parent.VideoUtils)
local useTokens = foundationModule.Hooks.useTokens
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate

return function(p0) --[[ line: 35 | named "SduiVideoThumbnail" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useTagAsViewportAutoplayCandidate (ref), sduiCoreSystemModule (ref), responsiveModule (ref), getPlaybackDetectionMethod (ref), cryoModule (ref), videoUtilsModule (ref)
	local cornerRadius = p0.cornerRadius or useTokens().Radius.Medium
	local var7 = reactModule.useRef(nil)
	local playbackCandidateRef = p0.playbackCandidateRef or var7
	useTagAsViewportAutoplayCandidate(playbackCandidateRef, if p0.videoPlayer then p0.videoPlaybackContext else nil, p0.videoPlayer ~= nil, nil)
	local current = `SduiVideoThumbnail_{sduiCoreSystemModule.useUidRefString().current}`
	local var10 = responsiveModule.usePreferredInput()
	local var11 = var10 == responsiveModule.Input.Pointer
	local var12 = getPlaybackDetectionMethod(var10, var11)
	local var13, var14 = reactModule.useState(false)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ref = if p0.playbackCandidateRef then nil else var7,
		Size = UDim2.fromScale(1, 1)
	}, {
		MediaContent = if p0.videoPlayer then reactModule.cloneElement(p0.videoPlayer, {
			extraLocalProps = cryoModule.Dictionary.join(p0.videoPlayer.props.extraLocalProps or {}, {
				defaultLoadingImageComponent = p0.imageComponent,
				isPlaybackEnabledByClient = var13,
				cornerRadius = cornerRadius
			})
		}) else p0.imageComponent,
		PlaybackDetector = if p0.videoPlayer then reactModule.createElement(videoUtilsModule.VideoPlaybackDetector, {
			videoKey = current,
			itemFrameRef = playbackCandidateRef,
			playbackDetectionMethod = var12,
			isHoverSupported = var11,
			isHovered = p0.isHovered,
			isSelected = p0.isSelected,
			autoplay = var10 == responsiveModule.Input.Touch,
			videoPlaybackCoordinator = if p0.videoPlaybackContext then p0.videoPlaybackContext.videoPlaybackCoordinator else nil,
			onPlaybackChange = reactModule.useCallback(function(p1) --[[ line: 59 ]]
				-- upvalues: var14 (ref)
				var14(p1)
			end, {}),
			videoDwellTimeInSec = p0.videoDwellTimeInSec,
			videoVisiblePercent = p0.videoVisiblePercent,
			isVideoEligible = p0.isVideoEligible,
			onPlaybackCandidate = p0.onPlaybackCandidate,
			viewportVideoAutoplayController = if p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil
		}) else nil
	})
end