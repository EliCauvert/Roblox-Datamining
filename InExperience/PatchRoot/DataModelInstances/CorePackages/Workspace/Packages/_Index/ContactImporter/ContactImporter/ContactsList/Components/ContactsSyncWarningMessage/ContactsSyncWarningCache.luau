return require(script:FindFirstAncestor("ContactImporter").Parent.SocialCommon).Utils.ImpressionCacheImpl({
	appStorageKey = "ContactsSyncWarningImpressionsCount",
	dismissedValue = -1,
	isKeyAvailableInEngine = game:GetEngineFeature("RegisterContactsSyncWarningImpressionsCountKey")
})