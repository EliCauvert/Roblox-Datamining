local Parent = script:FindFirstAncestor("GameTile").Parent
local CryoModule = require(Parent.Cryo)
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagLuaAppAddVideoIneligiblePlayabilityStatus = require(Parent.SharedFlags).FFlagLuaAppAddVideoIneligiblePlayabilityStatus
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
	if FFlagLuaAppAddVideoIneligiblePlayabilityStatus then PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval else nil,
	if FFlagLuaAppAddVideoIneligiblePlayabilityStatus then PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired else nil,
	if FFlagLuaAppAddVideoIneligiblePlayabilityStatus then PlayabilityStatusEnum.ContextualPlayabilityCoreGated else nil,
	if FFlagLuaAppAddVideoIneligiblePlayabilityStatus then PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser else nil
}

return function(p1, p2): boolean
	-- upvalues: UseSelectorFunction (copy), FetchGamePlayabilityAndProductInfo (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), RetrievalStatus (copy), CryoModule (copy), list (copy)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p3, p1)
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy)
		return p3.PlayabilityStatus and p3.PlayabilityStatus[p1] or nil
	end)
	
	return if FFlagLuaAppUsePrevalidatedVideoGamePlayability and p2 then true else UseSelectorResult == RetrievalStatus.Done and UseSelectorResult1 ~= nil and (UseSelectorResult1.isPlayable == true or CryoModule.List.find(list, UseSelectorResult1.playabilityStatus) == nil)
end