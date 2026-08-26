return function(p1)
	return {
		VerticalTile = p1.strictInterface({
			Base = p1.strictInterface({
				Container = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderWidth = p1.number,
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					DropShadow = p1.strictInterface({
						X = p1.number,
						Y = p1.number,
						Blur = p1.number,
						Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
					}),
					BorderRadius = p1.strictInterface({
						LeadingTop = p1.number,
						TrailingTop = p1.number,
						TrailingBottom = p1.number,
						LeadingBottom = p1.number
					})
				}),
				ContentTop = p1.strictInterface({
					Spacing = p1.strictInterface({
						Top = p1.number,
						Trailing = p1.number,
						Bottom = p1.number,
						Leading = p1.number
					})
				}),
				ContentBottom = p1.strictInterface({
					Spacing = p1.strictInterface({
						Top = p1.number,
						Trailing = p1.number,
						Bottom = p1.number,
						Leading = p1.number
					})
				})
			})
		}),
		PlayerTileSmall = p1.strictInterface({
			Base = p1.strictInterface({
				Container = p1.strictInterface({
					Gap = p1.number,
					Spacing = p1.strictInterface({
						Top = p1.number,
						Trailing = p1.number,
						Bottom = p1.number,
						Leading = p1.number
					})
				}),
				Image = p1.strictInterface({
					Size = p1.number,
					BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderRadius = p1.number,
					BorderWidth = p1.number
				}),
				Status = p1.strictInterface({
					Size = p1.number,
					BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderWidth = p1.number
				}),
				Content = p1.strictInterface({
					Gap = p1.number,
					Typography = p1.strictInterface({
						Font = p1.enum(Enum.Font),
						FontSize = p1.number,
						LineHeight = p1.number,
						LetterSpacing = p1.number
					}),
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Icon = p1.strictInterface({ Size = p1.number }),
				Presence = p1.strictInterface({
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			})
		}),
		Facepile = p1.strictInterface({
			Container = p1.strictInterface({ Gap = p1.number }),
			FaceGroup = p1.strictInterface({ Gap = p1.number }),
			Face = p1.strictInterface({
				BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				BorderWidth = p1.number,
				BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				BorderRadius = p1.number,
				Width = p1.number,
				Height = p1.number
			}),
			Badge = p1.strictInterface({
				BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				BorderWidth = p1.number,
				BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				BorderRadius = p1.number,
				Spacing = p1.number,
				Height = p1.number,
				MinWidth = p1.number,
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			}),
			Label = p1.strictInterface({
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			})
		}),
		ControllerBar = p1.strictInterface({
			BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
			BorderRadius = p1.strictInterface({
				LeadingTop = p1.number,
				TrailingTop = p1.number,
				TrailingBottom = p1.number,
				LeadingBottom = p1.number
			}),
			Spacing = p1.strictInterface({
				Top = p1.number,
				Trailing = p1.number,
				Bottom = p1.number,
				Leading = p1.number
			}),
			Gap = p1.number
		}),
		ControllerBarShortcut = p1.strictInterface({
			Container = p1.strictInterface({
				Gap = p1.number,
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Icon = p1.strictInterface({ Size = p1.number }),
			Label = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			})
		}),
		SelectionCursor = p1.strictInterface({
			BorderWidth = p1.number,
			Offset = p1.number,
			Inset = p1.number,
			Gradient = p1.strictInterface({
				Start = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				End = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			})
		}),
		StateLayer = p1.strictInterface({
			Base = p1.strictInterface({ BorderWidth = p1.number }),
			Standard = p1.strictInterface({
				Initialize = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Default = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Hover = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Pressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Selected = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				SelectedPressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Disabled = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			Lighten = p1.strictInterface({
				Initialize = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Default = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Hover = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Pressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Selected = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				SelectedPressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Disabled = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			Inverse = p1.strictInterface({
				Initialize = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Default = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Hover = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Pressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Selected = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				SelectedPressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Disabled = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			Darken = p1.strictInterface({
				Initialize = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Default = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Hover = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Pressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Selected = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				SelectedPressed = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Disabled = p1.strictInterface({
					Color = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			})
		}),
		MenuCell = p1.strictInterface({
			Base = p1.strictInterface({
				Container = p1.strictInterface({
					Height = p1.number,
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderRadius = p1.strictInterface({
						TopLeading = p1.number,
						TopTrailing = p1.number,
						BottomTrailing = p1.number,
						BottomLeading = p1.number
					}),
					BorderWidth = p1.number,
					Spacing = p1.strictInterface({
						Top = p1.number,
						Trailing = p1.number,
						Bottom = p1.number,
						Leading = p1.number
					})
				}),
				IconFrame = p1.strictInterface({ Size = p1.number }),
				TextFrame = p1.strictInterface({
					Spacing = p1.strictInterface({
						Top = p1.number,
						Trailing = p1.number,
						Bottom = p1.number,
						Leading = p1.number
					})
				}),
				Text = p1.strictInterface({
					Typography = p1.strictInterface({
						Font = p1.enum(Enum.Font),
						FontSize = p1.number,
						LineHeight = p1.number,
						LetterSpacing = p1.number
					})
				}),
				CheckFrame = p1.strictInterface({ Size = p1.number })
			}),
			Divider = p1.strictInterface({
				Container = p1.strictInterface({ BorderWidth = p1.number })
			}),
			Disabled = p1.strictInterface({
				Container = p1.strictInterface({
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			HasRoundBottom = p1.strictInterface({
				Container = p1.strictInterface({
					BorderRadius = p1.strictInterface({ BottomTrailing = p1.number, BottomLeading = p1.number })
				})
			}),
			HasRoundTop = p1.strictInterface({
				Container = p1.strictInterface({
					BorderRadius = p1.strictInterface({ TopLeading = p1.number, TopTrailing = p1.number })
				})
			})
		}),
		BaseMenu = p1.strictInterface({
			BorderRadius = p1.number,
			BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
		}),
		StatGroup = p1.strictInterface({ Gap = p1.number }),
		StatItem = p1.strictInterface({
			Container = p1.strictInterface({
				Gap = p1.number,
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Icon = p1.strictInterface({ Size = p1.number }),
			Label = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			})
		}),
		MediaTile = p1.strictInterface({
			Container = p1.strictInterface({ BorderRadius = p1.number }),
			Icon = p1.strictInterface({ Size = p1.number })
		}),
		StatWidget = p1.strictInterface({
			Container = p1.strictInterface({
				Gap = p1.number,
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Icon = p1.strictInterface({ Size = p1.number }),
			DataGroup = p1.strictInterface({ Gap = p1.number }),
			Data = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			}),
			Label = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				})
			})
		}),
		RateCount = p1.strictInterface({
			Container = p1.strictInterface({
				Spacing = p1.number,
				Gap = p1.number,
				BorderRadius = p1.number,
				BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			ButtonGroup = p1.strictInterface({ Gap = p1.number })
		}),
		PlayerCount = p1.strictInterface({
			Container = p1.strictInterface({
				Spacing = p1.number,
				BorderRadius = p1.number,
				BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			})
		}),
		VerticalScrollView = p1.strictInterface({
			Base = p1.strictInterface({
				Handle = p1.strictInterface({
					BackgroundColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderRadius = p1.number
				}),
				Icon = p1.strictInterface({ Size = p1.number }),
				Track = p1.strictInterface({
					Opacity = p1.number,
					Spacing = p1.strictInterface({ Top = p1.number, Bottom = p1.number })
				})
			}),
			Compact = p1.strictInterface({
				Handle = p1.strictInterface({ Width = p1.number }),
				Track = p1.strictInterface({ Width = p1.number })
			}),
			Wide = p1.strictInterface({
				Handle = p1.strictInterface({ Width = p1.number }),
				Track = p1.strictInterface({ Width = p1.number })
			}),
			Gamepad = p1.strictInterface({
				Handle = p1.strictInterface({ Width = p1.number }),
				Track = p1.strictInterface({ Width = p1.number })
			})
		}),
		TextField = p1.strictInterface({
			Base = p1.strictInterface({
				Field = p1.strictInterface({
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					BorderRadius = p1.number,
					Typography = p1.strictInterface({
						Font = p1.enum(Enum.Font),
						FontSize = p1.number,
						LineHeight = p1.number,
						LetterSpacing = p1.number
					}),
					Spacing = p1.strictInterface({ Leading = p1.number, Trailing = p1.number }),
					Gap = p1.number,
					Opacity = p1.number
				}),
				PlaceholderText = p1.strictInterface({
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				FieldValue = p1.strictInterface({
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				IconLeading = p1.strictInterface({
					ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Size = p1.number
				})
			}),
			Error = p1.strictInterface({
				Field = p1.strictInterface({
					BorderColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			Disabled = p1.strictInterface({ Field = p1.strictInterface({ Opacity = p1.number }) })
		}),
		InputLabel = p1.strictInterface({
			Base = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				}),
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Spacing = p1.strictInterface({ Bottom = p1.number }),
				Opacity = p1.number
			}),
			Disabled = p1.strictInterface({ Opacity = p1.number })
		}),
		HelperText = p1.strictInterface({
			Base = p1.strictInterface({
				Typography = p1.strictInterface({
					Font = p1.enum(Enum.Font),
					FontSize = p1.number,
					LineHeight = p1.number,
					LetterSpacing = p1.number
				}),
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Padding = p1.strictInterface({ Top = p1.number }),
				Opacity = p1.number
			}),
			Error = p1.strictInterface({
				ContentColor = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			})
		})
	}
end