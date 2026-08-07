-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local tModule = require(parent.Parent.t)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local validateThemedBackgroundImageInfoModule = require(parent.Core.Style.Validator.validateThemedBackgroundImageInfo)

return tModule.strictInterface({
	BackgroundDefault = validateColorInfoModule,
	BackgroundContrast = validateColorInfoModule,
	BackgroundMuted = validateColorInfoModule,
	BackgroundUIDefault = validateColorInfoModule,
	BackgroundUIContrast = validateColorInfoModule,
	BackgroundOnHover = validateColorInfoModule,
	BackgroundOnPress = validateColorInfoModule,
	UIDefault = validateColorInfoModule,
	UIMuted = validateColorInfoModule,
	UIEmphasis = validateColorInfoModule,
	ContextualPrimaryDefault = validateColorInfoModule,
	ContextualPrimaryOnHover = validateColorInfoModule,
	ContextualPrimaryContent = validateColorInfoModule,
	SystemPrimaryDefault = validateColorInfoModule,
	SystemPrimaryOnHover = validateColorInfoModule,
	SystemPrimaryContent = validateColorInfoModule,
	SecondaryDefault = validateColorInfoModule,
	SecondaryOnHover = validateColorInfoModule,
	SecondaryContent = validateColorInfoModule,
	IconDefault = validateColorInfoModule,
	IconEmphasis = validateColorInfoModule,
	IconOnHover = validateColorInfoModule,
	TextEmphasis = validateColorInfoModule,
	TextDefault = validateColorInfoModule,
	TextMuted = validateColorInfoModule,
	TextLink = validateColorInfoModule,
	Divider = validateColorInfoModule,
	Overlay = validateColorInfoModule,
	DropShadow = validateColorInfoModule,
	NavigationBar = validateColorInfoModule,
	PlaceHolder = validateColorInfoModule,
	OnlineStatus = validateColorInfoModule,
	OfflineStatus = validateColorInfoModule,
	Success = validateColorInfoModule,
	Alert = validateColorInfoModule,
	Badge = validateColorInfoModule,
	BadgeContent = validateColorInfoModule,
	SelectionCursor = require(parent.Core.Style.Validator.validateSelectionCursorInfo),
	PlayerBackgroundDefault = validateThemedBackgroundImageInfoModule,
	ItemBackgroundDefault = validateThemedBackgroundImageInfoModule
})