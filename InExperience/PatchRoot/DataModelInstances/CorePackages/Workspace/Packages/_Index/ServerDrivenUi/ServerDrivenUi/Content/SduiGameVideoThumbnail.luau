local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCoreSystem)
local TileVideoBlockingConfig = require(Parent.GameTile).TileVideoBlockingConfig
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local IsVideoEligibleForPlayabilityFunction = VideoUtilsModule.isVideoEligibleForPlayability
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local SduiVideoThumbnailModule = require(script.Parent.SduiVideoThumbnail)
local UseSduiVideoAnalyticsFunction = require(Parent.SduiSharedContent).useSduiVideoAnalytics
local FIntLuaAppGameTileVideoDwellTimeInSec = require(Parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent

return function(p1) --[[ Line: 45 | Named "SduiGameVideoThumbnail" ]]
	-- upvalues: DataHydrationModule (copy), SignalsReactModule (copy), UseSduiVideoAnalyticsFunction (copy), ReactModule (copy), VideoEndReason (copy), UseCanDevicePlayVideoPreviewFunction (copy), TileVideoBlockingConfig (copy), SduiVideoThumbnailModule (copy), IsVideoEligibleForPlayabilityFunction (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy)
	local PlayabilityStore = DataHydrationModule.Game.getPlayabilityStore(false)
	local Playability = PlayabilityStore.getPlayability(p1.universeId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(Playability.data)
	local IsUseSignalStateResultMatch = SignalsReactModule.useSignalState(Playability.status) == DataHydrationModule.DataStatus.Ready
	local UseSduiVideoAnalyticsResult = UseSduiVideoAnalyticsFunction(p1.analyticsContext, p1.sduiContext.appPage, {
		source = "universe",
		sourceId = p1.universeId,
		universeId = p1.universeId,
		placeId = p1.placeId
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 59 ]]
		-- upvalues: IsUseSignalStateResultMatch (copy), UseSduiVideoAnalyticsResult (copy), VideoEndReason (upval)
		if IsUseSignalStateResultMatch then
			UseSduiVideoAnalyticsResult.reportVideoEnd(nil, VideoEndReason.PlayabilityCheckFailed, p2, -1)
		end
	end, { UseSduiVideoAnalyticsResult, IsUseSignalStateResultMatch })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseCanDevicePlayVideoPreviewResult = UseCanDevicePlayVideoPreviewFunction(TileVideoBlockingConfig, p1.universeId, p1.sduiContext.appPage)
	
	return ReactModule.createElement(SduiVideoThumbnailModule, {
		sduiContext = p1.sduiContext,
		videoPlayer = p1.videoPlayer,
		imageComponent = p1.imageComponent,
		videoPlaybackContext = p1.sduiContext.videoPlaybackContext,
		isVideoEligible = IsVideoEligibleForPlayabilityFunction(IsUseSignalStateResultMatch, UseSignalStateResult, nil) and UseStateResult,
		onVideoIneligible = UseResult,
		onPlaybackCandidate = ReactModule.useCallback(function() --[[ Line: 70 ]]
			-- upvalues: IsUseSignalStateResultMatch (copy), PlayabilityStore (copy), p1 (copy), UseStateResult2 (copy), UseCanDevicePlayVideoPreviewResult (copy)
			if not IsUseSignalStateResultMatch then
				PlayabilityStore.fetchPlayability(p1.universeId)
			end
			UseStateResult2(UseCanDevicePlayVideoPreviewResult())
		end, {
			p1.universeId,
			IsUseSignalStateResultMatch,
			PlayabilityStore,
			UseCanDevicePlayVideoPreviewResult
		}),
		videoAnalytics = UseSduiVideoAnalyticsResult,
		videoDwellTimeInSec = FIntLuaAppGameTileVideoDwellTimeInSec,
		videoVisiblePercent = FIntLuaAppGameTileVideoVisiblePercent,
		isHovered = p1.isHovered,
		isSelected = p1.isSelected,
		cornerRadius = p1.cornerRadius,
		playbackCandidateRef = p1.playbackCandidateRef
	})
end