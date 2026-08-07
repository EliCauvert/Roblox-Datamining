-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:00 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	return {
		Typography = p0.strictInterface({
			Title = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			Header = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			Subheader = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			Body = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			CaptionHeader = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			CaptionBody = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			}),
			Footer = p0.strictInterface({
				Font = p0.enum(Enum.Font),
				FontSize = p0.number,
				LineHeight = p0.number,
				LetterSpacing = p0.number
			})
		}),
		Color = p0.strictInterface({
			Background = p0.strictInterface({
				Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Contrast = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Muted = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				OnHover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				OnPress = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			BackgroundUi = p0.strictInterface({
				Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Contrast = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Ui = p0.strictInterface({
				Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Muted = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Emphasis = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Text = p0.strictInterface({
				Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Muted = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Emphasis = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Link = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Inverse = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Icon = p0.strictInterface({
				Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Emphasis = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				OnHover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Action = p0.strictInterface({
				Primary = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Border = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Content = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				PrimaryBrand = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Border = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Content = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Secondary = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Border = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Content = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Alert = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Border = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Content = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Subtle = p0.strictInterface({
					Background = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Border = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Content = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			State = p0.strictInterface({
				Standard = p0.strictInterface({
					Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Hover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Pressed = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Lighten = p0.strictInterface({
					Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Hover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Pressed = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Inverse = p0.strictInterface({
					Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Hover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Pressed = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				}),
				Darken = p0.strictInterface({
					Default = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Hover = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
					Pressed = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
				})
			}),
			Focus = p0.strictInterface({
				Start = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				End = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Gradient = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			}),
			Common = p0.strictInterface({
				Divider = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Overlay = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				DropShadow = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				NavigationBar = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Badge = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				BadgeContent = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Placeholder = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Online = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Offline = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Alert = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number }),
				Success = p0.strictInterface({ Color3 = p0.Color3, Transparency = p0.number })
			})
		}),
		Radius = p0.strictInterface({
			None = p0.number,
			Small = p0.number,
			Medium = p0.number,
			Large = p0.number,
			XLarge = p0.number,
			Circle = p0.number
		}),
		Icon = p0.strictInterface({
			Size = p0.strictInterface({
				Small = p0.number,
				Medium = p0.number,
				Large = p0.number,
				XLarge = p0.number,
				XxLarge = p0.number
			})
		}),
		Stroke = p0.strictInterface({ Input = p0.number, Focus = p0.number }),
		Offset = p0.strictInterface({
			Focus = p0.strictInterface({ Standard = p0.number, Inset = p0.number })
		}),
		Opacity = p0.strictInterface({
			State = p0.strictInterface({
				Lighten = p0.strictInterface({ Hover = p0.number, Pressed = p0.number }),
				Darken = p0.strictInterface({ Hover = p0.number, Pressed = p0.number })
			})
		})
	}
end