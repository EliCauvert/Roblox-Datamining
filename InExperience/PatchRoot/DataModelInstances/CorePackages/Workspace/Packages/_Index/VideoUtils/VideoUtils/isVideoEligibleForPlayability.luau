local Parent = script:FindFirstAncestor("VideoUtils").Parent
local CryoModule = require(Parent.Cryo)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local list = {
	PlayabilityStatusEnum.UnderReview,
	PlayabilityStatusEnum.UniverseRootPlaceIsPrivate,
	PlayabilityStatusEnum.InsufficientPermissionFriendsOnly,
	PlayabilityStatusEnum.InsufficientPermissionGroupOnly,
	PlayabilityStatusEnum.GameUnapproved, PlayabilityStatusEnum.AccountRestricted,
	PlayabilityStatusEnum.ComplianceBlocked,
	PlayabilityStatusEnum.ContextualPlayabilityRegionalCompliance,
	PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
	PlayabilityStatusEnum.ContextualPlayabilityAgeGated,
	PlayabilityStatusEnum.ContextualPlayabilityUnrated,
	PlayabilityStatusEnum.ContextualPlayabilityAgeGatedByDescriptor,
	PlayabilityStatusEnum.ContextualPlayabilityExperienceBlockedParentalControls,
	PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval,
	PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired,
	PlayabilityStatusEnum.ContextualPlayabilityCoreGated,
	PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser
}

return function(p1, p2, p3): boolean
	-- upvalues: FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), CryoModule (copy), list (copy)
	return if FFlagLuaAppUsePrevalidatedVideoGamePlayability and p3 then true elseif p1 and p2 ~= nil then p2.isPlayable == true or CryoModule.List.find(list, p2.playabilityStatus) == nil else false
end