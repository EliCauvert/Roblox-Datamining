local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local videoUtilsModule = require(parent.VideoUtils)
local useTokens = foundationModule.Hooks.useTokens
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useTagAsViewportAutoplayCandidate (ref), sduiCoreSystemModule (ref), responsiveModule (ref), getPlaybackDetectionMethod (ref), getSduiComponentWrapper (ref), videoUtilsModule (ref)
	local cornerRadius = p1.cornerRadius or useTokens().Radius.Medium
	local var1 = reactModule.useRef(nil)
	local playbackCandidateRef = p1.playbackCandidateRef or var1
	useTagAsViewportAutoplayCandidate(playbackCandidateRef, if p1.videoPlayer then p1.videoPlaybackContext else nil, p1.videoPlayer ~= nil, nil)
	local current = `SduiVideoThumbnail_{sduiCoreSystemModule.useUidRefString().current}`
	local var2 = responsiveModule.usePreferredInput()
	local var3 = var2 == responsiveModule.Input.Pointer
	local var4 = getPlaybackDetectionMethod(var2, var3)
	local var5, var6 = reactModule.useState(false)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ref = if p1.playbackCandidateRef then nil else var1,
		Size = UDim2.fromScale(1, 1)
	}, {
		MediaContent = if p1.videoPlayer then reactModule.createElement(getSduiComponentWrapper(p1.videoPlayer), {
			debugName = "SduiVideoThumbnail.VideoPlayer",
			componentConfig = p1.videoPlayer,
			sduiContext = p1.sduiContext,
			extraLocalProps = {
				defaultLoadingImageComponent = p1.imageComponent,
				isPlaybackEnabledByClient = var5,
				cornerRadius = cornerRadius
			}
		}) else p1.imageComponent,
		PlaybackDetector = if p1.videoPlayer then reactModule.createElement(videoUtilsModule.VideoPlaybackDetector, {
			videoKey = current,
			itemFrameRef = playbackCandidateRef,
			playbackDetectionMethod = var4,
			isHoverSupported = var3,
			isHovered = p1.isHovered,
			isSelected = p1.isSelected,
			autoplay = var2 == responsiveModule.Input.Touch,
			videoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
			onPlaybackChange = reactModule.useCallback(function(p1)
				-- upvalues: var6 (ref)
				var6(p1)
			end, {}),
			videoDwellTimeInSec = p1.videoDwellTimeInSec,
			videoVisiblePercent = p1.videoVisiblePercent,
			isVideoEligible = p1.isVideoEligible,
			onPlaybackCandidate = p1.onPlaybackCandidate,
			viewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
		}) else nil
	})
end