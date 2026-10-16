local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local _ = require(Parent.RobloxSubscriptionPurchaseApp)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local FFlagEnableRobuxUpsellPlusButtonExperiment = require(Parent.IAPExperience).Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local GetBlackbirdUpsellBannerProductInfoModule = require(script.Parent.getBlackbirdUpsellBannerProductInfo)
local ShouldShowBlackbirdUpsellModule = require(script.Parent.shouldShowBlackbirdUpsell)
local config = {
	[ProductTypeEnum.Asset] = true,
	[ProductTypeEnum.Bundle] = true,
	[ProductTypeEnum.Gamepass] = true,
	[ProductTypeEnum.Product] = true,
	[ProductTypeEnum.Look] = true
}

return function(p1, p2, p3, p4, p5): boolean --[[ Line: 27 | Named "isEligibleForRobuxUpsellPlusButton" ]]
	-- upvalues: GetBlackbirdUpsellBannerProductInfoModule (copy), config (copy), FFlagEnableRobuxUpsellPlusButtonExperiment (copy), ShouldShowBlackbirdUpsellModule (copy)
	if not p1 then
		return false
	elseif type(p2) ~= "table" or #p2 == 0 then
		return false
	else
		local BlackbirdUpsellBannerProductInfoModule = GetBlackbirdUpsellBannerProductInfoModule(p2)
		
		if BlackbirdUpsellBannerProductInfoModule == nil or type(BlackbirdUpsellBannerProductInfoModule.initialDiscountPercentage) ~= "number" then
			return false
		elseif type(p4) ~= "table" or type(p4.basePriceInRobux) ~= "number" then
			return false
		elseif type(p3) == "table" then
			local Kind = p3.kind
			
			return if type(Kind) == "string" and config[Kind] and ShouldShowBlackbirdUpsellModule(p4, p5, false, p3, if FFlagEnableRobuxUpsellPlusButtonExperiment then true else nil) then true else false
		else
			return false
		end
	end
end