local MarketplaceService = game:GetService("MarketplaceService")
local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local SharedFlagsModule = require(Parent.SharedFlags)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)

return function(Callback)
	-- upvalues: ReactModule (copy), SharedFlagsModule (copy), MarketplaceService (copy), LoggingProtocolModule (copy), CurrencyTransferTelemetryModule (copy), TransferOriginationModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: SharedFlagsModule (upval), MarketplaceService (upval), LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferOriginationModule (upval), Callback (copy)
		if SharedFlagsModule.GetEngineFeatureEnablePromptRobuxTransferDedicatedUpsellEvent() then
			local PromptRobuxTransferSubscriptionUpsellRequestedConnection = MarketplaceService.PromptRobuxTransferSubscriptionUpsellRequested:Connect(function()
				-- upvalues: LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferOriginationModule (upval), Callback (upval)
				LoggingProtocolModule.default:logRobloxTelemetryCounter(CurrencyTransferTelemetryModule.CurrencyTransferEngineUpsellSignalReceivedCounter, 1, {
					transferOrigination = tostring(TransferOriginationModule.InExperience)
				})
				Callback()
			end)
			
			return function()
				-- upvalues: PromptRobuxTransferSubscriptionUpsellRequestedConnection (ref)
				if PromptRobuxTransferSubscriptionUpsellRequestedConnection then
					PromptRobuxTransferSubscriptionUpsellRequestedConnection:Disconnect()
					PromptRobuxTransferSubscriptionUpsellRequestedConnection = nil
				end
			end
		else
			return function() end
		end
	end, { Callback })
end