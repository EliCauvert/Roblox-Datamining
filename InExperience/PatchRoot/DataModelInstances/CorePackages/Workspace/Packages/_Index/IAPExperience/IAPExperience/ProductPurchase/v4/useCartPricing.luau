local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local _ = require(parent.Generic.ProductDetailsContainer)
local _ = require(script.Parent.aggregateCartPricingForMultiItem)
local _ = require(script.Parent.cartPricingResponseLineItem)
local deriveCartPricingViewModule = require(script.Parent.deriveCartPricingView)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(parent.ProductPurchase.PricingTypes)
local fFlagPurchasePromptFetchCartPricing = require(parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local fFlagPurchasePromptFixOfferMarginUpsell = require(parent.Parent.SharedFlags).FFlagPurchasePromptFixOfferMarginUpsell

return function(p1)
	-- upvalues: reactModule (ref), fFlagPurchasePromptFetchCartPricing (ref), deriveCartPricingViewModule (ref), fFlagPurchasePromptFixOfferMarginUpsell (ref), unifiedPurchaseModalTypeEnumModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: fFlagPurchasePromptFetchCartPricing (copy), deriveCartPricingViewModule (copy), p1 (ref)
		return if fFlagPurchasePromptFetchCartPricing then deriveCartPricingViewModule(p1.cartPricingResponse) else nil
	end, { p1.cartPricingResponse })
	local var2 = if var1 ~= nil then {} else var1.offers
	local var3 = if var1 == nil or not var1.hasSavings then nil else {
		subtotalRobux = var1.originalPrice,
		totalRobux = var1.priceAfterDiscount,
		savingsRobux = var1.originalPrice - var1.priceAfterDiscount,
		itemCount = var1.itemCount
	}
	local var4 = if fFlagPurchasePromptFixOfferMarginUpsell and var1 ~= nil then var1.priceWithoutOffersDiscounts else nil
	local var5 = if var1 ~= nil then nil else var1.priceAfterDiscount
	local var6 = fFlagPurchasePromptFetchCartPricing and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem
	local var7 = if var3 == nil then #var2 > 0 else true
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var3 (ref), var1 (ref)
		return if var7 and var3 ~= nil and var1 ~= nil then {
			basePriceInRobux = var3.subtotalRobux,
			priceInRobux = var3.totalRobux,
			discounts = var1.discounts
		} else nil
	end, { var7, var3, var1 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var3 (ref), p1 (ref), var8 (ref)
		return if var7 and var3 ~= nil then {
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = var3.totalRobux,
			itemPrice = var8 or p1.product.itemPrice,
			itemDisplayPrice = p1.product.itemDisplayPrice,
			badgeType = p1.product.badgeType
		} else p1.product
	end, { p1.product, var7, var3, var8 })
	local itemPrice = var9.itemPrice
	
	return {
		cartAggregate = var3,
		priceWithoutOffersDiscounts = var4,
		priceAfterOffersDiscounts = var5,
		shouldHideLookProductDetails = var6,
		cartPricingOffers = var2,
		showCartOfferUi = var7,
		mergedProductForDetails = var9,
		mergedProductItemPrice = itemPrice,
		mergedProductPriceInRobux = if itemPrice then itemPrice.priceInRobux else var9.itemRobuxCost,
		displayItemPriceForMultiItem = if var7 then var8 or p1.product.itemPrice else p1.product.itemPrice,
		cartPricingSavingsSummary = if var7 and var1 ~= nil then var1.savingsSummary else nil,
		toggleCartPricingOffer = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var2 (ref)
			local onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
			
			if onCartOfferAppliedChanged == nil then return end
			local t = {}
			local var10 = true
			
			for i, v in var2 do
				if not (if v.offerId == p2 then not v.selected else v.selected) then
					table.insert(t, v.offerId)
					var10 = false
				end
			end
			onCartOfferAppliedChanged(var10, t)
		end, { var2, p1.onCartOfferAppliedChanged })
	}
end