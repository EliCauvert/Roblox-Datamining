local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCoreSystem)
local tileVideoBlockingConfig = require(parent.GameTile).TileVideoBlockingConfig
local videoUtilsModule = require(parent.VideoUtils)
local isVideoEligibleForPlayability = videoUtilsModule.isVideoEligibleForPlayability
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local sduiVideoThumbnailModule = require(script.Parent.SduiVideoThumbnail)
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent

return function(p1)
	-- upvalues: dataHydrationModule (ref), signalsReactModule (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), sduiVideoThumbnailModule (ref), isVideoEligibleForPlayability (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local playabilityStore = dataHydrationModule.Game.getPlayabilityStore(false)
	local playability = playabilityStore.getPlayability(p1.universeId)
	local var1 = signalsReactModule.useSignalState(playability.data)
	local var2 = signalsReactModule.useSignalState(playability.status) == dataHydrationModule.DataStatus.Ready
	local var3, var4 = reactModule.useState(false)
	local var5 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p1.universeId, p1.sduiContext.appPage)
	
	return reactModule.createElement(sduiVideoThumbnailModule, {
		sduiContext = p1.sduiContext,
		videoPlayer = p1.videoPlayer,
		imageComponent = p1.imageComponent,
		videoPlaybackContext = p1.sduiContext.videoPlaybackContext,
		isVideoEligible = isVideoEligibleForPlayability(var2, var1, nil) and var3,
		onPlaybackCandidate = reactModule.useCallback(function()
			-- upvalues: var2 (ref), playabilityStore (ref), p1 (ref), var4 (ref), var5 (ref)
			if not var2 then
				playabilityStore.fetchPlayability(p1.universeId)
			end
			var4(var5())
		end, { p1.universeId, var2, playabilityStore, var5 }),
		videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
		videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
		isHovered = p1.isHovered,
		isSelected = p1.isSelected,
		cornerRadius = p1.cornerRadius,
		playbackCandidateRef = p1.playbackCandidateRef
	})
end