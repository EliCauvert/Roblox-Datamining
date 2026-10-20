local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local VideoUtilsModule = require(Parent.VideoUtils)
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local GetPlaybackDetectionMethodFunction = VideoUtilsModule.getPlaybackDetectionMethod
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local UseTagAsViewportAutoplayCandidateFunction = VideoUtilsModule.useTagAsViewportAutoplayCandidate

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), UseTagAsViewportAutoplayCandidateFunction (copy), SduiCoreSystemModule (copy), ResponsiveModule (copy), GetPlaybackDetectionMethodFunction (copy), GetSduiComponentWrapperFunction (copy), VideoUtilsModule (copy), VideoPlaybackDetectionMethod (copy)
	local UseTokensResult = UseTokensFunction()
	local CornerRadius = p1.cornerRadius or UseTokensResult.Radius.Medium
	local UseRefResult = ReactModule.useRef(nil)
	local PlaybackCandidateRef = p1.playbackCandidateRef or UseRefResult
	
	if not FFlagLuaAppOneByTwoHoverIdleAutoplay then
		UseTagAsViewportAutoplayCandidateFunction(PlaybackCandidateRef, if p1.videoPlayer then p1.videoPlaybackContext else nil, p1.videoPlayer ~= nil, nil)
	end
	local SduiVideoThumbnailName = `SduiVideoThumbnail_{SduiCoreSystemModule.useUidRefString().current}`
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		SduiVideoThumbnailName = ReactModule.useRef(SduiVideoThumbnailName).current
	end
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		UseTagAsViewportAutoplayCandidateFunction(PlaybackCandidateRef, if p1.videoPlayer then p1.videoPlaybackContext else nil, p1.videoPlayer ~= nil, nil, nil, nil, nil, if p1.videoPlayer then {
			isUserIntentModeAutoplayCandidate = false,
			videoKey = SduiVideoThumbnailName
		} else nil)
	end
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Pointer
	local PlaybackDetectionMethod = GetPlaybackDetectionMethodFunction(UsePreferredInputResult, IsUsePreferredInputResultMatch)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local VideoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: VideoPlaybackCoordinator (copy), p1 (copy)
		if VideoPlaybackCoordinator and p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoad(nil, VideoPlaybackCoordinator.currentPlaybackSessionId, p2, p3)
		end
	end, { p1.videoAnalytics, VideoPlaybackCoordinator })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: VideoPlaybackCoordinator (copy), p1 (copy)
		if VideoPlaybackCoordinator and p1.videoAnalytics and p1.videoAnalytics.reportVideoLoop then
			p1.videoAnalytics.reportVideoLoop(nil, VideoPlaybackCoordinator.currentPlaybackSessionId)
		end
	end, { p1.videoAnalytics, VideoPlaybackCoordinator })
	local ViewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ref = if p1.playbackCandidateRef then nil else UseRefResult,
		Size = UDim2.fromScale(1, 1)
	}, {
		MediaContent = if p1.videoPlayer then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.videoPlayer), {
			debugName = "SduiVideoThumbnail.VideoPlayer",
			componentConfig = p1.videoPlayer,
			sduiContext = p1.sduiContext,
			extraLocalProps = {
				defaultLoadingImageComponent = p1.imageComponent,
				isPlaybackEnabledByClient = UseStateResult,
				cornerRadius = CornerRadius,
				onVideoLoaded = UseResult1,
				onVideoLooped = UseResult2
			}
		}) else p1.imageComponent,
		PlaybackDetector = if p1.videoPlayer then ReactModule.createElement(VideoUtilsModule.VideoPlaybackDetector, {
			videoKey = SduiVideoThumbnailName,
			itemFrameRef = PlaybackCandidateRef,
			playbackDetectionMethod = PlaybackDetectionMethod,
			isHoverSupported = IsUsePreferredInputResultMatch,
			isHovered = p1.isHovered,
			isSelected = p1.isSelected,
			hasVideoPlaybackUserIntent = if FFlagLuaAppOneByTwoHoverIdleAutoplay and PlaybackDetectionMethod == VideoPlaybackDetectionMethod.Hover then p1.isHovered else nil,
			autoplay = UsePreferredInputResult == ResponsiveModule.Input.Touch,
			videoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
			onPlaybackChange = UseResult,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = p1.videoDwellTimeInSec,
			videoVisiblePercent = p1.videoVisiblePercent,
			isVideoEligible = p1.isVideoEligible,
			onVideoIneligible = p1.onVideoIneligible,
			onPlaybackCandidate = p1.onPlaybackCandidate,
			viewportVideoAutoplayController = ViewportVideoAutoplayController
		}) else nil
	})
end