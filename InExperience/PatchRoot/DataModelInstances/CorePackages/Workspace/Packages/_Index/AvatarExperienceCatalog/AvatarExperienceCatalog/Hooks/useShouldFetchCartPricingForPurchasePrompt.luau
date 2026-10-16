local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local itemRestrictions = avatarExperienceCommonModule.Enums.ItemRestrictions
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local useHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)
local AXEnableOffersOnHomeProfileItems = game:DefineFastFlag("AXEnableOffersOnHomeProfileItems", false)

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
	-- upvalues: useHasAtLeastOneCatalogOfferModule (ref), AXEnableOffersOnHomeProfileItems (ref), useNavigation (ref), avatarExperienceFlagsModule (ref), itemRestrictions (ref), avatarScreen (ref)
	local var1 = useHasAtLeastOneCatalogOfferModule()
	local var2 = if AXEnableOffersOnHomeProfileItems then useNavigation() else nil
	
	if p1 == nil then
		return false
	elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipFreeItems then
		local priceInRobux = p1.priceInRobux
		
		if if priceInRobux ~= nil then priceInRobux <= 0 else true then
			return false
		elseif avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingSkipLimitedCollectibles then
			local itemRestrictions_1 = p1.itemRestrictions
			
			return if if itemRestrictions_1 == nil then false elseif itemRestrictions_1[itemRestrictions.Limited] ~= true then if itemRestrictions_1[itemRestrictions.LimitedUnique] ~= true then itemRestrictions_1[itemRestrictions.Collectible] == true else true else true then false elseif AXEnableOffersOnHomeProfileItems and var2 and var2.state and (var2.state.routeName == avatarScreen.TryOnItem or var2.state.params and var2.state.params.fromProfile) then true else avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer and not var1
		end
	end
end