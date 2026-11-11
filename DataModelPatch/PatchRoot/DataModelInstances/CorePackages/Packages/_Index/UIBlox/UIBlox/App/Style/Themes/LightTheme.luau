local ColorsModule = require(script.Parent.Parent.Colors)

return {
	BackgroundDefault = { Transparency = 0, Color = ColorsModule.Alabaster },
	BackgroundContrast = { Transparency = 0, Color = ColorsModule.Ash },
	BackgroundMuted = { Transparency = 0, Color = ColorsModule.Chalk },
	BackgroundUIDefault = { Transparency = 0, Color = ColorsModule.White },
	BackgroundUIContrast = { Transparency = 0.1, Color = ColorsModule.White },
	BackgroundOnHover = { Transparency = 0.9, Color = ColorsModule.Black },
	BackgroundOnPress = { Transparency = 0.9, Color = ColorsModule.Black },
	UIDefault = { Transparency = 0, Color = ColorsModule.Pumice },
	UIMuted = { Transparency = 0.9, Color = ColorsModule.Black },
	UIEmphasis = { Transparency = 0.7, Color = ColorsModule.Black },
	ContextualPrimaryDefault = { Transparency = 0, Color = ColorsModule.Green },
	ContextualPrimaryOnHover = { Transparency = 0, Color = ColorsModule.Green },
	ContextualPrimaryContent = { Transparency = 0, Color = ColorsModule.White },
	SystemPrimaryDefault = { Transparency = 0, Color = ColorsModule.Flint },
	SystemPrimaryOnHover = { Transparency = 0, Color = ColorsModule.Flint },
	SystemPrimaryContent = { Transparency = 0, Color = ColorsModule.White },
	SecondaryDefault = { Transparency = 0.5, Color = ColorsModule.Black },
	SecondaryOnHover = { Transparency = 0, Color = ColorsModule.Flint },
	SecondaryContent = { Transparency = 0.5, Color = ColorsModule.Black },
	IconDefault = { Transparency = 0.4, Color = ColorsModule.Black },
	IconEmphasis = { Transparency = 0, Color = ColorsModule.Flint },
	IconOnHover = { Transparency = 0, Color = ColorsModule.Flint },
	TextEmphasis = { Transparency = 0, Color = ColorsModule.Flint },
	TextDefault = { Transparency = 0, Color = ColorsModule.Smoke },
	TextMuted = { Transparency = 0.4, Color = ColorsModule.Black },
	TextLink = { Transparency = 0, Color = ColorsModule.Blue },
	Divider = { Transparency = 0, Color = ColorsModule.Pumice },
	Overlay = { Transparency = 0.7, Color = ColorsModule.Black },
	DropShadow = { Transparency = 0.7, Color = ColorsModule.Black },
	NavigationBar = { Transparency = 0, Color = ColorsModule.White },
	PlaceHolder = { Transparency = 0.9, Color = ColorsModule.Black },
	OnlineStatus = { Transparency = 0, Color = ColorsModule.Green },
	OfflineStatus = { Transparency = 0.5, Color = ColorsModule.Black },
	Success = { Transparency = 0, Color = ColorsModule.Green },
	Alert = { Transparency = 0, Color = ColorsModule.Red },
	Badge = { Transparency = 0, Color = ColorsModule.Flint },
	BadgeContent = { Transparency = 0, Color = ColorsModule.White },
	SelectionCursor = {
		Transparency = 0,
		GradientRotationSpeed = 2,
		Color = ColorsModule.XboxBlue,
		AnimatedColor = ColorsModule.White,
		GradientColorSequence = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)),
			ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
		}),
		GradientTransparencySequence = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 0)
		})
	},
	PlayerBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/avatarBG_light",
		Color = ColorsModule.White
	},
	ItemBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/itemBG_light",
		Color = ColorsModule.White
	}
}