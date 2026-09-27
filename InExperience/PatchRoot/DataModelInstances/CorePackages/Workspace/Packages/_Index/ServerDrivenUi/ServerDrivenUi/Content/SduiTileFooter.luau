local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local textSizeModule = require(parent.TextSize)

return reactModule.memo(function(p1)
	-- upvalues: textSizeModule (ref), useTokens (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), reactModule (ref), imageSetLabel (ref)
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local automaticSize = p1.automaticSize
	local size = p1.size
	local zIndex = p1.zIndex
	local position = p1.position
	local selectable = p1.selectable
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var1 = useTokens()
	local fontStyle = p1.fontStyle or var1.Typography.BodyMedium
	local var2 = if foundationFontFaceMigration then nil else fontStyle.Font
	local var3 = if foundationFontFaceMigration then normalizeFontFace(fontStyle.Font) else nil
	local textColor = p1.textColor or var1.Color.Content.Default.Color3
	local var4 = if p1.iconWidth then UDim2.new(0, p1.iconWidth, 0, p1.iconWidth) else UDim2.new(0, var1.Size.Size_350, 0, var1.Size.Size_350)
	local iconColor = p1.iconColor or textColor
	local ceiled = math.ceil(fontStyle.LineHeight * fontStyle.FontSize + textSizeOffset)
	local textIconGap = p1.textIconGap or var1.Gap.XSmall
	local var5 = p1.onActivated ~= nil
	
	return if not p1.leftIcon and (not p1.leftIconComponent and (not p1.rightIcon and (not p1.rightIconComponent and not p1.rightText))) and not var5 then reactModule.createElement("TextLabel", {
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize or Enum.AutomaticSize.X,
		Size = size or UDim2.new(0, 0, 0, ceiled),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = p1.leftText or "",
		Font = var2,
		FontFace = var3,
		TextSize = fontStyle.FontSize,
		TextTransparency = 0,
		TextColor3 = textColor,
		TextWrapped = false,
		TextTruncate = Enum.TextTruncate.SplitWord,
		TextXAlignment = Enum.TextXAlignment.Left
	}, {
		UIFlexItem = p1.leftTextFlexMode and reactModule.createElement("UIFlexItem", { FlexMode = p1.leftTextFlexMode }) or nil
	}) else reactModule.createElement(if var5 then "TextButton" else "Frame", {
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize or Enum.AutomaticSize.X,
		Size = size or UDim2.new(0, 0, 0, ceiled),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Text = if var5 then "" else nil,
		TextTransparency = if var5 then 1 else nil,
		AutoButtonColor = if var5 then false else nil,
		[reactModule.Event.Activated] = if var5 then p1.onActivated else nil,
		Active = var5,
		Selectable = if selectable ~= nil then false else selectable
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, textIconGap),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		["1_LeftIcon"] = p1.leftIconComponent or (p1.leftIcon and reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Size = var4,
			ImageColor3 = iconColor,
			Image = p1.leftIcon
		}) or nil),
		["2_LeftText"] = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			LayoutOrder = 2,
			Text = p1.leftText or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, ceiled),
			Font = var2,
			FontFace = var3,
			TextSize = fontStyle.FontSize,
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = p1.leftTextFlexMode and reactModule.createElement("UIFlexItem", { FlexMode = p1.leftTextFlexMode }) or nil,
			UIPadding = if if p1.rightIcon == nil then if p1.rightIconComponent == nil then p1.rightText ~= nil else true else true then reactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, (p1.sectionGap or var1.Gap.Small) - textIconGap)
			}) else nil
		}),
		["3_RightIcon"] = p1.rightIconComponent or (p1.rightIcon and reactModule.createElement(imageSetLabel, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Size = var4,
			ImageColor3 = iconColor,
			Image = p1.rightIcon
		}) or nil),
		["4_RightText"] = p1.rightText and (reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			LayoutOrder = 4,
			Text = p1.rightText or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, ceiled),
			Font = var2,
			FontFace = var3,
			TextSize = fontStyle.FontSize,
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", {
				FlexMode = p1.rightTextFlexMode or Enum.UIFlexMode.Shrink
			})
		}) or nil)
	})
end)