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

return function(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), useIsVideoEligibleModule (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfigModule (ref), retrievalStatus (ref), videoEndReason (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), usePreferredInput (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref)
	local var1 = useDispatch()
	local var2 = useRoactService(roactNetworking)
	local var3 = useSelector(function(p2)
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p1 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2, p1.universeId)
	end)
	local var4 = useIsVideoEligibleModule(p1.universeId, if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = useCanDevicePlayVideoPreview(tileVideoBlockingConfigModule, p1.universeId, p1.pageContext)
	
	return reactModule.createElement(videoPlaybackDetector, {
		videoKey = p1.videoKey,
		itemIndex = p1.itemIndex,
		itemFrameRef = p1.tileRef,
		playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(usePreferredInput(), p1.isHoverSupported) else nil else nil,
		isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else p1.isHoverSupported,
		isHovered = p1.isHovered,
		isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then p1.isSelected else nil,
		autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil elseif fFlagLuaAppEdpMediaGalleryVideoPreview then p1.autoplay else nil,
		videoPlaybackCoordinator = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else nil,
		onPlaybackChange = p1.onPlaybackChange,
		videoAnalytics = p1.videoAnalytics,
		videoDwellTimeInSec = p1.videoDwellTimeInSec,
		videoVisiblePercent = p1.videoVisiblePercent,
		isVideoEligible = var4 and var5,
		onVideoIneligible = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var3 (ref), retrievalStatus (copy), videoEndReason (copy)
			if p1.videoAnalytics and var3 == retrievalStatus.Done then
				p1.videoAnalytics.reportVideoEnd(p1.itemIndex, videoEndReason.PlayabilityCheckFailed, p2, -1)
			end
		end, { p1.videoAnalytics, var3 }),
		onPlaybackCandidate = reactModule.useCallback(function()
			-- upvalues: var3 (ref), retrievalStatus (copy), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p1 (ref), var1 (ref), fetchGamePlayabilityAndProductInfo (copy), var2 (ref), var6 (ref), var7 (ref)
			if (var3 == retrievalStatus.NotStarted or var3 == retrievalStatus.Failed) and (if fFlagLuaAppUsePrevalidatedVideoGamePlayability then not p1.hasPrevalidatedVideoGamePlayability else true) then
				var1(fetchGamePlayabilityAndProductInfo.Fetch(var2, p1.universeId))
			end
			var6(var7())
		end, {
			p1.universeId, var3, var1, var2, var7,
			if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p1.hasPrevalidatedVideoGamePlayability else nil
		}),
		viewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	})
end