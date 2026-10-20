local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local VideoUtilsModule = require(CorePackages.Workspace.Packages.VideoUtils)
local VideoActions = VideoUtilsModule.AnalyticsEnums.VideoActions
local VideoLogger = VideoUtilsModule.VideoLogger
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local VideoPlayer = VideoUtilsModule.VideoPlayer
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FIntLuaAppEdpMediaGalleryItemVisiblePercent = require(CorePackages.Workspace.Packages.SharedFlags).FIntLuaAppEdpMediaGalleryItemVisiblePercent
local FFlagLuaAppGameTileSelectionVideoPlayback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local LuaAppEdpMediaGalleryVideoDwellTimeInHundredthsSec = game:DefineFastInt("LuaAppEdpMediaGalleryVideoDwellTimeInHundredthsSec", 0)

return function(p1)
	-- upvalues: VideoPlaybackCoordinator (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), ReactModule (copy), ArgCheckModule (copy), VideoLogger (copy), VideoActions (copy), VideoPlayer (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), VideoPlaybackDetector (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), VideoPlaybackDetectionMethod (copy), LuaAppEdpMediaGalleryVideoDwellTimeInHundredthsSec (copy), FIntLuaAppEdpMediaGalleryItemVisiblePercent (copy)
	local VideoPlaybackCoordinator1 = p1.videoPlaybackCoordinator or VideoPlaybackCoordinator.default
	local GalleryName: string = if FFlagLuaAppEdpMediaGalleryFullScreen then `media_gallery_item_{p1.itemIndex or "0"}_video_{p1.video or "0"}{if p1.isFullscreen then "_fullscreen" else ""}` else `media_gallery_item_{p1.itemIndex or "0"}_video_{p1.video or "0"}`
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = if FFlagLuaAppEdpMediaGalleryFullScreen then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), VideoPlaybackCoordinator1 (copy)
		return {
			videoAnalyticsData = { source = "MediaGallery", sourceId = p1.universeId or nil },
			getPlaybackSessionId = function()
				-- upvalues: VideoPlaybackCoordinator1 (upval)
				return VideoPlaybackCoordinator1.currentPlaybackSessionId
			end
		}
	end, { p1.universeId, VideoPlaybackCoordinator1 }) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		ref = UseRefResult
	}, {
		VideoPlayer = ReactModule.createElement(VideoPlayer, {
			muted = true,
			looped = false,
			video = p1.video,
			thumbnail = p1.thumbnail,
			shouldStartPlayback = UseStateResult,
			Size = UDim2.fromScale(1, 1),
			cornerRadius = p1.cornerRadius,
			showMuteButton = not FFlagLuaAppEdpConsoleMediaGalleryVideo or not p1.hideMuteButton,
			onMuteButtonActivated = ReactModule.useCallback(function(p2)
				-- upvalues: ArgCheckModule (upval), p1 (copy), VideoLogger (upval), VideoActions (upval), VideoPlaybackCoordinator1 (copy)
				ArgCheckModule.assert(p1.universeId)
				VideoLogger.reportVideoAction(VideoActions.volume, "GameDetails", {
					source = "MediaGallery",
					videoAssetId = p1.video,
					sourceId = p1.universeId or "",
					playbackSessionId = VideoPlaybackCoordinator1.currentPlaybackSessionId,
					volumeLevel = if p2 then 0 else 1
				})
			end, {
				p1.video,
				p1.universeId,
				VideoPlaybackCoordinator1.currentPlaybackSessionId
			}),
			showPlayButton = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isFullscreen else nil,
			showProgressBar = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isFullscreen else nil,
			videoAnalyticsContext = if FFlagLuaAppEdpMediaGalleryFullScreen then UseMemoResult else nil,
			onVideoLoaded = ReactModule.useCallback(function(p2, p3)
				-- upvalues: p1 (copy), VideoPlaybackCoordinator1 (copy)
				if p1.videoAnalytics then
					p1.videoAnalytics.reportVideoLoad(p1.itemIndex, VideoPlaybackCoordinator1.currentPlaybackSessionId, p2, p3)
				end
			end, {
				p1.itemIndex,
				p1.videoAnalytics,
				VideoPlaybackCoordinator1.currentPlaybackSessionId
			}),
			onVideoProgressChanged = if FFlagLuaAppEdpMediaGalleryAutoAdvance then p1.onVideoProgressChanged else nil,
			onVideoEnded = if FFlagLuaAppEdpMediaGalleryAutoAdvance then p1.onVideoEnded else nil,
			toggleVideoPlaybackSignal = p1.toggleVideoPlaybackSignal,
			toggleMuteSignal = p1.toggleMuteSignal,
			onMutedChanged = p1.onMutedChanged
		}),
		VideoPlaybackDetector = ReactModule.createElement(VideoPlaybackDetector, {
			isVideoEligible = true,
			videoKey = GalleryName,
			itemIndex = p1.itemIndex,
			itemFrameRef = UseRefResult,
			isItemOccluded = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isMediaGalleryOccluded else nil,
			playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback then VideoPlaybackDetectionMethod.Viewport else nil,
			autoplay = not FFlagLuaAppGameTileSelectionVideoPlayback or nil,
			videoPlaybackCoordinator = VideoPlaybackCoordinator1,
			onPlaybackChange = UseStateResult2,
			videoDwellTimeInSec = LuaAppEdpMediaGalleryVideoDwellTimeInHundredthsSec / 100,
			videoVisiblePercent = FIntLuaAppEdpMediaGalleryItemVisiblePercent,
			videoAnalytics = p1.videoAnalytics
		})
	})
end