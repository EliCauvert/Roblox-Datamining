local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")

return function(p0) --[[ line: 15 | named "listenForTeleportFailure" ]]
	-- upvalues: playersService (ref), teleportService (ref)
	local localPlayer = playersService.LocalPlayer
	local teleportInitFailedConnection = nil
	
	local function disconnect() --[[ line: 18 ]]
		-- upvalues: teleportInitFailedConnection (write)
		if teleportInitFailedConnection ~= nil then
			teleportInitFailedConnection:Disconnect()
			teleportInitFailedConnection = nil
		end
	end
	
	teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p1) --[[ line: 27 ]]
		-- upvalues: localPlayer (ref), teleportInitFailedConnection (write), p0 (ref)
		if p1 == localPlayer then
			if teleportInitFailedConnection ~= nil then
				teleportInitFailedConnection:Disconnect()
				teleportInitFailedConnection = nil
			end
			p0()
		end
	end)
	
	return disconnect
end