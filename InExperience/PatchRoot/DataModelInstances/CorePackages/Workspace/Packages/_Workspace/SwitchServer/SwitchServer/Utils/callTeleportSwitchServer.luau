local teleportService = game:GetService("TeleportService")

return function(p1)
	-- upvalues: teleportService (ref)
	if p1 == nil then
		teleportService:TeleportSwitchServer()
		
		return
	end
	teleportService:TeleportSwitchServer(p1)
end