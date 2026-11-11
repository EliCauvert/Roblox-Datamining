return {
	VerticalTile = {
		Base = {
			Container = {
				BorderWidth = 1,
				Background = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				BorderColor = {
					Transparency = 0.8,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				DropShadow = {
					X = 0,
					Y = 4,
					Blur = 8,
					Color = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) }
				},
				BorderRadius = {
					LeadingTop = 8,
					TrailingTop = 8,
					TrailingBottom = 8,
					LeadingBottom = 8
				}
			},
			ContentTop = {
				Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
			},
			ContentBottom = {
				Spacing = { Top = 8, Trailing = 8, Bottom = 8, Leading = 8 }
			}
		}
	},
	PlayerTileSmall = {
		Base = {
			Container = {
				Gap = 8,
				Spacing = { Top = 8, Trailing = 8, Bottom = 8, Leading = 8 }
			},
			Image = {
				Size = 96,
				BorderRadius = 9999,
				BorderWidth = 3,
				BackgroundColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				BorderColor = {
					Transparency = 0.8,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			Status = {
				Size = 16,
				BorderWidth = 2.5,
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0, 0.70588, 0.42745)
				},
				BorderColor = {
					Transparency = 0,
					Color3 = Color3.new(0.94902, 0.95686, 0.96078)
				}
			},
			Content = {
				Gap = 2,
				Typography = {
					FontSize = 15.12,
					LineHeight = 1.032,
					LetterSpacing = 0.01,
					Font = Enum.Font.BuilderSansMedium
				},
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			Icon = { Size = 16 },
			Presence = {
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.37647, 0.38039, 0.38431)
				}
			}
		}
	},
	Facepile = {
		Container = { Gap = 4 },
		FaceGroup = { Gap = -6 },
		Face = {
			BorderWidth = 2,
			BorderRadius = 9999,
			Width = 16,
			Height = 16,
			BackgroundColor = {
				Transparency = 0,
				Color3 = Color3.new(0.37647, 0.38039, 0.38431)
			},
			BorderColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		Badge = {
			BorderWidth = 2,
			BorderRadius = 9999,
			Spacing = 4,
			Height = 16,
			MinWidth = 16,
			BackgroundColor = {
				Transparency = 0,
				Color3 = Color3.new(0, 0.70588, 0.42745)
			},
			BorderColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
			Typography = {
				FontSize = 12.6,
				LineHeight = 1.111,
				LetterSpacing = 0.01,
				Font = Enum.Font.BuilderSansMedium
			}
		},
		Label = {
			ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) },
			Typography = {
				FontSize = 15.12,
				LineHeight = 1.032,
				LetterSpacing = 0,
				Font = Enum.Font.BuilderSans
			}
		}
	},
	ControllerBar = {
		Gap = 16,
		BackgroundColor = { Transparency = 0.9, Color3 = Color3.new(0, 0, 0) },
		BorderRadius = {
			LeadingTop = 9999,
			TrailingTop = 9999,
			TrailingBottom = 9999,
			LeadingBottom = 9999
		},
		Spacing = { Top = 8, Trailing = 12, Bottom = 8, Leading = 12 }
	},
	ControllerBarShortcut = {
		Container = {
			Gap = 4,
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			}
		},
		Icon = { Size = 36 },
		Label = {
			Typography = {
				FontSize = 15.12,
				LineHeight = 1.032,
				LetterSpacing = 0.01,
				Font = Enum.Font.BuilderSansMedium
			}
		}
	},
	SelectionCursor = {
		BorderWidth = 2,
		Offset = 6,
		Inset = 0,
		Gradient = {
			Start = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			},
			End = {
				Transparency = 0,
				Color3 = Color3.new(0.74118, 0.7451, 0.7451)
			}
		}
	},
	StateLayer = {
		Base = { BorderWidth = 1 },
		Standard = {
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
				Height = 56,
				BorderWidth = 0,
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				BackgroundColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				BorderColor = {
					Transparency = 0.8,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				BorderRadius = {
					TopLeading = 0,
					TopTrailing = 0,
					BottomTrailing = 0,
					BottomLeading = 0
				},
				Spacing = { Top = 0, Trailing = 12, Bottom = 0, Leading = 12 }
			},
			IconFrame = { Size = 32 },
			TextFrame = {
				Spacing = { Top = 0, Trailing = 12, Bottom = 0, Leading = 12 }
			},
			Text = {
				Typography = {
					FontSize = 20.16,
					LineHeight = 1.111,
					LetterSpacing = 0,
					Font = Enum.Font.BuilderSansBold
				}
			},
			CheckFrame = { Size = 32 }
		},
		Divider = { Container = { BorderWidth = 1 } },
		Disabled = {
			Container = {
				ContentColor = {
					Transparency = 0.5,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			}
		},
		HasRoundBottom = {
			Container = { BorderRadius = { BottomTrailing = 8, BottomLeading = 8 } }
		},
		HasRoundTop = {
			Container = { BorderRadius = { TopLeading = 8, TopTrailing = 8 } }
		}
	},
	BaseMenu = {
		BorderRadius = 8,
		BackgroundColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
	},
	StatGroup = { Gap = 8 },
	StatItem = {
		Container = {
			Gap = 2,
			ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) }
		},
		Icon = { Size = 16 },
		Label = {
			Typography = {
				FontSize = 15.12,
				LineHeight = 1.032,
				LetterSpacing = 0,
				Font = Enum.Font.BuilderSans
			}
		}
	},
	MediaTile = { Container = { BorderRadius = 8 }, Icon = { Size = 36 } },
	StatWidget = {
		Container = {
			Gap = 8,
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.22353, 0.23137, 0.23922)
			}
		},
		Icon = { Size = 48 },
		DataGroup = { Gap = 0 },
		Data = {
			Typography = {
				FontSize = 35.28,
				LineHeight = 1.032,
				LetterSpacing = -0.01,
				Font = Enum.Font.BuilderSansBold
			}
		},
		Label = {
			Typography = {
				FontSize = 20.16,
				LineHeight = 1.111,
				LetterSpacing = 0,
				Font = Enum.Font.BuilderSansBold
			}
		}
	},
	RateCount = {
		Container = {
			Spacing = 8,
			Gap = 8,
			BorderRadius = 8,
			BackgroundColor = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) }
		},
		ButtonGroup = { Gap = 8 }
	},
	PlayerCount = {
		Container = {
			Spacing = 8,
			BorderRadius = 0,
			BackgroundColor = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
		}
	},
	VerticalScrollView = {
		Base = {
			Handle = {
				BorderRadius = 9999,
				BackgroundColor = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) },
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			Icon = { Size = 36 },
			Track = { Opacity = 0, Spacing = { Top = 4, Bottom = 4 } }
		},
		Compact = { Handle = { Width = 2 }, Track = { Width = 12 } },
		Wide = { Handle = { Width = 8 }, Track = { Width = 16 } },
		Gamepad = { Handle = { Width = 16 }, Track = { Width = 16 } }
	},
	TextField = {
		Base = {
			Field = {
				BorderRadius = 8,
				Gap = 8,
				Opacity = 1,
				BorderColor = {
					Transparency = 0.8,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				},
				Typography = {
					FontSize = 20.16,
					LineHeight = 1.111,
					LetterSpacing = 0,
					Font = Enum.Font.BuilderSans
				},
				Spacing = { Leading = 12, Trailing = 12 }
			},
			PlaceholderText = {
				ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) }
			},
			FieldValue = {
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			IconLeading = {
				Size = 16,
				ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) }
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
				FontSize = 15.12,
				LineHeight = 1.032,
				LetterSpacing = 0,
				Font = Enum.Font.BuilderSans
			},
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.37647, 0.38039, 0.38431)
			},
			Spacing = { Bottom = 4 }
		},
		Disabled = { Opacity = 0.32 }
	},
	HelperText = {
		Base = {
			Opacity = 1,
			Typography = {
				FontSize = 12.6,
				LineHeight = 1.111,
				LetterSpacing = 0.01,
				Font = Enum.Font.BuilderSansMedium
			},
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.37647, 0.38039, 0.38431)
			},
			Padding = { Top = 4 }
		},
		Error = {
			ContentColor = {
				Transparency = 0,
				Color3 = Color3.new(0.96863, 0.29412, 0.32157)
			}
		}
	}
}