local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local cartPricingLoadingModule = require(script.Parent.CartPricingLoading)
local _ = require(script.Parent.useCartPricing)
local _ = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local fFlagUnifiedPurchaseAddSkeleton = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton

return function(p1)
	-- upvalues: reactModule (ref), cartPricingLoadingModule (ref), view (ref), productDetailsContainerModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref)
	local cartPricing = p1.cartPricing
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = 1
	}, {
		Details = reactModule.createElement(productDetailsContainerModule, {
			purchaseModalType = p1.purchaseModalType,
			product = cartPricing.mergedProductForDetails,
			subtitleView = p1.subtitleView,
			priceSuffix = p1.priceSuffix,
			isLoading = if fFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil,
			subtotalItemCount = if cartPricing.showCartOfferUi and cartPricing.cartAggregate then cartPricing.cartAggregate.itemCount else nil,
			hideProductDetails = cartPricing.shouldHideLookProductDetails,
			hideDiscountSummary = p1.isCartPricingLoading,
			savingsSummary = cartPricing.cartPricingSavingsSummary
		}),
		CartPricingLoading = if p1.isCartPricingLoading then reactModule.createElement(cartPricingLoadingModule, { LayoutOrder = 2, isLoading = p1.isCartPricingLoading }) else nil
	})
end