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

local function applyOverrides(p0, p1) --[[ line: 87 ]]
	-- upvalues: t (ref), cryoModule (ref)
	if p1 == nil then
		return p0
	end
	local t_1 = {}
	
	for i, v in p1 do
		t_1[t[i] or i] = v
	end
	return cryoModule.Dictionary.join(p0, t_1)
end

return reactModule.memo(function(p2) --[[ line: 98 | named "SduiTextIconRow" ]]
	-- upvalues: textSizeModule (ref), useTokens (ref), checkAndFormatPossibleLink (ref), reactModule (ref), applyOverrides (ref), imageSetLabel (ref)
	local layoutOrder = p2.layoutOrder
	local anchorPoint = p2.anchorPoint
	local automaticSize = p2.automaticSize
	local size = p2.size
	local zIndex = p2.zIndex
	local position = p2.position
	local selectable = p2.selectable
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var7 = useTokens()
	local fontStyle = p2.fontStyle or var7.Typography.HeadingSmall
	local textColor = p2.textColor or var7.Color.Content.Emphasis.Color3
	local ceiled = math.ceil(fontStyle.LineHeight * fontStyle.FontSize + textSizeOffset)
	local var11 = if p2.iconWidth then UDim2.new(0, p2.iconWidth, 0, p2.iconWidth) else UDim2.new(0, ceiled, 0, ceiled)
	local iconColor = p2.iconColor or textColor
	local var13 = p2.onActivated ~= nil
	local var14, var15 = checkAndFormatPossibleLink(p2.text)
	
	return reactModule.createElement(if var13 then "TextButton" else "Frame", {
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize,
		Size = size or UDim2.new(1, 0, 0, ceiled),
		BackgroundTransparency = if p2.backgroundStyle then p2.backgroundStyle.Transparency else 1,
		BackgroundColor3 = if p2.backgroundStyle then p2.backgroundStyle.Color3 else nil,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = if var13 then "" else nil,
		TextTransparency = if var13 then 1 else nil,
		AutoButtonColor = if var13 then false else nil,
		[reactModule.Event.Activated] = if var13 then p2.onActivated else nil,
		Active = var13,
		Selectable = selectable,
		[reactModule.Tag] = if p2.testId then `data-testid={p2.testId}` elseif var13 then "data-testid=--sdui-text-icon-row-button" else "data-testid=--sdui-text-icon-row"
	}, {
		UICorner = if p2.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = p2.cornerRadius }) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, p2.gap or 0),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = reactModule.createElement("TextLabel", applyOverrides({
			BackgroundTransparency = 1,
			Text = var15 or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = size or UDim2.new(0, 0, 0, ceiled),
			Font = fontStyle.Font,
			TextSize = fontStyle.FontSize,
			TextTransparency = 0,
			TextColor3 = textColor,
			TextWrapped = false,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = (if p2.iconFirst then -1 else 1) * 1,
			RichText = if var14 then true else nil,
			[reactModule.Tag] = "data-testid=--sdui-text-icon-row-text"
		}, p2.textOverrides), {
			UIFlexItem = if p2.textFlexMode then reactModule.createElement("UIFlexItem", { FlexMode = p2.textFlexMode }) else nil
		}),
		Icon = if p2.icon then reactModule.createElement(imageSetLabel, applyOverrides({
			LayoutOrder = (if p2.iconFirst then -1 else 1) * 2,
			Size = var11,
			BackgroundTransparency = 1,
			ImageColor3 = iconColor,
			ImageTransparency = 0,
			Image = p2.icon,
			[reactModule.Tag] = "data-testid=--sdui-text-icon-row-icon"
		}, p2.iconOverrides)) else nil
	})
end)