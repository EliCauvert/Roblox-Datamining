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

return function(p0)
	-- upvalues: dataHydrationModule (ref), signalsReactModule (ref), reactModule (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), sduiVideoThumbnailModule (ref), isVideoEligibleForPlayability (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local playabilityStore = dataHydrationModule.Game.getPlayabilityStore(false)
	local playability = playabilityStore.getPlayability(p0.universeId)
	local var7 = signalsReactModule.useSignalState(playability.data)
	local var8 = signalsReactModule.useSignalState(playability.status) == dataHydrationModule.DataStatus.Ready
	local var9, var10 = reactModule.useState(false)
	local var11 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p0.universeId, p0.sduiContext.appPage)
	
	return reactModule.createElement(sduiVideoThumbnailModule, {
		videoPlayer = p0.videoPlayer,
		imageComponent = p0.imageComponent,
		videoPlaybackContext = p0.sduiContext.videoPlaybackContext,
		isVideoEligible = isVideoEligibleForPlayability(var8, var7, nil) and var9,
		onPlaybackCandidate = reactModule.useCallback(function()
			-- upvalues: var8 (ref), playabilityStore (ref), p0 (ref), var10 (ref), var11 (ref)
			if not var8 then
				playabilityStore.fetchPlayability(p0.universeId)
			end
			var10(var11())
		end, { p0.universeId, var8, playabilityStore, var11 }),
		videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
		videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
		isHovered = p0.isHovered,
		isSelected = p0.isSelected,
		cornerRadius = p0.cornerRadius,
		playbackCandidateRef = p0.playbackCandidateRef
	})
end