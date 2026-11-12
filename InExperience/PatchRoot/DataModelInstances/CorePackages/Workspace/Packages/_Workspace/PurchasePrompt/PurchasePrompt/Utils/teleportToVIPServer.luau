local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Default = require(PurchasePrompt.Parent.LoggingProtocol).default
local VIPServerPostPurchaseTelemetryModule = require(PurchasePrompt.Events.VIPServerPostPurchaseTelemetry)

return function(p1, Callback: () -> ())
	-- upvalues: Default (copy), VIPServerPostPurchaseTelemetryModule (copy), RobloxReplicatedStorage (copy), TeleportService (copy), Players (copy)
	local function _(Reason)
		-- upvalues: Default (upval), VIPServerPostPurchaseTelemetryModule (upval), Callback (copy)
		Default:logRobloxTelemetryCounter(VIPServerPostPurchaseTelemetryModule.VIPServerTeleportFailedCounter, 1, { reason = Reason })
		Callback()
	end
	
	local TeleportToPurchasedVIPServer = RobloxReplicatedStorage:FindFirstChild("TeleportToPurchasedVIPServer")
	
	if TeleportToPurchasedVIPServer == nil or not TeleportToPurchasedVIPServer:IsA("RemoteEvent") then
		Default:logRobloxTelemetryCounter(VIPServerPostPurchaseTelemetryModule.VIPServerTeleportFailedCounter, 1, { reason = "no_remote" })
		Callback()
		
		return function() end
	else
		local Connection = nil
		local Connection1 = nil
		
		local function disconnect()
			-- upvalues: Connection (ref), Connection1 (ref)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
		
		Connection = TeleportToPurchasedVIPServer.OnClientEvent:Connect(function()
			-- upvalues: Connection (ref), Connection1 (ref), Default (upval), VIPServerPostPurchaseTelemetryModule (upval), Callback (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Default:logRobloxTelemetryCounter(VIPServerPostPurchaseTelemetryModule.VIPServerTeleportFailedCounter, 1, { reason = "server" })
			Callback()
		end)
		Connection1 = TeleportService.TeleportInitFailed:Connect(function(Player)
			-- upvalues: Players (upval), Connection (ref), Connection1 (ref), Default (upval), VIPServerPostPurchaseTelemetryModule (upval), Callback (copy)
			if Player == Players.LocalPlayer then
				Connection:Disconnect()
				Connection1:Disconnect()
				Default:logRobloxTelemetryCounter(VIPServerPostPurchaseTelemetryModule.VIPServerTeleportFailedCounter, 1, { reason = "teleport_init" })
				Callback()
			end
		end)
		TeleportToPurchasedVIPServer:FireServer(p1)
		
		return disconnect
	end
end