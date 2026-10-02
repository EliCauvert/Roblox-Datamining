local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local videoUtilsModule = require(parent.VideoUtils)
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local useTokens = foundationModule.Hooks.useTokens
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local videoPlaybackDetectionMethod = videoUtilsModule.VideoPlaybackDetectionMethod
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), useTagAsViewportAutoplayCandidate (ref), sduiCoreSystemModule (ref), responsiveModule (ref), getPlaybackDetectionMethod (ref), getSduiComponentWrapper (ref), videoUtilsModule (ref), videoPlaybackDetectionMethod (ref)
	local cornerRadius = p1.cornerRadius or useTokens().Radius.Medium
	local var1 = reactModule.useRef(nil)
	local playbackCandidateRef = p1.playbackCandidateRef or var1
	
	if not fFlagLuaAppOneByTwoHoverIdleAutoplay then
		useTagAsViewportAutoplayCandidate(playbackCandidateRef, if p1.videoPlayer then p1.videoPlaybackContext else nil, p1.videoPlayer ~= nil, nil)
	end
	local current = `SduiVideoThumbnail_{sduiCoreSystemModule.useUidRefString().current}`
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		current = reactModule.useRef(current).current
	end
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		useTagAsViewportAutoplayCandidate(playbackCandidateRef, if p1.videoPlayer then p1.videoPlaybackContext else nil, p1.videoPlayer ~= nil, nil, nil, nil, nil, if p1.videoPlayer then {
			isUserIntentModeAutoplayCandidate = false,
			videoKey = current
		} else nil)
	end
	local var2
	local var3 = responsiveModule.usePreferredInput()
	local var4 = var3 == responsiveModule.Input.Pointer
	local var5 = getPlaybackDetectionMethod(var3, var4)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2)
	end, {})
	local var9 = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil
	local var10 = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	local var11 = if p1.videoPlayer then reactModule.createElement(getSduiComponentWrapper(p1.videoPlayer), {
		debugName = "SduiVideoThumbnail.VideoPlayer",
		componentConfig = p1.videoPlayer,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			defaultLoadingImageComponent = p1.imageComponent,
			isPlaybackEnabledByClient = var6,
			cornerRadius = cornerRadius,
			onVideoLoaded = reactModule.useCallback(function(p2, p3)
				-- upvalues: var9 (ref), p1 (ref)
				if var9 and p1.videoAnalytics then
					p1.videoAnalytics.reportVideoLoad(nil, var9.currentPlaybackSessionId, p2, p3)
				end
			end, { p1.videoAnalytics, var9 }),
			onVideoLooped = reactModule.useCallback(function()
				-- upvalues: var9 (ref), p1 (ref)
				if var9 and p1.videoAnalytics and p1.videoAnalytics.reportVideoLoop then
					p1.videoAnalytics.reportVideoLoop(nil, var9.currentPlaybackSessionId)
				end
			end, { p1.videoAnalytics, var9 })
		}
	}) else p1.imageComponent
	local createElement = reactModule.createElement
	local var12 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ref = if p1.playbackCandidateRef then nil else var1,
		Size = UDim2.fromScale(1, 1)
	}
	local t_1 = { MediaContent = var11 }
	
	if p1.videoPlayer then
		var2 = reactModule.createElement
		var2 = var2(videoUtilsModule.VideoPlaybackDetector, {
			videoKey = current,
			itemFrameRef = playbackCandidateRef,
			playbackDetectionMethod = var5,
			isHoverSupported = var4,
			isHovered = p1.isHovered,
			isSelected = p1.isSelected,
			hasVideoPlaybackUserIntent = if fFlagLuaAppOneByTwoHoverIdleAutoplay and var5 == videoPlaybackDetectionMethod.Hover then p1.isHovered else nil,
			autoplay = var3 == responsiveModule.Input.Touch,
			videoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
			onPlaybackChange = var8,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = p1.videoDwellTimeInSec,
			videoVisiblePercent = p1.videoVisiblePercent,
			isVideoEligible = p1.isVideoEligible,
			onVideoIneligible = p1.onVideoIneligible,
			onPlaybackCandidate = p1.onPlaybackCandidate,
			viewportVideoAutoplayController = var10
		})
	else
		var2 = nil
	end
	t_1.PlaybackDetector = var2
	
	return createElement(var12, t, t_1)
end