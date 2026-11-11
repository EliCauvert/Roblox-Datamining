local RobloxPlusThemeModule = {
	Default = "Default",
	Emerald = "Emerald",
	Peridot = "Peridot",
	Ruby = "Ruby",
	Rose = "Rose",
	Amethyst = "Amethyst"
}
RobloxPlusThemeModule.Order = {
	RobloxPlusThemeModule.Default, RobloxPlusThemeModule.Emerald,
	RobloxPlusThemeModule.Peridot, RobloxPlusThemeModule.Ruby,
	RobloxPlusThemeModule.Rose, RobloxPlusThemeModule.Amethyst
}
RobloxPlusThemeModule.PaletteByTheme = {
	[RobloxPlusThemeModule.Emerald] = "Green",
	[RobloxPlusThemeModule.Peridot] = "Turquoise",
	[RobloxPlusThemeModule.Ruby] = "Red",
	[RobloxPlusThemeModule.Rose] = "Pink",
	[RobloxPlusThemeModule.Amethyst] = "Purple"
}
RobloxPlusThemeModule.Labels = {
	[RobloxPlusThemeModule.Default] = "Feature.Accessibility.AppTheme.Default",
	[RobloxPlusThemeModule.Emerald] = "Feature.Accessibility.AppTheme.Emerald",
	[RobloxPlusThemeModule.Peridot] = "Feature.Accessibility.AppTheme.Peridot",
	[RobloxPlusThemeModule.Ruby] = "Feature.Accessibility.AppTheme.Ruby",
	[RobloxPlusThemeModule.Rose] = "Feature.Accessibility.AppTheme.Rose",
	[RobloxPlusThemeModule.Amethyst] = "Feature.Accessibility.AppTheme.Amethyst"
}

return RobloxPlusThemeModule