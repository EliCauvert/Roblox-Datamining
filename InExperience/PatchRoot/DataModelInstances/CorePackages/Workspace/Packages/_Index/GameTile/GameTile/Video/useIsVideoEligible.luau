local parent = script:FindFirstAncestor("GameTile").Parent
local cryoModule = require(parent.Cryo)
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
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

return function(p0, p1) --[[ line: 49 | named "useIsVideoEligible" ]]
	-- upvalues: useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), retrievalStatus (ref), cryoModule (ref), list (ref)
	local var2 = useSelector(function(p2) --[[ line: 54 ]]
		-- upvalues: p0 (ref)
		return if p2.PlayabilityStatus then p2.PlayabilityStatus[p0] else nil
	end)
	
	return if fFlagLuaAppUsePrevalidatedVideoGamePlayability and p1 then true else not (useSelector(function(p3) --[[ line: 50 ]]
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p0 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p3, p0)
	end) ~= retrievalStatus.Done or var2 == nil) and (var2.isPlayable == true or cryoModule.List.find(list, var2.playabilityStatus) == nil)
end