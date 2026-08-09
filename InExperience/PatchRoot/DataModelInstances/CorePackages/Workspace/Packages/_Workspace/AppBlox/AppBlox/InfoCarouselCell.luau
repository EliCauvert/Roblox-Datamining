local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

return function(p0) --[[ line: 25 ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), imageSetLabel (ref)
	local var1 = useDesignTokens()
	local padding = p0.padding or var1.Size.Size_100
	local iconSize = p0.iconSize or 18
	local font = var1.Typography.BodyLarge.Font
	local var4 = if fFlagRenameDeprecatedUIBloxTokens then var1.FontSize.FontSize_350 else var1.FontSize.FontSize_300
	local default = var1.Color.Content.Default
	local emphasis = var1.Color.Content.Emphasis
	local textLabel = reactModule.createElement("TextLabel", {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Text = p0.bodyText,
		Font = var1.Typography.TitleLarge.Font,
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
		LayoutOrder = p0.LayoutOrder,
		[reactModule.Event.Activated] = p0.onActivated
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
			Text = p0.headerText,
			Font = font,
			TextSize = var4,
			TextColor3 = default.Color3,
			TextTransparency = default.Transparency,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Body = if p0.icon then reactModule.createElement("Frame", {
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
				Image = p0.icon,
				ImageColor3 = emphasis.Color3,
				ImageTransparency = emphasis.Transparency
			}),
			BodyText = textLabel
		}) else textLabel
	})
end