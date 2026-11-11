local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	return p1.TopBar.statusBarHeight + ConstantsModule.NAV_BAR_SIZE
end