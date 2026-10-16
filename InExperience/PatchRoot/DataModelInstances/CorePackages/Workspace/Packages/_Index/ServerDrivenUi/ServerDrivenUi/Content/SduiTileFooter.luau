local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local TextSizeModule = require(Parent.TextSize)

return ReactModule.memo(function(p1) --[[ Line: 61 | Named "SduiTileFooter" ]]
	-- upvalues: TextSizeModule (copy), UseTokensFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ReactModule (copy), ImageSetLabel (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local AutomaticSize = p1.automaticSize
	local Size = p1.size
	local ZIndex = p1.zIndex
	local Position = p1.position
	local Selectable = p1.selectable
	local TextSizeOffset = TextSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local UseTokensResult = UseTokensFunction()
	local FontStyle = p1.fontStyle or UseTokensResult.Typography.BodyMedium
	local FontStyleFont = if FoundationFontFaceMigration then nil else FontStyle.Font
	local NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(FontStyle.Font) else nil
	local TextColor = p1.textColor or UseTokensResult.Color.Content.Default.Color3
	local _UDim2: UDim2 = if p1.iconWidth then UDim2.new(0, p1.iconWidth, 0, p1.iconWidth) else UDim2.new(0, UseTokensResult.Size.Size_350, 0, UseTokensResult.Size.Size_350)
	local IconColor = p1.iconColor or TextColor
	local Ceiled = math.ceil(FontStyle.LineHeight * FontStyle.FontSize + TextSizeOffset)
	local TextIconGap = p1.textIconGap or UseTokensResult.Gap.XSmall
	local SectionGap = p1.sectionGap or UseTokensResult.Gap.Small
	local HasOnActivated = p1.onActivated ~= nil
	
	if not p1.leftIcon and (not p1.leftIconComponent and (not p1.rightIcon and (not p1.rightIconComponent and not p1.rightText))) and not HasOnActivated then
		return ReactModule.createElement("TextLabel", {
			[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			Position = Position,
			AnchorPoint = AnchorPoint,
			AutomaticSize = AutomaticSize or Enum.AutomaticSize.X,
			Size = Size or UDim2.new(0, 0, 0, Ceiled),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = LayoutOrder,
			ZIndex = ZIndex,
			Text = p1.leftText or "",
			Font = FontStyleFont,
			FontFace = NormalizeFontFaceResult,
			TextSize = FontStyle.FontSize,
			TextTransparency = 0,
			TextColor3 = TextColor,
			TextWrapped = false,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = p1.leftTextFlexMode and ReactModule.createElement("UIFlexItem", { FlexMode = p1.leftTextFlexMode }) or nil
		})
	else
		local HasRightIcon: boolean = p1.rightIcon ~= nil or p1.rightIconComponent ~= nil or p1.rightText ~= nil
		
		return ReactModule.createElement(if HasOnActivated then "TextButton" else "Frame", {
			[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			Position = Position,
			AnchorPoint = AnchorPoint,
			AutomaticSize = AutomaticSize or Enum.AutomaticSize.X,
			Size = Size or UDim2.new(0, 0, 0, Ceiled),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = LayoutOrder,
			ZIndex = ZIndex,
			Text = if HasOnActivated then "" else nil,
			TextTransparency = if HasOnActivated then 1 else nil,
			AutoButtonColor = not HasOnActivated and nil,
			[ReactModule.Event.Activated] = if HasOnActivated then p1.onActivated else nil,
			Active = HasOnActivated,
			Selectable = Selectable ~= nil and Selectable
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.Name,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, TextIconGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			["1_LeftIcon"] = p1.leftIconComponent or (p1.leftIcon and ReactModule.createElement(ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Size = _UDim2,
				ImageColor3 = IconColor,
				Image = p1.leftIcon
			}) or nil),
			["2_LeftText"] = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextTransparency = 0,
				TextWrapped = false,
				LayoutOrder = 2,
				Text = p1.leftText or "",
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, Ceiled),
				Font = FontStyleFont,
				FontFace = NormalizeFontFaceResult,
				TextSize = FontStyle.FontSize,
				TextColor3 = TextColor,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				UIFlexItem = p1.leftTextFlexMode and ReactModule.createElement("UIFlexItem", { FlexMode = p1.leftTextFlexMode }) or nil,
				UIPadding = if HasRightIcon then ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, SectionGap - TextIconGap) }) else nil
			}),
			["3_RightIcon"] = p1.rightIconComponent or (p1.rightIcon and ReactModule.createElement(ImageSetLabel, {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Size = _UDim2,
				ImageColor3 = IconColor,
				Image = p1.rightIcon
			}) or nil),
			["4_RightText"] = p1.rightText and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextTransparency = 0,
				TextWrapped = false,
				LayoutOrder = 4,
				Text = p1.rightText or "",
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, Ceiled),
				Font = FontStyleFont,
				FontFace = NormalizeFontFaceResult,
				TextSize = FontStyle.FontSize,
				TextColor3 = TextColor,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				UIFlexItem = ReactModule.createElement("UIFlexItem", {
					FlexMode = p1.rightTextFlexMode or Enum.UIFlexMode.Shrink
				})
			}) or nil
		})
	end
end)