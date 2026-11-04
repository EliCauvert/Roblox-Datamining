local config = {
	title = "Feature.InExperienceShop.GenericTransactionErrorTitle",
	body = "Feature.InExperienceShop.GenericTransactionErrorBody"
}
local config1 = {
	ActiveFreeTrialExists = {
		title = "Feature.InExperienceShop.Description.ActiveFreeTrialExistsTitle",
		body = "Feature.InExperienceShop.Description.ActiveFreeTrialExistsBody"
	},
	GamePassAlreadyOwned = {
		title = "Feature.InExperienceShop.Description.GamePassAlreadyOwnedTitle",
		body = "Feature.InExperienceShop.Description.GamePassAlreadyOwnedBody"
	},
	FreeTrialAlreadyRedeemed = {
		title = "Feature.InExperienceShop.Description.FreeTrialAlreadyRedeemedTitle",
		body = "Feature.InExperienceShop.Description.FreeTrialAlreadyRedeemedBody"
	},
	GamePassTrialNotEnabled = {
		title = "Feature.InExperienceShop.Description.GamePassTrialNotEnabledTitle",
		body = "Feature.InExperienceShop.Description.GamePassTrialNotEnabledBody"
	},
	GamePassNotPurchasable = {
		title = "Feature.InExperienceShop.Description.GamePassNotPurchasableTitle",
		body = "Feature.InExperienceShop.Description.GamePassNotPurchasableBody"
	},
	GamePassNotInUniverse = {
		title = "Feature.InExperienceShop.Description.GamePassNotInUniverseTitle",
		body = "Feature.InExperienceShop.Description.GamePassNotInUniverseBody"
	}
}

return function(p1)
	-- upvalues: config (copy), config1 (copy)
	return if p1 == nil then config else config1[p1] or config
end