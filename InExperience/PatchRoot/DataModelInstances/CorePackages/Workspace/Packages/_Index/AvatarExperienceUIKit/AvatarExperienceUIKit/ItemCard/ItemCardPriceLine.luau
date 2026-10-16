local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Badge = FoundationModule.Badge
local IconSize = FoundationModule.Enums.IconSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetLocalizedPriceModule = require(AvatarExperienceUIKit.ItemCard.Utils.getLocalizedPrice)
local FFlagAXDurablesFooter = AvatarExperienceFlagsModule.FFlagAXDurablesFooter

local function renderIconTextPair(p1) --[[ Line: 86 ]]
	-- upvalues: ReactModule (copy), Icon (copy), IconSize (copy), Text (copy)
	local Elements = {}
	
	if p1.iconName then
		Elements[p1.iconKey] = ReactModule.createElement(Icon, {
			name = p1.iconName,
			style = p1.resolvedColorStyle,
			size = IconSize.Small,
			LayoutOrder = p1.iconLayoutOrder,
			testId = p1.iconKey
		})
	end
	Elements[p1.textKey] = ReactModule.createElement(Text, {
		textStyle = p1.resolvedColorStyle,
		fontStyle = p1.tokens.Typography.BodyMedium,
		LayoutOrder = p1.textLayoutOrder,
		Text = p1.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
	
	return Elements
end

local function renderContentChildren(p1, PriceLineName, IconLayoutOrder, p2, ResolvedColorStyle, Tokens, DesignTokens) --[[ Line: 113 ]]
	-- upvalues: GetLocalizedPriceModule (copy), renderIconTextPair (copy)
	local Icon = nil
	local Text = nil
	local v1: string? = nil
	local v2: string? = nil
	
	if p1.type == "price" then
		Icon = "robux"
		Text = GetLocalizedPriceModule(p1.price)
		v1 = "RobuxIcon"
		v2 = "Amount"
	elseif p1.type == "timedOption" then
		Icon = p1.icon
		Text = p1.text
		v1 = "TimedOptionIcon"
		v2 = "TimedOptionText"
	else
		if p1.type ~= "text" then
			return {}
		end
		Text = p1.text
		v1 = "Text"
		v2 = "Text"
	end
	return (renderIconTextPair({
		iconName = Icon,
		text = Text,
		iconKey = `{PriceLineName}{v1}`,
		textKey = `{PriceLineName}{v2}`,
		iconLayoutOrder = IconLayoutOrder,
		textLayoutOrder = if Icon then p2 else IconLayoutOrder,
		resolvedColorStyle = ResolvedColorStyle,
		tokens = Tokens,
		designTokens = DesignTokens
	}))
end

local function ItemCardPriceLine(Frame: Frame) --[[ Line: 158 ]]
	-- upvalues: UseTokensFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), Badge (copy), BadgeVariant (copy), IconSize (copy), FFlagAXDurablesFooter (copy), renderContentChildren (copy), Icon (copy), Text (copy), GetLocalizedPriceModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	if Frame.content.type == "badge" then
		return (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = Frame.LayoutOrder
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseTokensResult.Padding.XSmall)
			}),
			Badge = ReactModule.createElement(Badge, {
				text = Frame.content.text,
				variant = BadgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -UseTokensResult.Gap.XXSmall)
			})
		}))
	end
	local ColorStyle = if Frame.content and Frame.content.colorStyle then Frame.content.colorStyle else UseTokensResult.Color.Content.Emphasis
	local IconSize1 = if Frame.content and Frame.content.iconSize then Frame.content.iconSize else IconSize.Small
	local FontStyle = if Frame.content and Frame.content.fontStyle then Frame.content.fontStyle else UseTokensResult.Typography.BodyMedium
	
	if not FFlagAXDurablesFooter or Frame.content.type ~= "multi" then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = Frame.LayoutOrder
		}, {
			ItemCardPriceLineLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
			}),
			ItemCardPriceLineRobuxIcon = if Frame.content.type == "price" then ReactModule.createElement(Icon, {
				name = "robux",
				LayoutOrder = 1,
				testId = "priceLineRobuxIcon",
				style = ColorStyle,
				size = IconSize1
			}) else nil,
			ItemCardPriceLineAmount = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				textStyle = ColorStyle,
				fontStyle = FontStyle,
				Text = if Frame.content.type == "price" then GetLocalizedPriceModule(Frame.content.price) else Frame.content.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		})
	end
	local config = {
		ItemCardPriceLineLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
		})
	}
	local Count = 1
	
	for i, content in Frame.content.contents do
		if i > 1 then
			config[`priceLineSpacer{i}`] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(UseTokensResult.Gap.XSmall, 0),
				LayoutOrder = Count
			})
			Count += 1
		end
		if content.type == "badge" then
			config[`priceLine{i}Badge`] = ReactModule.createElement(Badge, {
				text = content.text,
				variant = BadgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -UseTokensResult.Gap.XXSmall)
			})
			Count += 1
			continue
		end
		local ColorStyle1 = if content.colorStyle then content.colorStyle else UseTokensResult.Color.Content.Emphasis
		for i1, value in renderContentChildren(content, `priceLine{i}`, Count, Count + 1, ColorStyle1, UseTokensResult, UseDesignTokensResult) do
			config[i1] = value
		end
		Count += 2
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = Frame.LayoutOrder
	}, config)
end

return if AvatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardPriceLine) else ItemCardPriceLine