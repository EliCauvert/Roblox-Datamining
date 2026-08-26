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

return function(p1)
	-- upvalues: var1 (ref)
	local var2, _ = var1(p1)
	
	return if var2 then {
		productId = p1.productId,
		mobileProductId = p1.mobileProductId,
		robuxAmount = p1.robuxAmount,
		isSubscriptionOnly = p1.isSubscriptionOnly,
		premiumFeatureTypeName = p1.premiumFeatureTypeName,
		description = p1.description,
		price = p1.price.amount,
		currencySymbol = p1.price.currency.currencySymbol
	} else nil
end