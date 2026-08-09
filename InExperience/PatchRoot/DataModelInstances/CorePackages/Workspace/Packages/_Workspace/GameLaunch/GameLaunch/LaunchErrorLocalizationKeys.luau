local parent = script:FindFirstAncestor("GameLaunch").Parent
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local t = {}
local t_1 = {
	[retrievalStatus.Failed] = "Feature.GamePage.QuickLaunch.LaunchError.RequestFailed",
	[playabilityStatusEnum.GuestProhibited] = "Feature.GamePage.QuickLaunch.LaunchError.GuestProhibited",
	[playabilityStatusEnum.GameUnapproved] = "Feature.ExperienceDetails.UnplayableError.GameUnapproved",
	[playabilityStatusEnum.UniverseRootPlaceIsPrivate] = "Feature.ExperienceDetails.UnplayableError.UniverseRootPlaceIsPrivate",
	[playabilityStatusEnum.InsufficientPermissionFriendsOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionFriendsOnly",
	[playabilityStatusEnum.InsufficientPermissionGroupOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionGroupOnly",
	[playabilityStatusEnum.DeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedDefault",
	[playabilityStatusEnum.UnderReview] = "Feature.ExperienceDetails.UnplayableError.UnderReview",
	[playabilityStatusEnum.PurchaseRequired] = "Feature.GamePage.QuickLaunch.LaunchError.PurchaseRequired",
	[playabilityStatusEnum.AccountRestricted] = "Feature.ExperienceDetails.UnplayableError.AccountRestricted",
	[playabilityStatusEnum.TemporarilyUnavailable] = "Feature.ExperienceDetails.UnplayableError.TemporarilyUnavailable",
	[playabilityStatusEnum.ComplianceBlocked] = "Feature.ExperienceDetails.UnplayableError.ComplianceBlocked",
	[playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls",
	[playabilityStatusEnum.ContextualPlayabilityRegionalAvailability] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalAvailability",
	[playabilityStatusEnum.ContextualPlayabilityRegionalCompliance] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalCompliance",
	[playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityUnverifiedSeventeenPlusUser",
	[playabilityStatusEnum.PlaceHasNoPublishedVersion] = "Feature.ExperienceDetails.UnplayableError.PlaceHasNoPublishedVersion",
	[playabilityStatusEnum.IncorrectConfiguration] = "Feature.ExperienceDetails.UnplayableError.IncorrectConfiguration",
	[playabilityStatusEnum.ContextualPlayabilityAgeGated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGated",
	[playabilityStatusEnum.ContextualPlayabilityUnrated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityUnrated",
	[playabilityStatusEnum.ContextualPlayabilityAgeGatedByDescriptor] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGatedByDescriptor",
	[playabilityStatusEnum.FiatPurchaseDeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedDefault",
	[playabilityStatusEnum.ContextualPlayabilityExperienceBlockedParentalControls] = if require(parent.SharedFlags).FFlagLuaAppBlockedUnplayableError then "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls" else nil,
	Default = "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
}
setmetatable(t, {
	__newindex = function(_, _, _) --[[ line: 42 ]] end,
	__index = function(_, p0) --[[ line: 43 ]]
		-- upvalues: t_1 (ref)
		assert(p0 ~= nil, "LaunchErrorLocalizationKeys needs a key")
		
		return t_1[p0] or t_1.Default
	end
})

return t