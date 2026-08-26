local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local useTokens = require(parent.Foundation).Hooks.useTokens
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackDetectionMethod = videoUtilsModule.VideoPlaybackDetectionMethod
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoPlayer = videoUtilsModule.VideoPlayer
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagMediaGalleryVideoVisiblePercent = require(parent.SharedFlags).FFlagMediaGalleryVideoVisiblePercent
local getImageUriModule = require(mediaGallery.getImageUri)
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getImageUriModule (ref), videoPlaybackCoordinator (ref), mediaGalleryConstantsModule (ref), fFlagMediaGalleryVideoVisiblePercent (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), videoPlayer (ref), videoPlaybackDetector (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), videoPlaybackDetectionMethod (ref)
	local var1 = useTokens()
	local videoId = `rbxassetid://{p1.videoId}`
	local var2 = getImageUriModule(p1.thumbnail or "")
	local videoPlaybackCoordinator_1 = p1.videoPlaybackCoordinator or videoPlaybackCoordinator.default
	local videoAnalytics = p1.videoAnalytics
	local var3 = if p1.currentIndex ~= nil then p1.itemIndex == p1.currentIndex else true
	local setIsVideoActive = p1.setIsVideoActive
	local cornerRadius = p1.cornerRadius or var1.Radius.Medium
	local isFullscreen = p1.isFullscreen
	local var4 = (p1.videoDwellTimeHundredthsSec or mediaGalleryConstantsModule.VIDEO_DWELL_TIME_HUNDREDTHS_SEC) / 100
	local videoVisiblePercent = p1.videoVisiblePercent or (if fFlagMediaGalleryVideoVisiblePercent then mediaGalleryConstantsModule.VIDEO_PLAYBACK_VISIBLE_PERCENT else mediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT)
	local var5 = `media_gallery_item_{p1.itemIndex or "0"}_video_{p1.videoId or "0"}{if isFullscreen then "_fullscreen" else ""}`
	local var6 = if var3 then p1.toggleVideoPlaybackSignal else nil
	local var7 = if var3 then p1.toggleMuteSignal else nil
	local var8 = if var3 then p1.onVideoEnded else nil
	local var9 = if var3 then p1.onVideoProgressChanged else nil
	local var10 = if var3 then p1.onMutedChanged else nil
	local var11, var12 = reactModule.useState(false)
	local var13 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), setIsVideoActive (ref)
		if var3 and setIsVideoActive then
			setIsVideoActive(true)
			
			return function()
				-- upvalues: setIsVideoActive (copy)
				setIsVideoActive(false)
			end
		end
		return nil
	end, { var3, setIsVideoActive })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		ref = var13
	}, {
		VideoPlayer = reactModule.createElement(videoPlayer, {
			showMuteButton = true,
			video = videoId,
			thumbnail = var2,
			shouldStartPlayback = var11,
			muted = p1.muted ~= nil or p1.muted,
			looped = if p1.looped ~= nil then false else p1.looped,
			Size = UDim2.fromScale(1, 1),
			cornerRadius = cornerRadius,
			onMuteButtonActivated = reactModule.useCallback(function(p2)
				-- upvalues: videoAnalytics (ref), p1 (ref), videoPlaybackCoordinator_1 (ref)
				if videoAnalytics and videoAnalytics.reportVideoMute then
					videoAnalytics.reportVideoMute(p1.itemIndex, videoPlaybackCoordinator_1.currentPlaybackSessionId, p2)
				end
			end, {
				p1.itemIndex,
				videoAnalytics,
				videoPlaybackCoordinator_1.currentPlaybackSessionId
			}),
			showPlayButton = if p1.showPlayButton ~= nil then isFullscreen else p1.showPlayButton,
			showProgressBar = if p1.showProgressBar ~= nil then isFullscreen else p1.showProgressBar,
			videoAnalyticsContext = p1.videoAnalyticsContext,
			onVideoLoaded = reactModule.useCallback(function(p2, p3)
				-- upvalues: videoAnalytics (ref), p1 (ref), videoPlaybackCoordinator_1 (ref), fFlagSduiExperienceDetailsSupport (copy)
				if videoAnalytics then
					videoAnalytics.reportVideoLoad(p1.itemIndex, videoPlaybackCoordinator_1.currentPlaybackSessionId, p2, p3)
				end
				if fFlagSduiExperienceDetailsSupport and p1.onMediaResolved then
					p1.onMediaResolved(true)
				end
			end, {
				p1.itemIndex,
				if fFlagSduiExperienceDetailsSupport then p1.onMediaResolved else nil,
				videoAnalytics,
				videoPlaybackCoordinator_1.currentPlaybackSessionId
			}),
			onVideoProgressChanged = var9,
			onVideoEnded = var8,
			toggleVideoPlaybackSignal = var6,
			toggleMuteSignal = var7,
			onMutedChanged = var10
		}),
		VideoPlaybackDetector = reactModule.createElement(videoPlaybackDetector, {
			isVideoEligible = true,
			videoKey = var5,
			itemIndex = p1.itemIndex,
			itemFrameRef = var13,
			isItemOccluded = p1.isMediaGalleryOccluded,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback and (p1.autoplay ~= nil or p1.autoplay) then videoPlaybackDetectionMethod.Viewport else nil,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else p1.autoplay ~= nil or p1.autoplay,
			videoPlaybackCoordinator = videoPlaybackCoordinator_1,
			onPlaybackChange = var12,
			videoDwellTimeInSec = var4,
			videoVisiblePercent = videoVisiblePercent,
			videoAnalytics = videoAnalytics
		}),
		ItemOverlay = if p1.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p1.overlay }) else nil
	})
end)