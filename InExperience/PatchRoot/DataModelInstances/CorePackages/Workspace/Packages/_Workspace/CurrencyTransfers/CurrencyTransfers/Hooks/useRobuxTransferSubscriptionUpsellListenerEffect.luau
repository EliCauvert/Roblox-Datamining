local MarketplaceService = game:GetService("MarketplaceService")
local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local SharedFlagsModule = require(Parent.SharedFlags)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)

return function(Callback) --[[ Line: 14 | Named "useRobuxTransferSubscriptionUpsellListenerEffect" ]]
	-- upvalues: ReactModule (copy), SharedFlagsModule (copy), MarketplaceService (copy), LoggingProtocolModule (copy), CurrencyTransferTelemetryModule (copy), TransferOriginationModule (copy)
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: SharedFlagsModule (upval), MarketplaceService (upval), LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferOriginationModule (upval), Callback (copy)
		if SharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then
			local PromptRobuxTransferSubscriptionUpsellRequestedConnection = MarketplaceService.PromptRobuxTransferSubscriptionUpsellRequested:Connect(function() --[[ Line: 22 ]]
				-- upvalues: LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferOriginationModule (upval), Callback (upval)
				LoggingProtocolModule.default:logRobloxTelemetryCounter(CurrencyTransferTelemetryModule.CurrencyTransferEngineUpsellSignalReceivedCounter, 1, {
					transferOrigination = tostring(TransferOriginationModule.InExperience)
				})
				Callback()
			end)
			
			return function() --[[ Line: 33 ]]
				-- upvalues: PromptRobuxTransferSubscriptionUpsellRequestedConnection (ref)
				if PromptRobuxTransferSubscriptionUpsellRequestedConnection then
					PromptRobuxTransferSubscriptionUpsellRequestedConnection:Disconnect()
					PromptRobuxTransferSubscriptionUpsellRequestedConnection = nil
				end
			end
		else
			return function() --[[ Line: 19 ]] end
		end
	end, { Callback })
end