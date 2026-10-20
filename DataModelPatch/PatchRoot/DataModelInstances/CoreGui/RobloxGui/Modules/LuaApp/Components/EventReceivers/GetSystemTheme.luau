local GetFFlagUseNonYieldGetSystemThemeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUseNonYieldGetSystemTheme)

return function(p1)
	-- upvalues: GetFFlagUseNonYieldGetSystemThemeModule (copy)
	return if GetFFlagUseNonYieldGetSystemThemeModule() then p1:getSystemTheme() else p1:getSystemThemeAsync()
end