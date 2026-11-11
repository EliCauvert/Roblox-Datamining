local TModule = require(script:FindFirstAncestor("SystemTheme").Parent.t)
local SystemThemeEnumModule = {
	Light = Enum.SystemThemeValue.light,
	Dark = Enum.SystemThemeValue.dark,
	SystemLight = Enum.SystemThemeValue.systemLight,
	SystemDark = Enum.SystemThemeValue.systemDark,
	Error = Enum.SystemThemeValue.error
}

function SystemThemeEnumModule.getSystemThemeEnum(Name)
	-- upvalues: SystemThemeEnumModule (copy), TModule (copy)
	for _, value in pairs(SystemThemeEnumModule) do
		if TModule.userdata(value) and (value.Name == Name or value.Value == Name) then
			return value
		end
	end
	return SystemThemeEnumModule.Error
end

function SystemThemeEnumModule.isLightTheme(Light): boolean
	-- upvalues: SystemThemeEnumModule (copy)
	return Light == SystemThemeEnumModule.Light or Light == SystemThemeEnumModule.SystemLight
end

function SystemThemeEnumModule.isDarkTheme(Dark): boolean
	-- upvalues: SystemThemeEnumModule (copy)
	return Dark == SystemThemeEnumModule.Dark or Dark == SystemThemeEnumModule.SystemDark
end

function SystemThemeEnumModule.isSystemTheme(SystemDark): boolean
	-- upvalues: SystemThemeEnumModule (copy)
	return SystemDark == SystemThemeEnumModule.SystemLight or SystemDark == SystemThemeEnumModule.SystemDark
end

return SystemThemeEnumModule