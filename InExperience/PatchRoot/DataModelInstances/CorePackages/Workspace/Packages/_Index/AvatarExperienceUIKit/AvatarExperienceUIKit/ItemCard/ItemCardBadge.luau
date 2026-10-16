local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ItemCardIconModule = require(script.Parent.ItemCardIcon)
local AXItemCardBadgeCheckText = game:DefineFastFlag("AXItemCardBadgeCheckText", false)

return function(Frame) --[[ Line: 24 | Named "ItemCardBadge" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), AXItemCardBadgeCheckText (copy), Text (copy), ItemCardIconModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Elements = {
		ItemCardBadgeCornerRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Border = if Frame.displayBorder then ReactModule.createElement("UIStroke", {
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = UseTokensResult.Stroke.Thick
		}) else nil,
		ItemCardBadgeLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.XSmall)
		}),
		ItemCardBadgePadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.Small)
		})
	}
	
	for LayoutOrder, value in Frame.content do
		if value.type ~= "text" then
			Elements[value.icon .. tostring(LayoutOrder)] = ReactModule.createElement(ItemCardIconModule, { icon = value.icon, LayoutOrder = LayoutOrder })
			continue
		end
		if not AXItemCardBadgeCheckText then
			Elements[value.text .. tostring(LayoutOrder)] = ReactModule.createElement(Text, {
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.TitleSmall,
				LayoutOrder = LayoutOrder,
				Text = value.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		elseif value.text ~= "" then
			Elements[value.text .. tostring(LayoutOrder)] = ReactModule.createElement(Text, {
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.TitleSmall,
				LayoutOrder = LayoutOrder,
				Text = value.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		end
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = UseTokensResult.Color.OverMedia.OverMedia_100.Color3,
		BackgroundTransparency = UseTokensResult.Color.OverMedia.OverMedia_100.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY
	}, Elements)
end