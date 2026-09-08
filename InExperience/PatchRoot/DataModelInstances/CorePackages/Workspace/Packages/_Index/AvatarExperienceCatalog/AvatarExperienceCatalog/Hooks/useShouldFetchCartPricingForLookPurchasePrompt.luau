local avatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceFlags)
local useHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

return function()
	-- upvalues: useHasAtLeastOneCatalogOfferModule (ref), avatarExperienceFlagsModule (ref)
	return avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer and not useHasAtLeastOneCatalogOfferModule()
end