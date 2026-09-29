local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), imageSetLabel (ref)
	local var1 = useDesignTokens()
	local padding = p1.padding or var1.Size.Size_100
	local iconSize = p1.iconSize or 18
	local font = var1.Typography.BodyLarge.Font
	local fontSize350 = var1.FontSize.FontSize_350
	local default = var1.Color.Content.Default
	local font_1 = var1.Typography.TitleLarge.Font
	local emphasis = var1.Color.Content.Emphasis
	local textLabel = reactModule.createElement("TextLabel", {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Text = p1.bodyText,
		Font = if foundationFontFaceMigration then nil else font_1,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(font_1) else nil,
		TextSize = var1.Typography.TitleLarge.FontSize,
		TextColor3 = emphasis.Color3,
		TextTransparency = emphasis.Transparency,
		TextYAlignment = Enum.TextYAlignment.Center
	})
	
	return reactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.XY,
		TextTransparency = 1,
		Text = "",
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		[reactModule.Event.Activated] = p1.onActivated
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, padding)
		}),
		Header = reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.headerText,
			Font = if foundationFontFaceMigration then nil else font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(font) else nil,
			TextSize = fontSize350,
			TextColor3 = default.Color3,
			TextTransparency = default.Transparency,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Body = if p1.icon then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			BodyLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, var1.Size.Size_100)
			}),
			Icon = reactModule.createElement(imageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(iconSize, iconSize),
				Image = p1.icon,
				ImageColor3 = emphasis.Color3,
				ImageTransparency = emphasis.Transparency
			}),
			BodyText = textLabel
		}) else textLabel
	})
end