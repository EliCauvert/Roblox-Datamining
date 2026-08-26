local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local globalConfigModule = require(script.Parent.Parent.GlobalConfig)
local var1 = t.strictInterface({
	themeKey = t.optional(t.string),
	fontKey = t.optional(t.string),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	Text = t.string,
	TextColor3 = t.optional(t.Color3),
	TextTransparency = t.optional(t.numberConstrained(0, 1)),
	TextWrapped = t.optional(t.boolean),
	TextXAlignment = t.optional(t.enum(Enum.TextXAlignment)),
	TextYAlignment = t.optional(t.enum(Enum.TextYAlignment)),
	TextTruncate = t.optional(t.enum(Enum.TextTruncate)),
	Visible = t.optional(t.boolean),
	ZIndex = t.optional(t.integer),
	AutomaticSize = t.optional(t.enum(Enum.AutomaticSize)),
	[roact.Children] = t.optional(t.table)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withFoundationOrUIBloxStyle (ref), cryo (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withFoundationOrUIBloxStyle(function(p2)
		return {
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
		-- upvalues: p1 (ref), cryo (copy), roact (copy)
		local var2 = p2.Theme[p1.themeKey or "TextDefault"]
		local var3 = p2.Font[p1.fontKey or "Body"]
		
		return roact.createElement("TextLabel", cryo.Dictionary.join({
			TextColor3 = var2.Color,
			TextTransparency = var2.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = cryo.None,
			themeKey = cryo.None,
			Font = var3.Font,
			TextSize = var3.RelativeSize * p2.Font.BaseSize
		}))
	end)
end