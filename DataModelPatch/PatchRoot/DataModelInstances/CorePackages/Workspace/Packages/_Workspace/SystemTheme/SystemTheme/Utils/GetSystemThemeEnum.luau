local SystemTheme = script:FindFirstAncestor("SystemTheme")

return function()
	-- upvalues: SystemTheme (copy)
	return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable() and require(SystemTheme.Enum.SystemThemeEnum) or nil
end