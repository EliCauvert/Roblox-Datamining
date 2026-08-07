-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:59 2026 Pacific Standard Time.

return {
	Typography = {
		Title = {
			FontSize = 51,
			LineHeight = 1.2,
			LetterSpacing = 0,
			Font = Enum.Font.GothamBlack
		},
		Header = {
			FontSize = 30,
			LineHeight = 1.4,
			LetterSpacing = 0,
			Font = Enum.Font.GothamBold
		},
		Subheader = {
			FontSize = 24,
			LineHeight = 1.25,
			LetterSpacing = 0,
			Font = Enum.Font.GothamMedium
		},
		Body = {
			FontSize = 24,
			LineHeight = 1.25,
			LetterSpacing = 0,
			Font = Enum.Font.Gotham
		},
		CaptionHeader = {
			FontSize = 18,
			LineHeight = 1.15,
			LetterSpacing = 0,
			Font = Enum.Font.GothamMedium
		},
		CaptionBody = {
			FontSize = 18,
			LineHeight = 1.15,
			LetterSpacing = 0,
			Font = Enum.Font.Gotham
		},
		Footer = {
			FontSize = 15,
			LineHeight = 1.2,
			LetterSpacing = 0,
			Font = Enum.Font.GothamMedium
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
		Small = 6,
		Medium = 12,
		Large = 18,
		XLarge = 24,
		Circle = 9999
	},
	Icon = {
		Size = {
			Small = 24,
			Medium = 54,
			Large = 72,
			XLarge = 144,
			XxLarge = 288
		}
	},
	Stroke = { Input = 1.5, Focus = 3 },
	Offset = { Focus = { Standard = 9, Inset = 0 } },
	Opacity = {
		State = {
			Lighten = { Hover = 0.88, Pressed = 0.8 },
			Darken = { Hover = 0.88, Pressed = 0.8 }
		}
	}
}