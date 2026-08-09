local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local selectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p0) --[[ line: 31 | named "selectProductPrice" ]]
	-- upvalues: getPlayerPriceModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingOverrideModule (ref)
	local collectibleItemInstanceId = p0.promptRequest.collectibleItemInstanceId
	local var4 = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" or fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p0.productPayload and p0.productPayload.timedOptionDays ~= nil then p0.promptRequest.expectedPrice else getPlayerPriceModule(p0.productInfo, p0.accountInfo.membershipType == 4)
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		local var5 = selectCartPricingOverrideModule(p0)
		
		if var5 ~= nil then
			var4 = var5.priceInRobux
		end
	end
	return var4
end