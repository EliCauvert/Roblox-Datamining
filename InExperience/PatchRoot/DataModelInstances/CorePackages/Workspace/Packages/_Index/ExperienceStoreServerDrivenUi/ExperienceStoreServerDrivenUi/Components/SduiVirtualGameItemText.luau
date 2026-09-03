local parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local textSizeModule = require(parent.TextSize)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local tooltip = foundationModule.Tooltip
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local t = {
	pendingReceiptTooltip = "Purchasing.PurchaseDialog.Message.PendingDeveloperProductOnHome"
}

local function _(p1, p2)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else p2
end

local _ = function(p1, p2)
	return if p1 == nil then p2 else p1
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), textSizeModule (ref), reactModule (ref), view (ref), text (ref), icon (ref), iconName (ref), tooltip (ref), popoverSide (ref), popoverAlign (ref)
	local titleTag
	local var1 = useTokens()
	local var2 = useLocalization(t)
	local pendingReceiptsCountText = p1.pendingReceiptsCountText
	local var3 = typeof(pendingReceiptsCountText) == "string" and pendingReceiptsCountText ~= ""
	local var4 = if var3 then pendingReceiptsCountText else nil
	local pendingReceiptsTooltipText = p1.pendingReceiptsTooltipText
	local var5 = if not var3 then if typeof(pendingReceiptsTooltipText) == "string" and pendingReceiptsTooltipText ~= "" then pendingReceiptsTooltipText else var2.pendingReceiptTooltip else nil
	local var6 = typeof(p1.title) == "string" and p1.title ~= ""
	local var7 = if p1.titleFontStyle ~= nil then var1.Typography.TitleMedium else p1.titleFontStyle
	local var8 = if var6 then math.ceil((if p1.titleMaxLines == nil or p1.titleMaxLines <= 0 then 2 else p1.titleMaxLines) * (var7.LineHeight * var7.FontSize + textSizeModule.getTextSizeStore(false).getTextSizeOffset(false))) else 0
	local var9 = typeof(p1.priceText) == "string" and p1.priceText ~= ""
	local var10 = var9 and (p1.showBasePriceCrossed == true and (p1.basePriceText ~= nil and p1.basePriceText ~= ""))
	local var11 = p1.hideRobuxIconInPrice == true
	local var12 = var9 or var3
	local var13 = if p1.priceRobuxIconSize ~= nil then "Small" else p1.priceRobuxIconSize
	local priceRobuxIconStyle = p1.priceRobuxIconStyle
	local var14 = if priceRobuxIconStyle ~= nil then var1.Color.Content.Emphasis else priceRobuxIconStyle
	local var15 = if p1.basePriceRobuxIconSize ~= nil then "XSmall" else p1.basePriceRobuxIconSize
	local basePriceRobuxIconStyle = p1.basePriceRobuxIconStyle
	local var16 = if basePriceRobuxIconStyle ~= nil then var1.Color.Content.Muted else basePriceRobuxIconStyle
	local createElement = reactModule.createElement
	local t_1 = { LayoutOrder = p1.layoutOrder }
	local tag = p1.tag
	t_1.tag = if typeof(tag) == "string" and tag ~= "" then tag else "col fill auto-xy"
	t_1.testId = p1.testId
	local t_2 = {}
	
	if var6 then
		tag = reactModule.createElement
		local var17 = text
		local t_3 = {
			LayoutOrder = 1,
			TextWrapped = true,
			Text = p1.title,
			TextTruncate = Enum.TextTruncate.AtEnd,
			fontStyle = var7,
			Size = UDim2.new(1, 0, 0, var8)
		}
		titleTag = p1.titleTag
		t_3.tag = if typeof(titleTag) == "string" and titleTag ~= "" then titleTag else "size-full-0 text-wrap text-align-x-left text-truncate-end content-emphasis"
		t_3.testId = if p1.testId then `{p1.testId}--title` else nil
		tag = tag(var17, t_3)
	else
		tag = nil
	end
	t_2.Title = tag
	
	if var12 then
		local currentPriceTag, priceTextTag
		tag = reactModule.createElement
		local var18 = view
		local t_3 = { LayoutOrder = 2 }
		titleTag = p1.priceRowTag
		t_3.tag = if typeof(titleTag) == "string" and titleTag ~= "" then titleTag else "row align-y-center gap-small auto-xy"
		t_3.testId = if p1.testId then `{p1.testId}--price-row` else nil
		local t_4 = {}
		
		if var9 then
			titleTag = reactModule.createElement
			local var19 = view
			local t_5 = { LayoutOrder = 1 }
			currentPriceTag = p1.currentPriceTag
			t_5.tag = if typeof(currentPriceTag) == "string" and currentPriceTag ~= "" then currentPriceTag else "row align-y-center gap-xsmall auto-xy"
			t_5.testId = if p1.testId then `{p1.testId}--current-price` else nil
			local t_6 = {
				RobuxIcon = if not var11 then reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.Robux,
					size = var13,
					style = var14,
					testId = if p1.testId then `{p1.testId}--price-robux-icon` else nil
				}) else nil
			}
			currentPriceTag = reactModule.createElement
			local var20 = text
			local t_7 = { LayoutOrder = 2, Text = p1.priceText }
			priceTextTag = p1.priceTextTag
			t_7.tag = if typeof(priceTextTag) == "string" and priceTextTag ~= "" then priceTextTag else "auto-xy text-align-x-left text-body-medium content-emphasis"
			t_6.Price = currentPriceTag(var20, t_7)
			titleTag = titleTag(var19, t_5, t_6)
		else
			titleTag = nil
		end
		local basePriceTextTag
		t_4.CurrentPrice = titleTag
		
		if var10 then
			titleTag = reactModule.createElement
			local var21 = view
			local t_5 = { LayoutOrder = 2 }
			currentPriceTag = p1.basePriceTag
			t_5.tag = if typeof(currentPriceTag) == "string" and currentPriceTag ~= "" then currentPriceTag else "auto-xy"
			t_5.testId = if p1.testId then `{p1.testId}--base-price` else nil
			local t_6 = {}
			currentPriceTag = reactModule.createElement
			local t_7 = {}
			priceTextTag = p1.basePriceContentTag
			t_7.tag = if typeof(priceTextTag) == "string" and priceTextTag ~= "" then priceTextTag else "row align-y-center gap-xsmall auto-xy"
			local t_8 = {
				RobuxIcon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.Robux,
					size = var15,
					style = var16,
					testId = if p1.testId then `{p1.testId}--base-price-robux-icon` else nil
				})
			}
			priceTextTag = reactModule.createElement
			local t_9 = { LayoutOrder = 2, Text = p1.basePriceText }
			basePriceTextTag = p1.basePriceTextTag
			t_9.tag = if typeof(basePriceTextTag) == "string" and basePriceTextTag ~= "" then basePriceTextTag else "auto-xy text-align-x-left text-body-small content-muted"
			t_8.Price = priceTextTag(text, t_9)
			t_6.Content = currentPriceTag(view, t_7, t_8)
			currentPriceTag = reactModule.createElement
			local var22 = view
			local t_10 = {
				ZIndex = 2,
				tag = if typeof(priceTextTag) == "string" and priceTextTag ~= "" then priceTextTag else "bg-system-neutral position-center-center anchor-center-center",
				Size = UDim2.new(1, 0, 0, 1),
				testId = if p1.testId then `{p1.testId}--base-price-strikethrough` else nil
			}
			priceTextTag = p1.strikethroughTag
			t_6.Strikethrough = currentPriceTag(var22, t_10)
			titleTag = titleTag(var21, t_5, t_6)
		else
			titleTag = nil
		end
		t_4.BasePrice = titleTag
		
		if var3 then
			titleTag = reactModule.createElement
			local var23 = view
			local t_5 = { LayoutOrder = 3 }
			currentPriceTag = p1.ownedCountTag
			t_5.tag = if typeof(currentPriceTag) == "string" and currentPriceTag ~= "" then currentPriceTag else "row align-y-center gap-xsmall auto-xy"
			t_5.testId = if p1.testId then `{p1.testId}--owned-count` else nil
			local t_6 = {}
			
			if var9 then
				currentPriceTag = reactModule.createElement
				local var24 = text
				local t_7 = { LayoutOrder = 1 }
				priceTextTag = p1.ownedCountSeparatorText
				t_7.Text = if typeof(priceTextTag) == "string" and priceTextTag ~= "" then priceTextTag else "\194\183"
				priceTextTag = p1.ownedCountSeparatorTag
				t_7.tag = if typeof(priceTextTag) == "string" and priceTextTag ~= "" then priceTextTag else "auto-xy text-body-medium content-default"
				t_7.testId = if p1.testId then `{p1.testId}--owned-count-separator` else nil
				currentPriceTag = currentPriceTag(var24, t_7)
			else
				currentPriceTag = nil
			end
			t_6.Dot = currentPriceTag
			currentPriceTag = reactModule.createElement
			local var25 = tooltip
			local t_7 = {
				LayoutOrder = 2,
				title = "",
				text = var5,
				side = popoverSide.Top,
				align = popoverAlign.Center
			}
			local createElement_1 = reactModule.createElement
			priceTextTag = view
			local t_8 = {
				tag = "auto-xy",
				onStateChanged = function(_) end,
				testId = if p1.testId then `{p1.testId}--owned-count-tooltip` else nil
			}
			local t_9 = {}
			local createElement_2 = reactModule.createElement
			basePriceTextTag = text
			local t_10 = { Text = var4 }
			local ownedCountTextTag = p1.ownedCountTextTag
			t_10.tag = if typeof(ownedCountTextTag) == "string" and ownedCountTextTag ~= "" then ownedCountTextTag else "auto-xy text-body-medium content-muted"
			t_10.testId = if p1.testId then `{p1.testId}--owned-count-label` else nil
			t_9.Text = createElement_2(basePriceTextTag, t_10)
			t_6.Label = currentPriceTag(var25, t_7, createElement_1(priceTextTag, t_8, t_9))
			titleTag = titleTag(var23, t_5, t_6)
		else
			titleTag = nil
		end
		t_4.OwnedCount = titleTag
		tag = tag(var18, t_3, t_4)
	else
		tag = nil
	end
	t_2.PriceRow = tag
	
	return createElement(view, t_1, t_2)
end)