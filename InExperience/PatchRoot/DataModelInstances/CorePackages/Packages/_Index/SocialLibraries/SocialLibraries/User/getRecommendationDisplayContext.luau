local RecommendationContextType = require(script:FindFirstAncestor("SocialLibraries").dependencies).RoduxFriends.Enums.RecommendationContextType

local function _(p1)
	return if p1.mutualFriendsCount then p1.mutualFriendsCount else p1.mutualFriendsList and #p1.mutualFriendsList or 0
end

return function(p1)
	-- upvalues: RecommendationContextType (copy)
	local Icon = nil
	local FeatureFriendsLabelSingularMutualFriend: string? = nil
	local Formatter: ((string) -> any)? = nil
	local RawValueResult = p1.contextType and p1.contextType.rawValue() or nil
	local MutualFriendsCount = if p1.mutualFriendsCount then p1.mutualFriendsCount else p1.mutualFriendsList and #p1.mutualFriendsList or 0
	
	if RawValueResult == RecommendationContextType.MutualFriends.rawValue() and MutualFriendsCount > 0 then
		Formatter = function(Text: string)
			-- upvalues: MutualFriendsCount (copy)
			return if Text then tostring(MutualFriendsCount) .. " " .. string.lower(Text) else nil
		end
		
		FeatureFriendsLabelSingularMutualFriend = if MutualFriendsCount == 1 then "Feature.Friends.Label.SingularMutualFriend" else "Feature.Friends.Label.MutualFriends"
		Icon = { path = "icons/status/player/friend" }
	elseif RawValueResult == RecommendationContextType.Frequents.rawValue() then
		FeatureFriendsLabelSingularMutualFriend = "Feature.Friends.Label.Frequent"
	end
	return {
		icon = Icon,
		label = {
			text = nil,
			formatter = Formatter,
			textKey = FeatureFriendsLabelSingularMutualFriend
		}
	}
end