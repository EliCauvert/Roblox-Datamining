local t = { Transparency = 0, Color = Color3.fromRGB(0, 0, 0) }
local t_1 = {
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
}
local t_2 = {
	Transparency = 0,
	Image = "",
	Color = Color3.fromRGB(0, 0, 0)
}
local t_3 = {
	RelativeSize = 1,
	RelativeMinSize = 1,
	Font = Enum.Font.GothamMedium
}

return {
	Theme = {
		BackgroundDefault = t,
		BackgroundContrast = t,
		BackgroundMuted = t,
		BackgroundUIDefault = t,
		BackgroundUIContrast = t,
		BackgroundOnHover = t,
		BackgroundOnPress = t,
		UIDefault = t,
		UIMuted = t,
		UIEmphasis = t,
		ContextualPrimaryDefault = t,
		ContextualPrimaryOnHover = t,
		ContextualPrimaryContent = t,
		SystemPrimaryDefault = t,
		SystemPrimaryOnHover = t,
		SystemPrimaryContent = t,
		SecondaryDefault = t,
		SecondaryOnHover = t,
		SecondaryContent = t,
		IconDefault = t,
		IconEmphasis = t,
		IconOnHover = t,
		TextEmphasis = t,
		TextDefault = t,
		TextMuted = t,
		TextLink = t,
		Divider = t,
		Overlay = t,
		DropShadow = t,
		NavigationBar = t,
		PlaceHolder = t,
		OnlineStatus = t,
		OfflineStatus = t,
		Success = t,
		Alert = t,
		Badge = t,
		BadgeContent = t,
		SelectionCursor = t_1,
		PlayerBackgroundDefault = t_2,
		ItemBackgroundDefault = t_2
	},
	Font = {
		BaseSize = 10,
		Title = t_3,
		Header1 = t_3,
		Header2 = t_3,
		SubHeader1 = t_3,
		Body = t_3,
		CaptionHeader = t_3,
		CaptionSubHeader = t_3,
		CaptionBody = t_3,
		Footer = t_3,
		HeadingLarge = t_3,
		HeadingSmall = t_3,
		TitleLarge = t_3,
		BodyLarge = t_3,
		CaptionLarge = t_3,
		BodySmall = t_3,
		CaptionSmall = t_3
	},
	Settings = { PreferredTransparency = 0.56, ReducedMotion = true }
}