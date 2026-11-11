local ColorsModule = require(script.Parent.Colors)
local CorePackages = game:GetService("CorePackages")
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local DeprecatedLightThemeModule = {
	Color = { Background = ColorsModule.Alabaster },
	ContextPrimaryButton = {
		Transparency = 0,
		DisabledTransparency = 0.5,
		LoadingTransparency = 0.5,
		OnPressTransparency = 0.5,
		Color = ColorsModule.Green,
		DisabledColor = ColorsModule.Green,
		OnPressColor = ColorsModule.Green,
		Text = { Transparency = 0, Color = ColorsModule.White },
		Border = { Hidden = true }
	},
	SecondaryButton = {
		Transparency = 1,
		OnPressTransparency = 0.5,
		DisabledTransparency = 0.5,
		Color = ColorsModule.Smoke,
		HoverColor = ColorsModule.Flint,
		OnPressColor = ColorsModule.Smoke,
		DisabledColor = ColorsModule.Smoke,
		Text = { Transparency = 0.5, Color = ColorsModule.Black },
		Border = {
			Hidden = false,
			Transparency = 0.5,
			Color = ColorsModule.Black
		}
	},
	IconButton = {
		Fill = {
			Off = { Transparency = 0.9, Color = ColorsModule.Black },
			On = { Transparency = 1, Color = ColorsModule.Black },
			OnPress = { Transparency = 0.95, Color = ColorsModule.Black },
			Loading = { Transparency = 0.9, Color = ColorsModule.Black },
			Disabled = { Transparency = 0.95, Color = ColorsModule.Black }
		},
		Border = {
			Off = { Transparency = 0.5, Color = ColorsModule.Black },
			On = { Transparency = 0.5, Color = ColorsModule.Black },
			OnPress = { Transparency = 0.75, Color = ColorsModule.Black },
			Loading = { Transparency = 0.5, Color = ColorsModule.Black },
			Disabled = { Transparency = 0.75, Color = ColorsModule.Black }
		},
		Icon = {
			Off = { Transparency = 0.5, Color = ColorsModule.Black },
			On = { Transparency = 0, Color = ColorsModule.Green },
			OnPress = { Transparency = 0.5, Color = ColorsModule.Green },
			Loading = { Transparency = 0.5, Color = ColorsModule.Black },
			Disabled = { Transparency = 0.5, Color = ColorsModule.Black }
		}
	},
	EmptyStatePage = { ErrorMessage = { Color = ColorsModule.Gray3 } },
	ShimmerAnimation = {
		Transparency = 0,
		Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_lightTheme.png",
		AspectRatio = 0.876
	},
	ShimmerPanel = { Transparency = 0.5, Color = ColorsModule.Alabaster },
	ContextualMenu = {
		Cells = {
			Icon = {
				Transparency = 0.5,
				OnTransparency = 0,
				DisabledTransparency = 0.5,
				Color = ColorsModule.Flint,
				OnColor = ColorsModule.Green
			},
			Content = {
				DisabledTransparency = 0.5,
				Color = ColorsModule.Flint,
				DisabledColor = ColorsModule.Flint
			},
			Background = {
				OnPressTransparency = 0.9,
				OnPressColor = ColorsModule.Black
			}
		},
		Background = { Color = ColorsModule.Alabaster },
		Title = {
			Transparency = 0,
			DisabledTransparency = 0.5,
			Color = ColorsModule.Flint
		},
		Divider = { Color = ColorsModule.Pumice },
		Cancel = { Color = ColorsModule.Smoke }
	},
	AlertWindow = {
		Background = { Color = ColorsModule.Alabaster },
		Title = { Color = ColorsModule.Flint },
		Message = { Color = ColorsModule.Graphite },
		Divider = { Color = ColorsModule.Pumice }
	},
	GameDetails = {
		Text = {
			Font = Enum.Font.SourceSans,
			BoldFont = Enum.Font.SourceSansBold,
			Color = {
				Main = ColorsModule.White,
				Secondary = ColorsModule.Pumice
			}
		},
		GameBasicStats = {
			Transparency = 0.3,
			Color = ColorsModule.White,
			Font = Enum.Font.SourceSans
		},
		GameInfoList = {
			DividerColor = ColorsModule.Graphite,
			Cells = {
				Background = {
					Color = ColorsModule.Black,
					Transparency = { Default = 1, Pressed = 0.7 }
				}
			}
		},
		Rating = {
			Background = { Transparency = 0.7, Color = ColorsModule.White }
		},
		Carousel = { Text = { Color = ColorsModule.Flint } },
		TopBar = { Icon = { Color = ColorsModule.Slate } },
		LoadingView = {
			BackgroundImage = {
				Image = "rbxasset://textures/ui/LuaApp/graphic/GameDetailsBackground/loadingBkg_base.jpg",
				Size = Vector2.new(500, 500),
				Tint = { Transparency = 0.45, Color = ColorsModule.Ash }
			}
		},
		SocialMediaButton = { Transparency = 0, OnPressTransparency = 0.5 }
	},
	GameMediaAccordion = {
		Item = {
			BackgroundTransparency = 0.5,
			BackgroundColor = ColorsModule.Flint
		},
		FakeItem = {
			Loading = {
				BaseTransparency = 0.5,
				TransparencyStep = 0.25,
				Color = ColorsModule.Flint
			},
			Loaded = {
				BaseTransparency = 0.5,
				TransparencyStep = 0.25,
				Color = ColorsModule.White
			}
		},
		VideoIconColor = ColorsModule.White
	},
	GameCard = {
		Background = { Transparency = 0, Color = ColorsModule.White },
		Title = { Font = Enum.Font.SourceSans, Color = ColorsModule.Flint },
		GameBasicStats = {
			Transparency = 0.5,
			Color = ColorsModule.Black,
			Font = Enum.Font.SourceSans
		}
	},
	ChatTopBar = {
		Background = { Transparency = 0, Color = ColorsModule.ChatTopBarWhite },
		Title = {
			Size = 22,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.Flint
		},
		Subtitle = {
			Size = 14,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.Flint
		}
	},
	BottomBar = {
		Background = { Transparency = 0, Color = ColorsModule.White },
		TopBorder = { Transparency = 0, Color = ColorsModule.Pumice }
	},
	BottomBarButton = {
		Icon = {
			Off = { Transparency = 0.5, Color = ColorsModule.Flint },
			On = { Transparency = 0, Color = ColorsModule.Flint }
		},
		Title = { Size = 14, Font = AppFonts.default:getMedium() }
	},
	NumericalBadge = {
		Text = {
			Size = 12,
			Font = AppFonts.default:getMedium(),
			Color = ColorsModule.White
		},
		Border = {
			Default = { Transparency = 1, Color = ColorsModule.White },
			AppChrome = { Transparency = 0, Color = ColorsModule.White }
		},
		Inner = { Transparency = 0, Color = ColorsModule.Flint }
	},
	MorePage = {
		Background = { Transparency = 0, Color = ColorsModule.Alabaster },
		List = {
			Background = { Transparency = 0, Color = ColorsModule.White },
			Divider = { Transparency = 0, Color = ColorsModule.Pumice }
		},
		Button = {
			Background = {
				Default = { Transparency = 0, Color = ColorsModule.White },
				Pressed = { Transparency = 0, Color = ColorsModule.Alabaster }
			},
			Text = {
				Size = 19,
				Transparency = 0,
				Font = AppFonts.default:getMedium(),
				Color = ColorsModule.Smoke
			},
			Icon = { Transparency = 0, Color = ColorsModule.White },
			RightImage = { Transparency = 0, Color = ColorsModule.White }
		},
		Footer = {
			Size = 12,
			Transparency = 0,
			Font = AppFonts.default:getMedium(),
			Color = ColorsModule.Smoke
		}
	},
	EventsPage = {
		Text = {
			Size = 19,
			Transparency = 0.5,
			Font = AppFonts.default:getDefault(),
			Color = ColorsModule.Black
		}
	},
	PremiumIcon = { Transparency = 0, Color = ColorsModule.Flint }
}
DeprecatedLightThemeModule.RetryButton = DeprecatedLightThemeModule.SecondaryButton
DeprecatedLightThemeModule.Main = {
	Background = { Color = ColorsModule.Alabaster },
	Foreground = { Color = ColorsModule.White },
	TitleText = { Color = ColorsModule.Flint },
	BodyText = {
		Font = AppFonts.default:getDefault(),
		Color = ColorsModule.Smoke
	},
	Divider = { Color = ColorsModule.Pumice }
}
DeprecatedLightThemeModule.Buttons = {}
DeprecatedLightThemeModule.Buttons.AgreementButton = {
	Text = {
		Font = AppFonts.default:getDefault(),
		Color = ColorsModule.Smoke
	}
}
DeprecatedLightThemeModule.Widget = {
	Header = {
		Text = {
			Font = AppFonts.default:getBold(),
			Color = ColorsModule.White
		}
	},
	Background = {
		[FormFactor.UNKNOWN] = { Transparency = 0, Color = ColorsModule.Carbon },
		[FormFactor.WIDE] = { Transparency = 0, Color = ColorsModule.Carbon },
		[FormFactor.COMPACT] = { Transparency = 0.3, Color = ColorsModule.Black }
	},
	ContentText = {
		Color = ColorsModule.Gray4,
		Font = AppFonts.default:getDefault()
	}
}
DeprecatedLightThemeModule.ScrollingFrameWithScrollBar = {
	ScrollBar = { Transparency = 0.7, Color = ColorsModule.Black }
}

return DeprecatedLightThemeModule