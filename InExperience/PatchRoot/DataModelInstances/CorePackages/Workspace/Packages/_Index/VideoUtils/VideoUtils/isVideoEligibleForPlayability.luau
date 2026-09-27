local parent = script:FindFirstAncestor("VideoUtils").Parent
local cryoModule = require(parent.Cryo)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local list = {
	playabilityStatusEnum.UnderReview,
	playabilityStatusEnum.UniverseRootPlaceIsPrivate,
	playabilityStatusEnum.InsufficientPermissionFriendsOnly,
	playabilityStatusEnum.InsufficientPermissionGroupOnly,
	playabilityStatusEnum.GameUnapproved, playabilityStatusEnum.AccountRestricted,
	playabilityStatusEnum.ComplianceBlocked,
	playabilityStatusEnum.ContextualPlayabilityRegionalCompliance,
	playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
	playabilityStatusEnum.ContextualPlayabilityAgeGated,
	playabilityStatusEnum.ContextualPlayabilityUnrated,
	playabilityStatusEnum.ContextualPlayabilityAgeGatedByDescriptor,
	playabilityStatusEnum.ContextualPlayabilityExperienceBlockedParentalControls,
	playabilityStatusEnum.ContextualPlayabilityRequireParentApproval,
	playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired,
	playabilityStatusEnum.ContextualPlayabilityCoreGated,
	playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser
}

return function(p1, p2, p3)
	-- upvalues: fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), cryoModule (ref), list (ref)
	return if fFlagLuaAppUsePrevalidatedVideoGamePlayability and p3 then true else not (not p1 or p2 == nil) and (p2.isPlayable == true or cryoModule.List.find(list, p2.playabilityStatus) == nil)
end