local parent = script:FindFirstAncestor("GameTile").Parent
local cryoModule = require(parent.Cryo)
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local isVideoEligibleForPlayability = require(parent.VideoUtils).isVideoEligibleForPlayability
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagLuaAppAddVideoIneligiblePlayabilityStatus = require(parent.SharedFlags).FFlagLuaAppAddVideoIneligiblePlayabilityStatus
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local var1 = if not fFlagLuaAppSduiVideoThumbnail then {
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
} else nil

return function(p0, p1)
	-- upvalues: useSelector (ref), fetchGamePlayabilityAndProductInfo (ref), fFlagLuaAppSduiVideoThumbnail (ref), isVideoEligibleForPlayability (ref), retrievalStatus (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), cryoModule (ref), var1 (write)
	local var2 = useSelector(function(p2)
		-- upvalues: fetchGamePlayabilityAndProductInfo (copy), p0 (ref)
		return fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p2, p0)
	end)
	local var3 = useSelector(function(p3)
		-- upvalues: p0 (ref)
		return if p3.PlayabilityStatus then p3.PlayabilityStatus[p0] else nil
	end)
	
	return if fFlagLuaAppSduiVideoThumbnail then isVideoEligibleForPlayability(var2 == retrievalStatus.Done, var3, p1) elseif fFlagLuaAppUsePrevalidatedVideoGamePlayability and p1 then true else not (var2 ~= retrievalStatus.Done or var3 == nil) and (var3.isPlayable == true or cryoModule.List.find(var1, var3.playabilityStatus) == nil)
end