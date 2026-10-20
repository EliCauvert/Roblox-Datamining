local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local _ = require(Parent.Generic.ProductDetailsContainer)
local _ = require(script.Parent.aggregateCartPricingForMultiItem)
local _ = require(script.Parent.cartPricingResponseLineItem)
local DeriveCartPricingViewModule = require(script.Parent.deriveCartPricingView)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(Parent.ProductPurchase.PricingTypes)

return function(p1)
	-- upvalues: ReactModule (copy), DeriveCartPricingViewModule (copy), UnifiedPurchaseModalTypeEnumModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DeriveCartPricingViewModule (upval), p1 (copy)
		return DeriveCartPricingViewModule(p1.cartPricingResponse)
	end, { p1.cartPricingResponse })
	local T = if UseMemoResult == nil then {} else UseMemoResult.offers
	local Config = if UseMemoResult == nil or not UseMemoResult.hasSavings then nil else {
		subtotalRobux = UseMemoResult.originalPrice,
		totalRobux = UseMemoResult.priceAfterDiscount,
		savingsRobux = UseMemoResult.originalPrice - UseMemoResult.priceAfterDiscount,
		itemCount = UseMemoResult.itemCount
	}
	local HasConfig: boolean = Config ~= nil or #T > 0
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: HasConfig (copy), Config (copy), UseMemoResult (copy)
		return if HasConfig and Config ~= nil and UseMemoResult ~= nil then {
			basePriceInRobux = Config.subtotalRobux,
			priceInRobux = Config.totalRobux,
			discounts = UseMemoResult.discounts
		} else nil
	end, { HasConfig, Config, UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: HasConfig (copy), Config (copy), p1 (copy), UseMemoResult1 (copy)
		return if HasConfig and Config ~= nil then {
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = Config.totalRobux,
			itemPrice = UseMemoResult1 or p1.product.itemPrice,
			itemDisplayPrice = p1.product.itemDisplayPrice,
			badgeType = p1.product.badgeType
		} else p1.product
	end, { p1.product, HasConfig, Config, UseMemoResult1 })
	local ItemPrice = UseMemoResult2.itemPrice
	
	return {
		cartAggregate = Config,
		priceWithoutOffersDiscounts = if UseMemoResult == nil then nil else UseMemoResult.priceWithoutOffersDiscounts,
		priceAfterOffersDiscounts = if UseMemoResult == nil then nil else UseMemoResult.priceAfterDiscount,
		shouldHideLookProductDetails = p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem,
		cartPricingOffers = T,
		showCartOfferUi = HasConfig,
		mergedProductForDetails = UseMemoResult2,
		mergedProductItemPrice = ItemPrice,
		mergedProductPriceInRobux = if ItemPrice then ItemPrice.priceInRobux else UseMemoResult2.itemRobuxCost,
		displayItemPriceForMultiItem = HasConfig and UseMemoResult1 or p1.product.itemPrice,
		cartPricingSavingsSummary = if HasConfig and UseMemoResult ~= nil then UseMemoResult.savingsSummary else nil,
		toggleCartPricingOffer = ReactModule.useCallback(function(OfferId)
			-- upvalues: p1 (copy), T (copy)
			local OnCartOfferAppliedChangedFunction: (any, any) -> () = p1.onCartOfferAppliedChanged
			
			if OnCartOfferAppliedChangedFunction == nil then return end
			local List = {}
			local Flag = true
			
			for _, value in T do
				if not (if value.offerId == OfferId then not value.selected else value.selected) then
					table.insert(List, value.offerId)
					Flag = false
				end
			end
			OnCartOfferAppliedChangedFunction(Flag, List)
		end, { T, p1.onCartOfferAppliedChanged })
	}
end