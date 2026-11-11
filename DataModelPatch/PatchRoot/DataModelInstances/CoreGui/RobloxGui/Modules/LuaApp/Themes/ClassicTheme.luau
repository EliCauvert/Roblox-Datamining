local CorePackages = game:GetService("CorePackages")
local Color = require(CorePackages.Workspace.Packages.AppCommonLib).Color
local ColorsModule = require(script.Parent.Colors)
local ButtonStateModule = require(script.Parent.Parent.Enum.ButtonState)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local ClassicThemeModule = {
	Name = "classic",
	Color = { Background = ColorsModule.Gray4 },
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
		Transparency = 0,
		OnPressTransparency = 0,
		DisabledTransparency = 0,
		Color = ColorsModule.BluePrimary,
		HoverColor = ColorsModule.BlueHover,
		OnPressColor = ColorsModule.BlueHover,
		DisabledColor = ColorsModule.BlueDisabled,
		Text = { Transparency = 0, Color = ColorsModule.White },
		Border = { Hidden = true }
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
	RetryButton = {
		DisabledTransparency = 0,
		Color = ColorsModule.Gray1,
		DisabledColor = ColorsModule.Gray3
	},
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
				Color = ColorsModule.Gray1,
				OnColor = ColorsModule.Green
			},
			Content = {
				DisabledTransparency = 0.5,
				Color = ColorsModule.Gray1,
				DisabledColor = ColorsModule.Gray1
			},
			Background = {
				OnPressTransparency = 0.9,
				OnPressColor = ColorsModule.Black
			}
		},
		Background = { Color = ColorsModule.White },
		Title = {
			Transparency = 0,
			DisabledTransparency = 0.5,
			Color = ColorsModule.Black
		},
		Divider = { Color = ColorsModule.Gray4 },
		Cancel = { Color = ColorsModule.Gray1 },
		DarkOverlay = { Transparency = 0.5, Color = ColorsModule.Gray1 }
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
		Background = { Color = ColorsModule.White },
		Title = {
			Color = ColorsModule.Black,
			Font = AppFonts.default:getBold()
		},
		Message = {
			Color = ColorsModule.Gray1,
			Font = AppFonts.default:getDefault()
		},
		Divider = { Color = ColorsModule.Gray4 },
		Button = { Font = AppFonts.default:getDefault() }
	},
	GameDetails = {
		Background = { Transparency = 0.3, Color = ColorsModule.Black },
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
		Sponsor = {
			Color = ColorsModule.Gray3,
			TextColor = ColorsModule.White,
			Font = Enum.Font.SourceSans
		},
		Title = { Font = Enum.Font.SourceSans, Color = ColorsModule.Gray1 },
		GameBasicStats = {
			Transparency = 0,
			Color = ColorsModule.Gray2,
			Font = Enum.Font.SourceSans
		}
	},
	ChatTopBar = {
		Background = {
			Transparency = 0,
			Color = ColorsModule.ChatTopBarBluePressed
		},
		Title = {
			Size = 23,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.White
		},
		Subtitle = {
			Size = 15,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.White
		}
	},
	BottomBar = {
		Background = { Transparency = 0, Color = ColorsModule.White },
		TopBorder = { Transparency = 0, Color = ColorsModule.Gray4 }
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
			Default = { Transparency = 1, Color = ColorsModule.Red },
			AppChrome = { Transparency = 1, Color = ColorsModule.Red }
		},
		Inner = { Transparency = 0, Color = ColorsModule.Red }
	},
	MorePage = {
		Background = { Transparency = 0, Color = ColorsModule.Gray6 },
		List = {
			Background = { Transparency = 0, Color = ColorsModule.White },
			Divider = { Transparency = 0, Color = ColorsModule.Gray4 }
		},
		Button = {
			Background = {
				Default = { Transparency = 0, Color = ColorsModule.White },
				Pressed = { Transparency = 0, Color = ColorsModule.Gray5 }
			},
			Text = {
				Size = 23,
				Transparency = 0,
				Font = Enum.Font.SourceSans,
				Color = ColorsModule.Black
			},
			Icon = { Transparency = 0, Color = ColorsModule.White },
			RightImage = { Transparency = 0, Color = ColorsModule.White }
		},
		Footer = {
			Size = 18,
			Transparency = 0,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.Black
		}
	},
	EventsPage = {
		Text = {
			Size = 23,
			Transparency = 0,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.Gray3
		}
	},
	TencentNoticeCenter = {
		Text = {
			Size = 23,
			Transparency = 0,
			Font = Enum.Font.SourceSans,
			Color = ColorsModule.Gray3
		}
	},
	PremiumIcon = { Transparency = 0, Color = ColorsModule.Black },
	Main = {
		Background = { Color = ColorsModule.Gray4 },
		Foreground = { Color = ColorsModule.White },
		TitleText = { Color = ColorsModule.Gray1 },
		BodyText = { Font = Enum.Font.SourceSans, Color = ColorsModule.Gray2 },
		Divider = { Color = ColorsModule.Gray4 }
	},
	TopBar = {
		Bar = { Color = ColorsModule.BluePressed },
		Background = { Color = ColorsModule.BluePressed },
		DarkOverlay = { Transparency = 0.3, Color = ColorsModule.Black },
		Text = { Transparency = 0, Color = ColorsModule.White },
		Icon = { Color = ColorsModule.White },
		Badge = { Color = ColorsModule.Red },
		BadgeText = { Color = ColorsModule.White },
		Separator = { Color = ColorsModule.BluePressed }
	},
	SearchBar = {
		Background = { Color = ColorsModule.White },
		Placeholder = { Color = ColorsModule.Gray2 },
		Content = { Color = ColorsModule.Gray2 }
	},
	DropDownList = {
		[ButtonStateModule.Default] = {
			Background = { Color = ColorsModule.White },
			Content = { Color = ColorsModule.Gray2 },
			Border = { Color = ColorsModule.Black }
		}
	},
	ListPickerItem = {
		[ButtonStateModule.Default] = {
			Background = { Color = ColorsModule.White },
			Content = { Transparency = 0, Color = ColorsModule.Gray2 },
			Separator = { Color = ColorsModule.Gray4 }
		},
		[ButtonStateModule.Pressed] = { Background = { Color = Color3.fromRGB(242, 242, 242) } }
	},
	Buttons = {}
}
ClassicThemeModule.Buttons.CtaButton = {
	TextFont = Enum.Font.SourceSans,
	[ButtonStateModule.Default] = {
		Background = { Transparency = 0, Color = Color.Color3FromHex(178007) },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = Color.Color3FromHex(16777215) }
	},
	[ButtonStateModule.Pressed] = { Background = { Color = Color.Color3FromHex(4179577) } },
	[ButtonStateModule.Hover] = { Background = { Color = Color.Color3FromHex(4179577) } },
	[ButtonStateModule.Disabled] = { Background = { Color = Color.Color3FromHex(10740413) } }
}
ClassicThemeModule.Buttons.GrowthButton = ClassicThemeModule.Buttons.CtaButton
ClassicThemeModule.Buttons.SecondaryButton = {
	TextFont = Enum.Font.SourceSans,
	[ButtonStateModule.Default] = {
		Background = { Color = Color.Color3FromHex(41727) },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = Color.Color3FromHex(16777215) }
	},
	[ButtonStateModule.Pressed] = { Background = { Color = Color.Color3FromHex(3323391) } },
	[ButtonStateModule.Hover] = { Background = { Color = Color.Color3FromHex(3323391) } },
	[ButtonStateModule.Disabled] = { Background = { Color = Color.Color3FromHex(10083071) } }
}
ClassicThemeModule.Buttons.ControlButton = {
	TextFont = Enum.Font.SourceSans,
	[ButtonStateModule.Default] = {
		Background = { Color = Color.Color3FromHex(16777215) },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = Color.Color3FromHex(1644825) }
	},
	[ButtonStateModule.Disabled] = {
		Content = {
			Transparency = 0.5,
			Color = Color.Color3FromHex(12105912)
		}
	}
}
ClassicThemeModule.Buttons.AlertButton = {
	TextFont = Enum.Font.SourceSans,
	[ButtonStateModule.Default] = {
		Background = { Color = Color.Color3FromHex(14182504) },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = Color.Color3FromHex(16777215) }
	},
	[ButtonStateModule.Hover] = { Background = { Color = Color.Color3FromHex(14841462) } }
}
ClassicThemeModule.Buttons.BuyButtons = {
	TextFont = Enum.Font.SourceSans,
	[ButtonStateModule.Default] = {
		Background = { Color = Color.Color3FromHex(16777215) },
		Border = { Transparency = 1 },
		Content = { Transparency = 0, Color = Color.Color3FromHex(1644825) }
	},
	[ButtonStateModule.Pressed] = {
		Background = { Color = Color.Color3FromHex(4179577) },
		Content = { Color = Color.Color3FromHex(16777215) }
	},
	[ButtonStateModule.Hover] = {
		Background = { Color = Color.Color3FromHex(4179577) },
		Content = { Color = Color.Color3FromHex(16777215) }
	},
	[ButtonStateModule.Disabled] = {
		Content = {
			Transparency = 0.5,
			Color = Color.Color3FromHex(16777215)
		}
	}
}
ClassicThemeModule.Buttons.ToggleButton = {
	TextFont = Enum.Font.SourceSans,
	On = {
		[ButtonStateModule.Default] = {
			Background = { Color = Color.Color3FromHex(16777215) },
			Border = { Transparency = 1 },
			Content = { Transparency = 0, Color = Color.Color3FromHex(1644825) }
		},
		[ButtonStateModule.Pressed] = { Background = { Color = Color.Color3FromHex(14211288) } }
	},
	Off = {
		[ButtonStateModule.Default] = {
			Background = { Color = Color.Color3FromHex(16777215) },
			Border = { Transparency = 1 },
			Content = { Transparency = 0, Color = Color.Color3FromHex(1644825) }
		},
		[ButtonStateModule.Pressed] = { Background = { Color = Color.Color3FromHex(14211288) } }
	}
}
ClassicThemeModule.Buttons.AgreementButton = {
	Text = {
		Font = AppFonts.default:getDefault(),
		Color = ColorsModule.Pumice
	}
}
ClassicThemeModule.Widget = {
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
	ContentText = { Color = ColorsModule.Pumice, Font = Enum.Font.SourceSans }
}
ClassicThemeModule.IconCards = {
	Text = { Color = ColorsModule.Pumice, Font = Enum.Font.SourceSans }
}
ClassicThemeModule.ScrollingFrameWithScrollBar = {
	ScrollBar = { Transparency = 0.7, Color = ColorsModule.Gray3 }
}

return ClassicThemeModule