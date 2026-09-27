local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local IAPExperienceModule = require(parent.IAPExperience)
local _ = require(parent.RobloxSubscriptionPurchaseApp)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local fFlagEnableRobuxUpsellPlusButtonExperiment = IAPExperienceModule.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local getBlackbirdUpsellBannerProductInfoModule = require(script.Parent.getBlackbirdUpsellBannerProductInfo)
local shouldShowBlackbirdUpsellModule = require(script.Parent.shouldShowBlackbirdUpsell)
local t = {
	[productTypeEnum.Asset] = true,
	[productTypeEnum.Bundle] = true,
	[productTypeEnum.Gamepass] = true,
	[productTypeEnum.Product] = true,
	[productTypeEnum.Look] = true
}

return function(p1, p2, p3, p4, p5)
	-- upvalues: getBlackbirdUpsellBannerProductInfoModule (ref), t (ref), fFlagEnableRobuxUpsellPlusButtonExperiment (ref), shouldShowBlackbirdUpsellModule (ref)
	if not p1 then
		return false
	elseif type(p2) ~= "table" or #p2 == 0 then
		return false
	end
	local var1 = getBlackbirdUpsellBannerProductInfoModule(p2)
	
	if var1 == nil or type(var1.initialDiscountPercentage) ~= "number" then
		return false
	elseif type(p4) ~= "table" or type(p4.basePriceInRobux) ~= "number" then
		return false
	elseif type(p3) ~= "table" then
		return false
	end
	local kind = p3.kind
	
	return not (type(kind) ~= "string" or not t[kind]) and shouldShowBlackbirdUpsellModule(p4, p5, false, p3, if fFlagEnableRobuxUpsellPlusButtonExperiment then true else nil)
end