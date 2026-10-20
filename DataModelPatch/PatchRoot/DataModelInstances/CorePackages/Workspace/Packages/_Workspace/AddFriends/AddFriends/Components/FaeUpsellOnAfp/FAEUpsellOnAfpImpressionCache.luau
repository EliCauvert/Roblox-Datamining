return require(script:FindFirstAncestor("AddFriends").Parent.SocialCommon).Utils.ImpressionCacheImpl({
	appStorageKey = "FAEUpsellOnAfpImpressionsCount",
	dismissedValue = -1,
	isKeyAvailableInEngine = game:GetEngineFeature("RegisterFAEUpsellOnAfpImpressionsCountKey")
})