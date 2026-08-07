local colorsModule = require(script.Parent.Parent.Colors)

return {
	BackgroundDefault = { Transparency = 0, Color = colorsModule.Slate },
	BackgroundContrast = { Transparency = 0, Color = colorsModule.Carbon },
	BackgroundMuted = { Transparency = 0, Color = colorsModule.Obsidian },
	BackgroundUIDefault = { Transparency = 0, Color = colorsModule.Flint },
	BackgroundUIContrast = { Transparency = 0.3, Color = colorsModule.Black },
	BackgroundOnHover = { Transparency = 0.9, Color = colorsModule.White },
	BackgroundOnPress = { Transparency = 0.7, Color = colorsModule.Black },
	UIDefault = { Transparency = 0, Color = colorsModule.Graphite },
	UIMuted = { Transparency = 0.2, Color = colorsModule.Obsidian },
	UIEmphasis = { Transparency = 0.7, Color = colorsModule.White },
	ContextualPrimaryDefault = { Transparency = 0, Color = colorsModule.Green },
	ContextualPrimaryOnHover = { Transparency = 0, Color = colorsModule.Green },
	ContextualPrimaryContent = { Transparency = 0, Color = colorsModule.White },
	SystemPrimaryDefault = { Transparency = 0, Color = colorsModule.White },
	SystemPrimaryOnHover = { Transparency = 0, Color = colorsModule.White },
	SystemPrimaryContent = { Transparency = 0, Color = colorsModule.Flint },
	SecondaryDefault = { Transparency = 0.3, Color = colorsModule.White },
	SecondaryOnHover = { Transparency = 0, Color = colorsModule.White },
	SecondaryContent = { Transparency = 0.3, Color = colorsModule.White },
	IconDefault = { Transparency = 0.3, Color = colorsModule.White },
	IconEmphasis = { Transparency = 0, Color = colorsModule.White },
	IconOnHover = { Transparency = 0, Color = colorsModule.White },
	TextEmphasis = { Transparency = 0, Color = colorsModule.White },
	TextDefault = { Transparency = 0, Color = colorsModule.Pumice },
	TextMuted = { Transparency = 0.3, Color = colorsModule.White },
	TextLink = { Transparency = 0, Color = colorsModule.Blue },
	Divider = { Transparency = 0.8, Color = colorsModule.White },
	Overlay = { Transparency = 0.5, Color = colorsModule.Black },
	DropShadow = { Transparency = 0.5, Color = colorsModule.Black },
	NavigationBar = { Transparency = 0, Color = colorsModule.Carbon },
	PlaceHolder = { Transparency = 0.5, Color = colorsModule.Flint },
	OnlineStatus = { Transparency = 0, Color = colorsModule.Green },
	OfflineStatus = { Transparency = 0.3, Color = colorsModule.White },
	Success = { Transparency = 0, Color = colorsModule.Green },
	Alert = { Transparency = 0, Color = colorsModule.Red },
	Badge = { Transparency = 0, Color = colorsModule.White },
	BadgeContent = { Transparency = 0, Color = colorsModule.Flint },
	SelectionCursor = {
		Transparency = 0,
		GradientRotationSpeed = 2,
		Color = colorsModule.White,
		AnimatedColor = colorsModule.White,
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
		Color = colorsModule.White
	},
	ItemBackgroundDefault = {
		Transparency = 0,
		Image = "component_assets/itemBG_dark",
		Color = colorsModule.Black
	}
}