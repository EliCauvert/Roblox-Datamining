local SharedModule = require(script.Parent.Parent.Shared)
local ColorsModule = require(script.Parent.Colors)

return function(Scale: number)
	-- upvalues: SharedModule (copy), ColorsModule (copy)
	local Kens = SharedModule.Tokens(Scale)
	local TypographyResult = SharedModule.Typography(Scale)
	
	return {
		Color = SharedModule.withExtended(ColorsModule.Light()),
		Config = {
			ColorMode = { Name = "Light", IsDark = "false", IsLight = "true" },
			Text = {
				Font = "rbxasset://fonts/families/BuilderSans.json",
				InverseScale = 0.7936507936507936,
				NominalScale = 1.26,
				Interval = 5.04 * Scale,
				Scale = Scale
			},
			Theme = {
				Name = "NebulaDrift",
				IsClassic = "false",
				IsDefault = "false",
				IsFoundation = "false",
				IsKids = "false",
				IsUIBlox = "false",
				Text = {
					Font = "rbxasset://fonts/families/BuilderSans.json",
					NominalScale = 1.26,
					FontWeight = {
						FontWeight_300 = "Light",
						FontWeight_400 = "Regular",
						FontWeight_500 = "Medium",
						FontWeight_600 = "SemiBold",
						FontWeight_700 = "Bold",
						FontWeight_800 = "ExtraBold"
					}
				}
			},
			UI = { Interval = 4, StrokeBase = 1, Scale = Scale }
		},
		DarkMode = ColorsModule.Dark(),
		Ease = Kens.Ease,
		FontSize = TypographyResult.FontSize,
		FontWeight = TypographyResult.FontWeight,
		Gap = Kens.Gap,
		Gutter = Kens.Gutter,
		IconSize = Kens.IconSize,
		InputSize = Kens.InputSize,
		Inverse = ColorsModule.Dark(),
		LetterSpacing = Kens.LetterSpacing,
		LightMode = ColorsModule.Light(),
		LineHeight = TypographyResult.LineHeight,
		Margin = Kens.Margin,
		Padding = Kens.Padding,
		Platform = Kens.Platform,
		Radius = Kens.Radius,
		Size = Kens.Size,
		Stroke = Kens.Stroke,
		Time = Kens.Time,
		ToggleSize = Kens.ToggleSize,
		Typography = TypographyResult.Typography
	}
end