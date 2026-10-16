local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.Parent.IAPExperience)
local _ = require(PurchasePrompt.types)
local DeriveSelectedOfferIdsFromCartPricingModule = require(script.Parent.deriveSelectedOfferIdsFromCartPricing)

return function(p1) --[[ Line: 17 | Named "derivePurchaseOptionsFromCartPricingResponse" ]]
	-- upvalues: DeriveSelectedOfferIdsFromCartPricingModule (copy)
	if p1 == nil then
		return nil
	end
	local DeriveSelectedOfferIdsFromCartPricingModuleResult = DeriveSelectedOfferIdsFromCartPricingModule(p1)
	
	if #DeriveSelectedOfferIdsFromCartPricingModuleResult == 0 then
		return nil
	end
	local Offers = {}
	
	for _, Id in DeriveSelectedOfferIdsFromCartPricingModuleResult do
		table.insert(Offers, { Id = Id })
	end
	return { Offers = Offers }
end