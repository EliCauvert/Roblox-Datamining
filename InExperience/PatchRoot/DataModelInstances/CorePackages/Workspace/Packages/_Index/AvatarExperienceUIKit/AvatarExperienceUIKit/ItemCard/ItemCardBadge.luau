local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local itemCardIconModule = require(script.Parent.ItemCardIcon)
local AXItemCardBadgeCheckText = game:DefineFastFlag("AXItemCardBadgeCheckText", false)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), AXItemCardBadgeCheckText (ref), text (ref), itemCardIconModule (ref)
	local var4 = useTokens()
	local t = {
		ItemCardBadgeCornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Border = if p0.displayBorder then reactModule.createElement("UIStroke", {
			Color = var4.Color.Stroke.Default.Color3,
			Transparency = var4.Color.Stroke.Default.Transparency,
			Thickness = var4.Stroke.Thick
		}) else nil,
		ItemCardBadgeLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var4.Gap.XSmall)
		}),
		ItemCardBadgePadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var4.Padding.Small),
			PaddingRight = UDim.new(0, var4.Padding.Small),
			PaddingTop = UDim.new(0, var4.Padding.Small),
			PaddingBottom = UDim.new(0, var4.Padding.Small)
		})
	}
	
	for i, v in p0.content do
		if v.type ~= "text" then
			t[v.icon .. tostring(i)] = reactModule.createElement(itemCardIconModule, { icon = v.icon, LayoutOrder = i })
		elseif not AXItemCardBadgeCheckText then
			t[v.text .. tostring(i)] = reactModule.createElement(text, {
				textStyle = var4.Color.Content.Emphasis,
				fontStyle = var4.Typography.TitleSmall,
				LayoutOrder = i,
				Text = v.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		elseif v.text ~= "" then
			t[v.text .. tostring(i)] = reactModule.createElement(text, {
				textStyle = var4.Color.Content.Emphasis,
				fontStyle = var4.Typography.TitleSmall,
				LayoutOrder = i,
				Text = v.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		end
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var4.Color.OverMedia.OverMedia_100.Color3,
		BackgroundTransparency = var4.Color.OverMedia.OverMedia_100.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY
	}, t)
end