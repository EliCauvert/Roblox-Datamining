local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local VideoPlayer = VideoUtilsModule.VideoPlayer
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagMediaGalleryVideoVisiblePercent = require(Parent.SharedFlags).FFlagMediaGalleryVideoVisiblePercent
local FFlagLuaAppEdpMomentVideo = require(Parent.SharedFlags).FFlagLuaAppEdpMomentVideo
local GetImageUriModule = require(MediaGallery.getImageUri)
local MediaGalleryConstantsModule = require(MediaGallery.MediaGalleryConstants)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), GetImageUriModule (copy), VideoPlaybackCoordinator (copy), MediaGalleryConstantsModule (copy), FFlagMediaGalleryVideoVisiblePercent (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), ReactModule (copy), VideoPlayer (copy), FFlagLuaAppEdpMomentVideo (copy), VideoPlaybackDetector (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), VideoPlaybackDetectionMethod (copy)
	local UseTokensResult = UseTokensFunction()
	local AssetId: string = `rbxassetid://{p1.videoId}`
	local ImageUriModule = GetImageUriModule(p1.thumbnail or "")
	local VideoPlaybackCoordinator1 = p1.videoPlaybackCoordinator or VideoPlaybackCoordinator.default
	local VideoAnalytics = p1.videoAnalytics
	local NoCurrentIndex: boolean = p1.currentIndex == nil or p1.itemIndex == p1.currentIndex
	local SetIsVideoActiveFunction = p1.setIsVideoActive
	local CornerRadius = p1.cornerRadius or UseTokensResult.Radius.Medium
	local IsFullscreen = p1.isFullscreen
	local VideoDwellTimeInSec = (p1.videoDwellTimeHundredthsSec or MediaGalleryConstantsModule.VIDEO_DWELL_TIME_HUNDREDTHS_SEC) / 100
	local VideoVisiblePercent = p1.videoVisiblePercent or (if FFlagMediaGalleryVideoVisiblePercent then MediaGalleryConstantsModule.VIDEO_PLAYBACK_VISIBLE_PERCENT else MediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT)
	local GalleryName: string = `media_gallery_item_{p1.itemIndex or "0"}_video_{p1.videoId or "0"}{if IsFullscreen then "_fullscreen" else ""}`
	local ToggleVideoPlaybackSignal = if NoCurrentIndex then p1.toggleVideoPlaybackSignal else nil
	local ToggleMuteSignal = if NoCurrentIndex then p1.toggleMuteSignal else nil
	local OnVideoEnded = if NoCurrentIndex then p1.onVideoEnded else nil
	local OnVideoProgressChanged = if NoCurrentIndex then p1.onVideoProgressChanged else nil
	local OnMutedChanged = if NoCurrentIndex then p1.onMutedChanged else nil
	local OnPlayingChanged = if FFlagLuaAppMediaGalleryGamepadSupport and NoCurrentIndex then p1.onPlayingChanged else nil
	local OnVideoReadyChanged = if FFlagLuaAppMediaGalleryGamepadSupport and NoCurrentIndex then p1.onVideoReadyChanged else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: NoCurrentIndex (copy), SetIsVideoActiveFunction (copy)
		if NoCurrentIndex and SetIsVideoActiveFunction then
			SetIsVideoActiveFunction(true)
			
			return function()
				-- upvalues: SetIsVideoActiveFunction (upval)
				SetIsVideoActiveFunction(false)
			end
		else
			return nil
		end
	end, { NoCurrentIndex, SetIsVideoActiveFunction })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		ref = UseRefResult
	}, {
		VideoPlayer = ReactModule.createElement(VideoPlayer, {
			showMuteButton = true,
			video = AssetId,
			accessContext = if FFlagLuaAppEdpMomentVideo then p1.videoAccessContext else nil,
			thumbnail = ImageUriModule,
			shouldStartPlayback = UseStateResult,
			muted = p1.muted == nil or p1.muted,
			looped = p1.looped ~= nil and p1.looped,
			Size = UDim2.fromScale(1, 1),
			cornerRadius = CornerRadius,
			onMuteButtonActivated = ReactModule.useCallback(function(p2)
				-- upvalues: VideoAnalytics (copy), p1 (copy), VideoPlaybackCoordinator1 (copy)
				if VideoAnalytics and VideoAnalytics.reportVideoMute then
					VideoAnalytics.reportVideoMute(p1.itemIndex, VideoPlaybackCoordinator1.currentPlaybackSessionId, p2)
				end
			end, {
				p1.itemIndex,
				VideoAnalytics,
				VideoPlaybackCoordinator1.currentPlaybackSessionId
			}),
			showPlayButton = if p1.showPlayButton == nil then IsFullscreen else p1.showPlayButton,
			showProgressBar = if p1.showProgressBar == nil then IsFullscreen else p1.showProgressBar,
			videoAnalyticsContext = p1.videoAnalyticsContext,
			onVideoLoaded = ReactModule.useCallback(function(p2, p3)
				-- upvalues: VideoAnalytics (copy), p1 (copy), VideoPlaybackCoordinator1 (copy)
				if VideoAnalytics then
					VideoAnalytics.reportVideoLoad(p1.itemIndex, VideoPlaybackCoordinator1.currentPlaybackSessionId, p2, p3)
				end
				if p1.onMediaResolved then
					p1.onMediaResolved(true)
				end
			end, {
				p1.itemIndex,
				p1.onMediaResolved,
				VideoAnalytics,
				VideoPlaybackCoordinator1.currentPlaybackSessionId
			}),
			onVideoProgressChanged = OnVideoProgressChanged,
			onVideoEnded = OnVideoEnded,
			toggleVideoPlaybackSignal = ToggleVideoPlaybackSignal,
			toggleMuteSignal = ToggleMuteSignal,
			onMutedChanged = OnMutedChanged,
			onPlayingChanged = OnPlayingChanged,
			onVideoLoadedChanged = OnVideoReadyChanged
		}),
		VideoPlaybackDetector = ReactModule.createElement(VideoPlaybackDetector, {
			isVideoEligible = true,
			videoKey = GalleryName,
			itemIndex = p1.itemIndex,
			itemFrameRef = UseRefResult,
			isItemOccluded = p1.isMediaGalleryOccluded,
			playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback and (p1.autoplay == nil or p1.autoplay) then VideoPlaybackDetectionMethod.Viewport else nil,
			autoplay = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else p1.autoplay == nil or p1.autoplay,
			videoPlaybackCoordinator = VideoPlaybackCoordinator1,
			onPlaybackChange = UseStateResult2,
			videoDwellTimeInSec = VideoDwellTimeInSec,
			videoVisiblePercent = VideoVisiblePercent,
			videoAnalytics = VideoAnalytics
		}),
		ItemOverlay = if p1.overlay then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p1.overlay }) else nil,
		Attribution = if FFlagLuaAppEdpMomentVideo and p1.attributionComponent then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 6,
			Size = UDim2.fromScale(1, 1)
		}, { AttributionContent = p1.attributionComponent }) else nil
	})
end)