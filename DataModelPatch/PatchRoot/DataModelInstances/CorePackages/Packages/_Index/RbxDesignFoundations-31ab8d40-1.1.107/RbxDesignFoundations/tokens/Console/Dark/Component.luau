return {
	VerticalTile = {
		Base = {
			Container = {
				BorderWidth = 1.5,
				Background = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				BorderColor = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) },
				DropShadow = {
					X = 0,
					Y = 6,
					Blur = 12,
					Color = { Transparency = 0.5, Color3 = Color3.new(0, 0, 0) }
				},
				BorderRadius = {
					LeadingTop = 12,
					TrailingTop = 12,
					TrailingBottom = 12,
					LeadingBottom = 12
				}
			},
			ContentTop = {
				Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
			},
			ContentBottom = {
				Spacing = { Top = 12, Trailing = 12, Bottom = 12, Leading = 12 }
			}
		}
	},
	PlayerTileSmall = {
		Base = {
			Container = {
				Gap = 12,
				Spacing = { Top = 12, Trailing = 12, Bottom = 12, Leading = 12 }
			},
			Image = {
				Size = 144,
				BorderRadius = 9999,
				BorderWidth = 4.5,
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				BorderColor = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Status = {
				Size = 24,
				BorderWidth = 3.75,
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0, 0.70588, 0.42745)
				},
				BorderColor = {
					Transparency = 0,
					Color3 = Color3.new(0.13725, 0.1451, 0.15294)
				}
			},
			Content = {
				Gap = 3,
				Typography = {
					FontSize = 18,
					LineHeight = 1.15,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium
				},
				ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			},
			Icon = { Size = 24 },
			Presence = {
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.74118, 0.7451, 0.7451)
				}
			}
		}
	},
	Facepile = {
		Container = { Gap = 6 },
		FaceGroup = { Gap = -9 },
		Face = {
			BorderWidth = 3,
			BorderRadius = 9999,
			Width = 24,
			Height = 24,
			BackgroundColor = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			},
			BorderColor = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			}
		},
		Badge = {
			BorderWidth = 3,
			BorderRadius = 9999,
			Spacing = 6,
			Height = 24,
			MinWidth = 24,
			BackgroundColor = {
				Transparency = 0,
				Color3 = Color3.new(0, 0.70588, 0.42745)
			},
			BorderColor = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			},
			ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			Typography = {
				FontSize = 15,
				LineHeight = 1.2,
				LetterSpacing = 0,
				Font = Enum.Font.GothamMedium
			}
		},
		Label = {
			ContentColor = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) },
			Typography = {
				FontSize = 18,
				LineHeight = 1.15,
				LetterSpacing = 0,
				Font = Enum.Font.Gotham
			}
		}
	},
	ControllerBar = {
		Gap = 24,
		BackgroundColor = {
			Transparency = 0.2,
			Color3 = Color3.new(0.06667, 0.07059, 0.07843)
		},
		BorderRadius = {
			LeadingTop = 9999,
			TrailingTop = 9999,
			TrailingBottom = 9999,
			LeadingBottom = 9999
		},
		Spacing = { Top = 12, Trailing = 18, Bottom = 12, Leading = 18 }
	},
	ControllerBarShortcut = {
		Container = {
			Gap = 6,
			ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		Icon = { Size = 54 },
		Label = {
			Typography = {
				FontSize = 18,
				LineHeight = 1.15,
				LetterSpacing = 0,
				Font = Enum.Font.GothamMedium
			}
		}
	},
	SelectionCursor = {
		BorderWidth = 3,
		Offset = 9,
		Inset = 0,
		Gradient = {
			Start = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			End = {
				Transparency = 0,
				Color3 = Color3.new(0.39608, 0.4, 0.40784)
			}
		}
	},
	StateLayer = {
		Base = { BorderWidth = 1.5 },
		Standard = {
			Initialize = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Default = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Hover = {
				Color = { Transparency = 0.88, Color3 = Color3.new(1, 1, 1) }
			},
			Pressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Selected = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			SelectedPressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Disabled = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			}
		},
		Lighten = {
			Initialize = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Default = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Hover = {
				Color = { Transparency = 0.88, Color3 = Color3.new(1, 1, 1) }
			},
			Pressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Selected = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			SelectedPressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) }
			},
			Disabled = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			}
		},
		Inverse = {
			Initialize = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Default = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Hover = {
				Color = { Transparency = 0.88, Color3 = Color3.new(0, 0, 0) }
			},
			Pressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			},
			Selected = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			SelectedPressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			},
			Disabled = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			}
		},
		Darken = {
			Initialize = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Default = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			Hover = {
				Color = { Transparency = 0.88, Color3 = Color3.new(0, 0, 0) }
			},
			Pressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			},
			Selected = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			},
			SelectedPressed = {
				Color = { Transparency = 0.8, Color3 = Color3.new(0, 0, 0) }
			},
			Disabled = {
				Color = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
			}
		}
	},
	MenuCell = {
		Base = {
			Container = {
				Height = 84,
				BorderWidth = 0,
				ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				BorderColor = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) },
				BorderRadius = {
					TopLeading = 0,
					TopTrailing = 0,
					BottomTrailing = 0,
					BottomLeading = 0
				},
				Spacing = { Top = 0, Trailing = 18, Bottom = 0, Leading = 18 }
			},
			IconFrame = { Size = 48 },
			TextFrame = {
				Spacing = { Top = 0, Trailing = 18, Bottom = 0, Leading = 18 }
			},
			Text = {
				Typography = {
					FontSize = 24,
					LineHeight = 1.25,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium
				}
			},
			CheckFrame = { Size = 48 }
		},
		Divider = { Container = { BorderWidth = 1.5 } },
		Disabled = {
			Container = {
				ContentColor = { Transparency = 0.5, Color3 = Color3.new(1, 1, 1) }
			}
		},
		HasRoundBottom = {
			Container = {
				BorderRadius = { BottomTrailing = 12, BottomLeading = 12 }
			}
		},
		HasRoundTop = {
			Container = { BorderRadius = { TopLeading = 12, TopTrailing = 12 } }
		}
	},
	BaseMenu = {
		BorderRadius = 12,
		BackgroundColor = {
			Transparency = 0,
			Color3 = Color3.new(0.22353, 0.23137, 0.23922)
		}
	},
	StatGroup = { Gap = 12 },
	StatItem = {
		Container = {
			Gap = 3,
			ContentColor = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) }
		},
		Icon = { Size = 24 },
		Label = {
			Typography = {
				FontSize = 18,
				LineHeight = 1.15,
				LetterSpacing = 0,
				Font = Enum.Font.Gotham
			}
		}
	},
	MediaTile = { Container = { BorderRadius = 12 }, Icon = { Size = 54 } },
	StatWidget = {
		Container = {
			Gap = 12,
			ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		Icon = { Size = 72 },
		DataGroup = { Gap = 0 },
		Data = {
			Typography = {
				FontSize = 51,
				LineHeight = 1.2,
				LetterSpacing = 0,
				Font = Enum.Font.GothamBlack
			}
		},
		Label = {
			Typography = {
				FontSize = 24,
				LineHeight = 1.25,
				LetterSpacing = 0,
				Font = Enum.Font.GothamMedium
			}
		}
	},
	RateCount = {
		Container = {
			Spacing = 12,
			Gap = 12,
			BorderRadius = 12,
			BackgroundColor = { Transparency = 0.7, Color3 = Color3.new(1, 1, 1) }
		},
		ButtonGroup = { Gap = 12 }
	},
	PlayerCount = {
		Container = {
			Spacing = 12,
			BorderRadius = 0,
			BackgroundColor = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
		}
	},
	VerticalScrollView = {
		Base = {
			Handle = {
				BorderRadius = 9999,
				BackgroundColor = { Transparency = 0.7, Color3 = Color3.new(1, 1, 1) },
				ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			},
			Icon = { Size = 54 },
			Track = { Opacity = 0, Spacing = { Top = 6, Bottom = 6 } }
		},
		Compact = { Handle = { Width = 3 }, Track = { Width = 18 } },
		Wide = { Handle = { Width = 12 }, Track = { Width = 24 } },
		Gamepad = { Handle = { Width = 24 }, Track = { Width = 24 } }
	},
	TextField = {
		Base = {
			Field = {
				BorderRadius = 12,
				Gap = 12,
				Opacity = 1,
				BorderColor = { Transparency = 0.8, Color3 = Color3.new(1, 1, 1) },
				Typography = {
					FontSize = 24,
					LineHeight = 1.25,
					LetterSpacing = 0,
					Font = Enum.Font.Gotham
				},
				Spacing = { Leading = 18, Trailing = 18 }
			},
			PlaceholderText = {
				ContentColor = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) }
			},
			FieldValue = {
				ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
			},
			IconLeading = {
				Size = 24,
				ContentColor = { Transparency = 0.3, Color3 = Color3.new(1, 1, 1) }
			}
		},
		Error = {
			Field = {
				BorderColor = {
					Transparency = 0,
					Color3 = Color3.new(0.96863, 0.29412, 0.32157)
				}
			}
		},
		Disabled = { Field = { Opacity = 0.32 } }
	},
	InputLabel = {
		Base = {
			Opacity = 1,
			Typography = {
				FontSize = 18,
				LineHeight = 1.15,
				LetterSpacing = 0,
				Font = Enum.Font.Gotham
			},
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			},
			Spacing = { Bottom = 6 }
		},
		Disabled = { Opacity = 0.32 }
	},
	HelperText = {
		Base = {
			Opacity = 1,
			Typography = {
				FontSize = 15,
				LineHeight = 1.2,
				LetterSpacing = 0,
				Font = Enum.Font.GothamMedium
			},
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			},
			Padding = { Top = 6 }
		},
		Error = {
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.96863, 0.29412, 0.32157)
			}
		}
	}
}