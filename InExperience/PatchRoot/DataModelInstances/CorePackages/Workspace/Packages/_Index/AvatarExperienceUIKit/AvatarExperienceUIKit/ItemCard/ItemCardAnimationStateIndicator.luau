local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local t = {
		TabsLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			Padding = UDim.new(0, var1.Gap.XSmall)
		})
	}
	local text = nil
	
	for i, v in p1.states do
		local var2 = if v.isSelected then var1.Color.Stroke.Emphasis else var1.Color.Stroke.Muted
		t[`{i}-{v.text}`] = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var2.Color3,
			Transparency = var2.Transparency,
			Size = UDim2.new(1, 0, 0, var1.Size.Size_150),
			LayoutOrder = i
		})
		
		if v.isSelected then
			text = v.text
		end
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		Padding = if p1.paddingTop or p1.paddingBottom or (p1.paddingLeft or p1.paddingRight) then reactModule.createElement("UIPadding", {
			PaddingTop = p1.paddingTop,
			PaddingBottom = p1.paddingBottom,
			PaddingLeft = p1.paddingLeft,
			PaddingRight = p1.paddingRight
		}) else nil,
		Tabs = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t),
		Label = if text then reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			Text = text,
			Font = var1.Typography.TitleLarge.Font,
			TextSize = var1.Typography.TitleLarge.FontSize,
			TextColor3 = var1.Color.Content.Emphasis.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil
	})
end