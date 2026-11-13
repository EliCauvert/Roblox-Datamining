local SharedModule = require(script.Parent.Parent.Shared)
local ColorsModule = require(script.Parent.Colors)

return function(Scale: number)
	-- upvalues: SharedModule (copy), ColorsModule (copy)
	local Kens = SharedModule.Tokens(Scale)
	
	return {
		Color = SharedModule.withExtended(ColorsModule.Dark()),
		Config = {
			ColorMode = { Name = "Dark", IsDark = "true", IsLight = "false" },
			Text = {
				Font = "rbxassetid://127896232205472",
				InverseScale = 0.8271298593879238,
				NominalScale = 1.209,
				Interval = 4.836 * Scale,
				Scale = Scale
			},
			Theme = {
				Name = "Classic",
				IsClassic = "true",
				IsDefault = "false",
				IsFoundation = "false",
				IsKids = "false",
				IsUIBlox = "false",
				Text = {
					Font = "rbxassetid://127896232205472",
					NominalScale = 1.209,
					FontWeight = {
						FontWeight_300 = "Regular",
						FontWeight_400 = "Regular",
						FontWeight_500 = "Regular",
						FontWeight_600 = "Bold",
						FontWeight_700 = "Bold",
						FontWeight_800 = "Bold"
					}
				}
			},
			UI = { Interval = 4, StrokeBase = 1, Scale = Scale }
		},
		DarkMode = ColorsModule.Dark(),
		Ease = Kens.Ease,
		FontSize = {
			FontSize_200 = 10 * Scale,
			FontSize_250 = 12 * Scale,
			FontSize_300 = 15 * Scale,
			FontSize_350 = 17 * Scale,
			FontSize_400 = 19 * Scale,
			FontSize_500 = 24 * Scale,
			FontSize_600 = 29 * Scale,
			FontSize_700 = 34 * Scale,
			FontSize_800 = 39 * Scale,
			FontSize_900 = 44 * Scale,
			FontSize_1000 = 48 * Scale,
			FontSize_1100 = 53 * Scale,
			FontSize_1200 = 58 * Scale,
			FontSize_1300 = 63 * Scale,
			FontSize_1400 = 68 * Scale,
			FontSize_1500 = 73 * Scale,
			FontSize_1600 = 77 * Scale,
			FontSize_1700 = 82 * Scale,
			FontSize_1800 = 87 * Scale,
			FontSize_1900 = 92 * Scale,
			FontSize_2000 = 97 * Scale,
			FontSize_2100 = 102 * Scale,
			FontSize_2200 = 106 * Scale,
			FontSize_2300 = 111 * Scale,
			FontSize_2400 = 116 * Scale,
			FontSize_2500 = 121 * Scale,
			FontSize_2600 = 126 * Scale,
			FontSize_2700 = 131 * Scale,
			FontSize_2800 = 135 * Scale,
			FontSize_2900 = 140 * Scale,
			FontSize_3000 = 145 * Scale
		},
		FontWeight = {
			FontWeight_300 = "Regular",
			FontWeight_400 = "Regular",
			FontWeight_500 = "Regular",
			FontWeight_600 = "Bold",
			FontWeight_700 = "Bold",
			FontWeight_800 = "Bold"
		},
		Gap = Kens.Gap,
		Gutter = Kens.Gutter,
		IconSize = Kens.IconSize,
		InputSize = Kens.InputSize,
		Inverse = ColorsModule.Light(),
		LetterSpacing = Kens.LetterSpacing,
		LightMode = ColorsModule.Light(),
		LineHeight = {
			LineHeight_100 = 0.827,
			LineHeight_120 = 0.993,
			LineHeight_130 = 1.075,
			LineHeight_140 = 1.158
		},
		Margin = Kens.Margin,
		Padding = Kens.Padding,
		Platform = Kens.Platform,
		Radius = Kens.Radius,
		Size = Kens.Size,
		Stroke = Kens.Stroke,
		Time = Kens.Time,
		ToggleSize = Kens.ToggleSize,
		Typography = {
			BodyLarge = {
				LetterSpacing = 0,
				LineHeight = 1.158,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				FontSize = 19 * Scale
			},
			BodyMedium = {
				LetterSpacing = 0,
				LineHeight = 1.177,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				FontSize = 17 * Scale
			},
			BodySmall = {
				LetterSpacing = 0,
				LineHeight = 1.2,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				FontSize = 15 * Scale
			},
			CaptionLarge = {
				LetterSpacing = 0,
				LineHeight = 1.177,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 17 * Scale
			},
			CaptionMedium = {
				LetterSpacing = 0,
				LineHeight = 1.2,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 15 * Scale
			},
			CaptionSmall = {
				LetterSpacing = 0,
				LineHeight = 1.167,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 12 * Scale
			},
			DisplayLarge = {
				LetterSpacing = -0.01,
				LineHeight = 0.99,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 97 * Scale
			},
			DisplayMedium = {
				LetterSpacing = -0.01,
				LineHeight = 1,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 68 * Scale
			},
			DisplaySmall = {
				LetterSpacing = -0.01,
				LineHeight = 1,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 48 * Scale
			},
			HeadingLarge = {
				LetterSpacing = -0.01,
				LineHeight = 1,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 34 * Scale
			},
			HeadingMedium = {
				LetterSpacing = -0.01,
				LineHeight = 1.103,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 29 * Scale
			},
			HeadingSmall = {
				LetterSpacing = -0.01,
				LineHeight = 1,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 24 * Scale
			},
			LabelLarge = {
				LetterSpacing = 0,
				LineHeight = 0.842,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 19 * Scale
			},
			LabelMedium = {
				LetterSpacing = 0,
				LineHeight = 0.824,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 17 * Scale
			},
			LabelSmall = {
				LetterSpacing = 0,
				LineHeight = 0.8,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 15 * Scale
			},
			TitleLarge = {
				LetterSpacing = 0,
				LineHeight = 1.158,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 19 * Scale
			},
			TitleMedium = {
				LetterSpacing = 0,
				LineHeight = 1.177,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 17 * Scale
			},
			TitleSmall = {
				LetterSpacing = 0,
				LineHeight = 1.2,
				Font = Font.new("rbxassetid://127896232205472", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				FontSize = 15 * Scale
			}
		}
	}
end