local SetIsLocalUserSoothsayerModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetIsLocalUserSoothsayer)

return function(p1, p2)
	-- upvalues: SetIsLocalUserSoothsayerModule (copy)
	local P0 = p1 or false
	
	return if p2.type == SetIsLocalUserSoothsayerModule.name then p2.isSoothsayer else P0
end