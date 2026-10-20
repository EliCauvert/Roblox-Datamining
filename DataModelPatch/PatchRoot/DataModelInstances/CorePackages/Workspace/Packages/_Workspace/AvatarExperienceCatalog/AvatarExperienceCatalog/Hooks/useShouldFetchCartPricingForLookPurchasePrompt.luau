local AvatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceFlags)
local UseHasAtLeastOneCatalogOfferModule = require(script.Parent.useHasAtLeastOneCatalogOffer)

return function()
	-- upvalues: UseHasAtLeastOneCatalogOfferModule (copy), AvatarExperienceFlagsModule (copy)
	local UseHasAtLeastOneCatalogOfferModuleResult = UseHasAtLeastOneCatalogOfferModule()
	
	return not AvatarExperienceFlagsModule.FFlagPurchasePromptCartPricingRequireOffer or UseHasAtLeastOneCatalogOfferModuleResult
end