local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UnifiedProductDetailsModule = require(IAPExperience.Generic.UnifiedProductDetails)
local PriceSummaryV2Module = require(IAPExperience.Generic.PriceSummaryV2)
local DiscountSummaryModule = require(IAPExperience.Generic.DiscountSummary)
local MultiItemPriceShowsDiscountAccordionModule = require(IAPExperience.Generic.multiItemPriceShowsDiscountAccordion)
local UnifiedPurchaseModalTypeEnumModule = require(IAPExperience.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local _ = require(IAPExperience.Enums.VirtualItemBadgeType)
local FFlagAddCompactUnifiedUpsellModalModeModule = require(IAPExperience.Flags.FFlagAddCompactUnifiedUpsellModalMode)
local FFlagFixUnnecessaryPaddingInUnifiedPurchaseModalModule = require(IAPExperience.Flags.FFlagFixUnnecessaryPaddingInUnifiedPurchaseModal)
local FFlagPurchasePromptFetchCartPricing = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

local function _(p1): boolean
	if p1 then
		local BasePriceInRobux = p1.basePriceInRobux
		local PriceInRobux = p1.priceInRobux
		
		return typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and PriceInRobux < BasePriceInRobux
	else
		return false
	end
end

return function(p1)
	-- upvalues: FFlagPurchasePromptFetchCartPricing (copy), MultiItemPriceShowsDiscountAccordionModule (copy), UnifiedPurchaseModalTypeEnumModule (copy), ReactModule (copy), View (copy), UnifiedProductDetailsModule (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), DiscountSummaryModule (copy), PriceSummaryV2Module (copy), FFlagFixUnnecessaryPaddingInUnifiedPurchaseModalModule (copy)
	local ItemPrice = p1.product and p1.product.itemPrice
	local v1 = nil
	
	if ItemPrice then
		local BasePriceInRobux = ItemPrice.basePriceInRobux
		local PriceInRobux = ItemPrice.priceInRobux
		v1 = typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and PriceInRobux < BasePriceInRobux
	else
		v1 = false
	end
	local MultiItemPriceShowsDiscountAccordionModuleResult = if FFlagPurchasePromptFetchCartPricing then MultiItemPriceShowsDiscountAccordionModule(ItemPrice) else nil
	local _UDim2 = UDim2.new(1, 0, 0, 100)
	
	if p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then
		return if FFlagPurchasePromptFetchCartPricing and MultiItemPriceShowsDiscountAccordionModule(ItemPrice) then ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top gap-medium size-full-0 auto-y"
		}, {
			Details = if p1.hideProductDetails then nil else ReactModule.createElement(UnifiedProductDetailsModule, {
				layoutOrder = 1,
				isPortrait = false,
				isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then p1.isCompact else nil,
				itemIcon = p1.product.itemIcon,
				itemName = p1.product.itemName,
				itemRobuxCost = ItemPrice.priceInRobux,
				itemPrice = ItemPrice,
				model = p1.product.model,
				subtitleView = p1.subtitleView,
				itemDisplayPrice = p1.product.itemDisplayPrice,
				isLoading = p1.isLoading,
				priceSuffix = p1.priceSuffix
			}),
			DiscountSummary = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-xxsmall",
				LayoutOrder = 2,
				Visible = not p1.hideDiscountSummary
			}, {
				Discount = ReactModule.createElement(DiscountSummaryModule, {
					itemPrice = ItemPrice,
					savingsSummary = p1.savingsSummary
				})
			})
		}) elseif v1 then ReactModule.createElement(View, {
			tag = {
				["col align-x-center align-y-top size-full-0"] = FFlagPurchasePromptFetchCartPricing,
				["col shrink-0 size-full-0 align-x-center align-y-start"] = not FFlagPurchasePromptFetchCartPricing
			},
			Size = _UDim2
		}, {
			Summary = ReactModule.createElement(PriceSummaryV2Module, {
				amount = p1.product.itemRobuxCost,
				itemPrice = ItemPrice,
				subtotalItemCount = if FFlagPurchasePromptFetchCartPricing then p1.subtotalItemCount else nil
			})
		}) else ReactModule.createElement(PriceSummaryV2Module, {
			amount = p1.product.itemRobuxCost,
			itemPrice = ItemPrice,
			subtotalItemCount = if FFlagPurchasePromptFetchCartPricing then p1.subtotalItemCount else nil
		})
	else
		local MultiItemPriceShowsDiscountAccordionModuleResult1 = if FFlagPurchasePromptFetchCartPricing then MultiItemPriceShowsDiscountAccordionModuleResult else v1
		
		return ReactModule.createElement(View, {
			tag = {
				["col align-x-center align-y-top gap-medium size-full-0 auto-y"] = FFlagPurchasePromptFetchCartPricing,
				["col gap-medium shrink-0 auto-y size-full-0 align-x-center align-y-start"] = not FFlagPurchasePromptFetchCartPricing and v1,
				["col gap-medium auto-y size-full-0 align-x-center align-y-start"] = not FFlagPurchasePromptFetchCartPricing and not v1
			},
			Size = if MultiItemPriceShowsDiscountAccordionModuleResult1 then _UDim2 else nil
		}, {
			Details = ReactModule.createElement(UnifiedProductDetailsModule, {
				layoutOrder = 1,
				isPortrait = false,
				isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then p1.isCompact else nil,
				itemIcon = p1.product.itemIcon,
				itemName = p1.product.itemName,
				itemRobuxCost = p1.product.itemRobuxCost,
				itemPrice = ItemPrice,
				model = p1.product.model,
				subtitleView = p1.subtitleView,
				itemDisplayPrice = p1.product.itemDisplayPrice,
				isLoading = p1.isLoading,
				priceSuffix = p1.priceSuffix
			}),
			DiscountSummary = if ItemPrice and (not FFlagPurchasePromptFetchCartPricing or MultiItemPriceShowsDiscountAccordionModuleResult) then if FFlagFixUnnecessaryPaddingInUnifiedPurchaseModalModule and not v1 then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 auto-y padding-xxsmall"] = FFlagPurchasePromptFetchCartPricing,
					["auto-y size-full-0 padding-xxsmall"] = not FFlagPurchasePromptFetchCartPricing
				},
				Visible = if FFlagPurchasePromptFetchCartPricing then not p1.hideDiscountSummary else nil
			}, {
				Discount = ReactModule.createElement(DiscountSummaryModule, {
					itemPrice = ItemPrice,
					savingsSummary = if FFlagPurchasePromptFetchCartPricing then p1.savingsSummary else nil
				})
			}) elseif FFlagFixUnnecessaryPaddingInUnifiedPurchaseModalModule and not v1 then nil else nil
		})
	end
end