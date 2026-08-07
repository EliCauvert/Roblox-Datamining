local t = { Transparency = 0, Color = Color3.fromRGB(255, 0, 255) }
local t_1 = {
	RelativeSize = 1,
	RelativeMinSize = 1,
	Font = Enum.Font.GothamSemibold
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
		BadgeContent = t
	},
	Font = {
		BaseSize = 10,
		Title = t_1,
		Header1 = t_1,
		Header2 = t_1,
		SubHeader1 = t_1,
		Body = t_1,
		CaptionHeader = t_1,
		CaptionSubHeader = t_1,
		CaptionBody = t_1,
		Footer = t_1
	}
}