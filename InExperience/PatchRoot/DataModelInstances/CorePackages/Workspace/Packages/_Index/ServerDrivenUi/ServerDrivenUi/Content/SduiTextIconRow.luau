local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local CheckAndFormatPossibleLinkFunction = require(Parent.CollectionViews).checkAndFormatPossibleLink
local TextSizeModule = require(Parent.TextSize)
local config = {
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

local function applyOverrides(p1, IconOverrides)
	-- upvalues: config (copy), CryoModule (copy)
	if IconOverrides == nil then
		return p1
	end
	local t = {}
	
	for i, iconOverride in IconOverrides do
		t[config[i] or i] = iconOverride
	end
	return CryoModule.Dictionary.join(p1, t)
end

return ReactModule.memo(function(p2)
	-- upvalues: TextSizeModule (copy), UseTokensFunction (copy), CheckAndFormatPossibleLinkFunction (copy), ReactModule (copy), applyOverrides (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ImageSetLabel (copy)
	local LayoutOrder = p2.layoutOrder
	local AnchorPoint = p2.anchorPoint
	local AutomaticSize = p2.automaticSize
	local Size = p2.size
	local ZIndex = p2.zIndex
	local Position = p2.position
	local Selectable = p2.selectable
	local TextSizeOffset = TextSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local UseTokensResult = UseTokensFunction()
	local FontStyle = p2.fontStyle or UseTokensResult.Typography.HeadingSmall
	local TextColor = p2.textColor or UseTokensResult.Color.Content.Emphasis.Color3
	local Ceiled = math.ceil(FontStyle.LineHeight * FontStyle.FontSize + TextSizeOffset)
	local _UDim2: UDim2 = if p2.iconWidth then UDim2.new(0, p2.iconWidth, 0, p2.iconWidth) else UDim2.new(0, Ceiled, 0, Ceiled)
	local IconColor = p2.iconColor or TextColor
	local HasOnActivated = p2.onActivated ~= nil
	local CheckAndFormatPossibleLinkResult, CheckAndFormatPossibleLinkResult2 = CheckAndFormatPossibleLinkFunction(p2.text)
	
	return ReactModule.createElement(if HasOnActivated then "TextButton" else "Frame", {
		Position = Position,
		AnchorPoint = AnchorPoint,
		AutomaticSize = AutomaticSize,
		Size = Size or UDim2.new(1, 0, 0, Ceiled),
		BackgroundTransparency = p2.backgroundStyle and p2.backgroundStyle.Transparency or 1,
		BackgroundColor3 = p2.backgroundStyle and p2.backgroundStyle.Color3 or nil,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		Text = if HasOnActivated then "" else nil,
		TextTransparency = if HasOnActivated then 1 else nil,
		AutoButtonColor = not HasOnActivated and nil,
		[ReactModule.Event.Activated] = if HasOnActivated then p2.onActivated else nil,
		Active = HasOnActivated,
		Selectable = Selectable,
		[ReactModule.Tag] = if p2.testId then `data-testid={p2.testId}` elseif HasOnActivated then "data-testid=--sdui-text-icon-row-button" else "data-testid=--sdui-text-icon-row"
	}, {
		UICorner = if p2.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = p2.cornerRadius }) else nil,
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, p2.gap or 0),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = ReactModule.createElement("TextLabel", applyOverrides({
			BackgroundTransparency = 1,
			Text = CheckAndFormatPossibleLinkResult2 or "",
			AutomaticSize = Enum.AutomaticSize.X,
			Size = Size or UDim2.new(0, 0, 0, Ceiled),
			Font = if FoundationFontFaceMigration then nil else FontStyle.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(FontStyle.Font) else nil,
			TextSize = FontStyle.FontSize,
			TextTransparency = 0,
			TextColor3 = TextColor,
			TextWrapped = false,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = (if p2.iconFirst then -1 else 1) * 1,
			RichText = if CheckAndFormatPossibleLinkResult then true else nil,
			[ReactModule.Tag] = "data-testid=--sdui-text-icon-row-text"
		}, p2.textOverrides), {
			UIFlexItem = if p2.textFlexMode then ReactModule.createElement("UIFlexItem", { FlexMode = p2.textFlexMode }) else nil
		}),
		Icon = if p2.icon then ReactModule.createElement(ImageSetLabel, applyOverrides({
			LayoutOrder = (if p2.iconFirst then -1 else 1) * 2,
			Size = _UDim2,
			BackgroundTransparency = 1,
			ImageColor3 = IconColor,
			ImageTransparency = 0,
			Image = p2.icon,
			[ReactModule.Tag] = "data-testid=--sdui-text-icon-row-icon"
		}, p2.iconOverrides)) else nil
	})
end)