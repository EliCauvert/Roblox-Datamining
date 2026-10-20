local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ClassicThemeModule = require(Modules.LuaApp.Themes.ClassicTheme)
local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local config = {
	dark = require(Modules.LuaApp.Themes.DeprecatedDarkTheme),
	light = require(Modules.LuaApp.Themes.DeprecatedLightTheme),
	classic = ClassicThemeModule
}

return function(Text: string)
	-- upvalues: config (copy), Logging (copy), ClassicThemeModule (copy)
	if Text ~= nil and #Text > 0 then
		local Entry = config[string.lower(Text)]
		
		if Entry ~= nil then
			return Entry
		end
		Logging.warn("Unrecognized theme name: " .. Text)
	end
	return ClassicThemeModule
end