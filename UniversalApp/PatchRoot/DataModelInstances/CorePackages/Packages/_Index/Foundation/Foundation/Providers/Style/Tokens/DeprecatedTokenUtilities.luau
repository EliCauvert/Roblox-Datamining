local function cloneTokenValue(p1)
	-- upvalues: cloneTokenValue (ref)
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in p1 do
		t[i] = cloneTokenValue(v)
	end
	return t
end

return {
	getDeprecatedSemanticTokens = function(p2, p3)
		-- upvalues: cloneTokenValue (ref)
		return cloneTokenValue({
			Color = {
				Background = {
					Default = p2.Color.Surface.Surface_0,
					Contrast = p2.Color.Surface.Surface_100,
					Muted = p2.Color.Surface.Surface_200,
					OnHover = p2.Color.State.Hover,
					OnPress = p2.Color.State.Press
				},
				BackgroundUi = {
					Default = p2.Color.Surface.Surface_300,
					Contrast = p2.Color.OverMedia.OverMedia_0
				},
				Ui = {
					Default = p2.Color.Shift.Shift_200,
					Muted = p2.Color.Shift.Shift_100,
					Emphasis = p2.Color.Shift.Shift_400
				},
				Focus = {
					Start = p2.Color.Selection.Start,
					End = p2.Color.Selection.End,
					Gradient = p2.Color.Selection.Start
				},
				State = {
					Standard = {
						Default = p2.Color.State.Idle,
						Hover = p2.Color.State.Hover,
						Pressed = p2.Color.State.Press
					},
					Inverse = {
						Default = p2.Inverse.State.Idle,
						Hover = p2.Inverse.State.Hover,
						Pressed = p2.Inverse.State.Press
					},
					Darken = {
						Default = p2.LightMode.State.Idle,
						Hover = p2.LightMode.State.Hover,
						Pressed = p2.LightMode.State.Press
					},
					Lighten = {
						Default = p2.DarkMode.State.Idle,
						Hover = p2.DarkMode.State.Hover,
						Pressed = p2.DarkMode.State.Press
					}
				},
				Text = {
					Emphasis = p2.Color.Content.Emphasis,
					Default = p2.Color.Content.Default,
					Muted = p2.Color.Content.Muted,
					Link = p2.Color.Content.Link,
					Inverse = p2.Inverse.Content.Default
				},
				Icon = {
					Emphasis = p2.Color.Content.Emphasis,
					Default = p2.Color.Content.Default,
					OnHover = p2.Color.Content.Emphasis
				},
				Common = {
					Divider = p2.Color.Stroke.Emphasis,
					Overlay = p2.Color.Common.Scrim,
					DropShadow = p2.Color.Common.Shadow,
					NavigationBar = p2.Color.Common.NavigationBar,
					Placeholder = p2.Color.Common.Shimmer,
					Badge = p2.Color.System.Contrast,
					BadgeContent = p2.Inverse.Content.Emphasis,
					Online = p2.Color.System.Success,
					Offline = p2.Color.System.Neutral,
					Alert = p2.Color.System.Alert,
					Success = p2.Color.System.Success
				},
				Action = {
					PrimaryBrand = {
						Background = p2.Color.ActionEmphasis.Background,
						Content = p2.Color.ActionEmphasis.Foreground,
						Border = p2.Color.ActionEmphasis.Border
					},
					Primary = {
						Background = p2.Color.ActionSubEmphasis.Background,
						Content = p2.Color.ActionSubEmphasis.Foreground,
						Border = p2.Color.ActionSubEmphasis.Border
					},
					Secondary = {
						Background = p2.Color.ActionSubtle.Background,
						Content = p2.Color.ActionSubtle.Foreground,
						Border = p2.Color.ActionSubtle.Border
					},
					Subtle = {
						Background = p2.Color.ActionLink.Background,
						Content = p2.Color.ActionLink.Foreground,
						Border = p2.Color.ActionLink.Border
					},
					Alert = {
						Background = p2.Color.ActionAlert.Background,
						Content = p2.Color.ActionAlert.Foreground,
						Border = p2.Color.ActionAlert.Border
					}
				}
			},
			Icon = {
				Size = {
					Small = p2.Size.Size_400,
					Medium = p2.Size.Size_900,
					Large = p2.Size.Size_1200,
					XLarge = p2.Size.Size_2400,
					XXLarge = p3 * 192
				}
			},
			Offset = {
				Focus = { Standard = p2.Size.Size_150, Inset = p2.Size.Size_0 }
			},
			Opacity = {
				State = {
					Lighten = { Hover = 0.88, Pressed = 0.8 },
					Darken = { Hover = 0.88, Pressed = 0.8 }
				}
			},
			Radius = {
				None = p2.Radius.None,
				Small = p2.Radius.Small,
				Medium = p2.Radius.Medium,
				Large = p2.Size.Size_300,
				XLarge = p2.Radius.Large,
				Circle = p2.Radius.Circle
			},
			Stroke = { Input = p2.Stroke.Standard, Focus = p2.Stroke.Thick },
			Typography = {
				Title = {
					Font = p2.Typography.HeadingLarge.Font,
					FontSize = p2.Typography.HeadingLarge.FontSize,
					LetterSpacing = p2.Typography.HeadingLarge.LetterSpacing,
					LineHeight = p2.LineHeight.LineHeight_130
				},
				Header = {
					Font = p2.Typography.HeadingSmall.Font,
					FontSize = p2.Typography.HeadingSmall.FontSize,
					LetterSpacing = p2.Typography.HeadingSmall.LetterSpacing,
					LineHeight = p2.Typography.HeadingSmall.LineHeight
				},
				Subheader = {
					Font = p2.Typography.TitleLarge.Font,
					FontSize = p2.Typography.TitleLarge.FontSize,
					LetterSpacing = p2.Typography.TitleLarge.LetterSpacing,
					LineHeight = p2.Typography.TitleLarge.LineHeight
				},
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					FontSize = p2.Typography.BodyLarge.FontSize,
					LetterSpacing = p2.Typography.BodyLarge.LetterSpacing,
					LineHeight = p2.Typography.BodyLarge.LineHeight
				},
				CaptionHeader = {
					Font = p2.Typography.CaptionLarge.Font,
					FontSize = p2.FontSize.FontSize_300,
					LetterSpacing = p2.Typography.BodyLarge.LetterSpacing,
					LineHeight = p2.LineHeight.LineHeight_130
				},
				CaptionBody = {
					Font = p2.Typography.BodySmall.Font,
					FontSize = p2.Typography.BodySmall.FontSize,
					LetterSpacing = p2.Typography.BodySmall.LetterSpacing,
					LineHeight = p2.LineHeight.LineHeight_130
				},
				Footer = {
					Font = p2.Typography.CaptionSmall.Font,
					FontSize = p2.Typography.CaptionSmall.FontSize,
					LetterSpacing = p2.Typography.BodyLarge.LetterSpacing,
					LineHeight = p2.Typography.CaptionSmall.LineHeight
				}
			}
		})
	end
}