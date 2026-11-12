local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), NormalizeFontFaceFunction (copy), ImageSetLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Padding = Frame.padding or UseDesignTokensResult.Size.Size_100
	local IconSize = Frame.iconSize or 18
	local BodyLargeFont = UseDesignTokensResult.Typography.BodyLarge.Font
	local FontSize350 = UseDesignTokensResult.FontSize.FontSize_350
	local Default = UseDesignTokensResult.Color.Content.Default
	local Emphasis = UseDesignTokensResult.Color.Content.Emphasis
	local TextLabel = ReactModule.createElement("TextLabel", {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Text = Frame.bodyText,
		FontFace = NormalizeFontFaceFunction(UseDesignTokensResult.Typography.TitleLarge.Font),
		TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
		TextColor3 = Emphasis.Color3,
		TextTransparency = Emphasis.Transparency,
		TextYAlignment = Enum.TextYAlignment.Center
	})
	
	return ReactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.XY,
		TextTransparency = 1,
		Text = "",
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Event.Activated] = Frame.onActivated
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Padding)
		}),
		Header = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = Frame.headerText,
			FontFace = NormalizeFontFaceFunction(BodyLargeFont),
			TextSize = FontSize350,
			TextColor3 = Default.Color3,
			TextTransparency = Default.Transparency,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Body = if Frame.icon then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			BodyLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
			}),
			Icon = ReactModule.createElement(ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(IconSize, IconSize),
				Image = Frame.icon,
				ImageColor3 = Emphasis.Color3,
				ImageTransparency = Emphasis.Transparency
			}),
			BodyText = TextLabel
		}) else TextLabel
	})
end