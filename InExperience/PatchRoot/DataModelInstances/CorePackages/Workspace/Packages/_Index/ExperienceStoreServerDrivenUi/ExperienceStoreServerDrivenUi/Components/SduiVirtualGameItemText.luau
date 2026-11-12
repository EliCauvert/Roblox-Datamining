local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TextSizeModule = require(Parent.TextSize)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Tooltip = FoundationModule.Tooltip
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local config = {
	pendingReceiptTooltip = "Purchasing.PurchaseDialog.Message.PendingDeveloperProductOnHome"
}

local function _(p1, p2)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else p2
end

local _ = function(p1, p2)
	return if p1 == nil then p2 else p1
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), TextSizeModule (copy), ReactModule (copy), View (copy), Text (copy), Icon (copy), IconName (copy), Tooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local PendingReceiptsCountText = p1.pendingReceiptsCountText
	local IsNotPendingReceiptsCountTextMatch: boolean = typeof(PendingReceiptsCountText) == "string" and PendingReceiptsCountText ~= ""
	local PendingReceiptsCountText1 = if IsNotPendingReceiptsCountTextMatch then PendingReceiptsCountText else nil
	local PendingReceiptsTooltipText = p1.pendingReceiptsTooltipText
	local PendingReceiptsTooltipText1 = if IsNotPendingReceiptsCountTextMatch then if typeof(PendingReceiptsTooltipText) == "string" and PendingReceiptsTooltipText ~= "" then PendingReceiptsTooltipText else UseLocalizationResult.pendingReceiptTooltip else nil
	local IsNotTitleMatch: boolean = typeof(p1.title) == "string" and p1.title ~= ""
	local TitleMaxLines = if p1.titleMaxLines == nil or p1.titleMaxLines <= 0 then 2 else p1.titleMaxLines
	local TitleMedium = if p1.titleFontStyle == nil then UseTokensResult.Typography.TitleMedium else p1.titleFontStyle
	local TextSizeOffset = TextSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local Ceiled: number = if IsNotTitleMatch then math.ceil(TitleMaxLines * (TitleMedium.LineHeight * TitleMedium.FontSize + TextSizeOffset)) else 0
	local IsNotPriceTextMatch: boolean = typeof(p1.priceText) == "string" and p1.priceText ~= ""
	local IsNotBasePriceTextMatch: boolean = IsNotPriceTextMatch and (p1.showBasePriceCrossed == true and (p1.basePriceText ~= nil and p1.basePriceText ~= ""))
	local IsHideRobuxIconInPrice = p1.hideRobuxIconInPrice == true
	local IsNotPriceTextMatch1: boolean = IsNotPriceTextMatch or IsNotPendingReceiptsCountTextMatch
	local Small = if p1.priceRobuxIconSize == nil then "Small" else p1.priceRobuxIconSize
	local PriceRobuxIconStyle = p1.priceRobuxIconStyle
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	local Emphasis1 = if PriceRobuxIconStyle == nil then Emphasis else PriceRobuxIconStyle
	local XSmall = if p1.basePriceRobuxIconSize == nil then "XSmall" else p1.basePriceRobuxIconSize
	local BasePriceRobuxIconStyle = p1.basePriceRobuxIconStyle
	local Muted = UseTokensResult.Color.Content.Muted
	local Muted1 = if BasePriceRobuxIconStyle == nil then Muted else BasePriceRobuxIconStyle
	local CreateElementFunction2 = ReactModule.createElement
	local Tag = p1.tag
	local config1 = {
		LayoutOrder = p1.layoutOrder,
		tag = if typeof(Tag) == "string" and Tag ~= "" then Tag else "col fill auto-xy",
		testId = p1.testId
	}
	local t = {}
	local Element = nil
	
	if IsNotTitleMatch then
		local TitleTag = p1.titleTag
		Element = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			Text = p1.title,
			TextTruncate = Enum.TextTruncate.AtEnd,
			fontStyle = TitleMedium,
			Size = UDim2.new(1, 0, 0, Ceiled),
			tag = if typeof(TitleTag) == "string" and TitleTag ~= "" then TitleTag else "size-full-0 text-wrap text-align-x-left text-truncate-end content-emphasis",
			testId = if p1.testId then `{p1.testId}--title` else nil
		})
	else
		Element = nil
	end
	t.Title = Element
	local PriceRow = nil
	
	if IsNotPriceTextMatch1 then
		local CreateElementFunction1 = ReactModule.createElement
		local PriceRowTag = p1.priceRowTag
		local config2 = {
			LayoutOrder = 2,
			tag = if typeof(PriceRowTag) == "string" and PriceRowTag ~= "" then PriceRowTag else "row align-y-center gap-small auto-xy",
			testId = if p1.testId then `{p1.testId}--price-row` else nil
		}
		local t1 = {}
		local Element1 = nil
		
		if IsNotPriceTextMatch then
			local CurrentPriceTag = p1.currentPriceTag
			local PriceTextTag = p1.priceTextTag
			Element1 = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = if typeof(CurrentPriceTag) == "string" and CurrentPriceTag ~= "" then CurrentPriceTag else "row align-y-center gap-xsmall auto-xy",
				testId = if p1.testId then `{p1.testId}--current-price` else nil
			}, {
				RobuxIcon = if IsHideRobuxIconInPrice then nil else ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = IconName.Robux,
					size = Small,
					style = Emphasis1,
					testId = if p1.testId then `{p1.testId}--price-robux-icon` else nil
				}),
				Price = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = p1.priceText,
					tag = if typeof(PriceTextTag) == "string" and PriceTextTag ~= "" then PriceTextTag else "auto-xy text-align-x-left text-body-medium content-emphasis"
				})
			})
		else
			Element1 = nil
		end
		t1.CurrentPrice = Element1
		local Element2 = nil
		
		if IsNotBasePriceTextMatch then
			local BasePriceTag = p1.basePriceTag
			local BasePriceContentTag = p1.basePriceContentTag
			local config3 = {
				tag = if typeof(BasePriceContentTag) == "string" and BasePriceContentTag ~= "" then BasePriceContentTag else "row align-y-center gap-xsmall auto-xy"
			}
			local BasePriceTextTag = p1.basePriceTextTag
			local StrikethroughTag = p1.strikethroughTag
			Element2 = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = if typeof(BasePriceTag) == "string" and BasePriceTag ~= "" then BasePriceTag else "auto-xy",
				testId = if p1.testId then `{p1.testId}--base-price` else nil
			}, {
				Content = ReactModule.createElement(View, config3, {
					RobuxIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.Robux,
						size = XSmall,
						style = Muted1,
						testId = if p1.testId then `{p1.testId}--base-price-robux-icon` else nil
					}),
					Price = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						Text = p1.basePriceText,
						tag = if typeof(BasePriceTextTag) == "string" and BasePriceTextTag ~= "" then BasePriceTextTag else "auto-xy text-align-x-left text-body-small content-muted"
					})
				}),
				Strikethrough = ReactModule.createElement(View, {
					ZIndex = 2,
					tag = if typeof(StrikethroughTag) == "string" and StrikethroughTag ~= "" then StrikethroughTag else "bg-system-neutral position-center-center anchor-center-center",
					Size = UDim2.new(1, 0, 0, 1),
					testId = if p1.testId then `{p1.testId}--base-price-strikethrough` else nil
				})
			})
		else
			Element2 = nil
		end
		t1.BasePrice = Element2
		local OwnedCount = nil
		
		if IsNotPendingReceiptsCountTextMatch then
			local CreateElementFunction = ReactModule.createElement
			local OwnedCountTag = p1.ownedCountTag
			local config4 = {
				LayoutOrder = 3,
				tag = if typeof(OwnedCountTag) == "string" and OwnedCountTag ~= "" then OwnedCountTag else "row align-y-center gap-xsmall auto-xy",
				testId = if p1.testId then `{p1.testId}--owned-count` else nil
			}
			local t2 = {}
			local Element3 = nil
			
			if IsNotPriceTextMatch then
				local OwnedCountSeparatorText = p1.ownedCountSeparatorText
				local OwnedCountSeparatorText1 = if typeof(OwnedCountSeparatorText) == "string" and OwnedCountSeparatorText ~= "" then OwnedCountSeparatorText else "·"
				local OwnedCountSeparatorTag = p1.ownedCountSeparatorTag
				Element3 = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = OwnedCountSeparatorText1,
					tag = if typeof(OwnedCountSeparatorTag) == "string" and OwnedCountSeparatorTag ~= "" then OwnedCountSeparatorTag else "auto-xy text-body-medium content-default",
					testId = if p1.testId then `{p1.testId}--owned-count-separator` else nil
				})
			else
				Element3 = nil
			end
			t2.Dot = Element3
			local OwnedCountTextTag = p1.ownedCountTextTag
			t2.Label = ReactModule.createElement(Tooltip, {
				LayoutOrder = 2,
				title = "",
				text = PendingReceiptsTooltipText1,
				side = PopoverSide.Top,
				align = PopoverAlign.Center
			}, ReactModule.createElement(View, {
				tag = "auto-xy",
				onStateChanged = function(_) end,
				testId = if p1.testId then `{p1.testId}--owned-count-tooltip` else nil
			}, {
				Text = ReactModule.createElement(Text, {
					Text = PendingReceiptsCountText1,
					tag = if typeof(OwnedCountTextTag) == "string" and OwnedCountTextTag ~= "" then OwnedCountTextTag else "auto-xy text-body-medium content-muted",
					testId = if p1.testId then `{p1.testId}--owned-count-label` else nil
				})
			}))
			OwnedCount = CreateElementFunction(View, config4, t2)
		else
			OwnedCount = nil
		end
		t1.OwnedCount = OwnedCount
		PriceRow = CreateElementFunction1(View, config2, t1)
	else
		PriceRow = nil
	end
	t.PriceRow = PriceRow
	
	return CreateElementFunction2(View, config1, t)
end)