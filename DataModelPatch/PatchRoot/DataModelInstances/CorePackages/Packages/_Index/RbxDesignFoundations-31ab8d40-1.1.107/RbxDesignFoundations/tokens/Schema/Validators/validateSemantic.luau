return function(p1)
	return {
		Typography = p1.strictInterface({
			Title = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			Header = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			Subheader = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			Body = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			CaptionHeader = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			CaptionBody = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			}),
			Footer = p1.strictInterface({
				Font = p1.enum(Enum.Font),
				FontSize = p1.number,
				LineHeight = p1.number,
				LetterSpacing = p1.number
			})
		}),
		Color = p1.strictInterface({
			Background = p1.strictInterface({
				Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Contrast = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Muted = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				OnHover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				OnPress = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			BackgroundUi = p1.strictInterface({
				Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Contrast = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Ui = p1.strictInterface({
				Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Muted = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Emphasis = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Text = p1.strictInterface({
				Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Muted = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Emphasis = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Link = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Inverse = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Icon = p1.strictInterface({
				Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Emphasis = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				OnHover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Action = p1.strictInterface({
				Primary = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Border = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Content = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				PrimaryBrand = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Border = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Content = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Secondary = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Border = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Content = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Alert = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Border = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Content = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Subtle = p1.strictInterface({
					Background = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Border = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Content = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			State = p1.strictInterface({
				Standard = p1.strictInterface({
					Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Hover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Pressed = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Lighten = p1.strictInterface({
					Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Hover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Pressed = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Inverse = p1.strictInterface({
					Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Hover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Pressed = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				}),
				Darken = p1.strictInterface({
					Default = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Hover = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
					Pressed = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
				})
			}),
			Focus = p1.strictInterface({
				Start = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				End = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Gradient = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			}),
			Common = p1.strictInterface({
				Divider = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Overlay = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				DropShadow = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				NavigationBar = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Badge = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				BadgeContent = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Placeholder = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Online = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Offline = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Alert = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number }),
				Success = p1.strictInterface({ Color3 = p1.Color3, Transparency = p1.number })
			})
		}),
		Radius = p1.strictInterface({
			None = p1.number,
			Small = p1.number,
			Medium = p1.number,
			Large = p1.number,
			XLarge = p1.number,
			Circle = p1.number
		}),
		Icon = p1.strictInterface({
			Size = p1.strictInterface({
				Small = p1.number,
				Medium = p1.number,
				Large = p1.number,
				XLarge = p1.number,
				XxLarge = p1.number
			})
		}),
		Stroke = p1.strictInterface({ Input = p1.number, Focus = p1.number }),
		Offset = p1.strictInterface({
			Focus = p1.strictInterface({ Standard = p1.number, Inset = p1.number })
		}),
		Opacity = p1.strictInterface({
			State = p1.strictInterface({
				Lighten = p1.strictInterface({ Hover = p1.number, Pressed = p1.number }),
				Darken = p1.strictInterface({ Hover = p1.number, Pressed = p1.number })
			})
		})
	}
end