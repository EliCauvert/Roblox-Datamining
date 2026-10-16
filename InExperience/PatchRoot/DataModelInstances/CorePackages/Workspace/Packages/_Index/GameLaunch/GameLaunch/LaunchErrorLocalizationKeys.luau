local Parent = script:FindFirstAncestor("GameLaunch").Parent
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local LaunchErrorLocalizationKeysModule = {}
local config = {
	[require(Parent.Http).Enum.RetrievalStatus.Failed] = "Feature.GamePage.QuickLaunch.LaunchError.RequestFailed",
	[PlayabilityStatusEnum.GuestProhibited] = "Feature.GamePage.QuickLaunch.LaunchError.GuestProhibited",
	[PlayabilityStatusEnum.GameUnapproved] = "Feature.ExperienceDetails.UnplayableError.GameUnapproved",
	[PlayabilityStatusEnum.UniverseRootPlaceIsPrivate] = "Feature.ExperienceDetails.UnplayableError.UniverseRootPlaceIsPrivate",
	[PlayabilityStatusEnum.InsufficientPermissionFriendsOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionFriendsOnly",
	[PlayabilityStatusEnum.InsufficientPermissionGroupOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionGroupOnly",
	[PlayabilityStatusEnum.DeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedDefault",
	[PlayabilityStatusEnum.UnderReview] = "Feature.ExperienceDetails.UnplayableError.UnderReview",
	[PlayabilityStatusEnum.PurchaseRequired] = "Feature.GamePage.QuickLaunch.LaunchError.PurchaseRequired",
	[PlayabilityStatusEnum.AccountRestricted] = "Feature.ExperienceDetails.UnplayableError.AccountRestricted",
	[PlayabilityStatusEnum.TemporarilyUnavailable] = "Feature.ExperienceDetails.UnplayableError.TemporarilyUnavailable",
	[PlayabilityStatusEnum.ComplianceBlocked] = "Feature.ExperienceDetails.UnplayableError.ComplianceBlocked",
	[PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls",
	[PlayabilityStatusEnum.ContextualPlayabilityRegionalAvailability] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalAvailability",
	[PlayabilityStatusEnum.ContextualPlayabilityRegionalCompliance] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalCompliance",
	[PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityUnverifiedSeventeenPlusUser",
	[PlayabilityStatusEnum.PlaceHasNoPublishedVersion] = "Feature.ExperienceDetails.UnplayableError.PlaceHasNoPublishedVersion",
	[PlayabilityStatusEnum.IncorrectConfiguration] = "Feature.ExperienceDetails.UnplayableError.IncorrectConfiguration",
	[PlayabilityStatusEnum.ContextualPlayabilityAgeGated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGated",
	[PlayabilityStatusEnum.ContextualPlayabilityUnrated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityUnrated",
	[PlayabilityStatusEnum.ContextualPlayabilityAgeGatedByDescriptor] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGatedByDescriptor",
	[PlayabilityStatusEnum.FiatPurchaseDeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.FiatPurchaseDeviceRestricted",
	[PlayabilityStatusEnum.ContextualPlayabilityExperienceBlockedParentalControls] = if require(Parent.SharedFlags).FFlagLuaAppBlockedUnplayableError then "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls" else nil,
	Default = "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
}
setmetatable(LaunchErrorLocalizationKeysModule, {
	__newindex = function(_, _, _) --[[ Line: 42 ]] end,
	__index = function(_, p1) --[[ Line: 43 ]]
		-- upvalues: config (copy)
		assert(p1 ~= nil, "LaunchErrorLocalizationKeys needs a key")
		
		return config[p1] or config.Default
	end
})

return LaunchErrorLocalizationKeysModule