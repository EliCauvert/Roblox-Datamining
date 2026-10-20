local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local T = require(PurchasePrompt.Parent.PurchasePromptDeps).t
local _ = require(PurchasePrompt.strict)
local InterfaceResult = T.interface({
	productId = T.number,
	mobileProductId = T.string,
	robuxAmount = T.number,
	isSubscriptionOnly = T.boolean,
	premiumFeatureTypeName = T.string,
	description = T.string,
	price = T.interface({
		amount = T.number,
		currency = T.interface({ currencySymbol = T.string })
	})
})

return function(p1)
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, _ = InterfaceResult(p1)
	
	return if InterfaceResultResult then {
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