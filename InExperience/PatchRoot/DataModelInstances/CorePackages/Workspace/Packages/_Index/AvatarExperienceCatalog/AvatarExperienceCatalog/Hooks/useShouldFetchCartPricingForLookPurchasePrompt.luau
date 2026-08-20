local avatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceFlags)
local useHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

return function() --[[ line: 22 | named "useShouldFetchCartPricingForLookPurchasePrompt" ]]
	-- upvalues: useHasAtLeastOneCatalogOfferModule (ref), avatarExperienceFlagsModule (ref)
	return avatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer and not useHasAtLeastOneCatalogOfferModule()
end