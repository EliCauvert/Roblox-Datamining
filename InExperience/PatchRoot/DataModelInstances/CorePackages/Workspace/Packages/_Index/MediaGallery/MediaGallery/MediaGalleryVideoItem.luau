local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local useTokens = require(parent.Foundation).Hooks.useTokens
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoPlayer = videoUtilsModule.VideoPlayer
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local getImageUriModule = require(mediaGallery.getImageUri)
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)

return reactModule.memo(function(p0) --[[ line: 61 | named "MediaGalleryVideoItem" ]]
	-- upvalues: useTokens (ref), getImageUriModule (ref), videoPlaybackCoordinator (ref), mediaGalleryConstantsModule (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), videoPlayer (ref), videoPlaybackDetector (ref)
	local var5 = useTokens()
	local videoId = `rbxassetid://{p0.videoId}`
	local var7 = getImageUriModule(p0.thumbnail or "")
	local videoPlaybackCoordinator_1 = p0.videoPlaybackCoordinator or videoPlaybackCoordinator.default
	local videoAnalytics = p0.videoAnalytics
	local var9 = if p0.currentIndex ~= nil then p0.itemIndex == p0.currentIndex else true
	local setIsVideoActive = p0.setIsVideoActive
	local cornerRadius = p0.cornerRadius or var5.Radius.Medium
	local isFullscreen = p0.isFullscreen
	local var11 = (p0.videoDwellTimeHundredthsSec or mediaGalleryConstantsModule.VIDEO_DWELL_TIME_HUNDREDTHS_SEC) / 100
	local videoVisiblePercent = p0.videoVisiblePercent or mediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT
	local _ = "media_gallery_item_%*_video_%*%*"
	local _ = p0.itemIndex or "0"
	local _ = p0.videoId or "0"
	local _ = if isFullscreen then "_fullscreen" else ""
	local var13 = if var9 then p0.toggleVideoPlaybackSignal else nil
	local var14 = if var9 then p0.toggleMuteSignal else nil
	local var15 = if var9 then p0.onVideoEnded else nil
	local var16 = if var9 then p0.onVideoProgressChanged else nil
	local var17 = if var9 then p0.onMutedChanged else nil
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var9 (ref), setIsVideoActive (ref)
		if var9 and setIsVideoActive then
			setIsVideoActive(true)
			
			return function() --[[ line: 93 ]]
				-- upvalues: setIsVideoActive (copy)
				setIsVideoActive(false)
			end
		end
		return nil
	end, { var9, setIsVideoActive })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p0.Size,
		ZIndex = p0.ZIndex,
		ref = var20
	}, {
		VideoPlayer = reactModule.createElement(videoPlayer, {
			showMuteButton = true,
			video = videoId,
			thumbnail = var7,
			shouldStartPlayback = var18,
			muted = p0.muted ~= nil or p0.muted,
			looped = if p0.looped ~= nil then false else p0.looped,
			Size = UDim2.fromScale(1, 1),
			cornerRadius = cornerRadius,
			onMuteButtonActivated = reactModule.useCallback(function(p1) --[[ line: 123 ]]
				-- upvalues: videoAnalytics (ref), p0 (ref), videoPlaybackCoordinator_1 (ref)
				if videoAnalytics and videoAnalytics.reportVideoMute then
					videoAnalytics.reportVideoMute(p0.itemIndex, videoPlaybackCoordinator_1.currentPlaybackSessionId, p1)
				end
			end, {
				p0.itemIndex,
				videoAnalytics,
				videoPlaybackCoordinator_1.currentPlaybackSessionId
			}),
			showPlayButton = if p0.showPlayButton ~= nil then isFullscreen else p0.showPlayButton,
			showProgressBar = if p0.showProgressBar ~= nil then isFullscreen else p0.showProgressBar,
			videoAnalyticsContext = p0.videoAnalyticsContext,
			onVideoLoaded = reactModule.useCallback(function(p2, p3) --[[ line: 101 ]]
				-- upvalues: videoAnalytics (ref), p0 (ref), videoPlaybackCoordinator_1 (ref), fFlagSduiExperienceDetailsSupport (copy)
				if videoAnalytics then
					videoAnalytics.reportVideoLoad(p0.itemIndex, videoPlaybackCoordinator_1.currentPlaybackSessionId, p2, p3)
				end
				if fFlagSduiExperienceDetailsSupport and p0.onMediaResolved then
					p0.onMediaResolved(true)
				end
			end, {
				p0.itemIndex,
				if fFlagSduiExperienceDetailsSupport then p0.onMediaResolved else nil,
				videoAnalytics,
				videoPlaybackCoordinator_1.currentPlaybackSessionId
			}),
			onVideoProgressChanged = var16,
			onVideoEnded = var15,
			toggleVideoPlaybackSignal = var13,
			toggleMuteSignal = var14,
			onMutedChanged = var17
		}),
		VideoPlaybackDetector = reactModule.createElement(videoPlaybackDetector, {
			isVideoEligible = true,
			videoKey = u181,
			itemIndex = p0.itemIndex,
			itemFrameRef = var20,
			isItemOccluded = p0.isMediaGalleryOccluded,
			autoplay = p0.autoplay ~= nil or p0.autoplay,
			videoPlaybackCoordinator = videoPlaybackCoordinator_1,
			onPlaybackChange = var19,
			videoDwellTimeInSec = var11,
			videoVisiblePercent = videoVisiblePercent,
			videoAnalytics = videoAnalytics
		}),
		ItemOverlay = if p0.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p0.overlay }) else nil
	})
end)