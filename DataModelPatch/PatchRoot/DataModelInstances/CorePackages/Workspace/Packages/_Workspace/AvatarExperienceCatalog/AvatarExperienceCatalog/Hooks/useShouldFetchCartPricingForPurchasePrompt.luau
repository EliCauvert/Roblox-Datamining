local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ItemRestrictions = require(Parent.AvatarExperienceCommon).Enums.ItemRestrictions
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local UseHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

local function _(p1): boolean
	local PriceInRobux: number = p1.priceInRobux
	
	return PriceInRobux == nil or PriceInRobux <= 0
end

local _ = function(p1): boolean
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	
	return ItemRestrictions1 ~= nil and (ItemRestrictions1[ItemRestrictions.Limited] == true or (ItemRestrictions1[ItemRestrictions.LimitedUnique] == true or ItemRestrictions1[ItemRestrictions.Collectible] == true))
end

return function(p1)
	-- upvalues: UseHasAtLeastOneCatalogOfferModule (copy), AvatarExperienceFlagsModule (copy), ItemRestrictions (copy)
	local UseHasAtLeastOneCatalogOfferModuleResult = UseHasAtLeastOneCatalogOfferModule()
	
	if p1 == nil then
		return false
	end
	if AvatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipFreeItems then
		local PriceInRobux: number = p1.priceInRobux
		
		if PriceInRobux == nil or PriceInRobux <= 0 then
			return false
		end
	end
	if AvatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipLimitedCollectibles then
		local ItemRestrictions1 = p1.itemRestrictions
		
		if ItemRestrictions1 ~= nil and (ItemRestrictions1[ItemRestrictions.Limited] == true or (ItemRestrictions1[ItemRestrictions.LimitedUnique] == true or ItemRestrictions1[ItemRestrictions.Collectible] == true)) then
			return false
		end
	end
	return not AvatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer or UseHasAtLeastOneCatalogOfferModuleResult
end