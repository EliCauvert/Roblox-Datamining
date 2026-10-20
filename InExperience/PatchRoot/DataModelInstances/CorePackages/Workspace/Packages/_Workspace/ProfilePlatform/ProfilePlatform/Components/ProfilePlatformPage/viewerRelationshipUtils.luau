local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Types)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FriendStatusModule = require(ProfilePlatform.Analytics.FriendStatus)
local config = {
	Friends = FriendStatusModule.Friends,
	Self = FriendStatusModule.Self,
	RequestSent = FriendStatusModule.RequestSent,
	RequestReceived = FriendStatusModule.RequestReceived,
	None = FriendStatusModule.NotFriends,
	Invalid = FriendStatusModule.Unknown,
	Ineligible = FriendStatusModule.Ineligible,
	_ = FriendStatusModule.Unknown
}

local function _(p1)
	return p1 and p1.trustedFriendStatus or nil
end

local _ = function(p1)
	-- upvalues: config (copy)
	return config[p1]
end

return {
	getViewerRelationshipFromProfileResponse = function(p1)
		-- upvalues: GetDeepValueModule (copy), EnumsModule (copy)
		return GetDeepValueModule(p1, `responseBody.components.{EnumsModule.Components.UserProfileHeader}.viewerRelationship`)
	end,
	getContextualInformationFromProfileResponse = function(p1)
		-- upvalues: GetDeepValueModule (copy), EnumsModule (copy)
		return GetDeepValueModule(p1, `responseBody.components.{EnumsModule.Components.UserProfileHeader}.contextualInformation`)
	end,
	mapViewerRelationshipAndContextToAnalyticsFriendStatus = function(p1, p2)
		-- upvalues: EnumsModule (copy), FriendStatusModule (copy), config (copy)
		local FriendshipStatus = p1 and p1.friendshipStatus or "Invalid"
		
		return if p2 and p2.context == EnumsModule.ContextualTypes.AccountDeleted and FriendshipStatus == "Friends" then FriendStatusModule.Ineligible else config[FriendshipStatus]
	end,
	isViewerTrustedFriendsFromViewerRelationship = function(p1): boolean
		return (p1 and p1.trustedFriendStatus or nil) == "TrustedFriends"
	end
}