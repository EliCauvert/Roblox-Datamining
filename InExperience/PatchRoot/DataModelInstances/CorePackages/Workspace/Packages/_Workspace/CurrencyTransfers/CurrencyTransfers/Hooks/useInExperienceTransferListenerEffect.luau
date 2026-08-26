local httpService = game:GetService("HttpService")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local _ = require(currencyTransfers.Flows.InExperienceTransferFlow)

return function(p1)
	-- upvalues: reactModule (ref), marketplaceService (ref), playersService (ref), httpService (ref), loggingProtocolModule (ref), currencyTransferTelemetryModule (ref), transferDirectionModule (ref), transferOriginationModule (ref)
	reactModule.useEffect(function()
		-- upvalues: marketplaceService (copy), playersService (copy), httpService (copy), loggingProtocolModule (copy), currencyTransferTelemetryModule (copy), transferDirectionModule (copy), transferOriginationModule (copy), p1 (ref)
		local promptRobuxTransferRequestedConnection = marketplaceService.PromptRobuxTransferRequested:Connect(function(p2, p3)
			-- upvalues: playersService (copy), httpService (copy), loggingProtocolModule (copy), currencyTransferTelemetryModule (copy), transferDirectionModule (copy), transferOriginationModule (copy), p1 (copy)
			if p2 == playersService.LocalPlayer then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p3 (ref)
					return httpService:JSONDecode(p3)
				end)
				
				if not ok then
					warn("[InExperienceTransfer] Failed to decode transfer response")
				end
				if ok and status then
					loggingProtocolModule.default:logRobloxTelemetryCounter(currencyTransferTelemetryModule.CurrencyTransferEngineSignalReceivedCounter, 1, {
						direction = tostring(transferDirectionModule.Send),
						transferOrigination = tostring(transferOriginationModule.InExperience)
					})
					p1(status)
				end
			end
		end)
		
		return function()
			-- upvalues: promptRobuxTransferRequestedConnection (write)
			if promptRobuxTransferRequestedConnection then
				promptRobuxTransferRequestedConnection:Disconnect()
				promptRobuxTransferRequestedConnection = nil
			end
		end
	end, { p1 })
end