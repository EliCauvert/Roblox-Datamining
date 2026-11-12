local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local GlobalConfigModule = require(script.Parent.Parent.GlobalConfig)
local config = {
	Title = "HeadingLarge",
	Header1 = "HeadingSmall",
	Header2 = "TitleLarge",
	SubHeader1 = "TitleLarge",
	Body = "BodyLarge",
	CaptionHeader = "CaptionLarge",
	CaptionSubHeader = "CaptionLarge",
	CaptionBody = "BodySmall",
	Footer = "CaptionSmall"
}
local StrictInterfaceResult = T.strictInterface({
	themeKey = T.optional(T.string),
	fontKey = T.optional(T.string),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	Size = T.optional(T.UDim2),
	Text = T.string,
	TextColor3 = T.optional(T.Color3),
	TextTransparency = T.optional(T.numberConstrained(0, 1)),
	TextWrapped = T.optional(T.boolean),
	TextXAlignment = T.optional(T.enum(Enum.TextXAlignment)),
	TextYAlignment = T.optional(T.enum(Enum.TextYAlignment)),
	TextTruncate = T.optional(T.enum(Enum.TextTruncate)),
	Visible = T.optional(T.boolean),
	ZIndex = T.optional(T.integer),
	AutomaticSize = T.optional(T.enum(Enum.AutomaticSize)),
	[Roact.Children] = T.optional(T.table)
})

return function(p1)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), config (copy), NormalizeFontFaceFunction (copy), Cryo (copy), Roact (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
			Theme = {
				BackgroundDefault = {
					Color = p2.Color.Surface.Surface_0.Color3,
					Transparency = p2.Color.Surface.Surface_0.Transparency
				},
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				},
				BackgroundMuted = {
					Color = p2.Color.Surface.Surface_200.Color3,
					Transparency = p2.Color.Surface.Surface_200.Transparency
				},
				BackgroundUIDefault = {
					Color = p2.Color.Surface.Surface_300.Color3,
					Transparency = p2.Color.Surface.Surface_300.Transparency
				},
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				},
				BackgroundOnHover = {
					Color = p2.Color.State.Hover.Color3,
					Transparency = p2.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p2.Color.State.Press.Color3,
					Transparency = p2.Color.State.Press.Transparency
				},
				UIDefault = {
					Color = p2.Color.Shift.Shift_200.Color3,
					Transparency = p2.Color.Shift.Shift_200.Transparency
				},
				UIMuted = {
					Color = p2.Color.Shift.Shift_100.Color3,
					Transparency = p2.Color.Shift.Shift_100.Transparency
				},
				UIEmphasis = {
					Color = p2.Color.Shift.Shift_400.Color3,
					Transparency = p2.Color.Shift.Shift_400.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p2.Color.ActionEmphasis.Background.Color3,
					Transparency = p2.Color.ActionEmphasis.Background.Transparency
				},
				ContextualPrimaryContent = {
					Color = p2.Color.ActionEmphasis.Foreground.Color3,
					Transparency = p2.Color.ActionEmphasis.Foreground.Transparency
				},
				SystemPrimaryDefault = {
					Color = p2.Color.ActionSubEmphasis.Background.Color3,
					Transparency = p2.Color.ActionSubEmphasis.Background.Transparency
				},
				SystemPrimaryContent = {
					Color = p2.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p2.Color.ActionSubEmphasis.Foreground.Transparency
				},
				IconDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				IconOnHover = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				TextMuted = {
					Color = p2.Color.Content.Muted.Color3,
					Transparency = p2.Color.Content.Muted.Transparency
				},
				TextLink = {
					Color = p2.Color.Content.Link.Color3,
					Transparency = p2.Color.Content.Link.Transparency
				},
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				},
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				},
				DropShadow = {
					Color = p2.Color.Common.Shadow.Color3,
					Transparency = p2.Color.Common.Shadow.Transparency
				},
				NavigationBar = {
					Color = p2.Color.Common.NavigationBar.Color3,
					Transparency = p2.Color.Common.NavigationBar.Transparency
				},
				PlaceHolder = {
					Color = p2.Color.Common.Shimmer.Color3,
					Transparency = p2.Color.Common.Shimmer.Transparency
				},
				OnlineStatus = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				},
				OfflineStatus = {
					Color = p2.Color.System.Neutral.Color3,
					Transparency = p2.Color.System.Neutral.Transparency
				},
				Success = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				},
				Alert = {
					Color = p2.Color.System.Alert.Color3,
					Transparency = p2.Color.System.Alert.Transparency
				},
				Badge = {
					Color = p2.Color.System.Contrast.Color3,
					Transparency = p2.Color.System.Contrast.Transparency
				},
				BadgeContent = {
					Color = p2.Inverse.Content.Emphasis.Color3,
					Transparency = p2.Inverse.Content.Emphasis.Transparency
				},
				SecondaryContent = {
					Color = p2.Color.Extended.White.White_70.Color3,
					Transparency = p2.Color.Extended.White.White_70.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Title = {
					Font = p2.Typography.HeadingLarge.Font,
					RelativeSize = p2.Typography.HeadingLarge.FontSize
				},
				Header1 = {
					Font = p2.Typography.HeadingSmall.Font,
					RelativeSize = p2.Typography.HeadingSmall.FontSize
				},
				Header2 = {
					Font = p2.Typography.TitleLarge.Font,
					RelativeSize = p2.Typography.TitleLarge.FontSize
				},
				SubHeader1 = {
					Font = p2.Typography.TitleLarge.Font,
					RelativeSize = p2.Typography.TitleLarge.FontSize
				},
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				},
				CaptionHeader = {
					Font = p2.Typography.CaptionLarge.Font,
					RelativeSize = p2.Typography.CaptionLarge.FontSize
				},
				CaptionSubHeader = {
					Font = p2.Typography.CaptionLarge.Font,
					RelativeSize = p2.Typography.CaptionLarge.FontSize
				},
				CaptionBody = {
					Font = p2.Typography.BodySmall.Font,
					RelativeSize = p2.Typography.BodySmall.FontSize
				},
				Footer = {
					Font = p2.Typography.CaptionSmall.Font,
					RelativeSize = p2.Typography.CaptionSmall.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: p1 (copy), FoundationFontFaceMigration (upval), config (upval), NormalizeFontFaceFunction (upval), Cryo (upval), Roact (upval)
		local ThemeEntry = p2.Theme[p1.themeKey or "TextDefault"]
		local v1 = p2.Font[p1.fontKey or "Body"]
		
		return Roact.createElement("TextLabel", (Cryo.Dictionary.join({
			TextColor3 = ThemeEntry.Color,
			TextTransparency = ThemeEntry.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = Cryo.None,
			themeKey = Cryo.None,
			Font = if FoundationFontFaceMigration then Cryo.None else v1.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction((p2.Tokens.Typography[config[p1.fontKey or "Body"]] or v1).Font) else nil,
			TextSize = v1.RelativeSize * p2.Font.BaseSize
		})))
	end)
end