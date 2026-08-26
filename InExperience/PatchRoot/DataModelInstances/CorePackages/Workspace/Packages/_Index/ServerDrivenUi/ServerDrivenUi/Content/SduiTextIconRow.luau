local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local checkAndFormatPossibleLink = require(parent.CollectionViews).checkAndFormatPossibleLink
local textSizeModule = require(parent.TextSize)
local t = {
	anchorPoint = "AnchorPoint",
	automaticSize = "AutomaticSize",
	backgroundColor3 = "BackgroundColor3",
	backgroundTransparency = "BackgroundTransparency",
	layoutOrder = "LayoutOrder",
	position = "Position",
	richText = "RichText",
	size = "Size",
	text = "Text",
	textTruncate = "TextTruncate",
	textWrapped = "TextWrapped",
	textXAlignment = "TextXAlignment",
	textYAlignment = "TextYAlignment",
	zIndex = "ZIndex"
}

local function applyOverrides(p1, p2)
	-- upvalues: t (ref), cryoModule (ref)
	if p2 == nil then
		return p1
	end
	local t_1 = {}
	
	for i, v in p2 do
		t_1[t[i] or i] = v
	end
	return cryoModule.Dictionary.join(p1, t_1)
end

return reactModule.memo(function(p3)
	-- upvalues: textSizeModule (ref), useTokens (ref), checkAndFormatPossibleLink (ref), reactModule (ref), applyOverrides (ref), imageSetLabel (ref)
	local layoutOrder = p3.layoutOrder
	local anchorPoint = p3.anchorPoint
	local automaticSize = p3.automaticSize
	local size = p3.size
	local zIndex = p3.zIndex
	local position = p3.position
	local selectable = p3.selectable
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var1 = useTokens()
	local fontStyle = p3.fontStyle or var1.Typography.HeadingSmall
	local textColor = p3.textColor or var1.Color.Content.Emphasis.Color3
	local ceiled = math.ceil(fontStyle.LineHeight * fontStyle.FontSize + textSizeOffset)
	local var2 = if p3.iconWidth then UDim2.new(0, p3.iconWidth, 0, p3.iconWidth) else UDim2.new(0, ceiled, 0, ceiled)
	local iconColor = p3.iconColor or textColor
	local var3 = p3.onActivated ~= nil
	local var4, var5 = checkAndFormatPossibleLink(p3.text)
	
	return reactModule.createElement(if var3 then "TextButton" else "Frame", {
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize,
		Size = size or UDim2.new(1, 0, 0, ceiled),
		BackgroundTransparency = if p3.backgroundStyle then p3.backgroundStyle.Transparency else 1,
		BackgroundColor3 = if p3.backgroundStyle then p3.backgroundStyle.Color3 else nil,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = if var3 then "" else nil,
		TextTransparency = if var3 then 1 else nil,
		AutoButtonColor = if var3 then false else nil,
		[reactModule.Event.Activated] = if var3 then p3.onActivated else nil,
		Active = var3,
		Selectable = selectable,
		[reactModule.Tag] = if p3.testId then `data-testid={p3.testId}` elseif var3 then "data-testid=--sdui-text-icon-row-button" else "data-testid=--sdui-text-icon-row"
	}, {
		UICorner = if p3.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = p3.cornerRadius }) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, p3.gap or 0),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = reactModule.createElement("TextLabel", applyOverrides({
			BackgroundTransparency = 1,
			Text = var5 or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = size or UDim2.new(0, 0, 0, ceiled),
			Font = fontStyle.Font,
			TextSize = fontStyle.FontSize,
			TextTransparency = 0,
			TextColor3 = textColor,
			TextWrapped = false,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = (if p3.iconFirst then -1 else 1) * 1,
			RichText = if var4 then true else nil,
			[reactModule.Tag] = "data-testid=--sdui-text-icon-row-text"
		}, p3.textOverrides), {
			UIFlexItem = if p3.textFlexMode then reactModule.createElement("UIFlexItem", { FlexMode = p3.textFlexMode }) else nil
		}),
		Icon = if p3.icon then reactModule.createElement(imageSetLabel, applyOverrides({
			LayoutOrder = (if p3.iconFirst then -1 else 1) * 2,
			Size = var2,
			BackgroundTransparency = 1,
			ImageColor3 = iconColor,
			ImageTransparency = 0,
			Image = p3.icon,
			[reactModule.Tag] = "data-testid=--sdui-text-icon-row-icon"
		}, p3.iconOverrides)) else nil
	})
end)