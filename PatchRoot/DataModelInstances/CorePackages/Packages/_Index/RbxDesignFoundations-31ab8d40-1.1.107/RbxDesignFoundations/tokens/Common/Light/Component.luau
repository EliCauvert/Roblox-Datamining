-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:58 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	return {
		VerticalTile = {
			Base = {
				Container = {
					Background = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
					BorderWidth = 1 * p0,
					BorderColor = {
						Transparency = 0.8,
						Color3 = Color3.new(0.22353, 0.23137, 0.23922)
					},
					DropShadow = {
						X = 0,
						Y = 4 * p0,
						Blur = 8 * p0,
						Color = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) }
					},
					BorderRadius = {
						LeadingTop = 8 * p0,
						TrailingTop = 8 * p0,
						TrailingBottom = 8 * p0,
						LeadingBottom = 8 * p0
					}
				},
				ContentTop = {
					Spacing = { Top = 0, Trailing = 0, Bottom = 0, Leading = 0 }
				},
				ContentBottom = {
					Spacing = {
						Top = 8 * p0,
						Trailing = 8 * p0,
						Bottom = 8 * p0,
						Leading = 8 * p0
					}
				}
			}
		},
		PlayerTileSmall = {
			Base = {
				Container = {
					Gap = 8 * p0,
					Spacing = {
						Top = 8 * p0,
						Trailing = 8 * p0,
						Bottom = 8 * p0,
						Leading = 8 * p0
					}
				},
				Image = {
					BorderRadius = 9999,
					Size = 96 * p0,
					BackgroundColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
					BorderColor = {
						Transparency = 0.8,
						Color3 = Color3.new(0.22353, 0.23137, 0.23922)
					},
					BorderWidth = 3 * p0
				},
				Status = {
					Size = 16 * p0,
					BackgroundColor = {
						Transparency = 0,
						Color3 = Color3.new(0, 0.70588, 0.42745)
					},
					BorderColor = {
						Transparency = 0,
						Color3 = Color3.new(0.94902, 0.95686, 0.96078)
					},
					BorderWidth = 2.5 * p0
				},
				Content = {
					Gap = 2 * p0,
					Typography = {
						LineHeight = 1.15,
						LetterSpacing = 0,
						Font = Enum.Font.GothamMedium,
						FontSize = 12 * p0
					},
					ContentColor = {
						Transparency = 0,
						Color3 = Color3.new(0.22353, 0.23137, 0.23922)
					}
				},
				Icon = { Size = 16 * p0 },
				Presence = {
					ContentColor = {
						Transparency = 0,
						Color3 = Color3.new(0.37647, 0.38039, 0.38431)
					}
				}
			}
		},
		Facepile = {
			Container = { Gap = 4 * p0 },
			FaceGroup = { Gap = -6 * p0 },
			Face = {
				BorderRadius = 9999,
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0.37647, 0.38039, 0.38431)
				},
				BorderWidth = 2 * p0,
				BorderColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				Width = 16 * p0,
				Height = 16 * p0
			},
			Badge = {
				BorderRadius = 9999,
				BackgroundColor = {
					Transparency = 0,
					Color3 = Color3.new(0, 0.70588, 0.42745)
				},
				BorderWidth = 2 * p0,
				BorderColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				Spacing = 4 * p0,
				Height = 16 * p0,
				MinWidth = 16 * p0,
				ContentColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				Typography = {
					LineHeight = 1.2,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium,
					FontSize = 10 * p0
				}
			},
			Label = {
				ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) },
				Typography = {
					LineHeight = 1.15,
					LetterSpacing = 0,
					Font = Enum.Font.Gotham,
					FontSize = 12 * p0
				}
			}
		},
		ControllerBar = {
			BackgroundColor = { Transparency = 0.9, Color3 = Color3.new(0, 0, 0) },
			BorderRadius = {
				LeadingTop = 9999,
				TrailingTop = 9999,
				TrailingBottom = 9999,
				LeadingBottom = 9999
			},
			Spacing = {
				Top = 8 * p0,
				Trailing = 12 * p0,
				Bottom = 8 * p0,
				Leading = 12 * p0
			},
			Gap = 16 * p0
		},
		ControllerBarShortcut = {
			Container = {
				Gap = 4 * p0,
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			Icon = { Size = 36 * p0 },
			Label = {
				Typography = {
					LineHeight = 1.15,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium,
					FontSize = 12 * p0
				}
			}
		},
		SelectionCursor = {
			Inset = 0,
			BorderWidth = 2 * p0,
			Offset = 6 * p0,
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
			Base = { BorderWidth = 1 * p0 },
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
					BorderWidth = 0,
					Height = 56 * p0,
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
					Spacing = {
						Top = 0,
						Bottom = 0,
						Trailing = 12 * p0,
						Leading = 12 * p0
					}
				},
				IconFrame = { Size = 32 * p0 },
				TextFrame = {
					Spacing = {
						Top = 0,
						Bottom = 0,
						Trailing = 12 * p0,
						Leading = 12 * p0
					}
				},
				Text = {
					Typography = {
						LineHeight = 1.25,
						LetterSpacing = 0,
						Font = Enum.Font.GothamMedium,
						FontSize = 16 * p0
					}
				},
				CheckFrame = { Size = 32 * p0 }
			},
			Divider = { Container = { BorderWidth = 1 * p0 } },
			Disabled = {
				Container = {
					ContentColor = {
						Transparency = 0.5,
						Color3 = Color3.new(0.22353, 0.23137, 0.23922)
					}
				}
			},
			HasRoundBottom = {
				Container = {
					BorderRadius = { BottomTrailing = 8 * p0, BottomLeading = 8 * p0 }
				}
			},
			HasRoundTop = {
				Container = {
					BorderRadius = { TopLeading = 8 * p0, TopTrailing = 8 * p0 }
				}
			}
		},
		BaseMenu = {
			BorderRadius = 8 * p0,
			BackgroundColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
		},
		StatGroup = { Gap = 8 * p0 },
		StatItem = {
			Container = {
				Gap = 2 * p0,
				ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) }
			},
			Icon = { Size = 16 * p0 },
			Label = {
				Typography = {
					LineHeight = 1.15,
					LetterSpacing = 0,
					Font = Enum.Font.Gotham,
					FontSize = 12 * p0
				}
			}
		},
		MediaTile = {
			Container = { BorderRadius = 8 * p0 },
			Icon = { Size = 36 * p0 }
		},
		StatWidget = {
			Container = {
				Gap = 8 * p0,
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.22353, 0.23137, 0.23922)
				}
			},
			Icon = { Size = 48 * p0 },
			DataGroup = { Gap = 0 },
			Data = {
				Typography = {
					LineHeight = 1.2,
					LetterSpacing = 0,
					Font = Enum.Font.GothamBlack,
					FontSize = 34 * p0
				}
			},
			Label = {
				Typography = {
					LineHeight = 1.25,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium,
					FontSize = 16 * p0
				}
			}
		},
		RateCount = {
			Container = {
				Spacing = 8 * p0,
				Gap = 8 * p0,
				BorderRadius = 8 * p0,
				BackgroundColor = { Transparency = 0.7, Color3 = Color3.new(0, 0, 0) }
			},
			ButtonGroup = { Gap = 8 * p0 }
		},
		PlayerCount = {
			Container = {
				BorderRadius = 0,
				Spacing = 8 * p0,
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
				Icon = { Size = 36 * p0 },
				Track = { Opacity = 0, Spacing = { Top = 4 * p0, Bottom = 4 * p0 } }
			},
			Compact = { Handle = { Width = 2 * p0 }, Track = { Width = 12 * p0 } },
			Wide = { Handle = { Width = 8 * p0 }, Track = { Width = 16 * p0 } },
			Gamepad = {
				Handle = { Width = 16 * p0 },
				Track = { Width = 16 * p0 }
			}
		},
		TextField = {
			Base = {
				Field = {
					Opacity = 1,
					BorderColor = {
						Transparency = 0.8,
						Color3 = Color3.new(0.22353, 0.23137, 0.23922)
					},
					BorderRadius = 8 * p0,
					Typography = {
						LineHeight = 1.25,
						LetterSpacing = 0,
						Font = Enum.Font.Gotham,
						FontSize = 16 * p0
					},
					Spacing = { Leading = 12 * p0, Trailing = 12 * p0 },
					Gap = 8 * p0
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
					ContentColor = { Transparency = 0.4, Color3 = Color3.new(0, 0, 0) },
					Size = 16 * p0
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
					LineHeight = 1.15,
					LetterSpacing = 0,
					Font = Enum.Font.Gotham,
					FontSize = 12 * p0
				},
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.37647, 0.38039, 0.38431)
				},
				Spacing = { Bottom = 4 * p0 }
			},
			Disabled = { Opacity = 0.32 }
		},
		HelperText = {
			Base = {
				Opacity = 1,
				Typography = {
					LineHeight = 1.2,
					LetterSpacing = 0,
					Font = Enum.Font.GothamMedium,
					FontSize = 10 * p0
				},
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.37647, 0.38039, 0.38431)
				},
				Padding = { Top = 4 * p0 }
			},
			Error = {
				ContentColor = {
					Transparency = 0,
					Color3 = Color3.new(0.96863, 0.29412, 0.32157)
				}
			}
		}
	}
end