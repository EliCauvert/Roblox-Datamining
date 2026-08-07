local sharedFlagsModule = require(script:FindFirstAncestor("AvatarExperienceFlags").Parent.SharedFlags)

return game:DefineFastFlag("PurchasePromptCartPricingSkipFreeItems2", false) and (sharedFlagsModule.FFlagMarketplaceOffersRoot and sharedFlagsModule.FFlagMarketplaceOffersOptOutRoot)