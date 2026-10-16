local function cloneTokenValue(List) --[[ Line: 1 ]]
	-- upvalues: cloneTokenValue (copy)
	if type(List) ~= "table" then
		return List
	end
	local t = {}
	
	for i, value in List do
		t[i] = cloneTokenValue(value)
	end
	return t
end

return {
	getDeprecatedSemanticTokens = function(p1, p2: number) --[[ Line: 14 ]]
		-- upvalues: cloneTokenValue (copy)
		return (cloneTokenValue({
			Color = {
				Background = {
					Default = p1.Color.Surface.Surface_0,
					Contrast = p1.Color.Surface.Surface_100,
					Muted = p1.Color.Surface.Surface_200,
					OnHover = p1.Color.State.Hover,
					OnPress = p1.Color.State.Press
				},
				BackgroundUi = {
					Default = p1.Color.Surface.Surface_300,
					Contrast = p1.Color.OverMedia.OverMedia_0
				},
				Ui = {
					Default = p1.Color.Shift.Shift_200,
					Muted = p1.Color.Shift.Shift_100,
					Emphasis = p1.Color.Shift.Shift_400
				},
				Focus = {
					Start = p1.Color.Selection.Start,
					End = p1.Color.Selection.End,
					Gradient = p1.Color.Selection.Start
				},
				State = {
					Standard = {
						Default = p1.Color.State.Idle,
						Hover = p1.Color.State.Hover,
						Pressed = p1.Color.State.Press
					},
					Inverse = {
						Default = p1.Inverse.State.Idle,
						Hover = p1.Inverse.State.Hover,
						Pressed = p1.Inverse.State.Press
					},
					Darken = {
						Default = p1.LightMode.State.Idle,
						Hover = p1.LightMode.State.Hover,
						Pressed = p1.LightMode.State.Press
					},
					Lighten = {
						Default = p1.DarkMode.State.Idle,
						Hover = p1.DarkMode.State.Hover,
						Pressed = p1.DarkMode.State.Press
					}
				},
				Text = {
					Emphasis = p1.Color.Content.Emphasis,
					Default = p1.Color.Content.Default,
					Muted = p1.Color.Content.Muted,
					Link = p1.Color.Content.Link,
					Inverse = p1.Inverse.Content.Default
				},
				Icon = {
					Emphasis = p1.Color.Content.Emphasis,
					Default = p1.Color.Content.Default,
					OnHover = p1.Color.Content.Emphasis
				},
				Common = {
					Divider = p1.Color.Stroke.Emphasis,
					Overlay = p1.Color.Common.Scrim,
					DropShadow = p1.Color.Common.Shadow,
					NavigationBar = p1.Color.Common.NavigationBar,
					Placeholder = p1.Color.Common.Shimmer,
					Badge = p1.Color.System.Contrast,
					BadgeContent = p1.Inverse.Content.Emphasis,
					Online = p1.Color.System.Success,
					Offline = p1.Color.System.Neutral,
					Alert = p1.Color.System.Alert,
					Success = p1.Color.System.Success
				},
				Action = {
					PrimaryBrand = {
						Background = p1.Color.ActionEmphasis.Background,
						Content = p1.Color.ActionEmphasis.Foreground,
						Border = p1.Color.ActionEmphasis.Border
					},
					Primary = {
						Background = p1.Color.ActionSubEmphasis.Background,
						Content = p1.Color.ActionSubEmphasis.Foreground,
						Border = p1.Color.ActionSubEmphasis.Border
					},
					Secondary = {
						Background = p1.Color.ActionSubtle.Background,
						Content = p1.Color.ActionSubtle.Foreground,
						Border = p1.Color.ActionSubtle.Border
					},
					Subtle = {
						Background = p1.Color.ActionLink.Background,
						Content = p1.Color.ActionLink.Foreground,
						Border = p1.Color.ActionLink.Border
					},
					Alert = {
						Background = p1.Color.ActionAlert.Background,
						Content = p1.Color.ActionAlert.Foreground,
						Border = p1.Color.ActionAlert.Border
					}
				}
			},
			Icon = {
				Size = {
					Small = p1.Size.Size_400,
					Medium = p1.Size.Size_900,
					Large = p1.Size.Size_1200,
					XLarge = p1.Size.Size_2400,
					XXLarge = p2 * 192
				}
			},
			Offset = {
				Focus = { Standard = p1.Size.Size_150, Inset = p1.Size.Size_0 }
			},
			Opacity = {
				State = {
					Lighten = { Hover = 0.88, Pressed = 0.8 },
					Darken = { Hover = 0.88, Pressed = 0.8 }
				}
			},
			Radius = {
				None = p1.Radius.None,
				Small = p1.Radius.Small,
				Medium = p1.Radius.Medium,
				Large = p1.Size.Size_300,
				XLarge = p1.Radius.Large,
				Circle = p1.Radius.Circle
			},
			Stroke = { Input = p1.Stroke.Standard, Focus = p1.Stroke.Thick },
			Typography = {
				Title = {
					Font = p1.Typography.HeadingLarge.Font,
					FontSize = p1.Typography.HeadingLarge.FontSize,
					LetterSpacing = p1.Typography.HeadingLarge.LetterSpacing,
					LineHeight = p1.LineHeight.LineHeight_130
				},
				Header = {
					Font = p1.Typography.HeadingSmall.Font,
					FontSize = p1.Typography.HeadingSmall.FontSize,
					LetterSpacing = p1.Typography.HeadingSmall.LetterSpacing,
					LineHeight = p1.Typography.HeadingSmall.LineHeight
				},
				Subheader = {
					Font = p1.Typography.TitleLarge.Font,
					FontSize = p1.Typography.TitleLarge.FontSize,
					LetterSpacing = p1.Typography.TitleLarge.LetterSpacing,
					LineHeight = p1.Typography.TitleLarge.LineHeight
				},
				Body = {
					Font = p1.Typography.BodyLarge.Font,
					FontSize = p1.Typography.BodyLarge.FontSize,
					LetterSpacing = p1.Typography.BodyLarge.LetterSpacing,
					LineHeight = p1.Typography.BodyLarge.LineHeight
				},
				CaptionHeader = {
					Font = p1.Typography.CaptionLarge.Font,
					FontSize = p1.FontSize.FontSize_300,
					LetterSpacing = p1.Typography.BodyLarge.LetterSpacing,
					LineHeight = p1.LineHeight.LineHeight_130
				},
				CaptionBody = {
					Font = p1.Typography.BodySmall.Font,
					FontSize = p1.Typography.BodySmall.FontSize,
					LetterSpacing = p1.Typography.BodySmall.LetterSpacing,
					LineHeight = p1.LineHeight.LineHeight_130
				},
				Footer = {
					Font = p1.Typography.CaptionSmall.Font,
					FontSize = p1.Typography.CaptionSmall.FontSize,
					LetterSpacing = p1.Typography.BodyLarge.LetterSpacing,
					LineHeight = p1.Typography.CaptionSmall.LineHeight
				}
			}
		}))
	end
}