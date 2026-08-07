local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local cartPricingLoadingModule = require(script.Parent.CartPricingLoading)
local _ = require(script.Parent.useCartPricing)
local _ = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local fFlagUnifiedPurchaseAddSkeleton = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton

return function(p0) --[[ line: 28 | named "CartPricingProductDetails" ]]
	-- upvalues: reactModule (ref), cartPricingLoadingModule (ref), view (ref), productDetailsContainerModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref)
	local cartPricing = p0.cartPricing
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = 1
	}, {
		Details = reactModule.createElement(productDetailsContainerModule, {
			purchaseModalType = p0.purchaseModalType,
			product = cartPricing.mergedProductForDetails,
			subtitleView = p0.subtitleView,
			priceSuffix = p0.priceSuffix,
			isLoading = if fFlagUnifiedPurchaseAddSkeleton then p0.isLoading else nil,
			subtotalItemCount = if cartPricing.showCartOfferUi and cartPricing.cartAggregate then cartPricing.cartAggregate.itemCount else nil,
			hideProductDetails = cartPricing.shouldHideLookProductDetails,
			hideDiscountSummary = p0.isCartPricingLoading,
			savingsSummary = cartPricing.cartPricingSavingsSummary
		}),
		CartPricingLoading = if p0.isCartPricingLoading then reactModule.createElement(cartPricingLoadingModule, { LayoutOrder = 2, isLoading = p0.isCartPricingLoading }) else nil
	})
end