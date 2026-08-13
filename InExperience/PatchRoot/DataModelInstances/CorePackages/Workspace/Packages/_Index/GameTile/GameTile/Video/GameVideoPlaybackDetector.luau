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
local tileVideoBlockingConfigModule = require(gameTile.Video.TileVideoBlockingConfig)
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback

return function(p0) --[[ line: 54 | named "GameVideoPlaybackDetector" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), useIsVideoEligibleModule (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfigModule (ref), retrievalStatus (ref), videoEndReason (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), usePreferredInput (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref)
	local var6 = useDispatch()
	local var7 = useRoactService(roactNetworking)
	local var8 = useSelector(function(p1) --[[ line: 58 ]]
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p0 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, p0.universeId)
	end)
	local var9 = useIsVideoEligibleModule(p0.universeId, if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil)
	local var10, var11 = reactModule.useState(false)
	local var12 = useCanDevicePlayVideoPreview(tileVideoBlockingConfigModule, p0.universeId, p0.pageContext)
	
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
		isVideoEligible = var9 and var10,
		onVideoIneligible = reactModule.useCallback(function(p2) --[[ line: 74 ]]
			-- upvalues: p0 (ref), var8 (ref), retrievalStatus (copy), videoEndReason (copy)
			if p0.videoAnalytics and var8 == retrievalStatus.Done then
				p0.videoAnalytics.reportVideoEnd(p0.itemIndex, videoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p0.videoAnalytics, var8 }),
		onPlaybackCandidate = reactModule.useCallback(function() --[[ line: 81 ]]
			-- upvalues: var8 (ref), retrievalStatus (copy), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p0 (ref), var6 (ref), fetchGamePlayabilityAndProductInfo (copy), var7 (ref), var11 (ref), var12 (ref)
			if (var8 == retrievalStatus.NotStarted or var8 == retrievalStatus.Failed) and (if fFlagLuaAppUsePrevalidatedVideoGamePlayability then not p0.hasPrevalidatedVideoGamePlayability else true) then
				var6(fetchGamePlayabilityAndProductInfo.Fetch(var7, p0.universeId))
			end
			var11(var12())
		end, {
			p0.universeId, var8, var6, var7, var12,
			if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p0.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end