local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local text = foundationModule.Text
local icon = foundationModule.Icon
local badge = foundationModule.Badge
local iconSize = foundationModule.Enums.IconSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local useTokens = foundationModule.Hooks.useTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local getLocalizedPriceModule = require(avatarExperienceUIKit.ItemCard.Utils.getLocalizedPrice)
local fFlagAXDurablesFooter = avatarExperienceFlagsModule.FFlagAXDurablesFooter
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXEnableIaBTimedOptionsBulkPurchase = avatarExperienceFlagsModule.FFlagAXEnableIaBTimedOptionsBulkPurchase
local fFlagAXItemCardComponentsMemo = avatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo

local function renderIconTextPair(p0)
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), text (ref)
	local t = {}
	
	if p0.iconName then
		t[p0.iconKey] = reactModule.createElement(icon, {
			name = p0.iconName,
			style = p0.resolvedColorStyle,
			size = iconSize.Small,
			LayoutOrder = p0.iconLayoutOrder,
			testId = p0.iconKey
		})
	end
	t[p0.textKey] = reactModule.createElement(text, {
		textStyle = p0.resolvedColorStyle,
		fontStyle = p0.tokens.Typography.BodyMedium,
		LayoutOrder = p0.textLayoutOrder,
		Text = p0.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
	
	return t
end

local function renderContentChildren(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getLocalizedPriceModule (ref), renderIconTextPair (ref)
	local icon = nil
	local text = nil
	local var9 = nil
	local var10 = nil
	
	if p1.type == "price" then
		icon = "robux"
		text = getLocalizedPriceModule(p1.price)
		var9 = "RobuxIcon"
		var10 = "Amount"
	elseif p1.type == "timedOption" then
		icon = p1.icon
		text = p1.text
		var9 = "TimedOptionIcon"
		var10 = "TimedOptionText"
	elseif p1.type == "text" then
		text = p1.text
		var9 = "Text"
		var10 = "Text"
	else
		return {}
	end
	return renderIconTextPair({
		iconName = icon,
		text = text,
		iconKey = `{p2}{var9}`,
		textKey = `{p2}{var10}`,
		iconLayoutOrder = p3,
		textLayoutOrder = if icon then p4 else p3,
		resolvedColorStyle = p5,
		tokens = p6,
		designTokens = p7
	})
end

local function ItemCardPriceLine(p8)
	-- upvalues: useTokens (ref), useDesignTokens (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), reactModule (ref), badge (ref), badgeVariant (ref), fFlagAXMISEnableMultiShopping (ref), iconSize (ref), fFlagAXDurablesFooter (ref), renderContentChildren (ref), icon (ref), text (ref), getLocalizedPriceModule (ref)
	local var11 = useTokens()
	local var12 = useDesignTokens()
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase and p8.content.type == "badge" then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = p8.LayoutOrder
		}, {
			Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var11.Padding.XSmall) }),
			Badge = reactModule.createElement(badge, {
				text = p8.content.text,
				variant = badgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -var11.Gap.XXSmall)
			})
		})
	end
	local var13 = if p8.content and p8.content.colorStyle then p8.content.colorStyle else var11.Color.Content.Emphasis
	local var14 = if fFlagAXMISEnableMultiShopping and p8.content and p8.content.iconSize then p8.content.iconSize else iconSize.Small
	local var15 = if fFlagAXMISEnableMultiShopping and p8.content and p8.content.fontStyle then p8.content.fontStyle else var11.Typography.BodyMedium
	
	if not fFlagAXDurablesFooter or p8.content.type ~= "multi" then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = p8.LayoutOrder
		}, {
			ItemCardPriceLineLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, var11.Gap.XXSmall)
			}),
			ItemCardPriceLineRobuxIcon = if p8.content.type == "price" then reactModule.createElement(icon, {
				name = "robux",
				LayoutOrder = 1,
				testId = "priceLineRobuxIcon",
				style = var13,
				size = var14
			}) else nil,
			ItemCardPriceLineAmount = reactModule.createElement(text, {
				LayoutOrder = 2,
				textStyle = var13,
				fontStyle = var15,
				Text = if p8.content.type == "price" then getLocalizedPriceModule(p8.content.price) else p8.content.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		})
	end
	local content = p8.content
	local t = {
		ItemCardPriceLineLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var11.Gap.XXSmall)
		})
	}
	local var17 = 1
	
	for i, v in content.contents do
		if i > 1 then
			t[`priceLineSpacer{i}`] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var11.Gap.XSmall, 0),
				LayoutOrder = var17
			})
			var17 += 1
		end
		if fFlagAXEnableIaBTimedOptionsBulkPurchase and v.type == "badge" then
			t[`priceLine{i}Badge`] = reactModule.createElement(badge, {
				text = v.text,
				variant = badgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -var11.Gap.XXSmall)
			})
			var17 += 1
		else
			for i_1, v_1 in renderContentChildren(v, `priceLine{i}`, var17, var17 + 1, if v.colorStyle then v.colorStyle else var11.Color.Content.Emphasis, var11, var12) do
				t[i_1] = v_1
			end
			var17 += 2
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p8.LayoutOrder
	}, t)
end

return if fFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardPriceLine) else ItemCardPriceLine