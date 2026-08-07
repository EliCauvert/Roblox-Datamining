return require(script:FindFirstAncestor("ProfilePlatform").Parent.SocialCommon).Utils.ImpressionCacheImpl({
	appStorageKey = "ProfileInspectAndBuyImpressionCount",
	dismissedValue = -1,
	isKeyAvailableInEngine = game:GetEngineFeature("ProfileInspectAndBuyImpressionCountStorageKey")
})