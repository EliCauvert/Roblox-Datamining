local parent = script:FindFirstAncestor("GamePlayButton").Parent
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local t = {
	AgeVerification = "AgeVerification",
	UpdatePlaytestSettings = "UpdatePlaytestSettings",
	TrustedFriends = "TrustedFriends"
}

return {
	Type = t,
	getType = function(p1)
		-- upvalues: playabilityStatusEnum (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), t (ref)
		return if p1 == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or fFlagLuaAppPlayButtonAmpAgeCheckFlow and p1 == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then t.AgeVerification elseif p1 == playabilityStatusEnum.ContextualPlayabilityPlaytestDisabled or p1 == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval then t.UpdatePlaytestSettings elseif p1 == playabilityStatusEnum.ContextualPlayabilityTrustedFriendRequired then t.TrustedFriends else nil
	end
}