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
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(Parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local LuaAppGameTileVideoManufacturerDeny = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false)
local LuaAppGameTileVideoDeviceDeny = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false)
local LuaAppGameTileVideoMaxMemoryDeny = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false)
local LuaAppGameTileVideoAvailableRamDeny = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false)
local LuaAppGameTileVideoMaxMemoryThresholdMb = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1)
local LuaAppGameTileVideoAvailableRamThresholdMb = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1)
local LuaAppGameTileVideoManufacturerPipeDenyList = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", "")
local LuaAppGameTileVideoDevicePipeDenyList = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "")
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local Config = if FFlagLuaAppTileVideoDeviceMemoryBlocking then {
	enableManufacturerDeny = LuaAppGameTileVideoManufacturerDeny,
	enableDeviceDeny = LuaAppGameTileVideoDeviceDeny,
	enableMaxMemoryDeny = LuaAppGameTileVideoMaxMemoryDeny,
	enableAvailableRamDeny = LuaAppGameTileVideoAvailableRamDeny,
	maxMemoryThresholdMb = LuaAppGameTileVideoMaxMemoryThresholdMb,
	availableRamThresholdMb = LuaAppGameTileVideoAvailableRamThresholdMb,
	manufacturerDenyList = LuaAppGameTileVideoManufacturerPipeDenyList,
	deviceDenyList = LuaAppGameTileVideoDevicePipeDenyList
} else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), FetchGamePlayabilityAndProductInfo (copy), UseIsVideoEligibleModule (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), ReactModule (copy), UseCanDevicePlayVideoPreviewFunction (copy), Config (ref), RetrievalStatus (copy), VideoEndReason (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), UsePreferredInputFunction (copy), GetPlaybackDetectionMethodFunction (copy), VideoPlaybackDetector (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2, p1.universeId)
	end)
	local UseIsVideoEligibleModuleResult = UseIsVideoEligibleModule(p1.universeId, if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil)
	local Callback = nil
	local Callback1 = nil
	local v1 = nil
	
	if FFlagLuaAppTileVideoDeviceMemoryBlocking then
		local UseStateResult
		UseStateResult, Callback = ReactModule.useState(false)
		Callback1 = UseCanDevicePlayVideoPreviewFunction(Config, p1.universeId, p1.pageContext)
		v1 = UseIsVideoEligibleModuleResult and UseStateResult
	end
	local PlaybackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback then GetPlaybackDetectionMethodFunction(UsePreferredInputFunction(), p1.isHoverSupported) else nil
	
	return ReactModule.createElement(VideoPlaybackDetector, {
		videoKey = p1.videoKey,
		itemIndex = p1.itemIndex,
		itemFrameRef = p1.tileRef,
		playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback then PlaybackDetectionMethod else nil,
		isHoverSupported = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else p1.isHoverSupported,
		isHovered = p1.isHovered,
		isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then p1.isSelected else nil,
		autoplay = if FFlagLuaAppGameTileSelectionVideoPlayback then nil elseif FFlagLuaAppEdpMediaGalleryVideoPreview then p1.autoplay else nil,
		videoPlaybackCoordinator = if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
		onPlaybackChange = p1.onPlaybackChange,
		videoAnalytics = p1.videoAnalytics,
		videoDwellTimeInSec = p1.videoDwellTimeInSec,
		videoVisiblePercent = p1.videoVisiblePercent,
		isVideoEligible = if FFlagLuaAppTileVideoDeviceMemoryBlocking then v1 else UseIsVideoEligibleModuleResult,
		onVideoIneligible = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseSelectorResult (copy), RetrievalStatus (upval), VideoEndReason (upval)
			if p1.videoAnalytics and UseSelectorResult == RetrievalStatus.Done then
				p1.videoAnalytics.reportVideoEnd(p1.itemIndex, VideoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p1.videoAnalytics, UseSelectorResult }),
		onPlaybackCandidate = ReactModule.useCallback(function()
			-- upvalues: UseSelectorResult (copy), RetrievalStatus (upval), FFlagLuaAppUsePrevalidatedVideoGamePlayability (upval), p1 (copy), UseDispatchResult (copy), FetchGamePlayabilityAndProductInfo (upval), UseRoactServiceResult (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (upval), Callback (ref), Callback1 (ref)
			if (UseSelectorResult == RetrievalStatus.NotStarted or UseSelectorResult == RetrievalStatus.Failed) and (not FFlagLuaAppUsePrevalidatedVideoGamePlayability or not p1.hasPrevalidatedVideoGamePlayability) then
				UseDispatchResult(FetchGamePlayabilityAndProductInfo.Fetch(UseRoactServiceResult, p1.universeId))
			end
			if FFlagLuaAppTileVideoDeviceMemoryBlocking then
				Callback(Callback1())
			end
		end, {
			p1.universeId, UseSelectorResult, UseDispatchResult, UseRoactServiceResult,
			Callback1,
			if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end