local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local _ = require(CurrencyTransfers.Flows.InExperienceTransferFlow)

return function(Callback)
	-- upvalues: ReactModule (copy), MarketplaceService (copy), Players (copy), HttpService (copy), LoggingProtocolModule (copy), CurrencyTransferTelemetryModule (copy), TransferDirectionModule (copy), TransferOriginationModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: MarketplaceService (upval), Players (upval), HttpService (upval), LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferDirectionModule (upval), TransferOriginationModule (upval), Callback (copy)
		local PromptRobuxTransferRequestedConnection = MarketplaceService.PromptRobuxTransferRequested:Connect(function(Player, JsonResponse)
			-- upvalues: Players (upval), HttpService (upval), LoggingProtocolModule (upval), CurrencyTransferTelemetryModule (upval), TransferDirectionModule (upval), TransferOriginationModule (upval), Callback (upval)
			if Player == Players.LocalPlayer then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), JsonResponse (copy)
					return HttpService:JSONDecode(JsonResponse)
				end)
				
				if not Success then
					warn("[InExperienceTransfer] Failed to decode transfer response")
				end
				if Success and Result then
					LoggingProtocolModule.default:logRobloxTelemetryCounter(CurrencyTransferTelemetryModule.CurrencyTransferEngineSignalReceivedCounter, 1, {
						direction = tostring(TransferDirectionModule.Send),
						transferOrigination = tostring(TransferOriginationModule.InExperience)
					})
					Callback(Result)
				end
			end
		end)
		
		return function()
			-- upvalues: PromptRobuxTransferRequestedConnection (ref)
			if PromptRobuxTransferRequestedConnection then
				PromptRobuxTransferRequestedConnection:Disconnect()
				PromptRobuxTransferRequestedConnection = nil
			end
		end
	end, { Callback })
end