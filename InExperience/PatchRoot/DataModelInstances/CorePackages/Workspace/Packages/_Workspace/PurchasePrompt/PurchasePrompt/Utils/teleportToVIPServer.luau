local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

return function(p1, Callback: () -> ())
	-- upvalues: RobloxReplicatedStorage (copy), TeleportService (copy), Players (copy)
	local TeleportToPurchasedVIPServer = RobloxReplicatedStorage:FindFirstChild("TeleportToPurchasedVIPServer")
	
	if TeleportToPurchasedVIPServer == nil or not TeleportToPurchasedVIPServer:IsA("RemoteEvent") then
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
			-- upvalues: Connection (ref), Connection1 (ref), Callback (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Callback()
		end)
		Connection1 = TeleportService.TeleportInitFailed:Connect(function(Player)
			-- upvalues: Players (upval), Connection (ref), Connection1 (ref), Callback (copy)
			if Player == Players.LocalPlayer then
				Connection:Disconnect()
				Connection1:Disconnect()
				Callback()
			end
		end)
		TeleportToPurchasedVIPServer:FireServer(p1)
		
		return disconnect
	end
end