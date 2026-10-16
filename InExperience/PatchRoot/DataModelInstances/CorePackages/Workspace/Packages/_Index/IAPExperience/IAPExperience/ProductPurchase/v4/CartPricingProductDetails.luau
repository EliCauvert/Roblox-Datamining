local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local View = require(Parent1.Foundation).View
local ProductDetailsContainerModule = require(Parent.Generic.ProductDetailsContainer)
local CartPricingLoadingModule = require(script.Parent.CartPricingLoading)
local _ = require(script.Parent.useCartPricing)
local _ = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local FFlagUnifiedPurchaseAddSkeleton = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase

return function(p1) --[[ Line: 32 | Named "CartPricingProductDetails" ]]
	-- upvalues: ReactModule (copy), CartPricingLoadingModule (copy), View (copy), ProductDetailsContainerModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), FFlagUnifiedPurchaseAddSkeleton (copy)
	local CartPricing = p1.cartPricing
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = 1
	}, {
		Details = ReactModule.createElement(ProductDetailsContainerModule, {
			purchaseModalType = p1.purchaseModalType,
			product = CartPricing.mergedProductForDetails,
			subtitleView = p1.subtitleView,
			priceSuffix = p1.priceSuffix,
			includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.includePriceSuffixOnOriginal else nil,
			priceText = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.priceText else nil,
			isLoading = if FFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil,
			subtotalItemCount = if CartPricing.showCartOfferUi and CartPricing.cartAggregate then CartPricing.cartAggregate.itemCount else nil,
			hideProductDetails = CartPricing.shouldHideLookProductDetails,
			hideDiscountSummary = p1.isCartPricingLoading,
			savingsSummary = CartPricing.cartPricingSavingsSummary
		}),
		CartPricingLoading = if p1.isCartPricingLoading then ReactModule.createElement(CartPricingLoadingModule, { LayoutOrder = 2, isLoading = p1.isCartPricingLoading }) else nil
	})
end