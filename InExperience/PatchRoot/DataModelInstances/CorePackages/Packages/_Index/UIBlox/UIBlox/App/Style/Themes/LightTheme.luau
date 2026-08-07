local colorsModule = require(script.Parent.Parent.Colors)

return {
	BackgroundDefault = { Transparency = 0, Color = colorsModule.Alabaster },
	BackgroundContrast = { Transparency = 0, Color = colorsModule.Ash },
	BackgroundMuted = { Transparency = 0, Color = colorsModule.Chalk },
	BackgroundUIDefault = { Transparency = 0, Color = colorsModule.White },
	BackgroundUIContrast = { Transparency = 0.1, Color = colorsModule.White },
	BackgroundOnHover = { Transparency = 0.9, Color = colorsModule.Black },
	BackgroundOnPress = { Transparency = 0.9, Color = colorsModule.Black },
	UIDefault = { Transparency = 0, Color = colorsModule.Pumice },
	UIMuted = { Transparency = 0.9, Color = colorsModule.Black },
	UIEmphasis = { Transparency = 0.7, Color = colorsModule.Black },
	ContextualPrimaryDefault = { Transparency = 0, Color = colorsModule.Green },
	ContextualPrimaryOnHover = { Transparency = 0, Color = colorsModule.Green },
	ContextualPrimaryContent = { Transparency = 0, Color = colorsModule.White },
	SystemPrimaryDefault = { Transparency = 0, Color = colorsModule.Flint },
	SystemPrimaryOnHover = { Transparency = 0, Color = colorsModule.Flint },
	SystemPrimaryContent = { Transparency = 0, Color = colorsModule.White },
	SecondaryDefault = { Transparency = 0.5, Color = colorsModule.Black },
	SecondaryOnHover = { Transparency = 0, Color = colorsModule.Flint },
	SecondaryContent = { Transparency = 0.5, Color = colorsModule.Black },
	IconDefault = { Transparency = 0.4, Color = colorsModule.Black },
	IconEmphasis = { Transparency = 0, Color = colorsModule.Flint },
	IconOnHover = { Transparency = 0, Color = colorsModule.Flint },
	TextEmphasis = { Transparency = 0, Color = colorsModule.Flint },
	TextDefault = { Transparency = 0, Color = colorsModule.Smoke },
	TextMuted = { Transparency = 0.4, Color = colorsModule.Black },
	TextLink = { Transparency = 0, Color = colorsModule.Blue },
	Divider = { Transparency = 0, Color = colorsModule.Pumice },
	Overlay = { Transparency = 0.7, Color = colorsModule.Black },
	DropShadow = { Transparency = 0.7, Color = colorsModule.Black },
	NavigationBar = { Transparency = 0, Color = colorsModule.White },
	PlaceHolder = { Transparency = 0.9, Color = colorsModule.Black },
	OnlineStatus = { Transparency = 0, Color = colorsModule.Green },
	OfflineStatus = { Transparency = 0.5, Color = colorsModule.Black },
	Success = { Transparency = 0, Color = colorsModule.Green },
	Alert = { Transparency = 0, Color = colorsModule.Red },
	Badge = { Transparency = 0, Color = colorsModule.Flint },
	BadgeContent = { Transparency = 0, Color = colorsModule.White },
	SelectionCursor = {
		Transparency = 0,
		GradientRotationSpeed = 2,
		Color = colorsModule.XboxBlue,
		AnimatedColor = colorsModule.White,
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
		Color = colorsModule.White
	},
	ItemBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/itemBG_light",
		Color = colorsModule.White
	}
}