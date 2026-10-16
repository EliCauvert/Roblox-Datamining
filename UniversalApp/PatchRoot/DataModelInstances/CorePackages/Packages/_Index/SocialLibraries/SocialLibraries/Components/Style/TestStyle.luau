local Alert = { Transparency = 0, Color = Color3.fromRGB(255, 0, 255) }
local Body = {
	RelativeSize = 1,
	RelativeMinSize = 1,
	Font = Enum.Font.GothamSemibold
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
		BadgeContent = Alert
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
		Footer = Body
	}
}