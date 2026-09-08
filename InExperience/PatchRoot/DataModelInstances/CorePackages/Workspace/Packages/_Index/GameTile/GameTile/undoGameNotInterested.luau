local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local loggersModule = require(parent.Loggers)
local loggingProtocolModule = require(parent.LoggingProtocol)
local robloxAppToastsRoduxModule = require(parent.RobloxAppToastsRodux)
local userSignalsModule = require(parent.UserSignals)
local default = loggingProtocolModule.default
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local setNetworkingErrorToast = robloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local userSignalTypes = userSignalsModule.UserSignalTypes
local mutedError = loggersModule.mutedError
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)

return function(p1)
	-- upvalues: default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), postSendUserSignal (ref), userSignalTypes (ref), mutedError (ref)
	if not p1.appPage then
		default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
		p1.dispatch(setNetworkingErrorToast())
		
		return false
	end
	p1.setGameHidden(p1.universeId, false)
	
	if p1.onOptimisticUnhide then
		p1.onOptimisticUnhide()
	end
	local ok, status = pcall(function()
		-- upvalues: postSendUserSignal (copy), p1 (ref), userSignalTypes (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
		postSendUserSignal(p1.networking, { boolValue = false }, {
			id = p1.universeId,
			assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
			signalOrigin = {
				productSurface = p1.appPage,
				topicId = p1.collectionId or "",
				subIds = { p1.collectionId or "" }
			}
		}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p2)
			-- upvalues: p1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
			p1.setGameHidden(p1.universeId, true)
			p1.dispatch(setNetworkingErrorToast(p2))
			default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not ok then
		p1.setGameHidden(p1.universeId, true)
		mutedError(status)
	end
	return true
end