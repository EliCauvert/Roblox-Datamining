return require(script:FindFirstAncestor("AddFriends").Parent.SocialCommon).Utils.ImpressionCacheImpl({
	appStorageKey = "TCEducationBannerImpressionsCount",
	dismissedValue = -1,
	isKeyAvailableInEngine = game:GetEngineFeature("RegisterTCEducationBannerImpressionsCountKey")
})