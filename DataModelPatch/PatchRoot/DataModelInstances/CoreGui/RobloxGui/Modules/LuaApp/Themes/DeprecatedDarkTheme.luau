local CorePackages = game:GetService("CorePackages")
local ColorsModule = require(script.Parent.Colors)
local ButtonStateModule = require(script.Parent.Parent.Enum.ButtonState)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local DeprecatedDarkThemeModule = {
	Name = "dark",
	Color = { Background = ColorsModule.Slate },
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
		Color = ColorsModule.Pumice,
		HoverColor = ColorsModule.White,
		OnPressColor = ColorsModule.Pumice,
		DisabledColor = ColorsModule.Pumice,
		Text = { Transparency = 0.3, Color = ColorsModule.White },
		Border = {
			Hidden = false,
			Transparency = 0.3,
			Color = ColorsModule.White
		}
	},
	IconButton = {
		Fill = {
			Off = { Transparency = 0.7, Color = ColorsModule.White },
			On = { Transparency = 1, Color = ColorsModule.White },
			OnPress = { Transparency = 0.85, Color = ColorsModule.White },
			Loading = { Transparency = 0.7, Color = ColorsModule.White },
			Disabled = { Transparency = 0.85, Color = ColorsModule.White }
		},
		Border = {
			Off = { Transparency = 0.3, Color = ColorsModule.White },
			On = { Transparency = 0.3, Color = ColorsModule.White },
			OnPress = { Transparency = 0.85, Color = ColorsModule.White },
			Loading = { Transparency = 0.3, Color = ColorsModule.White },
			Disabled = { Transparency = 0.85, Color = ColorsModule.White }
		},
		Icon = {
			Off = { Transparency = 0.3, Color = ColorsModule.White },
			On = { Transparency = 0, Color = ColorsModule.Green },
			OnPress = { Transparency = 0.7, Color = ColorsModule.Green },
			Loading = { Transparency = 0.5, Color = ColorsModule.White },
			Disabled = { Transparency = 0.7, Color = ColorsModule.White }
		}
	},
	EmptyStatePage = { ErrorMessage = { Color = ColorsModule.Graphite } },
	ShimmerAnimation = {
		Transparency = 0.65,
		Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png",
		AspectRatio = 0.876
	},
	ShimmerPanel = { Transparency = 0.5, Color = ColorsModule.Flint },
	ContextualMenu = {
		Cells = {
			Icon = {
				Transparency = 0.3,
				OnTransparency = 0,
				DisabledTransparency = 0.5,
				Color = ColorsModule.White,
				OnColor = ColorsModule.Green
			},
			Content = {
				DisabledTransparency = 0.5,
				Color = ColorsModule.White,
				DisabledColor = ColorsModule.White
			},
			Background = {
				OnPressTransparency = 0.7,
				OnPressColor = ColorsModule.Black
			}
		},
		Background = { Color = ColorsModule.Flint },
		Title = {
			Transparency = 0,
			DisabledTransparency = 0.5,
			Font = AppFonts.default:getDefault(),
			Color = ColorsModule.White
		},
		Divider = { Color = ColorsModule.Graphite },
		Cancel = { Color = ColorsModule.Pumice },
		DarkOverlay = { Transparency = 0.7, Color = ColorsModule.Black }
	},
	Authentication = {
		WeChatButton = {
			Text = {
				Size = 18,
				Font = AppFonts.default:getBold(),
				Color = ColorsModule.White
			},
			Background = { Color = ColorsModule.Green2 }
		}
	},
	AlertWindow = {
		Background = { Color = ColorsModule.Flint },
		Title = {
			Color = ColorsModule.White,
			Font = AppFonts.default:getBold()
		},
		Message = {
			Color = ColorsModule.Pumice,
			Font = AppFonts.default:getDefault()
		},
		Divider = { Color = ColorsModule.Graphite },
		Button = { Font = AppFonts.default:getDefault() }
	},
	GameDetails = {
		Background = { Transparency = 0.3, Color = ColorsModule.Black },
		Text = {
			Font = AppFonts.default:getDefault(),
			BoldFont = AppFonts.default:getBlack(),
			Color = {
				Main = ColorsModule.White,
				Secondary = ColorsModule.Pumice
			}
		},
		GameCard = {
			Background = { Transparency = 0, Color = ColorsModule.Flint },
			Sponsor = {
				Color = ColorsModule.Graphite,
				TextColor = ColorsModule.White,
				Font = AppFonts.default:getDefault()
			},
			Title = {
				Font = AppFonts.default:getDefault(),
				Color = ColorsModule.White
			},
			GameBasicStats = {
				Transparency = 0.3,
				Color = ColorsModule.White,
				Font = AppFonts.default:getDefault()
			}
		},
		GameBasicStats = {
			Transparency = 0.3,
			Color = ColorsModule.White,
			Font = AppFonts.default:getMedium()
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
		Carousel = { Text = { Color = ColorsModule.White } },
		TopBar = { Icon = { Color = ColorsModule.White } },
		LoadingView = {
			BackgroundImage = {
				Image = "rbxasset://textures/ui/LuaApp/graphic/GameDetailsBackground/loadingBkg_base.jpg",
				Size = Vector2.new(500, 500),
				Tint = { Transparency = 0.2, Color = ColorsModule.Obsidian }
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
		Background = { Transparency = 0, Color = ColorsModule.Flint },
		Sponsor = {
			Color = ColorsModule.Graphite,
			TextColor = ColorsModule.White,
			Font = Enum.Font.SourceSans
		},
		Title = { Font = Enum.Font.SourceSans, Color = ColorsModule.White },
		GameBasicStats = {
			Transparency = 0.3,
			Color = ColorsModule.White,
			Font = Enum.Font.SourceSans
		}
	},
	ChatTopBar = {
		Background = { Transparency = 0, Color = ColorsModule.ChatTopBarSlate },
		Title = {
			Size = 22,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.White
		},
		Subtitle = {
			Size = 14,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.White
		}
	},
	BottomBar = {
		Background = { Transparency = 0, Color = ColorsModule.Carbon },
		TopBorder = { Transparency = 0, Color = ColorsModule.Graphite }
	},
	BottomBarButton = {
		Icon = {
			Off = { Transparency = 0.5, Color = ColorsModule.White },
			On = { Transparency = 0, Color = ColorsModule.White }
		},
		Title = { Size = 14, Font = AppFonts.default:getMedium() }
	},
	NumericalBadge = {
		Text = {
			Size = 12,
			Font = AppFonts.default:getMedium(),
			Color = ColorsModule.Slate
		},
		Border = {
			Default = { Transparency = 1, Color = ColorsModule.Slate },
			AppChrome = { Transparency = 0, Color = ColorsModule.Slate }
		},
		Inner = { Transparency = 0, Color = ColorsModule.White }
	},
	MorePage = {
		Background = { Transparency = 0, Color = ColorsModule.Slate },
		List = {
			Background = { Transparency = 0, Color = ColorsModule.Flint },
			Divider = { Transparency = 0, Color = ColorsModule.Graphite }
		},
		Button = {
			Background = {
				Default = { Transparency = 0, Color = ColorsModule.Flint },
				Pressed = { Transparency = 0, Color = ColorsModule.Slate }
			},
			Text = {
				Size = 19,
				Transparency = 0,
				Font = AppFonts.default:getMedium(),
				Color = ColorsModule.Pumice
			},
			Icon = { Transparency = 0, Color = ColorsModule.White },
			RightImage = { Transparency = 0, Color = ColorsModule.White }
		},
		Footer = {
			Size = 12,
			Transparency = 0,
			Font = AppFonts.default:getMedium(),
			Color = ColorsModule.Pumice
		}
	},
	EventsPage = {
		Text = {
			Size = 19,
			Transparency = 0.3,
			Font = AppFonts.default:getDefault(),
			Color = ColorsModule.White
		}
	},
	PremiumIcon = { Transparency = 0, Color = ColorsModule.White }
}
DeprecatedDarkThemeModule.RetryButton = DeprecatedDarkThemeModule.SecondaryButton
DeprecatedDarkThemeModule.Main = {
	Background = { Color = ColorsModule.Slate },
	Foreground = { Color = ColorsModule.Flint },
	TitleText = { Color = ColorsModule.White },
	BodyText = {
		Font = AppFonts.default:getDefault(),
		Color = ColorsModule.Pumice
	},
	Divider = { Color = ColorsModule.Graphite }
}
DeprecatedDarkThemeModule.TopBar = {
	Bar = { Color = DeprecatedDarkThemeModule.Main.Background.Color },
	Background = { Color = DeprecatedDarkThemeModule.Main.Background.Color },
	DarkOverlay = { Transparency = 0.3, Color = ColorsModule.Black },
	Text = {
		Transparency = 0,
		Color = DeprecatedDarkThemeModule.Main.TitleText.Color
	},
	Icon = { Color = DeprecatedDarkThemeModule.Main.BodyText.Color },
	Badge = { Color = ColorsModule.White },
	BadgeText = { Color = ColorsModule.Slate },
	Separator = { Color = ColorsModule.Obsidian }
}
DeprecatedDarkThemeModule.SearchBar = {
	Background = { Color = ColorsModule.Black },
	Placeholder = { Color = ColorsModule.Flint },
	Content = { Color = ColorsModule.Pumice }
}
DeprecatedDarkThemeModule.DropDownList = {
	[ButtonStateModule.Default] = {
		Background = {
			Transparency = 0.3,
			Color = DeprecatedDarkThemeModule.Main.Background.Color
		},
		Content = {
			Transparency = 0.3,
			Color = DeprecatedDarkThemeModule.Main.BodyText.Color
		},
		Border = { Color = ColorsModule.Smoke }
	},
	[ButtonStateModule.Pressed] = {
		Background = { Transparency = 0.5 },
		Content = { Transparency = 0.5 }
	}
}
DeprecatedDarkThemeModule.ListPickerItem = {
	[ButtonStateModule.Default] = {
		Background = { Transparency = 0.5, Color = ColorsModule.Flint },
		Content = { Transparency = 0, Color = ColorsModule.Pumice },
		Separator = { Color = ColorsModule.Flint }
	},
	[ButtonStateModule.Hover] = {
		Background = { Color = ColorsModule.Graphite },
		Content = { Color = ColorsModule.White }
	},
	[ButtonStateModule.Pressed] = {
		Background = { Transparency = 0.7, Color = ColorsModule.Black },
		Content = { Transparency = 0.7, Color = ColorsModule.White }
	},
	[ButtonStateModule.Disabled] = {
		Content = { Transparency = 0.7, Color = ColorsModule.White }
	}
}
DeprecatedDarkThemeModule.Buttons = {}
DeprecatedDarkThemeModule.Buttons.CtaButton = {
	TextFont = Enum.Font.SourceSansBold,
	[ButtonStateModule.Default] = {
		Background = { Transparency = 0, Color = ColorsModule.White },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = ColorsModule.Slate }
	},
	[ButtonStateModule.Pressed] = {
		Background = { Transparency = 0.5 },
		Content = { Transparency = 0.5 }
	},
	[ButtonStateModule.Disabled] = {
		Background = { Transparency = 0.5 },
		Content = { Transparency = 0.5 }
	}
}
DeprecatedDarkThemeModule.Buttons.GrowthButton = {
	TextFont = Enum.Font.SourceSansBold,
	[ButtonStateModule.Default] = {
		Background = { Transparency = 0, Color = ColorsModule.Green },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = ColorsModule.White }
	},
	[ButtonStateModule.Pressed] = {
		Background = { Transparency = 0.5 },
		Content = { Transparency = 0.5 }
	},
	[ButtonStateModule.Disabled] = {
		Background = { Transparency = 0.5 },
		Content = { Transparency = 0.5 }
	}
}
DeprecatedDarkThemeModule.Buttons.SecondaryButton = {
	TextFont = Enum.Font.SourceSansBold,
	[ButtonStateModule.Default] = {
		Background = { Transparency = 1 },
		Border = { Transparency = 0.3, Color = ColorsModule.White },
		Content = { Transparency = 0.3, Color = ColorsModule.White }
	},
	[ButtonStateModule.Pressed] = {
		Border = { Transparency = 0.65 },
		Content = { Transparency = 0.65 }
	},
	[ButtonStateModule.Hover] = {
		Border = { Transparency = 0 },
		Content = { Transparency = 0 }
	},
	[ButtonStateModule.Disabled] = {
		Border = { Transparency = 0.65 },
		Content = { Transparency = 0.65 }
	}
}
DeprecatedDarkThemeModule.Buttons.ControlButton = DeprecatedDarkThemeModule.Buttons.SecondaryButton
DeprecatedDarkThemeModule.Buttons.BuyButton = DeprecatedDarkThemeModule.Buttons.SecondaryButton
DeprecatedDarkThemeModule.Buttons.AlertButton = {
	TextFont = Enum.Font.SourceSansBold,
	[ButtonStateModule.Default] = {
		Background = { Transparency = 1 },
		Border = { Transparency = 0.3, Color = ColorsModule.Red },
		Content = { Transparency = 0.3, Color = ColorsModule.Red }
	},
	[ButtonStateModule.Pressed] = {
		Border = { Transparency = 0.65 },
		Content = { Transparency = 0.65 }
	},
	[ButtonStateModule.Hover] = {
		Border = { Transparency = 0 },
		Content = { Transparency = 0 }
	},
	[ButtonStateModule.Disabled] = {
		Border = { Transparency = 0.65 },
		Content = { Transparency = 0.65 }
	}
}
DeprecatedDarkThemeModule.Buttons.ToggleButton = {
	TextFont = Enum.Font.SourceSans,
	On = {
		[ButtonStateModule.Default] = {
			Background = { Transparency = 1 },
			Border = { Transparency = 0.3, Color = ColorsModule.White },
			Content = { Transparency = 0.3, Color = ColorsModule.Green }
		},
		[ButtonStateModule.Pressed] = {
			Border = { Transparency = 0.65 },
			Content = { Transparency = 0.65 }
		},
		[ButtonStateModule.Hover] = {
			Border = { Transparency = 0 },
			Content = { Transparency = 0 }
		},
		[ButtonStateModule.Disabled] = {
			Border = { Transparency = 0.65 },
			Content = { Transparency = 0.65 }
		}
	},
	Off = DeprecatedDarkThemeModule.Buttons.SecondaryButton
}
DeprecatedDarkThemeModule.Buttons.AgreementButton = {
	Text = {
		Font = AppFonts.default:getDefault(),
		Color = ColorsModule.Pumice
	}
}
DeprecatedDarkThemeModule.Widget = {
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
		Color = ColorsModule.Pumice,
		Font = AppFonts.default:getDefault()
	}
}
DeprecatedDarkThemeModule.IconCards = {
	Text = {
		Color = ColorsModule.Pumice,
		Font = AppFonts.default:getDefault()
	}
}
DeprecatedDarkThemeModule.ScrollingFrameWithScrollBar = {
	ScrollBar = { Transparency = 0.7, Color = ColorsModule.White }
}

return DeprecatedDarkThemeModule