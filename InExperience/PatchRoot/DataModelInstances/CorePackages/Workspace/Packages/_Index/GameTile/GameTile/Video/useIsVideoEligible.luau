local Parent = script:FindFirstAncestor("GameTile").Parent
local CryoModule = require(Parent.Cryo)
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local IsVideoEligibleForPlayabilityFunction = require(Parent.VideoUtils).isVideoEligibleForPlayability
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local List = if FFlagLuaAppSduiVideoThumbnail then nil else {
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

return function(p1, p2) --[[ Line: 45 | Named "useIsVideoEligible" ]]
	-- upvalues: UseSelectorFunction (copy), FetchGamePlayabilityAndProductInfo (copy), FFlagLuaAppSduiVideoThumbnail (copy), IsVideoEligibleForPlayabilityFunction (copy), RetrievalStatus (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), CryoModule (copy), List (ref)
	local UseSelectorResult = UseSelectorFunction(function(p3) --[[ Line: 46 ]]
		-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p3, p1)
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p3) --[[ Line: 50 ]]
		-- upvalues: p1 (copy)
		return p3.PlayabilityStatus and p3.PlayabilityStatus[p1] or nil
	end)
	
	return if FFlagLuaAppSduiVideoThumbnail then IsVideoEligibleForPlayabilityFunction(UseSelectorResult == RetrievalStatus.Done, UseSelectorResult1, p2) elseif FFlagLuaAppUsePrevalidatedVideoGamePlayability and p2 then true else UseSelectorResult == RetrievalStatus.Done and UseSelectorResult1 ~= nil and (UseSelectorResult1.isPlayable == true or CryoModule.List.find(List, UseSelectorResult1.playabilityStatus) == nil)
end