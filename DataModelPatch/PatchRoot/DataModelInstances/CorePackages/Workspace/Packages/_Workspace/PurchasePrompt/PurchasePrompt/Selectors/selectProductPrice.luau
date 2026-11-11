local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local SelectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1)
	-- upvalues: GetPlayerPriceModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectCartPricingOverrideModule (copy)
	local CollectibleItemInstanceId = p1.promptRequest.collectibleItemInstanceId
	local ExpectedPrice = p1.promptRequest.expectedPrice
	local PlayerPriceModule = GetPlayerPriceModule(p1.productInfo, p1.accountInfo.membershipType == 4)
	
	if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" or FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p1.productPayload and p1.productPayload.timedOptionDays ~= nil then
		PlayerPriceModule = ExpectedPrice
	end
	if FFlagPurchasePromptCartPricingEnabledModule then
		local SelectCartPricingOverrideModuleResult = SelectCartPricingOverrideModule(p1)
		
		if SelectCartPricingOverrideModuleResult ~= nil then
			PlayerPriceModule = SelectCartPricingOverrideModuleResult.priceInRobux
		end
	end
	return PlayerPriceModule
end