return function(p0)
	return {
		VerticalTile = p0.strictInterface({
			Base = p0.strictInterface({
				Container = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderWidth = p0.number,
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					DropShadow = p0.strictInterface({
						X = p0.number,
						Y = p0.number,
						Blur = p0.number,
						Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
					}),
					BorderRadius = p0.strictInterface({
						LeadingTop = p0.number,
						TrailingTop = p0.number,
						TrailingBottom = p0.number,
						LeadingBottom = p0.number
					})
				}),
				ContentTop = p0.strictInterface({
					Spacing = p0.strictInterface({
						Top = p0.number,
						Trailing = p0.number,
						Bottom = p0.number,
						Leading = p0.number
					})
				}),
				ContentBottom = p0.strictInterface({
					Spacing = p0.strictInterface({
						Top = p0.number,
						Trailing = p0.number,
						Bottom = p0.number,
						Leading = p0.number
					})
				})
			})
		}),
		PlayerTileSmall = p0.strictInterface({
			Base = p0.strictInterface({
				Container = p0.strictInterface({
					Gap = p0.number,
					Spacing = p0.strictInterface({
						Top = p0.number,
						Trailing = p0.number,
						Bottom = p0.number,
						Leading = p0.number
					})
				}),
				Image = p0.strictInterface({
					Size = p0.number,
					BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderRadius = p0.number,
					BorderWidth = p0.number
				}),
				Status = p0.strictInterface({
					Size = p0.number,
					BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderWidth = p0.number
				}),
				Content = p0.strictInterface({
					Gap = p0.number,
					Typography = p0.strictInterface({
						Font = p0.enum(Enum.Font),
						FontSize = p0.number,
						LineHeight = p0.number,
						LetterSpacing = p0.number
					}),
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Icon = p0.strictInterface({ Size = p0.number }),
				Presence = p0.strictInterface({
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			})
		}),
		Facepile = p0.strictInterface({
			Container = p0.strictInterface({ Gap = p0.number }),
			FaceGroup = p0.strictInterface({ Gap = p0.number }),
			Face = p0.strictInterface({
				BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				BorderWidth = p0.number,
				BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				BorderRadius = p0.number,
				Width = p0.number,
				Height = p0.number
			}),
			Badge = p0.strictInterface({
				BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				BorderWidth = p0.number,
				BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				BorderRadius = p0.number,
				Spacing = p0.number,
				Height = p0.number,
				MinWidth = p0.number,
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			}),
			Label = p0.strictInterface({
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			})
		}),
		ControllerBar = p0.strictInterface({
			BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
			BorderRadius = p0.strictInterface({
				LeadingTop = p0.number,
				TrailingTop = p0.number,
				TrailingBottom = p0.number,
				LeadingBottom = p0.number
			}),
			Spacing = p0.strictInterface({
				Top = p0.number,
				Trailing = p0.number,
				Bottom = p0.number,
				Leading = p0.number
			}),
			Gap = p0.number
		}),
		ControllerBarShortcut = p0.strictInterface({
			Container = p0.strictInterface({
				Gap = p0.number,
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Icon = p0.strictInterface({ Size = p0.number }),
			Label = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			})
		}),
		SelectionCursor = p0.strictInterface({
			BorderWidth = p0.number,
			Offset = p0.number,
			Inset = p0.number,
			Gradient = p0.strictInterface({
				Start = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				End = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			})
		}),
		StateLayer = p0.strictInterface({
			Base = p0.strictInterface({ BorderWidth = p0.number }),
			Standard = p0.strictInterface({
				Initialize = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Default = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Hover = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Pressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Selected = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				SelectedPressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Disabled = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			Lighten = p0.strictInterface({
				Initialize = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Default = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Hover = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Pressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Selected = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				SelectedPressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Disabled = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			Inverse = p0.strictInterface({
				Initialize = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Default = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Hover = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Pressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Selected = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				SelectedPressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Disabled = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			Darken = p0.strictInterface({
				Initialize = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Default = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Hover = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Pressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Selected = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				SelectedPressed = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Disabled = p0.strictInterface({
					Color = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			})
		}),
		MenuCell = p0.strictInterface({
			Base = p0.strictInterface({
				Container = p0.strictInterface({
					Height = p0.number,
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderRadius = p0.strictInterface({
						TopLeading = p0.number,
						TopTrailing = p0.number,
						BottomTrailing = p0.number,
						BottomLeading = p0.number
					}),
					BorderWidth = p0.number,
					Spacing = p0.strictInterface({
						Top = p0.number,
						Trailing = p0.number,
						Bottom = p0.number,
						Leading = p0.number
					})
				}),
				IconFrame = p0.strictInterface({ Size = p0.number }),
				TextFrame = p0.strictInterface({
					Spacing = p0.strictInterface({
						Top = p0.number,
						Trailing = p0.number,
						Bottom = p0.number,
						Leading = p0.number
					})
				}),
				Text = p0.strictInterface({
					Typography = p0.strictInterface({
						Font = p0.enum(Enum.Font),
						FontSize = p0.number,
						LineHeight = p0.number,
						LetterSpacing = p0.number
					})
				}),
				CheckFrame = p0.strictInterface({ Size = p0.number })
			}),
			Divider = p0.strictInterface({
				Container = p0.strictInterface({ BorderWidth = p0.number })
			}),
			Disabled = p0.strictInterface({
				Container = p0.strictInterface({
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			HasRoundBottom = p0.strictInterface({
				Container = p0.strictInterface({
					BorderRadius = p0.strictInterface({ BottomTrailing = p0.number, BottomLeading = p0.number })
				})
			}),
			HasRoundTop = p0.strictInterface({
				Container = p0.strictInterface({
					BorderRadius = p0.strictInterface({ TopLeading = p0.number, TopTrailing = p0.number })
				})
			})
		}),
		BaseMenu = p0.strictInterface({
			BorderRadius = p0.number,
			BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
		}),
		StatGroup = p0.strictInterface({ Gap = p0.number }),
		StatItem = p0.strictInterface({
			Container = p0.strictInterface({
				Gap = p0.number,
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Icon = p0.strictInterface({ Size = p0.number }),
			Label = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			})
		}),
		MediaTile = p0.strictInterface({
			Container = p0.strictInterface({ BorderRadius = p0.number }),
			Icon = p0.strictInterface({ Size = p0.number })
		}),
		StatWidget = p0.strictInterface({
			Container = p0.strictInterface({
				Gap = p0.number,
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Icon = p0.strictInterface({ Size = p0.number }),
			DataGroup = p0.strictInterface({ Gap = p0.number }),
			Data = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			}),
			Label = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				})
			})
		}),
		RateCount = p0.strictInterface({
			Container = p0.strictInterface({
				Spacing = p0.number,
				Gap = p0.number,
				BorderRadius = p0.number,
				BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			ButtonGroup = p0.strictInterface({ Gap = p0.number })
		}),
		PlayerCount = p0.strictInterface({
			Container = p0.strictInterface({
				Spacing = p0.number,
				BorderRadius = p0.number,
				BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			})
		}),
		VerticalScrollView = p0.strictInterface({
			Base = p0.strictInterface({
				Handle = p0.strictInterface({
					BackgroundColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderRadius = p0.number
				}),
				Icon = p0.strictInterface({ Size = p0.number }),
				Track = p0.strictInterface({
					Opacity = p0.number,
					Spacing = p0.strictInterface({ Top = p0.number, Bottom = p0.number })
				})
			}),
			Compact = p0.strictInterface({
				Handle = p0.strictInterface({ Width = p0.number }),
				Track = p0.strictInterface({ Width = p0.number })
			}),
			Wide = p0.strictInterface({
				Handle = p0.strictInterface({ Width = p0.number }),
				Track = p0.strictInterface({ Width = p0.number })
			}),
			Gamepad = p0.strictInterface({
				Handle = p0.strictInterface({ Width = p0.number }),
				Track = p0.strictInterface({ Width = p0.number })
			})
		}),
		TextField = p0.strictInterface({
			Base = p0.strictInterface({
				Field = p0.strictInterface({
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					BorderRadius = p0.number,
					Typography = p0.strictInterface({
						Font = p0.enum(Enum.Font),
						FontSize = p0.number,
						LineHeight = p0.number,
						LetterSpacing = p0.number
					}),
					Spacing = p0.strictInterface({ Leading = p0.number, Trailing = p0.number }),
					Gap = p0.number,
					Opacity = p0.number
				}),
				PlaceholderText = p0.strictInterface({
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				FieldValue = p0.strictInterface({
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				IconLeading = p0.strictInterface({
					ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Size = p0.number
				})
			}),
			Error = p0.strictInterface({
				Field = p0.strictInterface({
					BorderColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			Disabled = p0.strictInterface({ Field = p0.strictInterface({ Opacity = p0.number }) })
		}),
		InputLabel = p0.strictInterface({
			Base = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				}),
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Spacing = p0.strictInterface({ Bottom = p0.number }),
				Opacity = p0.number
			}),
			Disabled = p0.strictInterface({ Opacity = p0.number })
		}),
		HelperText = p0.strictInterface({
			Base = p0.strictInterface({
				Typography = p0.strictInterface({
					Font = p0.enum(Enum.Font),
					FontSize = p0.number,
					LineHeight = p0.number,
					LetterSpacing = p0.number
				}),
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Padding = p0.strictInterface({ Top = p0.number }),
				Opacity = p0.number
			}),
			Error = p0.strictInterface({
				ContentColor = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			})
		})
	}
end