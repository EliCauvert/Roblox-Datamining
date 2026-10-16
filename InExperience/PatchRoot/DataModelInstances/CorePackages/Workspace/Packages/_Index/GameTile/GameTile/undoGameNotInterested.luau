local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local UserSignalsModule = require(Parent.UserSignals)
local Default = require(Parent.LoggingProtocol).default
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local MutedErrorFunction = require(Parent.Loggers).mutedError
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)

return function(p1): boolean --[[ Line: 28 | Named "undoGameNotInterested" ]]
	-- upvalues: Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), PostSendUserSignalFunction (copy), UserSignalTypes (copy), MutedErrorFunction (copy)
	if not p1.appPage then
		Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
		p1.dispatch(SetNetworkingErrorToastFunction())
		
		return false
	end
	p1.setGameHidden(p1.universeId, false)
	
	if p1.onOptimisticUnhide then
		p1.onOptimisticUnhide()
	end
	local Success, Result = pcall(function() --[[ Line: 43 ]]
		-- upvalues: PostSendUserSignalFunction (upval), p1 (copy), UserSignalTypes (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
		PostSendUserSignalFunction(p1.networking, { boolValue = false }, {
			id = p1.universeId,
			assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
			signalOrigin = {
				productSurface = p1.appPage,
				topicId = p1.collectionId or "",
				subIds = { p1.collectionId or "" }
			}
		}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err) --[[ Line: 57 ]]
			-- upvalues: p1 (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			p1.setGameHidden(p1.universeId, true)
			p1.dispatch(SetNetworkingErrorToastFunction(Err))
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not Success then
		p1.setGameHidden(p1.universeId, true)
		MutedErrorFunction(Result)
	end
	return true
end