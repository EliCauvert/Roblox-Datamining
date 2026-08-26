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

local function renderIconTextPair(p1)
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), text (ref)
	local t = {}
	
	if p1.iconName then
		t[p1.iconKey] = reactModule.createElement(icon, {
			name = p1.iconName,
			style = p1.resolvedColorStyle,
			size = iconSize.Small,
			LayoutOrder = p1.iconLayoutOrder,
			testId = p1.iconKey
		})
	end
	t[p1.textKey] = reactModule.createElement(text, {
		textStyle = p1.resolvedColorStyle,
		fontStyle = p1.tokens.Typography.BodyMedium,
		LayoutOrder = p1.textLayoutOrder,
		Text = p1.text,
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
	local var1 = nil
	local var2 = nil
	
	if p1.type == "price" then
		icon = "robux"
		text = getLocalizedPriceModule(p1.price)
		var1 = "RobuxIcon"
		var2 = "Amount"
	elseif p1.type == "timedOption" then
		icon = p1.icon
		text = p1.text
		var1 = "TimedOptionIcon"
		var2 = "TimedOptionText"
	elseif p1.type == "text" then
		text = p1.text
		var1 = "Text"
		var2 = "Text"
	else
		return {}
	end
	return renderIconTextPair({
		iconName = icon,
		text = text,
		iconKey = `{p2}{var1}`,
		textKey = `{p2}{var2}`,
		iconLayoutOrder = p3,
		textLayoutOrder = if icon then p4 else p3,
		resolvedColorStyle = p5,
		tokens = p6,
		designTokens = p7
	})
end

local function ItemCardPriceLine(p1)
	-- upvalues: useTokens (ref), useDesignTokens (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), reactModule (ref), badge (ref), badgeVariant (ref), fFlagAXMISEnableMultiShopping (ref), iconSize (ref), fFlagAXDurablesFooter (ref), renderContentChildren (ref), icon (ref), text (ref), getLocalizedPriceModule (ref)
	local var1 = useTokens()
	local var2 = useDesignTokens()
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase and p1.content.type == "badge" then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = p1.LayoutOrder
		}, {
			Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var1.Padding.XSmall) }),
			Badge = reactModule.createElement(badge, {
				text = p1.content.text,
				variant = badgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -var1.Gap.XXSmall)
			})
		})
	end
	local var3 = if p1.content and p1.content.colorStyle then p1.content.colorStyle else var1.Color.Content.Emphasis
	local var4 = if fFlagAXMISEnableMultiShopping and p1.content and p1.content.iconSize then p1.content.iconSize else iconSize.Small
	local var5 = if fFlagAXMISEnableMultiShopping and p1.content and p1.content.fontStyle then p1.content.fontStyle else var1.Typography.BodyMedium
	
	if not fFlagAXDurablesFooter or p1.content.type ~= "multi" then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = p1.LayoutOrder
		}, {
			ItemCardPriceLineLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, var1.Gap.XXSmall)
			}),
			ItemCardPriceLineRobuxIcon = if p1.content.type == "price" then reactModule.createElement(icon, {
				name = "robux",
				LayoutOrder = 1,
				testId = "priceLineRobuxIcon",
				style = var3,
				size = var4
			}) else nil,
			ItemCardPriceLineAmount = reactModule.createElement(text, {
				LayoutOrder = 2,
				textStyle = var3,
				fontStyle = var5,
				Text = if p1.content.type == "price" then getLocalizedPriceModule(p1.content.price) else p1.content.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		})
	end
	local content = p1.content
	local t = {
		ItemCardPriceLineLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var1.Gap.XXSmall)
		})
	}
	local var6 = 1
	
	for i, v in content.contents do
		if i > 1 then
			t[`priceLineSpacer{i}`] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var1.Gap.XSmall, 0),
				LayoutOrder = var6
			})
			var6 += 1
		end
		if fFlagAXEnableIaBTimedOptionsBulkPurchase and v.type == "badge" then
			t[`priceLine{i}Badge`] = reactModule.createElement(badge, {
				text = v.text,
				variant = badgeVariant.Neutral,
				Position = UDim2.new(0, 0, 0, -var1.Gap.XXSmall)
			})
			var6 += 1
		else
			for i_1, v_1 in renderContentChildren(v, `priceLine{i}`, var6, var6 + 1, if v.colorStyle then v.colorStyle else var1.Color.Content.Emphasis, var1, var2) do
				t[i_1] = v_1
			end
			var6 += 2
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.LayoutOrder
	}, t)
end

return if fFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardPriceLine) else ItemCardPriceLine