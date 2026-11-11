local Color = { Transparency = 0, Color3 = Color3.new() }
local Typography = {
	FontSize = 0,
	LineHeight = 0,
	LetterSpacing = 0,
	Font = Enum.Font.Unknown
}

return {
	Global = {
		Size_0 = 0,
		Size_25 = 0,
		Size_50 = 0,
		Size_75 = 0,
		Size_100 = 0,
		Size_125 = 0,
		Size_150 = 0,
		Size_175 = 0,
		Size_200 = 0,
		Size_250 = 0,
		Size_300 = 0,
		Size_350 = 0,
		Size_400 = 0,
		Size_450 = 0,
		Size_500 = 0,
		Size_600 = 0,
		Size_700 = 0,
		Size_800 = 0,
		Size_900 = 0,
		Size_1000 = 0,
		Size_1100 = 0,
		Size_1200 = 0,
		Size_1300 = 0,
		Size_1400 = 0,
		Space_0 = 0,
		Space_25 = 0,
		Space_50 = 0,
		Space_75 = 0,
		Space_100 = 0,
		Space_125 = 0,
		Space_150 = 0,
		Space_175 = 0,
		Space_200 = 0,
		Space_250 = 0,
		Space_300 = 0,
		Space_400 = 0,
		Space_500 = 0,
		Space_600 = 0,
		Space_800 = 0,
		Space_1000 = 0,
		FontSize_25 = 0,
		FontSize_50 = 0,
		FontSize_75 = 0,
		FontSize_100 = 0,
		FontSize_200 = 0,
		FontSize_300 = 0,
		FontSize_400 = 0,
		FontSize_500 = 0,
		FontSize_600 = 0,
		FontSize_700 = 0,
		FontSize_800 = 0,
		FontSize_900 = 0,
		FontSize_1000 = 0,
		Family = { Standard = "" },
		Weight_300 = "",
		Weight_400 = "",
		Weight_600 = "",
		Weight_700 = "",
		Weight_900 = "",
		LetterSpacing = { Default = 0, Tight = 0, Loose = 0 },
		LineHeight_100 = 0,
		LineHeight_200 = 0,
		LineHeight_300 = 0,
		LineHeight_400 = 0,
		Stroke_50 = 0,
		Stroke_100 = 0,
		Stroke_150 = 0,
		Stroke_200 = 0,
		Stroke_250 = 0,
		Stroke_300 = 0,
		Stroke_400 = 0,
		Opacity_0 = 0,
		Opacity_8 = 0,
		Opacity_12 = 0,
		Opacity_16 = 0,
		Opacity_32 = 0,
		Opacity_68 = 0,
		Opacity_84 = 0,
		Opacity_88 = 0,
		Opacity_92 = 0,
		Opacity_100 = 0,
		Color = {
			Black = Color,
			White = Color,
			Green = Color,
			Red = Color,
			Blue = Color,
			Carbon = Color,
			Flint = Color,
			Graphite = Color,
			Obsidian = Color,
			Pumice = Color,
			Slate = Color,
			Alabaster = Color,
			Ash = Color,
			Chalk = Color,
			Smoke = Color,
			None = Color
		}
	},
	Semantic = {
		Typography = {
			Title = Typography,
			Header = Typography,
			Subheader = Typography,
			Body = Typography,
			CaptionHeader = Typography,
			CaptionBody = Typography,
			Footer = Typography
		},
		Color = {
			Background = {
				Default = Color,
				Contrast = Color,
				Muted = Color,
				OnHover = Color,
				OnPress = Color
			},
			BackgroundUi = { Default = Color, Contrast = Color },
			Ui = { Default = Color, Muted = Color, Emphasis = Color },
			Text = {
				Default = Color,
				Muted = Color,
				Emphasis = Color,
				Link = Color,
				Inverse = Color
			},
			Icon = { Default = Color, Emphasis = Color, OnHover = Color },
			Action = {
				Primary = { Background = Color, Border = Color, Content = Color },
				PrimaryBrand = { Background = Color, Border = Color, Content = Color },
				Secondary = { Background = Color, Border = Color, Content = Color },
				Alert = { Background = Color, Border = Color, Content = Color },
				Subtle = { Background = Color, Border = Color, Content = Color }
			},
			State = {
				Standard = { Default = Color, Hover = Color, Pressed = Color },
				Lighten = { Default = Color, Hover = Color, Pressed = Color },
				Inverse = { Default = Color, Hover = Color, Pressed = Color },
				Darken = { Default = Color, Hover = Color, Pressed = Color }
			},
			Focus = { Start = Color, End = Color, Gradient = Color },
			Common = {
				Divider = Color,
				Overlay = Color,
				DropShadow = Color,
				NavigationBar = Color,
				Badge = Color,
				BadgeContent = Color,
				Placeholder = Color,
				Online = Color,
				Offline = Color,
				Alert = Color,
				Success = Color
			}
		},
		Radius = {
			None = 0,
			Small = 0,
			Medium = 0,
			Large = 0,
			XLarge = 0,
			Circle = 0
		},
		Icon = {
			Size = {
				Small = 0,
				Medium = 0,
				Large = 0,
				XLarge = 0,
				XxLarge = 0
			}
		},
		Stroke = { Input = 0, Focus = 0 },
		Offset = { Focus = { Standard = 0, Inset = 0 } },
		Opacity = {
			State = {
				Lighten = { Hover = 0, Pressed = 0 },
				Darken = { Hover = 0, Pressed = 0 }
			}
		}
	},
	Component = {
		VerticalTile = {
			Base = {
				Container = {
					BorderWidth = 0,
					Background = Color,
					BorderColor = Color,
					DropShadow = { X = 0, Y = 0, Blur = 0, Color = Color },
					BorderRadius = {
						LeadingTop = 0,
						TrailingTop = 0,
						TrailingBottom = 0,
						LeadingBottom = 0
					}
				},
				ContentTop = {
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				},
				ContentBottom = {
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				}
			}
		},
		PlayerTileSmall = {
			Base = {
				Container = {
					Gap = 0,
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				},
				Image = {
					Size = 0,
					BorderRadius = 0,
					BorderWidth = 0,
					BackgroundColor = Color,
					BorderColor = Color
				},
				Status = {
					Size = 0,
					BorderWidth = 0,
					BackgroundColor = Color,
					BorderColor = Color
				},
				Content = { Gap = 0, Typography = Typography, ContentColor = Color },
				Icon = { Size = 0 },
				Presence = { ContentColor = Color }
			}
		},
		Facepile = {
			Container = { Gap = 0 },
			FaceGroup = { Gap = 0 },
			Face = {
				BorderWidth = 0,
				BorderRadius = 0,
				Width = 0,
				Height = 0,
				BackgroundColor = Color,
				BorderColor = Color
			},
			Badge = {
				BorderWidth = 0,
				BorderRadius = 0,
				Spacing = 0,
				Height = 0,
				MinWidth = 0,
				BackgroundColor = Color,
				BorderColor = Color,
				ContentColor = Color,
				Typography = Typography
			},
			Label = { ContentColor = Color, Typography = Typography }
		},
		ControllerBar = {
			Gap = 0,
			BackgroundColor = Color,
			BorderRadius = {
				LeadingTop = 0,
				TrailingTop = 0,
				TrailingBottom = 0,
				LeadingBottom = 0
			},
			Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
		},
		ControllerBarShortcut = {
			Container = { Gap = 0, ContentColor = Color },
			Icon = { Size = 0 },
			Label = { Typography = Typography }
		},
		SelectionCursor = {
			BorderWidth = 0,
			Offset = 0,
			Inset = 0,
			Gradient = { Start = Color, End = Color }
		},
		StateLayer = {
			Base = { BorderWidth = 0 },
			Standard = {
				Initialize = { Color = Color },
				Default = { Color = Color },
				Hover = { Color = Color },
				Pressed = { Color = Color },
				Selected = { Color = Color },
				SelectedPressed = { Color = Color },
				Disabled = { Color = Color }
			},
			Lighten = {
				Initialize = { Color = Color },
				Default = { Color = Color },
				Hover = { Color = Color },
				Pressed = { Color = Color },
				Selected = { Color = Color },
				SelectedPressed = { Color = Color },
				Disabled = { Color = Color }
			},
			Inverse = {
				Initialize = { Color = Color },
				Default = { Color = Color },
				Hover = { Color = Color },
				Pressed = { Color = Color },
				Selected = { Color = Color },
				SelectedPressed = { Color = Color },
				Disabled = { Color = Color }
			},
			Darken = {
				Initialize = { Color = Color },
				Default = { Color = Color },
				Hover = { Color = Color },
				Pressed = { Color = Color },
				Selected = { Color = Color },
				SelectedPressed = { Color = Color },
				Disabled = { Color = Color }
			}
		},
		MenuCell = {
			Base = {
				Container = {
					Height = 0,
					BorderWidth = 0,
					ContentColor = Color,
					BackgroundColor = Color,
					BorderColor = Color,
					BorderRadius = {
						TopLeading = 0,
						TopTrailing = 0,
						BottomTrailing = 0,
						BottomLeading = 0
					},
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				},
				IconFrame = { Size = 0 },
				TextFrame = {
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				},
				Text = { Typography = Typography },
				CheckFrame = { Size = 0 }
			},
			Divider = { Container = { BorderWidth = 0 } },
			Disabled = { Container = { ContentColor = Color } },
			HasRoundBottom = {
				Container = { BorderRadius = { BottomTrailing = 0, BottomLeading = 0 } }
			},
			HasRoundTop = {
				Container = { BorderRadius = { TopLeading = 0, TopTrailing = 0 } }
			}
		},
		BaseMenu = { BorderRadius = 0, BackgroundColor = Color },
		StatGroup = { Gap = 0 },
		StatItem = {
			Container = { Gap = 0, ContentColor = Color },
			Icon = { Size = 0 },
			Label = { Typography = Typography }
		},
		MediaTile = { Container = { BorderRadius = 0 }, Icon = { Size = 0 } },
		StatWidget = {
			Container = { Gap = 0, ContentColor = Color },
			Icon = { Size = 0 },
			DataGroup = { Gap = 0 },
			Data = { Typography = Typography },
			Label = { Typography = Typography }
		},
		RateCount = {
			Container = {
				Spacing = 0,
				Gap = 0,
				BorderRadius = 0,
				BackgroundColor = Color
			},
			ButtonGroup = { Gap = 0 }
		},
		PlayerCount = {
			Container = { Spacing = 0, BorderRadius = 0, BackgroundColor = Color }
		},
		VerticalScrollView = {
			Base = {
				Handle = {
					BorderRadius = 0,
					BackgroundColor = Color,
					ContentColor = Color
				},
				Icon = { Size = 0 },
				Track = { Opacity = 0, Spacing = { Top = 0, Bottom = 0 } }
			},
			Compact = { Handle = { Width = 0 }, Track = { Width = 0 } },
			Wide = { Handle = { Width = 0 }, Track = { Width = 0 } },
			Gamepad = { Handle = { Width = 0 }, Track = { Width = 0 } }
		},
		TextField = {
			Base = {
				Field = {
					BorderRadius = 0,
					Gap = 0,
					Opacity = 0,
					BorderColor = Color,
					Typography = Typography,
					Spacing = { Leading = 0, Trailing = 0 }
				},
				PlaceholderText = { ContentColor = Color },
				FieldValue = { ContentColor = Color },
				IconLeading = { Size = 0, ContentColor = Color }
			},
			Error = { Field = { BorderColor = Color } },
			Disabled = { Field = { Opacity = 0 } }
		},
		InputLabel = {
			Base = {
				Opacity = 0,
				Typography = Typography,
				ContentColor = Color,
				Spacing = { Bottom = 0 }
			},
			Disabled = { Opacity = 0 }
		},
		HelperText = {
			Base = {
				Opacity = 0,
				Typography = Typography,
				ContentColor = Color,
				Padding = { Top = 0 }
			},
			Error = { ContentColor = Color }
		}
	}
}