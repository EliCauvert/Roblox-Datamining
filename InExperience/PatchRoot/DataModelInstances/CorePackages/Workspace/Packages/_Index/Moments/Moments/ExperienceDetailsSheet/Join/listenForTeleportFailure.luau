local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")

return function(p1)
	-- upvalues: playersService (ref), teleportService (ref)
	local localPlayer = playersService.LocalPlayer
	local teleportInitFailedConnection = nil
	
	local function disconnect()
		-- upvalues: teleportInitFailedConnection (write)
		if teleportInitFailedConnection ~= nil then
			teleportInitFailedConnection:Disconnect()
			teleportInitFailedConnection = nil
		end
	end
	
	teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p2)
		-- upvalues: localPlayer (ref), teleportInitFailedConnection (write), p1 (ref)
		if p2 == localPlayer then
			if teleportInitFailedConnection ~= nil then
				teleportInitFailedConnection:Disconnect()
				teleportInitFailedConnection = nil
			end
			p1()
		end
	end)
	
	return disconnect
end