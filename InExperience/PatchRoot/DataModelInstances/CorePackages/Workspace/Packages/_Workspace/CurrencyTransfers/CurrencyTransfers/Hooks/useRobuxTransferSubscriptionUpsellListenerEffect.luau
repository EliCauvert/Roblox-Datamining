local marketplaceService = game:GetService("MarketplaceService")
local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local sharedFlagsModule = require(parent.SharedFlags)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)

return function(p0)
	-- upvalues: reactModule (ref), sharedFlagsModule (ref), marketplaceService (ref), loggingProtocolModule (ref), currencyTransferTelemetryModule (ref), transferOriginationModule (ref)
	reactModule.useEffect(function()
		-- upvalues: sharedFlagsModule (copy), marketplaceService (copy), loggingProtocolModule (copy), currencyTransferTelemetryModule (copy), transferOriginationModule (copy), p0 (ref)
		if sharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then
			local promptRobuxTransferSubscriptionUpsellRequestedConnection = marketplaceService.PromptRobuxTransferSubscriptionUpsellRequested:Connect(function()
				-- upvalues: loggingProtocolModule (copy), currencyTransferTelemetryModule (copy), transferOriginationModule (copy), p0 (copy)
				loggingProtocolModule.default:logRobloxTelemetryCounter(currencyTransferTelemetryModule.CurrencyTransferEngineUpsellSignalReceivedCounter, 1, {
					transferOrigination = tostring(transferOriginationModule.InExperience)
				})
				p0()
			end)
			
			return function()
				-- upvalues: promptRobuxTransferSubscriptionUpsellRequestedConnection (write)
				if promptRobuxTransferSubscriptionUpsellRequestedConnection then
					promptRobuxTransferSubscriptionUpsellRequestedConnection:Disconnect()
					promptRobuxTransferSubscriptionUpsellRequestedConnection = nil
				end
			end
		end
		return function() end
	end, { p0 })
end