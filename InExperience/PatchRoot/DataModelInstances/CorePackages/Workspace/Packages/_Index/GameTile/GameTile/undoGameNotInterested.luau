local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local LoggersModule = require(Parent.Loggers)
local RobloxAppToastsRoduxModule = require(Parent.RobloxAppToastsRodux)
local SharedFlagsModule = require(Parent.SharedFlags)
local UserSignalsModule = require(Parent.UserSignals)
local Default = require(Parent.LoggingProtocol).default
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local SetNetworkingErrorToastFunction = RobloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local MutedErrorFunction = LoggersModule.mutedError
local GetGameTileHiddenStoreModule = require(GameTile.HiddenGameTile.getGameTileHiddenStore)
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local FFlagLuaAppNotInterestedTileFeedbackButton = SharedFlagsModule.FFlagLuaAppNotInterestedTileFeedbackButton

return function(p1): boolean
	-- upvalues: Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), GetGameTileHiddenStoreModule (copy), PostSendUserSignalFunction (copy), UserSignalTypes (copy), MutedErrorFunction (copy)
	if not p1.appPage then
		Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
		p1.dispatch(SetNetworkingErrorToastFunction())
		
		return false
	end
	p1.setGameHidden(p1.universeId, false)
	local FeedbackOpener = nil
	
	if FFlagLuaAppNotInterestedTileFeedbackButton then
		local GameTileHiddenStoreModule = GetGameTileHiddenStoreModule(p1.collectionId or "")
		FeedbackOpener = GameTileHiddenStoreModule.getFeedbackOpeners(false)[p1.universeId]
		GameTileHiddenStoreModule.setGameFeedbackOpener(p1.universeId, nil)
	end
	if p1.onOptimisticUnhide then
		p1.onOptimisticUnhide()
	end
	local Success, Result = pcall(function()
		-- upvalues: PostSendUserSignalFunction (upval), p1 (copy), UserSignalTypes (upval), FFlagLuaAppNotInterestedTileFeedbackButton (upval), FeedbackOpener (ref), GetGameTileHiddenStoreModule (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
		PostSendUserSignalFunction(p1.networking, { boolValue = false }, {
			id = p1.universeId,
			assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
			signalOrigin = {
				productSurface = p1.appPage,
				topicId = p1.collectionId or "",
				subIds = { p1.collectionId or "" }
			}
		}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err)
			-- upvalues: p1 (upval), FFlagLuaAppNotInterestedTileFeedbackButton (upval), FeedbackOpener (upval), GetGameTileHiddenStoreModule (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			p1.setGameHidden(p1.universeId, true)
			
			if FFlagLuaAppNotInterestedTileFeedbackButton and FeedbackOpener then
				local GameTileHiddenStoreModule = GetGameTileHiddenStoreModule(p1.collectionId or "")
				
				if GameTileHiddenStoreModule.getFeedbackOpeners(false)[p1.universeId] == nil then
					GameTileHiddenStoreModule.setGameFeedbackOpener(p1.universeId, FeedbackOpener)
				end
			end
			p1.dispatch(SetNetworkingErrorToastFunction(Err))
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not Success then
		p1.setGameHidden(p1.universeId, true)
		
		if FFlagLuaAppNotInterestedTileFeedbackButton and FeedbackOpener then
			GetGameTileHiddenStoreModule(p1.collectionId or "").setGameFeedbackOpener(p1.universeId, FeedbackOpener)
		end
		MutedErrorFunction(Result)
	end
	return true
end