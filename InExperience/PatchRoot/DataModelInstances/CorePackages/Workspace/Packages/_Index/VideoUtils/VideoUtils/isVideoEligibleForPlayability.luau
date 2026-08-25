local parent = script:FindFirstAncestor("VideoUtils").Parent
local cryoModule = require(parent.Cryo)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fFlagLuaAppAddVideoIneligiblePlayabilityStatus = require(parent.SharedFlags).FFlagLuaAppAddVideoIneligiblePlayabilityStatus
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
	if fFlagLuaAppAddVideoIneligiblePlayabilityStatus then playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else nil,
	if fFlagLuaAppAddVideoIneligiblePlayabilityStatus then playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired else nil,
	if fFlagLuaAppAddVideoIneligiblePlayabilityStatus then playabilityStatusEnum.ContextualPlayabilityCoreGated else nil,
	if fFlagLuaAppAddVideoIneligiblePlayabilityStatus then playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser else nil
}

return function(p0, p1, p2)
	-- upvalues: fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), cryoModule (ref), list (ref)
	return if fFlagLuaAppUsePrevalidatedVideoGamePlayability and p2 then true else not (not p0 or p1 == nil) and (p1.isPlayable == true or cryoModule.List.find(list, p1.playabilityStatus) == nil)
end