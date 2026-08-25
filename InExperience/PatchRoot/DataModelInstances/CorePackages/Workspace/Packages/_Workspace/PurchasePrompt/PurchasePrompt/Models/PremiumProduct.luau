local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local t = require(purchasePrompt.Parent.PurchasePromptDeps).t
local _ = require(purchasePrompt.strict)
local var1 = t.interface({
	productId = t.number,
	mobileProductId = t.string,
	robuxAmount = t.number,
	isSubscriptionOnly = t.boolean,
	premiumFeatureTypeName = t.string,
	description = t.string,
	price = t.interface({
		amount = t.number,
		currency = t.interface({ currencySymbol = t.string })
	})
})

return function(p0)
	-- upvalues: var1 (ref)
	local var2, _ = var1(p0)
	
	return if var2 then {
		productId = p0.productId,
		mobileProductId = p0.mobileProductId,
		robuxAmount = p0.robuxAmount,
		isSubscriptionOnly = p0.isSubscriptionOnly,
		premiumFeatureTypeName = p0.premiumFeatureTypeName,
		description = p0.description,
		price = p0.price.amount,
		currencySymbol = p0.price.currency.currencySymbol
	} else nil
end