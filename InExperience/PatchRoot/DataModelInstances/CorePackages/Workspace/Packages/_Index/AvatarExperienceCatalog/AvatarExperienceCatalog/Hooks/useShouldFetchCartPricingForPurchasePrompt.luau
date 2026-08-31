local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local itemRestrictions = require(parent.AvatarExperienceCommon).Enums.ItemRestrictions
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local useHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

local function _(p1)
	local priceInRobux = p1.priceInRobux
	
	return if priceInRobux ~= nil then priceInRobux <= 0 else true
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return if itemRestrictions_1 == nil then false elseif itemRestrictions_1[itemRestrictions.Limited] ~= true then if itemRestrictions_1[itemRestrictions.LimitedUnique] ~= true then itemRestrictions_1[itemRestrictions.Collectible] == true else true else true
end

return function(p1)
	-- upvalues: useHasAtLeastOneCatalogOfferModule (ref), avatarExperienceFlagsModule (ref), itemRestrictions (ref)
	local var1 = useHasAtLeastOneCatalogOfferModule()
	
	if p1 == nil then
		return false
	elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipFreeItems then
		local priceInRobux = p1.priceInRobux
		
		if if priceInRobux ~= nil then priceInRobux <= 0 else true then
			return false
		elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipLimitedCollectibles then
			local itemRestrictions_1 = p1.itemRestrictions
			
			return if if itemRestrictions_1 == nil then false elseif itemRestrictions_1[itemRestrictions.Limited] ~= true then if itemRestrictions_1[itemRestrictions.LimitedUnique] ~= true then itemRestrictions_1[itemRestrictions.Collectible] == true else true else true then false else avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer and not var1
		end
	end
end