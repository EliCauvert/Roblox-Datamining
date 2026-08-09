local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local _ = require(parent.Generic.ProductDetailsContainer)
local _ = require(script.Parent.aggregateCartPricingForMultiItem)
local _ = require(script.Parent.cartPricingResponseLineItem)
local deriveCartPricingViewModule = require(script.Parent.deriveCartPricingView)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(parent.ProductPurchase.PricingTypes)
local fFlagPurchasePromptFetchCartPricing = require(parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

return function(p0) --[[ line: 43 | named "useCartPricing" ]]
	-- upvalues: reactModule (ref), fFlagPurchasePromptFetchCartPricing (ref), deriveCartPricingViewModule (ref), unifiedPurchaseModalTypeEnumModule (ref)
	local var3 = reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: fFlagPurchasePromptFetchCartPricing (copy), deriveCartPricingViewModule (copy), p0 (ref)
		return if fFlagPurchasePromptFetchCartPricing then deriveCartPricingViewModule(p0.cartPricingResponse) else nil
	end, { p0.cartPricingResponse })
	local var4 = if var3 ~= nil then {} else var3.offers
	local var5 = if var3 == nil or not var3.hasSavings then nil else {
		subtotalRobux = var3.originalPrice,
		totalRobux = var3.priceAfterDiscount,
		savingsRobux = var3.originalPrice - var3.priceAfterDiscount,
		itemCount = var3.itemCount
	}
	local var6 = fFlagPurchasePromptFetchCartPricing and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem
	local var7 = if var5 == nil then #var4 > 0 else true
	local var8 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: var7 (ref), var5 (ref), var3 (ref)
		return if var7 and var5 ~= nil and var3 ~= nil then {
			basePriceInRobux = var5.subtotalRobux,
			priceInRobux = var5.totalRobux,
			discounts = var3.discounts
		} else nil
	end, { var7, var5, var3 })
	local var9 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: var7 (ref), var5 (ref), p0 (ref), var8 (ref)
		return if var7 and var5 ~= nil then {
			model = p0.product.model,
			itemIcon = p0.product.itemIcon,
			itemName = p0.product.itemName,
			itemRobuxCost = var5.totalRobux,
			itemPrice = var8 or p0.product.itemPrice,
			itemDisplayPrice = p0.product.itemDisplayPrice,
			badgeType = p0.product.badgeType
		} else p0.product
	end, { p0.product, var7, var5, var8 })
	local itemPrice = var9.itemPrice
	
	return {
		cartAggregate = var5,
		shouldHideLookProductDetails = var6,
		cartPricingOffers = var4,
		showCartOfferUi = var7,
		mergedProductForDetails = var9,
		mergedProductItemPrice = itemPrice,
		mergedProductPriceInRobux = if itemPrice then itemPrice.priceInRobux else var9.itemRobuxCost,
		displayItemPriceForMultiItem = if var7 then var8 or p0.product.itemPrice else p0.product.itemPrice,
		cartPricingSavingsSummary = if var7 and var3 ~= nil then var3.savingsSummary else nil,
		toggleCartPricingOffer = reactModule.useCallback(function(p1) --[[ line: 112 ]]
			-- upvalues: p0 (ref), var4 (ref)
			local onCartOfferAppliedChanged = p0.onCartOfferAppliedChanged
			
			if onCartOfferAppliedChanged == nil then return end
			local t = {}
			local var11 = true
			
			for i, v in var4 do
				if not (if v.offerId == p1 then not v.selected else v.selected) then
					table.insert(t, v.offerId)
					var11 = false
				end
			end
			onCartOfferAppliedChanged(var11, t)
		end, { var4, p0.onCartOfferAppliedChanged })
	}
end