game:DefineFastFlag("SystemThemeLuaEnabled10", false)
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local config = {
	Light = Enum.SystemThemeValue.light,
	Dark = Enum.SystemThemeValue.dark,
	SystemLight = Enum.SystemThemeValue.systemLight,
	SystemDark = Enum.SystemThemeValue.systemDark,
	Error = Enum.SystemThemeValue.error
}

function config.getSystemThemeEnum(Name)
	-- upvalues: config (copy), TModule (copy)
	for _, value in pairs(config) do
		if TModule.userdata(value) and (value.Name == Name or value.Value == Name) then
			return value
		end
	end
	return config.Error
end

function config.isLightTheme(Light): boolean
	-- upvalues: config (copy)
	return Light == config.Light or Light == config.SystemLight
end

function config.isDarkTheme(Dark): boolean
	-- upvalues: config (copy)
	return Dark == config.Dark or Dark == config.SystemDark
end

function config.isSystemTheme(SystemDark): boolean
	-- upvalues: config (copy)
	return SystemDark == config.SystemLight or SystemDark == config.SystemDark
end

return if game:GetFastFlag("SystemThemeLuaEnabled10") then require(CorePackages.Workspace.Packages.SystemTheme).Enum.SystemThemeEnum else config