local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ItemRestrictions = require(Parent.AvatarExperienceCommon).Enums.ItemRestrictions
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local UseHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

local function _(p1): boolean --[[ Line: 54 | Named "isFree" ]]
	local PriceInRobux: number = p1.priceInRobux
	
	return PriceInRobux == nil or PriceInRobux <= 0
end

local _ = function(p1): boolean --[[ Line: 59 | Named "isLimitedCollectible" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	
	return ItemRestrictions1 ~= nil and (ItemRestrictions1[ItemRestrictions.Limited] == true or (ItemRestrictions1[ItemRestrictions.LimitedUnique] == true or ItemRestrictions1[ItemRestrictions.Collectible] == true))
end

return function(p1) --[[ Line: 69 | Named "useShouldFetchCartPricingForPurchasePrompt" ]]
	-- upvalues: UseHasAtLeastOneCatalogOfferModule (copy), UseNavigationFunction (copy), AvatarExperienceFlagsModule (copy), ItemRestrictions (copy), AvatarScreen (copy)
	local UseHasAtLeastOneCatalogOfferModuleResult = UseHasAtLeastOneCatalogOfferModule()
	local UseNavigationResult = UseNavigationFunction()
	
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
	return if UseNavigationResult and UseNavigationResult.state and (UseNavigationResult.state.routeName == AvatarScreen.TryOnItem or UseNavigationResult.state.params and UseNavigationResult.state.params.fromProfile) then true else not AvatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer or UseHasAtLeastOneCatalogOfferModuleResult
end