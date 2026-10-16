local TeleportService = game:GetService("TeleportService")

return function(GameIdsToExclude) --[[ Line: 3 | Named "callTeleportSwitchServer" ]]
	-- upvalues: TeleportService (copy)
	if GameIdsToExclude == nil then
		TeleportService:TeleportSwitchServer()
		
		return
	else
		TeleportService:TeleportSwitchServer(GameIdsToExclude)
	end
end