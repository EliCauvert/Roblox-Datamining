local sharedFlagsModule = require(script:FindFirstAncestor("AvatarExperienceFlags").Parent.SharedFlags)

return game:DefineFastFlag("PurchasePromptCartPricingRequireOffer2", false) and (sharedFlagsModule.FFlagMarketplaceOffersRoot and sharedFlagsModule.FFlagMarketplaceOffersOptOutRoot)