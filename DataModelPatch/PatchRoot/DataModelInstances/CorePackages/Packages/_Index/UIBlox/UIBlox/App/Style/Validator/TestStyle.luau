local Alert = { Transparency = 0, Color = Color3.fromRGB(0, 0, 0) }
local ItemBackgroundDefault = {
	Transparency = 0,
	Image = "",
	Color = Color3.fromRGB(0, 0, 0)
}
local Body = {
	RelativeSize = 1,
	RelativeMinSize = 1,
	Font = Enum.Font.GothamMedium
}

return {
	Theme = {
		BackgroundDefault = Alert,
		BackgroundContrast = Alert,
		BackgroundMuted = Alert,
		BackgroundUIDefault = Alert,
		BackgroundUIContrast = Alert,
		BackgroundOnHover = Alert,
		BackgroundOnPress = Alert,
		UIDefault = Alert,
		UIMuted = Alert,
		UIEmphasis = Alert,
		ContextualPrimaryDefault = Alert,
		ContextualPrimaryOnHover = Alert,
		ContextualPrimaryContent = Alert,
		SystemPrimaryDefault = Alert,
		SystemPrimaryOnHover = Alert,
		SystemPrimaryContent = Alert,
		SecondaryDefault = Alert,
		SecondaryOnHover = Alert,
		SecondaryContent = Alert,
		IconDefault = Alert,
		IconEmphasis = Alert,
		IconOnHover = Alert,
		TextEmphasis = Alert,
		TextDefault = Alert,
		TextMuted = Alert,
		TextLink = Alert,
		Divider = Alert,
		Overlay = Alert,
		DropShadow = Alert,
		NavigationBar = Alert,
		PlaceHolder = Alert,
		OnlineStatus = Alert,
		OfflineStatus = Alert,
		Success = Alert,
		Alert = Alert,
		Badge = Alert,
		BadgeContent = Alert,
		SelectionCursor = {
			Transparency = 0,
			GradientRotationSpeed = 2,
			Color = Color3.new(0.086, 0.678, 0.847),
			AnimatedColor = Color3.new(1, 1, 1),
			GradientColorSequence = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)),
				ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
			}),
			GradientTransparencySequence = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 0)
			})
		},
		PlayerBackgroundDefault = ItemBackgroundDefault,
		ItemBackgroundDefault = ItemBackgroundDefault
	},
	Font = {
		BaseSize = 10,
		Title = Body,
		Header1 = Body,
		Header2 = Body,
		SubHeader1 = Body,
		Body = Body,
		CaptionHeader = Body,
		CaptionSubHeader = Body,
		CaptionBody = Body,
		Footer = Body,
		HeadingLarge = Body,
		HeadingSmall = Body,
		TitleLarge = Body,
		BodyLarge = Body,
		CaptionLarge = Body,
		BodySmall = Body,
		CaptionSmall = Body
	},
	Settings = { PreferredTransparency = 0.56, ReducedMotion = true }
}