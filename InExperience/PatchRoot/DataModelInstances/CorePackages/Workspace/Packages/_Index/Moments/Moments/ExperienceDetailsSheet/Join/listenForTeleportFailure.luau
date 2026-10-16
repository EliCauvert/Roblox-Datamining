local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

return function(Callback) --[[ Line: 15 | Named "listenForTeleportFailure" ]]
	-- upvalues: Players (copy), TeleportService (copy)
	local LocalPlayer = Players.LocalPlayer
	local Connection = nil
	
	local function disconnect() --[[ Line: 18 ]]
		-- upvalues: Connection (ref)
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	Connection = TeleportService.TeleportInitFailed:Connect(function(Player) --[[ Line: 27 ]]
		-- upvalues: LocalPlayer (copy), Connection (ref), Callback (copy)
		if Player == LocalPlayer then
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			Callback()
		end
	end)
	
	return disconnect
end