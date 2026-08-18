local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local itemRestrictions = require(parent.AvatarExperienceCommon).Enums.ItemRestrictions
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local useHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

local function _(p0) --[[ line: 52 | named "isFree" ]]
	local priceInRobux = p0.priceInRobux
	
	return if priceInRobux ~= nil then priceInRobux <= 0 else true
end

local _ = function(p1) --[[ line: 57 | named "isLimitedCollectible" ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return if itemRestrictions_1 == nil then false elseif itemRestrictions_1[itemRestrictions.Limited] ~= true then if itemRestrictions_1[itemRestrictions.LimitedUnique] ~= true then itemRestrictions_1[itemRestrictions.Collectible] == true else true else true
end

return function(p2) --[[ line: 67 | named "useShouldFetchCartPricingForPurchasePrompt" ]]
	-- upvalues: useHasAtLeastOneCatalogOfferModule (ref), avatarExperienceFlagsModule (ref), itemRestrictions (ref)
	local var2 = useHasAtLeastOneCatalogOfferModule()
	
	if p2 == nil then
		return false
	elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipFreeItems then
		local priceInRobux = p2.priceInRobux
		
		if if priceInRobux ~= nil then priceInRobux <= 0 else true then
			return false
		elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipLimitedCollectibles then
			local itemRestrictions_1 = p2.itemRestrictions
			
			return if if itemRestrictions_1 == nil then false elseif itemRestrictions_1[itemRestrictions.Limited] ~= true then if itemRestrictions_1[itemRestrictions.LimitedUnique] ~= true then itemRestrictions_1[itemRestrictions.Collectible] == true else true else true then false else avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer and not var2
		end
	end
end