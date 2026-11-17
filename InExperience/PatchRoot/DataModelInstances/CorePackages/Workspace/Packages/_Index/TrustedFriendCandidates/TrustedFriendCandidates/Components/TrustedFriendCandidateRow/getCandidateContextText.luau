local Parent = script:FindFirstAncestor("TrustedFriendCandidates").Parent
local ProfileInsightsModule = require(Parent.ProfileInsights)
local SocialCommonModule = require(Parent.SocialCommon)
local GetMutualFriendsTextFunction = SocialCommonModule.Utils.getMutualFriendsText
local GetFriendRequestOriginTextFunction = ProfileInsightsModule.Formatters.getFriendRequestOriginText
local ContextualInfoTypes = SocialCommonModule.Enums.ContextualInfoTypes

return function(p1, Localized)
	-- upvalues: GetMutualFriendsTextFunction (copy), ContextualInfoTypes (copy), GetFriendRequestOriginTextFunction (copy)
	local RankedInsightKeys = if p1 then p1.rankedInsightKeys else nil
	local RankedInsightKey = if RankedInsightKeys then RankedInsightKeys[1] else nil
	
	if p1 == nil or RankedInsightKey == nil then
		return nil, nil
	end
	if RankedInsightKey == "mutualFriends" then
		local CountMutualFriends = #p1.mutualFriends
		
		if CountMutualFriends > 0 then
			return GetMutualFriendsTextFunction({
				mutualFriendsCount = CountMutualFriends,
				localized = Localized
			}), ContextualInfoTypes.MutualFriends
		end
	elseif RankedInsightKey == "friendRequestOriginSource" then
		local FriendRequestOriginText = GetFriendRequestOriginTextFunction(p1.friendRequestOriginSource, Localized)
		
		if FriendRequestOriginText then
			return FriendRequestOriginText, ContextualInfoTypes.FriendRequestOrigin
		end
	end
	return nil, nil
end