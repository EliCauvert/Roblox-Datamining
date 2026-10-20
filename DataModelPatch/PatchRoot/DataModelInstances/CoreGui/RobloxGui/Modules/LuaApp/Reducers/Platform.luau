local SetPlatformModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetPlatform)

return function(p1, p2)
	-- upvalues: SetPlatformModule (copy)
	local P0 = p1 or Enum.Platform.None
	assert(P0, "")
	
	return if p2.type == SetPlatformModule.name then p2.platform else P0
end