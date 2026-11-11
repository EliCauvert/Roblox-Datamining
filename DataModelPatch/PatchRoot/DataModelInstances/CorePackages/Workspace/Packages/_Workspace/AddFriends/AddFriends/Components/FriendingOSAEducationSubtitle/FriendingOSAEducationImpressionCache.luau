return require(script:FindFirstAncestor("AddFriends").Parent.SocialCommon).Utils.ImpressionCacheImpl({
	appStorageKey = "FriendingOSAEducationImpressionsCount",
	dismissedValue = -1,
	isKeyAvailableInEngine = game:GetEngineFeature("RegisterFriendingOSAEducationImpressionsCountKey")
})