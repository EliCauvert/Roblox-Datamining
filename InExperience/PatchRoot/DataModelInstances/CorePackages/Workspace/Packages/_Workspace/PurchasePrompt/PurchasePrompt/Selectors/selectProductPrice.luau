local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local SelectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1) --[[ Line: 8 | Named "selectProductPrice" ]]
	-- upvalues: GetPlayerPriceModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), SelectCartPricingOverrideModule (copy)
	local CollectibleItemInstanceId = p1.promptRequest.collectibleItemInstanceId
	local ExpectedPrice = p1.promptRequest.expectedPrice
	local ExpectedPrice1 = if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then ExpectedPrice elseif FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p1.productPayload and p1.productPayload.timedOptionDays ~= nil then ExpectedPrice else GetPlayerPriceModule(p1.productInfo, p1.accountInfo.membershipType == 4)
	local SelectCartPricingOverrideModuleResult = SelectCartPricingOverrideModule(p1)
	
	if SelectCartPricingOverrideModuleResult ~= nil then
		ExpectedPrice1 = SelectCartPricingOverrideModuleResult.priceInRobux
	end
	return ExpectedPrice1
end