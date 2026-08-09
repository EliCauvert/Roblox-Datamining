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
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppTileVideoDeviceMemoryBlocking = require(parent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local luaAppGameTileVideoManufacturerDeny = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false)
local luaAppGameTileVideoDeviceDeny = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false)
local luaAppGameTileVideoMaxMemoryDeny = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false)
local luaAppGameTileVideoAvailableRamDeny = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false)
local luaAppGameTileVideoMaxMemoryThresholdMb = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1)
local luaAppGameTileVideoAvailableRamThresholdMb = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1)
local luaAppGameTileVideoManufacturerPipeDenyList = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", "")
local luaAppGameTileVideoDevicePipeDenyList = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "")
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local var13 = if fFlagLuaAppTileVideoDeviceMemoryBlocking then {
	enableManufacturerDeny = luaAppGameTileVideoManufacturerDeny,
	enableDeviceDeny = luaAppGameTileVideoDeviceDeny,
	enableMaxMemoryDeny = luaAppGameTileVideoMaxMemoryDeny,
	enableAvailableRamDeny = luaAppGameTileVideoAvailableRamDeny,
	maxMemoryThresholdMb = luaAppGameTileVideoMaxMemoryThresholdMb,
	availableRamThresholdMb = luaAppGameTileVideoAvailableRamThresholdMb,
	manufacturerDenyList = luaAppGameTileVideoManufacturerPipeDenyList,
	deviceDenyList = luaAppGameTileVideoDevicePipeDenyList
} else nil

return function(p0) --[[ line: 73 | named "GameVideoPlaybackDetector" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), useIsVideoEligibleModule (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), fFlagLuaAppTileVideoDeviceMemoryBlocking (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), var13 (write), retrievalStatus (ref), videoEndReason (ref), videoPlaybackDetector (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), fFlagLuaAppHomeTouchAutoplay (ref)
	local var14 = useDispatch()
	local var15 = useRoactService(roactNetworking)
	local var16 = useSelector(function(p1) --[[ line: 77 ]]
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p0 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, p0.universeId)
	end)
	local var17 = useIsVideoEligibleModule(p0.universeId, if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil)
	local _ = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	
	if fFlagLuaAppTileVideoDeviceMemoryBlocking then
		local var21, var22 = reactModule.useState(false)
		local var23 = var21
		var18 = var22
		var19 = useCanDevicePlayVideoPreview(var13, p0.universeId, p0.pageContext)
		var20 = var17 and var23
	end
	return reactModule.createElement(videoPlaybackDetector, {
		videoKey = p0.videoKey,
		itemIndex = p0.itemIndex,
		itemFrameRef = p0.tileRef,
		isHoverSupported = p0.isHoverSupported,
		isHovered = p0.isHovered,
		autoplay = if fFlagLuaAppEdpMediaGalleryVideoPreview then p0.autoplay else nil,
		videoPlaybackCoordinator = if fFlagLuaAppHomeTouchAutoplay and p0.videoPlaybackContext then p0.videoPlaybackContext.videoPlaybackCoordinator else nil,
		onPlaybackChange = p0.onPlaybackChange,
		videoAnalytics = p0.videoAnalytics,
		videoDwellTimeInSec = p0.videoDwellTimeInSec,
		videoVisiblePercent = p0.videoVisiblePercent,
		isVideoEligible = if fFlagLuaAppTileVideoDeviceMemoryBlocking then var20 else var17,
		onVideoIneligible = reactModule.useCallback(function(p2) --[[ line: 98 ]]
			-- upvalues: p0 (ref), var16 (ref), retrievalStatus (copy), videoEndReason (copy)
			if p0.videoAnalytics and var16 == retrievalStatus.Done then
				p0.videoAnalytics.reportVideoEnd(p0.itemIndex, videoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p0.videoAnalytics, var16 }),
		onPlaybackCandidate = reactModule.useCallback(function() --[[ line: 105 ]]
			-- upvalues: var16 (ref), retrievalStatus (copy), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p0 (ref), var14 (ref), fetchGamePlayabilityAndProductInfo (copy), var15 (ref), fFlagLuaAppTileVideoDeviceMemoryBlocking (copy), var18 (write), var19 (write)
			if (var16 == retrievalStatus.NotStarted or var16 == retrievalStatus.Failed) and (if fFlagLuaAppUsePrevalidatedVideoGamePlayability then not p0.hasPrevalidatedVideoGamePlayability else true) then
				var14(fetchGamePlayabilityAndProductInfo.Fetch(var15, p0.universeId))
			end
			if fFlagLuaAppTileVideoDeviceMemoryBlocking then
				var18(var19())
			end
		end, {
			p0.universeId, var16, var14, var15, var19,
			if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if fFlagLuaAppHomeTouchAutoplay and p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end