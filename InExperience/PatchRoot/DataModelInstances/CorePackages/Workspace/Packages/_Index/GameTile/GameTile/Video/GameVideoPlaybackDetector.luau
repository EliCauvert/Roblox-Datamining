local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseIsVideoEligibleModule = require(GameTile.Video.useIsVideoEligible)
local UsePreferredInputFunction = require(Parent.Responsive).usePreferredInput
local VideoUtilsModule = require(Parent.VideoUtils)
local GetPlaybackDetectionMethodFunction = VideoUtilsModule.getPlaybackDetectionMethod
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local TileVideoBlockingConfigModule = require(GameTile.Video.TileVideoBlockingConfig)
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), FetchGamePlayabilityAndProductInfo (copy), UseIsVideoEligibleModule (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), ReactModule (copy), UseCanDevicePlayVideoPreviewFunction (copy), TileVideoBlockingConfigModule (copy), RetrievalStatus (copy), VideoEndReason (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), UsePreferredInputFunction (copy), GetPlaybackDetectionMethodFunction (copy), VideoPlaybackDetector (copy), VideoPlaybackDetectionMethod (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2, p1.universeId)
	end)
	local UseIsVideoEligibleModuleResult = UseIsVideoEligibleModule(p1.universeId, if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseCanDevicePlayVideoPreviewResult = UseCanDevicePlayVideoPreviewFunction(TileVideoBlockingConfigModule, p1.universeId, p1.pageContext)
	local PlaybackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback or FFlagLuaAppOneByTwoHoverIdleAutoplay then GetPlaybackDetectionMethodFunction(UsePreferredInputFunction(), p1.isHoverSupported) else nil
	
	return ReactModule.createElement(VideoPlaybackDetector, {
		videoKey = p1.videoKey,
		itemIndex = p1.itemIndex,
		itemFrameRef = p1.tileRef,
		playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback or FFlagLuaAppOneByTwoHoverIdleAutoplay then PlaybackDetectionMethod else nil,
		isHoverSupported = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else p1.isHoverSupported,
		isHovered = p1.isHovered,
		isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p1.isSelected else nil,
		hasVideoPlaybackUserIntent = if FFlagLuaAppOneByTwoHoverIdleAutoplay and PlaybackDetectionMethod == VideoPlaybackDetectionMethod.Hover then p1.isHovered else nil,
		autoplay = if FFlagLuaAppGameTileSelectionVideoPlayback then nil elseif FFlagLuaAppEdpMediaGalleryVideoPreview then p1.autoplay else nil,
		videoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
		onPlaybackChange = p1.onPlaybackChange,
		videoAnalytics = p1.videoAnalytics,
		videoDwellTimeInSec = p1.videoDwellTimeInSec,
		videoVisiblePercent = p1.videoVisiblePercent,
		isVideoEligible = UseIsVideoEligibleModuleResult and UseStateResult,
		onVideoIneligible = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseSelectorResult (copy), RetrievalStatus (upval), VideoEndReason (upval)
			if p1.videoAnalytics and UseSelectorResult == RetrievalStatus.Done then
				p1.videoAnalytics.reportVideoEnd(p1.itemIndex, VideoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p1.videoAnalytics, UseSelectorResult }),
		onPlaybackCandidate = ReactModule.useCallback(function()
			-- upvalues: UseSelectorResult (copy), RetrievalStatus (upval), FFlagLuaAppUsePrevalidatedVideoGamePlayability (upval), p1 (copy), UseDispatchResult (copy), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult (copy), UseStateResult2 (copy), UseCanDevicePlayVideoPreviewResult (copy)
			if (UseSelectorResult == RetrievalStatus.NotStarted or UseSelectorResult == RetrievalStatus.Failed) and (not FFlagLuaAppUsePrevalidatedVideoGamePlayability or not p1.hasPrevalidatedVideoGamePlayability) then
				UseDispatchResult(FetchGamePlayabilityAndProductInfo.Fetch(UseRoactServiceResult, p1.universeId))
			end
			UseStateResult2(UseCanDevicePlayVideoPreviewResult())
		end, {
			p1.universeId, UseSelectorResult, UseDispatchResult, UseRoactServiceResult,
			UseCanDevicePlayVideoPreviewResult,
			if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end