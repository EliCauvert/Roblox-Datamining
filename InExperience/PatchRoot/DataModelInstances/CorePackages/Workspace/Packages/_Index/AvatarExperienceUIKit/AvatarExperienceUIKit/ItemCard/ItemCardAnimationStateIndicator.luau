local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return function(p1) --[[ Line: 25 | Named "ItemCardAnimationStateIndicator" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local config = {
		TabsLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			Padding = UDim.new(0, UseTokensResult.Gap.XSmall)
		})
	}
	local Text = nil
	
	for LayoutOrder, state in p1.states do
		local Emphasis = if state.isSelected then UseTokensResult.Color.Stroke.Emphasis else UseTokensResult.Color.Stroke.Muted
		config[`{LayoutOrder}-{state.text}`] = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Emphasis.Color3,
			Transparency = Emphasis.Transparency,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_150),
			LayoutOrder = LayoutOrder
		})
		
		if state.isSelected then
			Text = state.text
		end
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		Padding = if p1.paddingTop or p1.paddingBottom or p1.paddingLeft or p1.paddingRight then ReactModule.createElement("UIPadding", {
			PaddingTop = p1.paddingTop,
			PaddingBottom = p1.paddingBottom,
			PaddingLeft = p1.paddingLeft,
			PaddingRight = p1.paddingRight
		}) else nil,
		Tabs = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, config),
		Label = if Text then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			Text = Text,
			Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.TitleLarge.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.TitleLarge.Font) else nil,
			TextSize = UseTokensResult.Typography.TitleLarge.FontSize,
			TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil
	})
end