local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local textSizeModule = require(parent.TextSize)

return reactModule.memo(function(p0) --[[ line: 59 | named "SduiTileFooter" ]]
	-- upvalues: textSizeModule (ref), useTokens (ref), reactModule (ref), imageSetLabel (ref)
	local layoutOrder = p0.layoutOrder
	local anchorPoint = p0.anchorPoint
	local automaticSize = p0.automaticSize
	local size = p0.size
	local zIndex = p0.zIndex
	local position = p0.position
	local selectable = p0.selectable
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var3 = useTokens()
	local fontStyle = p0.fontStyle or var3.Typography.BodyMedium
	local textColor = p0.textColor or var3.Color.Content.Default.Color3
	local var6 = if p0.iconWidth then UDim2.new(0, p0.iconWidth, 0, p0.iconWidth) else UDim2.new(0, var3.Size.Size_350, 0, var3.Size.Size_350)
	local iconColor = p0.iconColor or textColor
	local ceiled = math.ceil(fontStyle.LineHeight * fontStyle.FontSize + textSizeOffset)
	local textIconGap = p0.textIconGap or var3.Gap.XSmall
	local var10 = p0.onActivated ~= nil
	
	return if not p0.leftIcon and (not p0.leftIconComponent and (not p0.rightIcon and (not p0.rightIconComponent and not p0.rightText))) and not var10 then reactModule.createElement("TextLabel", {
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize or Enum.AutomaticSize.X,
		Size = size or UDim2.new(0, 0, 0, ceiled),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = p0.leftText or "",
		Font = fontStyle.Font,
		TextSize = fontStyle.FontSize,
		TextTransparency = 0,
		TextColor3 = textColor,
		TextWrapped = false,
		TextTruncate = Enum.TextTruncate.SplitWord,
		TextXAlignment = Enum.TextXAlignment.Left
	}, {
		UIFlexItem = p0.leftTextFlexMode and reactModule.createElement("UIFlexItem", { FlexMode = p0.leftTextFlexMode }) or nil
	}) else reactModule.createElement(if var10 then "TextButton" else "Frame", {
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize or Enum.AutomaticSize.X,
		Size = size or UDim2.new(0, 0, 0, ceiled),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = if var10 then "" else nil,
		TextTransparency = if var10 then 1 else nil,
		AutoButtonColor = if var10 then false else nil,
		[reactModule.Event.Activated] = if var10 then p0.onActivated else nil,
		Active = var10,
		Selectable = if selectable ~= nil then false else selectable
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, textIconGap),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		["1_LeftIcon"] = p0.leftIconComponent or (p0.leftIcon and reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Size = var6,
			ImageColor3 = iconColor,
			Image = p0.leftIcon
		}) or nil),
		["2_LeftText"] = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			LayoutOrder = 2,
			Text = p0.leftText or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, ceiled),
			Font = fontStyle.Font,
			TextSize = fontStyle.FontSize,
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = p0.leftTextFlexMode and reactModule.createElement("UIFlexItem", { FlexMode = p0.leftTextFlexMode }) or nil,
			UIPadding = if if p0.rightIcon == nil then if p0.rightIconComponent == nil then p0.rightText ~= nil else true else true then reactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, (p0.sectionGap or var3.Gap.Small) - textIconGap)
			}) else nil
		}),
		["3_RightIcon"] = p0.rightIconComponent or (p0.rightIcon and reactModule.createElement(imageSetLabel, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Size = var6,
			ImageColor3 = iconColor,
			Image = p0.rightIcon
		}) or nil),
		["4_RightText"] = p0.rightText and (reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			LayoutOrder = 4,
			Text = p0.rightText or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, ceiled),
			Font = fontStyle.Font,
			TextSize = fontStyle.FontSize,
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", {
				FlexMode = p0.rightTextFlexMode or Enum.UIFlexMode.Shrink
			})
		}) or nil)
	})
end)