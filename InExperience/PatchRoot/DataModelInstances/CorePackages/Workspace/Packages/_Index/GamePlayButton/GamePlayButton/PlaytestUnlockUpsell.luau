local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local Type = {
	AgeVerification = "AgeVerification",
	UpdatePlaytestSettings = "UpdatePlaytestSettings",
	TrustedFriends = "TrustedFriends"
}

return {
	Type = Type,
	getType = function(ContextualPlayabilityAgeCheckRequired)
		-- upvalues: PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), Type (copy)
		return if ContextualPlayabilityAgeCheckRequired == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or FFlagLuaAppPlayButtonAmpAgeCheckFlow and ContextualPlayabilityAgeCheckRequired == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then Type.AgeVerification elseif ContextualPlayabilityAgeCheckRequired == PlayabilityStatusEnum.ContextualPlayabilityPlaytestDisabled or ContextualPlayabilityAgeCheckRequired == PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval then Type.UpdatePlaytestSettings elseif ContextualPlayabilityAgeCheckRequired == PlayabilityStatusEnum.ContextualPlayabilityTrustedFriendRequired then Type.TrustedFriends else nil
	end
}