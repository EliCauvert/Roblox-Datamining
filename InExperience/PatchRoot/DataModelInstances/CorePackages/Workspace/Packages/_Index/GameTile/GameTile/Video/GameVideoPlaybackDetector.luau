local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useIsVideoEligibleModule = require(gameTile.Video.useIsVideoEligible)
local usePreferredInput = require(parent.Responsive).usePreferredInput
local videoUtilsModule = require(parent.VideoUtils)
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local luaAppGameTileVideoManufacturerDeny = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false)
local luaAppGameTileVideoDeviceDeny = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false)
local luaAppGameTileVideoMaxMemoryDeny = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false)
local luaAppGameTileVideoAvailableRamDeny = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false)
local luaAppGameTileVideoMaxMemoryThresholdMb = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1)
local luaAppGameTileVideoAvailableRamThresholdMb = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1)
local luaAppGameTileVideoManufacturerPipeDenyList = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", "")
local luaAppGameTileVideoDevicePipeDenyList = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "")
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local t = {
	enableManufacturerDeny = luaAppGameTileVideoManufacturerDeny,
	enableDeviceDeny = luaAppGameTileVideoDeviceDeny,
	enableMaxMemoryDeny = luaAppGameTileVideoMaxMemoryDeny,
	enableAvailableRamDeny = luaAppGameTileVideoAvailableRamDeny,
	maxMemoryThresholdMb = luaAppGameTileVideoMaxMemoryThresholdMb,
	availableRamThresholdMb = luaAppGameTileVideoAvailableRamThresholdMb,
	manufacturerDenyList = luaAppGameTileVideoManufacturerPipeDenyList,
	deviceDenyList = luaAppGameTileVideoDevicePipeDenyList
}

return function(p0) --[[ line: 74 | named "GameVideoPlaybackDetector" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), useIsVideoEligibleModule (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), t (ref), retrievalStatus (ref), videoEndReason (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), usePreferredInput (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref)
	local var14 = useDispatch()
	local var15 = useRoactService(roactNetworking)
	local var16 = useSelector(function(p1) --[[ line: 78 ]]
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p0 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, p0.universeId)
	end)
	local var17 = useIsVideoEligibleModule(p0.universeId, if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil)
	local var18, var19 = reactModule.useState(false)
	local var20 = useCanDevicePlayVideoPreview(t, p0.universeId, p0.pageContext)
	
	return reactModule.createElement(videoPlaybackDetector, {
		videoKey = p0.videoKey,
		itemIndex = p0.itemIndex,
		itemFrameRef = p0.tileRef,
		playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(usePreferredInput(), p0.isHoverSupported) else nil else nil,
		isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else p0.isHoverSupported,
		isHovered = p0.isHovered,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p0.isSelected else nil,
		autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil elseif fFlagLuaAppEdpMediaGalleryVideoPreview then p0.autoplay else nil,
		videoPlaybackCoordinator = if p0.videoPlaybackContext then p0.videoPlaybackContext.videoPlaybackCoordinator else nil,
		onPlaybackChange = p0.onPlaybackChange,
		videoAnalytics = p0.videoAnalytics,
		videoDwellTimeInSec = p0.videoDwellTimeInSec,
		videoVisiblePercent = p0.videoVisiblePercent,
		isVideoEligible = var17 and var18,
		onVideoIneligible = reactModule.useCallback(function(p2) --[[ line: 94 ]]
			-- upvalues: p0 (ref), var16 (ref), retrievalStatus (copy), videoEndReason (copy)
			if p0.videoAnalytics and var16 == retrievalStatus.Done then
				p0.videoAnalytics.reportVideoEnd(p0.itemIndex, videoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p0.videoAnalytics, var16 }),
		onPlaybackCandidate = reactModule.useCallback(function() --[[ line: 101 ]]
			-- upvalues: var16 (ref), retrievalStatus (copy), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p0 (ref), var14 (ref), fetchGamePlayabilityAndProductInfo (copy), var15 (ref), var19 (ref), var20 (ref)
			if (var16 == retrievalStatus.NotStarted or var16 == retrievalStatus.Failed) and (if fFlagLuaAppUsePrevalidatedVideoGamePlayability then not p0.hasPrevalidatedVideoGamePlayability else true) then
				var14(fetchGamePlayabilityAndProductInfo.Fetch(var15, p0.universeId))
			end
			var19(var20())
		end, {
			p0.universeId, var16, var14, var15, var20,
			if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end