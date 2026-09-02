local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCoreSystem)
local tileVideoBlockingConfig = require(parent.GameTile).TileVideoBlockingConfig
local videoUtilsModule = require(parent.VideoUtils)
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local isVideoEligibleForPlayability = videoUtilsModule.isVideoEligibleForPlayability
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local sduiVideoThumbnailModule = require(script.Parent.SduiVideoThumbnail)
local useSduiGameVideoAnalyticsModule = require(serverDrivenUi.Analytics.useSduiGameVideoAnalytics)
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent

return function(p1)
	-- upvalues: dataHydrationModule (ref), signalsReactModule (ref), useSduiGameVideoAnalyticsModule (ref), reactModule (ref), videoEndReason (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), sduiVideoThumbnailModule (ref), isVideoEligibleForPlayability (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local playabilityStore = dataHydrationModule.Game.getPlayabilityStore(false)
	local playability = playabilityStore.getPlayability(p1.universeId)
	local var1 = signalsReactModule.useSignalState(playability.data)
	local var2 = signalsReactModule.useSignalState(playability.status) == dataHydrationModule.DataStatus.Ready
	local var3 = useSduiGameVideoAnalyticsModule(p1.analyticsContext, p1.sduiContext.appPage, p1.universeId, p1.placeId)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var3 (ref), videoEndReason (copy)
		if var2 then
			var3.reportVideoEnd(nil, videoEndReason.PlayabilityCheckFailed, p2, -1)
		end
	end, { var3, var2 })
	local var5, var6 = reactModule.useState(false)
	local var7 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p1.universeId, p1.sduiContext.appPage)
	
	return reactModule.createElement(sduiVideoThumbnailModule, {
		sduiContext = p1.sduiContext,
		videoPlayer = p1.videoPlayer,
		imageComponent = p1.imageComponent,
		videoPlaybackContext = p1.sduiContext.videoPlaybackContext,
		isVideoEligible = isVideoEligibleForPlayability(var2, var1, nil) and var5,
		onVideoIneligible = var4,
		onPlaybackCandidate = reactModule.useCallback(function()
			-- upvalues: var2 (ref), playabilityStore (ref), p1 (ref), var6 (ref), var7 (ref)
			if not var2 then
				playabilityStore.fetchPlayability(p1.universeId)
			end
			var6(var7())
		end, { p1.universeId, var2, playabilityStore, var7 }),
		videoAnalytics = var3,
		videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
		videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
		isHovered = p1.isHovered,
		isSelected = p1.isSelected,
		cornerRadius = p1.cornerRadius,
		playbackCandidateRef = p1.playbackCandidateRef
	})
end