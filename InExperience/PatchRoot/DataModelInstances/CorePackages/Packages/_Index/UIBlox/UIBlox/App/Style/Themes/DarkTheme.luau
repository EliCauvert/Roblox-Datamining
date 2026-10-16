local ColorsModule = require(script.Parent.Parent.Colors)

return {
	BackgroundDefault = { Transparency = 0, Color = ColorsModule.Slate },
	BackgroundContrast = { Transparency = 0, Color = ColorsModule.Carbon },
	BackgroundMuted = { Transparency = 0, Color = ColorsModule.Obsidian },
	BackgroundUIDefault = { Transparency = 0, Color = ColorsModule.Flint },
	BackgroundUIContrast = { Transparency = 0.3, Color = ColorsModule.Black },
	BackgroundOnHover = { Transparency = 0.9, Color = ColorsModule.White },
	BackgroundOnPress = { Transparency = 0.7, Color = ColorsModule.Black },
	UIDefault = { Transparency = 0, Color = ColorsModule.Graphite },
	UIMuted = { Transparency = 0.2, Color = ColorsModule.Obsidian },
	UIEmphasis = { Transparency = 0.7, Color = ColorsModule.White },
	ContextualPrimaryDefault = { Transparency = 0, Color = ColorsModule.Green },
	ContextualPrimaryOnHover = { Transparency = 0, Color = ColorsModule.Green },
	ContextualPrimaryContent = { Transparency = 0, Color = ColorsModule.White },
	SystemPrimaryDefault = { Transparency = 0, Color = ColorsModule.White },
	SystemPrimaryOnHover = { Transparency = 0, Color = ColorsModule.White },
	SystemPrimaryContent = { Transparency = 0, Color = ColorsModule.Flint },
	SecondaryDefault = { Transparency = 0.3, Color = ColorsModule.White },
	SecondaryOnHover = { Transparency = 0, Color = ColorsModule.White },
	SecondaryContent = { Transparency = 0.3, Color = ColorsModule.White },
	IconDefault = { Transparency = 0.3, Color = ColorsModule.White },
	IconEmphasis = { Transparency = 0, Color = ColorsModule.White },
	IconOnHover = { Transparency = 0, Color = ColorsModule.White },
	TextEmphasis = { Transparency = 0, Color = ColorsModule.White },
	TextDefault = { Transparency = 0, Color = ColorsModule.Pumice },
	TextMuted = { Transparency = 0.3, Color = ColorsModule.White },
	TextLink = { Transparency = 0, Color = ColorsModule.Blue },
	Divider = { Transparency = 0.8, Color = ColorsModule.White },
	Overlay = { Transparency = 0.5, Color = ColorsModule.Black },
	DropShadow = { Transparency = 0.5, Color = ColorsModule.Black },
	NavigationBar = { Transparency = 0, Color = ColorsModule.Carbon },
	PlaceHolder = { Transparency = 0.5, Color = ColorsModule.Flint },
	OnlineStatus = { Transparency = 0, Color = ColorsModule.Green },
	OfflineStatus = { Transparency = 0.3, Color = ColorsModule.White },
	Success = { Transparency = 0, Color = ColorsModule.Green },
	Alert = { Transparency = 0, Color = ColorsModule.Red },
	Badge = { Transparency = 0, Color = ColorsModule.White },
	BadgeContent = { Transparency = 0, Color = ColorsModule.Flint },
	SelectionCursor = {
		Transparency = 0,
		GradientRotationSpeed = 2,
		Color = ColorsModule.White,
		AnimatedColor = ColorsModule.White,
		GradientColorSequence = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, Color3.new(0.336, 0.336, 0.336))
		}),
		GradientTransparencySequence = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 0)
		})
	},
	PlayerBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/avatarBG_dark",
		Color = ColorsModule.White
	},
	ItemBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/itemBG_dark",
		Color = ColorsModule.Black
	}
}