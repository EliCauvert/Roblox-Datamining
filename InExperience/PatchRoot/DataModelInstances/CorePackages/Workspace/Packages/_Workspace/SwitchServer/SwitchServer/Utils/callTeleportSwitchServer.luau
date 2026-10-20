local TeleportService = game:GetService("TeleportService")

return function(GameIdsToExclude)
	-- upvalues: TeleportService (copy)
	if GameIdsToExclude == nil then
		TeleportService:TeleportSwitchServer()
		
		return
	else
		TeleportService:TeleportSwitchServer(GameIdsToExclude)
	end
end