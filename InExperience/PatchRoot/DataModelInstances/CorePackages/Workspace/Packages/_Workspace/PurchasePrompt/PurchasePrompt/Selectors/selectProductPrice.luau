local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local selectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1)
	-- upvalues: getPlayerPriceModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingOverrideModule (ref)
	local collectibleItemInstanceId = p1.promptRequest.collectibleItemInstanceId
	local var1 = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" or fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p1.productPayload and p1.productPayload.timedOptionDays ~= nil then p1.promptRequest.expectedPrice else getPlayerPriceModule(p1.productInfo, p1.accountInfo.membershipType == 4)
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		local var2 = selectCartPricingOverrideModule(p1)
		
		if var2 ~= nil then
			var1 = var2.priceInRobux
		end
	end
	return var1
end