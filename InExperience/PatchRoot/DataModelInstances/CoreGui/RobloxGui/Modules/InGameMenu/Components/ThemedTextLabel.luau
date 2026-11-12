local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local NormalizeFontFaceFunction = require(CorePackages.Packages.Foundation).Utility.normalizeFontFace
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
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithFoundationOrUIBloxStyleFunction (copy), config (copy), NormalizeFontFaceFunction (copy), Cryo (copy), Roact (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithFoundationOrUIBloxStyleFunction(function(Tokens)
		return {
			Tokens = Tokens,
			Theme = {
				BackgroundDefault = {
					Color = Tokens.Color.Surface.Surface_0.Color3,
					Transparency = Tokens.Color.Surface.Surface_0.Transparency
				},
				BackgroundContrast = {
					Color = Tokens.Color.Surface.Surface_100.Color3,
					Transparency = Tokens.Color.Surface.Surface_100.Transparency
				},
				BackgroundMuted = {
					Color = Tokens.Color.Surface.Surface_200.Color3,
					Transparency = Tokens.Color.Surface.Surface_200.Transparency
				},
				BackgroundUIDefault = {
					Color = Tokens.Color.Surface.Surface_300.Color3,
					Transparency = Tokens.Color.Surface.Surface_300.Transparency
				},
				BackgroundUIContrast = {
					Color = Tokens.Color.OverMedia.OverMedia_0.Color3,
					Transparency = Tokens.Color.OverMedia.OverMedia_0.Transparency
				},
				BackgroundOnHover = {
					Color = Tokens.Color.State.Hover.Color3,
					Transparency = Tokens.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = Tokens.Color.State.Press.Color3,
					Transparency = Tokens.Color.State.Press.Transparency
				},
				UIDefault = {
					Color = Tokens.Color.Shift.Shift_200.Color3,
					Transparency = Tokens.Color.Shift.Shift_200.Transparency
				},
				UIMuted = {
					Color = Tokens.Color.Shift.Shift_100.Color3,
					Transparency = Tokens.Color.Shift.Shift_100.Transparency
				},
				UIEmphasis = {
					Color = Tokens.Color.Shift.Shift_400.Color3,
					Transparency = Tokens.Color.Shift.Shift_400.Transparency
				},
				ContextualPrimaryDefault = {
					Color = Tokens.Color.ActionEmphasis.Background.Color3,
					Transparency = Tokens.Color.ActionEmphasis.Background.Transparency
				},
				ContextualPrimaryContent = {
					Color = Tokens.Color.ActionEmphasis.Foreground.Color3,
					Transparency = Tokens.Color.ActionEmphasis.Foreground.Transparency
				},
				SystemPrimaryDefault = {
					Color = Tokens.Color.ActionSubEmphasis.Background.Color3,
					Transparency = Tokens.Color.ActionSubEmphasis.Background.Transparency
				},
				SystemPrimaryContent = {
					Color = Tokens.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = Tokens.Color.ActionSubEmphasis.Foreground.Transparency
				},
				IconDefault = {
					Color = Tokens.Color.Content.Default.Color3,
					Transparency = Tokens.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = Tokens.Color.Content.Emphasis.Color3,
					Transparency = Tokens.Color.Content.Emphasis.Transparency
				},
				IconOnHover = {
					Color = Tokens.Color.Content.Emphasis.Color3,
					Transparency = Tokens.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = Tokens.Color.Content.Emphasis.Color3,
					Transparency = Tokens.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = Tokens.Color.Content.Default.Color3,
					Transparency = Tokens.Color.Content.Default.Transparency
				},
				TextMuted = {
					Color = Tokens.Color.Content.Muted.Color3,
					Transparency = Tokens.Color.Content.Muted.Transparency
				},
				TextLink = {
					Color = Tokens.Color.Content.Link.Color3,
					Transparency = Tokens.Color.Content.Link.Transparency
				},
				Divider = {
					Color = Tokens.Color.Stroke.Emphasis.Color3,
					Transparency = Tokens.Color.Stroke.Emphasis.Transparency
				},
				Overlay = {
					Color = Tokens.Color.Common.Scrim.Color3,
					Transparency = Tokens.Color.Common.Scrim.Transparency
				},
				DropShadow = {
					Color = Tokens.Color.Common.Shadow.Color3,
					Transparency = Tokens.Color.Common.Shadow.Transparency
				},
				NavigationBar = {
					Color = Tokens.Color.Common.NavigationBar.Color3,
					Transparency = Tokens.Color.Common.NavigationBar.Transparency
				},
				PlaceHolder = {
					Color = Tokens.Color.Common.Shimmer.Color3,
					Transparency = Tokens.Color.Common.Shimmer.Transparency
				},
				OnlineStatus = {
					Color = Tokens.Color.System.Success.Color3,
					Transparency = Tokens.Color.System.Success.Transparency
				},
				OfflineStatus = {
					Color = Tokens.Color.System.Neutral.Color3,
					Transparency = Tokens.Color.System.Neutral.Transparency
				},
				Success = {
					Color = Tokens.Color.System.Success.Color3,
					Transparency = Tokens.Color.System.Success.Transparency
				},
				Alert = {
					Color = Tokens.Color.System.Alert.Color3,
					Transparency = Tokens.Color.System.Alert.Transparency
				},
				Badge = {
					Color = Tokens.Color.System.Contrast.Color3,
					Transparency = Tokens.Color.System.Contrast.Transparency
				},
				BadgeContent = {
					Color = Tokens.Inverse.Content.Emphasis.Color3,
					Transparency = Tokens.Inverse.Content.Emphasis.Transparency
				},
				SecondaryContent = {
					Color = Tokens.Color.Extended.White.White_70.Color3,
					Transparency = Tokens.Color.Extended.White.White_70.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Title = {
					Font = Tokens.Typography.HeadingLarge.Font,
					RelativeSize = Tokens.Typography.HeadingLarge.FontSize
				},
				Header1 = {
					Font = Tokens.Typography.HeadingSmall.Font,
					RelativeSize = Tokens.Typography.HeadingSmall.FontSize
				},
				Header2 = {
					Font = Tokens.Typography.TitleLarge.Font,
					RelativeSize = Tokens.Typography.TitleLarge.FontSize
				},
				SubHeader1 = {
					Font = Tokens.Typography.TitleLarge.Font,
					RelativeSize = Tokens.Typography.TitleLarge.FontSize
				},
				Body = {
					Font = Tokens.Typography.BodyLarge.Font,
					RelativeSize = Tokens.Typography.BodyLarge.FontSize
				},
				CaptionHeader = {
					Font = Tokens.Typography.CaptionLarge.Font,
					RelativeSize = Tokens.Typography.CaptionLarge.FontSize
				},
				CaptionSubHeader = {
					Font = Tokens.Typography.CaptionLarge.Font,
					RelativeSize = Tokens.Typography.CaptionLarge.FontSize
				},
				CaptionBody = {
					Font = Tokens.Typography.BodySmall.Font,
					RelativeSize = Tokens.Typography.BodySmall.FontSize
				},
				Footer = {
					Font = Tokens.Typography.CaptionSmall.Font,
					RelativeSize = Tokens.Typography.CaptionSmall.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: p1 (copy), config (upval), NormalizeFontFaceFunction (upval), Cryo (upval), Roact (upval)
		local ThemeEntry = p2.Theme[p1.themeKey or "TextDefault"]
		local v1 = p2.Font[p1.fontKey or "Body"]
		
		return Roact.createElement("TextLabel", (Cryo.Dictionary.join({
			TextColor3 = ThemeEntry.Color,
			TextTransparency = ThemeEntry.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = Cryo.None,
			themeKey = Cryo.None,
			Font = Cryo.None,
			FontFace = NormalizeFontFaceFunction((p2.Tokens.Typography[config[p1.fontKey or "Body"]] or v1).Font),
			TextSize = v1.RelativeSize * p2.Font.BaseSize
		})))
	end)
end