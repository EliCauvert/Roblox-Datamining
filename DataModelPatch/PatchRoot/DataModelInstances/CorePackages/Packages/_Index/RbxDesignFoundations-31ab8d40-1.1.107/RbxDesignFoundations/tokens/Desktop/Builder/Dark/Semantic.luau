return {
	Typography = {
		Title = {
			FontSize = 35.28,
			LineHeight = 1.032,
			LetterSpacing = -0.01,
			Font = Enum.Font.BuilderSansBold
		},
		Header = {
			FontSize = 25.2,
			LineHeight = 0.952,
			LetterSpacing = -0.01,
			Font = Enum.Font.BuilderSansBold
		},
		Subheader = {
			FontSize = 20.16,
			LineHeight = 1.111,
			LetterSpacing = 0,
			Font = Enum.Font.BuilderSansBold
		},
		Body = {
			FontSize = 20.16,
			LineHeight = 1.111,
			LetterSpacing = 0,
			Font = Enum.Font.BuilderSans
		},
		CaptionHeader = {
			FontSize = 15.12,
			LineHeight = 1.032,
			LetterSpacing = 0.01,
			Font = Enum.Font.BuilderSansMedium
		},
		CaptionBody = {
			FontSize = 15.12,
			LineHeight = 1.032,
			LetterSpacing = 0,
			Font = Enum.Font.BuilderSans
		},
		Footer = {
			FontSize = 12.6,
			LineHeight = 1.111,
			LetterSpacing = 0.01,
			Font = Enum.Font.BuilderSansMedium
		}
	},
	Color = {
		Background = {
			Default = {
				Transparency = 0,
				Color3 = Color3.new(0.13725, 0.1451, 0.15294)
			},
			Contrast = {
				Transparency = 0,
				Color3 = Color3.new(0.09804, 0.10588, 0.11373)
			},
			Muted = {
				Transparency = 0,
				Color3 = Color3.new(0.06667, 0.07059, 0.07843)
			},
			OnHover = { Transparency = 0.9, Color3 = Color3.new(1, 1, 1) },
			OnPress = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) }
		},
		BackgroundUi = {
			Default = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			},
			Contrast = { Transparency = 0.3, Color3 = Color3.new(0, 0, 0) }
		},
		Ui = {
			Default = {
				Transparency = 0,
				Color3 = Color3.new(0.39608, 0.4, 0.40784)
			},
			Muted = {
				Transparency = 0.2,
				Color3 = Color3.new(0.06667, 0.07059, 0.07843)
			},
			Emphasis = { Transparency = 0.7, Color3 = Color3.new(1, 1, 1) }
		},
		Text = {
			Default = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			},
			Muted = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) },
			Emphasis = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			Link = {
				Transparency = 0,
				Color3 = Color3.new(0.32157, 0.67843, 0.95686)
			},
			Inverse = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			}
		},
		Icon = {
			Default = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) },
			Emphasis = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			OnHover = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		Action = {
			Primary = {
				Background = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				Border = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Content = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			PrimaryBrand = {
				Background = {
					Transparency = 0,
					Color3 = Color3.new(0, 0.70588, 0.42745)
				},
				Border = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Content = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			},
			Secondary = {
				Background = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Border = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				Content = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			},
			Alert = {
				Background = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Border = {
					Transparency = 0,
					Color3 = Color3.new(0.96863, 0.29412, 0.32157)
				},
				Content = {
					Transparency = 0,
					Color3 = Color3.new(0.96863, 0.29412, 0.32157)
				}
			},
			Subtle = {
				Background = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Border = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Content = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			}
		},
		State = {
			Standard = {
				Default = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Hover = { Transparency = 0.88, Color3 = Color3.new(1, 1, 1) },
				Pressed = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Lighten = {
				Default = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Hover = { Transparency = 0.88, Color3 = Color3.new(1, 1, 1) },
				Pressed = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Inverse = {
				Default = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Hover = { Transparency = 0.88, Color3 = Color3.new(0, 0, 0) },
				Pressed = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			},
			Darken = {
				Default = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
				Hover = { Transparency = 0.88, Color3 = Color3.new(0, 0, 0) },
				Pressed = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			}
		},
		Focus = {
			Start = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			End = {
				Transparency = 0,
				Color3 = Color3.new(0.39608, 0.4, 0.40784)
			},
			Gradient = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		Common = {
			Divider = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) },
			Overlay = { Transparency = 0.5, Color3 = Color3.new(0, 0, 0) },
			DropShadow = { Transparency = 0.5, Color3 = Color3.new(0, 0, 0) },
			NavigationBar = {
				Transparency = 0,
				Color3 = Color3.new(0.09804, 0.10588, 0.11373)
			},
			Badge = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			BadgeContent = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			},
			Placeholder = {
				Transparency = 0.5,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			},
			Online = {
				Transparency = 0,
				Color3 = Color3.new(0, 0.70588, 0.42745)
			},
			Offline = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) },
			Alert = {
				Transparency = 0,
				Color3 = Color3.new(0.96863, 0.29412, 0.32157)
			},
			Success = {
				Transparency = 0,
				Color3 = Color3.new(0, 0.70588, 0.42745)
			}
		}
	},
	Radius = {
		None = 0,
		Small = 4,
		Medium = 8,
		Large = 12,
		XLarge = 16,
		Circle = 9999
	},
	Icon = {
		Size = {
			Small = 16,
			Medium = 36,
			Large = 48,
			XLarge = 96,
			XxLarge = 192
		}
	},
	Stroke = { Input = 1, Focus = 2 },
	Offset = { Focus = { Standard = 6, Inset = 0 } },
	Opacity = {
		State = {
			Lighten = { Hover = 0.88, Pressed = 0.8 },
			Darken = { Hover = 0.88, Pressed = 0.8 }
		}
	}
}