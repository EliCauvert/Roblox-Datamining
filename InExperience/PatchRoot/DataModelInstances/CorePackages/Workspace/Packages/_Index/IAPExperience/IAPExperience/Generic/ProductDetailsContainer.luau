local IAPExperience = script:FindFirstAncestor("IAPExperience")
local parent = IAPExperience.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local unifiedProductDetailsModule = require(IAPExperience.Generic.UnifiedProductDetails)
local priceSummaryV2Module = require(IAPExperience.Generic.PriceSummaryV2)
local discountSummaryModule = require(IAPExperience.Generic.DiscountSummary)
local multiItemPriceShowsDiscountAccordionModule = require(IAPExperience.Generic.multiItemPriceShowsDiscountAccordion)
local unifiedPurchaseModalTypeEnumModule = require(IAPExperience.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local _ = require(IAPExperience.Enums.VirtualItemBadgeType)
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

local function _(p1)
	if p1 then
		local basePriceInRobux = p1.basePriceInRobux
		local priceInRobux = p1.priceInRobux
		
		return typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	end
	return false
end

return function(p1)
	-- upvalues: fFlagPurchasePromptFetchCartPricing (ref), multiItemPriceShowsDiscountAccordionModule (ref), unifiedPurchaseModalTypeEnumModule (ref), reactModule (ref), view (ref), unifiedProductDetailsModule (ref), discountSummaryModule (ref), priceSummaryV2Module (ref)
	local var1
	local itemPrice = p1.product and p1.product.itemPrice
	
	if itemPrice then
		local basePriceInRobux = itemPrice.basePriceInRobux
		local priceInRobux = itemPrice.priceInRobux
		var1 = typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	else
		var1 = false
	end
	local var2 = if fFlagPurchasePromptFetchCartPricing then multiItemPriceShowsDiscountAccordionModule(itemPrice) else nil
	local uDim2 = UDim2.new(1, 0, 0, 100)
	
	if p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
		return if fFlagPurchasePromptFetchCartPricing and multiItemPriceShowsDiscountAccordionModule(itemPrice) then reactModule.createElement(view, {
			tag = "col align-x-center align-y-top gap-medium size-full-0 auto-y"
		}, {
			Details = if p1.hideProductDetails then nil else reactModule.createElement(unifiedProductDetailsModule, {
				layoutOrder = 1,
				isPortrait = false,
				isCompact = p1.isCompact,
				itemIcon = p1.product.itemIcon,
				itemName = p1.product.itemName,
				itemRobuxCost = itemPrice.priceInRobux,
				itemPrice = itemPrice,
				model = p1.product.model,
				subtitleView = p1.subtitleView,
				itemDisplayPrice = p1.product.itemDisplayPrice,
				isLoading = p1.isLoading,
				priceSuffix = p1.priceSuffix
			}),
			DiscountSummary = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-xxsmall",
				LayoutOrder = 2,
				Visible = not p1.hideDiscountSummary
			}, {
				Discount = reactModule.createElement(discountSummaryModule, {
					itemPrice = itemPrice,
					savingsSummary = p1.savingsSummary
				})
			})
		}) elseif var1 then reactModule.createElement(view, {
			tag = {
				["col align-x-center align-y-top size-full-0"] = fFlagPurchasePromptFetchCartPricing,
				["col shrink-0 size-full-0 align-x-center align-y-start"] = not fFlagPurchasePromptFetchCartPricing
			},
			Size = uDim2
		}, {
			Summary = reactModule.createElement(priceSummaryV2Module, {
				amount = p1.product.itemRobuxCost,
				itemPrice = itemPrice,
				subtotalItemCount = if fFlagPurchasePromptFetchCartPricing then p1.subtotalItemCount else nil
			})
		}) else reactModule.createElement(priceSummaryV2Module, {
			amount = p1.product.itemRobuxCost,
			itemPrice = itemPrice,
			subtotalItemCount = if fFlagPurchasePromptFetchCartPricing then p1.subtotalItemCount else nil
		})
	end
	local var3 = if itemPrice and (not fFlagPurchasePromptFetchCartPricing or var2) then reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = {
			["size-full-0 auto-y padding-xxsmall"] = fFlagPurchasePromptFetchCartPricing,
			["auto-y size-full-0 padding-xxsmall"] = not fFlagPurchasePromptFetchCartPricing
		},
		Visible = if fFlagPurchasePromptFetchCartPricing then not p1.hideDiscountSummary else nil
	}, {
		Discount = reactModule.createElement(discountSummaryModule, {
			itemPrice = itemPrice,
			savingsSummary = if fFlagPurchasePromptFetchCartPricing then p1.savingsSummary else nil
		})
	}) else nil
	
	if not var1 then
		var3 = nil
	end
	return reactModule.createElement(view, {
		tag = {
			["col align-x-center align-y-top gap-medium size-full-0 auto-y"] = fFlagPurchasePromptFetchCartPricing,
			["col gap-medium shrink-0 auto-y size-full-0 align-x-center align-y-start"] = not fFlagPurchasePromptFetchCartPricing and var1,
			["col gap-medium auto-y size-full-0 align-x-center align-y-start"] = not fFlagPurchasePromptFetchCartPricing and not var1
		},
		Size = if if fFlagPurchasePromptFetchCartPricing then var2 else var1 then uDim2 else nil
	}, {
		Details = reactModule.createElement(unifiedProductDetailsModule, {
			layoutOrder = 1,
			isPortrait = false,
			isCompact = p1.isCompact,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			itemPrice = itemPrice,
			model = p1.product.model,
			subtitleView = p1.subtitleView,
			itemDisplayPrice = p1.product.itemDisplayPrice,
			isLoading = p1.isLoading,
			priceSuffix = p1.priceSuffix
		}),
		DiscountSummary = var3
	})
end