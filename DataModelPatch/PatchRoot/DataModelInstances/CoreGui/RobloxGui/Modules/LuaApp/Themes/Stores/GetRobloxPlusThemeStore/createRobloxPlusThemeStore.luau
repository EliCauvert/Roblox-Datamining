local SignalsModule = require(game:GetService("CorePackages").Packages.Signals)
local RobloxPlusThemeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Themes.RobloxPlusTheme)

return function()
	-- upvalues: SignalsModule (copy), RobloxPlusThemeModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(RobloxPlusThemeModule.Default)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	
	return {
		getColorThemeKey = Signal,
		setColorThemeKey = Signal2,
		getPreviewColorThemeKey = Signal1,
		setPreviewColorThemeKey = Signal2_1
	}
end