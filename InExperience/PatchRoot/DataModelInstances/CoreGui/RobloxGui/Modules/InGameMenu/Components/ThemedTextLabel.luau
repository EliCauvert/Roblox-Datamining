local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local globalConfigModule = require(script.Parent.Parent.GlobalConfig)
local var3 = t.strictInterface({
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

return function(p0)
	-- upvalues: globalConfigModule (ref), var3 (ref), withFoundationOrUIBloxStyle (ref), cryo (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var3(p0))
	end
	return withFoundationOrUIBloxStyle(function(p1)
		return {
			Theme = {
				BackgroundDefault = {
					Color = p1.Color.Surface.Surface_0.Color3,
					Transparency = p1.Color.Surface.Surface_0.Transparency
				},
				BackgroundContrast = {
					Color = p1.Color.Surface.Surface_100.Color3,
					Transparency = p1.Color.Surface.Surface_100.Transparency
				},
				BackgroundMuted = {
					Color = p1.Color.Surface.Surface_200.Color3,
					Transparency = p1.Color.Surface.Surface_200.Transparency
				},
				BackgroundUIDefault = {
					Color = p1.Color.Surface.Surface_300.Color3,
					Transparency = p1.Color.Surface.Surface_300.Transparency
				},
				BackgroundUIContrast = {
					Color = p1.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p1.Color.OverMedia.OverMedia_0.Transparency
				},
				BackgroundOnHover = {
					Color = p1.Color.State.Hover.Color3,
					Transparency = p1.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p1.Color.State.Press.Color3,
					Transparency = p1.Color.State.Press.Transparency
				},
				UIDefault = {
					Color = p1.Color.Shift.Shift_200.Color3,
					Transparency = p1.Color.Shift.Shift_200.Transparency
				},
				UIMuted = {
					Color = p1.Color.Shift.Shift_100.Color3,
					Transparency = p1.Color.Shift.Shift_100.Transparency
				},
				UIEmphasis = {
					Color = p1.Color.Shift.Shift_400.Color3,
					Transparency = p1.Color.Shift.Shift_400.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p1.Color.ActionEmphasis.Background.Color3,
					Transparency = p1.Color.ActionEmphasis.Background.Transparency
				},
				ContextualPrimaryContent = {
					Color = p1.Color.ActionEmphasis.Foreground.Color3,
					Transparency = p1.Color.ActionEmphasis.Foreground.Transparency
				},
				SystemPrimaryDefault = {
					Color = p1.Color.ActionSubEmphasis.Background.Color3,
					Transparency = p1.Color.ActionSubEmphasis.Background.Transparency
				},
				SystemPrimaryContent = {
					Color = p1.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p1.Color.ActionSubEmphasis.Foreground.Transparency
				},
				IconDefault = {
					Color = p1.Color.Content.Default.Color3,
					Transparency = p1.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = p1.Color.Content.Emphasis.Color3,
					Transparency = p1.Color.Content.Emphasis.Transparency
				},
				IconOnHover = {
					Color = p1.Color.Content.Emphasis.Color3,
					Transparency = p1.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = p1.Color.Content.Emphasis.Color3,
					Transparency = p1.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = p1.Color.Content.Default.Color3,
					Transparency = p1.Color.Content.Default.Transparency
				},
				TextMuted = {
					Color = p1.Color.Content.Muted.Color3,
					Transparency = p1.Color.Content.Muted.Transparency
				},
				TextLink = {
					Color = p1.Color.Content.Link.Color3,
					Transparency = p1.Color.Content.Link.Transparency
				},
				Divider = {
					Color = p1.Color.Stroke.Emphasis.Color3,
					Transparency = p1.Color.Stroke.Emphasis.Transparency
				},
				Overlay = {
					Color = p1.Color.Common.Scrim.Color3,
					Transparency = p1.Color.Common.Scrim.Transparency
				},
				DropShadow = {
					Color = p1.Color.Common.Shadow.Color3,
					Transparency = p1.Color.Common.Shadow.Transparency
				},
				NavigationBar = {
					Color = p1.Color.Common.NavigationBar.Color3,
					Transparency = p1.Color.Common.NavigationBar.Transparency
				},
				PlaceHolder = {
					Color = p1.Color.Common.Shimmer.Color3,
					Transparency = p1.Color.Common.Shimmer.Transparency
				},
				OnlineStatus = {
					Color = p1.Color.System.Success.Color3,
					Transparency = p1.Color.System.Success.Transparency
				},
				OfflineStatus = {
					Color = p1.Color.System.Neutral.Color3,
					Transparency = p1.Color.System.Neutral.Transparency
				},
				Success = {
					Color = p1.Color.System.Success.Color3,
					Transparency = p1.Color.System.Success.Transparency
				},
				Alert = {
					Color = p1.Color.System.Alert.Color3,
					Transparency = p1.Color.System.Alert.Transparency
				},
				Badge = {
					Color = p1.Color.System.Contrast.Color3,
					Transparency = p1.Color.System.Contrast.Transparency
				},
				BadgeContent = {
					Color = p1.Inverse.Content.Emphasis.Color3,
					Transparency = p1.Inverse.Content.Emphasis.Transparency
				},
				SecondaryContent = {
					Color = p1.Color.Extended.White.White_70.Color3,
					Transparency = p1.Color.Extended.White.White_70.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Title = {
					Font = p1.Typography.HeadingLarge.Font,
					RelativeSize = p1.Typography.HeadingLarge.FontSize
				},
				Header1 = {
					Font = p1.Typography.HeadingSmall.Font,
					RelativeSize = p1.Typography.HeadingSmall.FontSize
				},
				Header2 = {
					Font = p1.Typography.TitleLarge.Font,
					RelativeSize = p1.Typography.TitleLarge.FontSize
				},
				SubHeader1 = {
					Font = p1.Typography.TitleLarge.Font,
					RelativeSize = p1.Typography.TitleLarge.FontSize
				},
				Body = {
					Font = p1.Typography.BodyLarge.Font,
					RelativeSize = p1.Typography.BodyLarge.FontSize
				},
				CaptionHeader = {
					Font = p1.Typography.CaptionLarge.Font,
					RelativeSize = p1.Typography.CaptionLarge.FontSize
				},
				CaptionSubHeader = {
					Font = p1.Typography.CaptionLarge.Font,
					RelativeSize = p1.Typography.CaptionLarge.FontSize
				},
				CaptionBody = {
					Font = p1.Typography.BodySmall.Font,
					RelativeSize = p1.Typography.BodySmall.FontSize
				},
				Footer = {
					Font = p1.Typography.CaptionSmall.Font,
					RelativeSize = p1.Typography.CaptionSmall.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: p0 (ref), cryo (copy), roact (copy)
		local var4 = p2.Theme[p0.themeKey or "TextDefault"]
		local var5 = p2.Font[p0.fontKey or "Body"]
		
		return roact.createElement("TextLabel", cryo.Dictionary.join({
			TextColor3 = var4.Color,
			TextTransparency = var4.Transparency
		}, p0, {
			BackgroundTransparency = 1,
			fontKey = cryo.None,
			themeKey = cryo.None,
			Font = var5.Font,
			TextSize = var5.RelativeSize * p2.Font.BaseSize
		}))
	end)
end