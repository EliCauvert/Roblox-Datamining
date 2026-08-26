local recommendationContextType = require(script:FindFirstAncestor("SocialLibraries").dependencies).RoduxFriends.Enums.RecommendationContextType
local _ = {
	SingularMutualFriend = "Feature.Friends.Label.SingularMutualFriend",
	MutualFriends = "Feature.Friends.Label.MutualFriends",
	PlayedTogether = "Feature.Friends.Label.Frequent"
}

local _ = function(p1)
	return if p1.mutualFriendsCount then p1.mutualFriendsCount elseif p1.mutualFriendsList then #p1.mutualFriendsList else 0
end

return function(p1)
	-- upvalues: recommendationContextType (ref)
	local t = nil
	local var1 = nil
	local var2 = nil
	local var3 = p1.contextType and p1.contextType.rawValue() or nil
	local var4 = if p1.mutualFriendsCount then p1.mutualFriendsCount elseif p1.mutualFriendsList then #p1.mutualFriendsList else 0
	
	if var3 == recommendationContextType.MutualFriends.rawValue() and var4 > 0 then
		var2 = function(p2)
			-- upvalues: var4 (ref)
			return if p2 then tostring(var4) .. " " .. string.lower(p2) else nil
		end
		
		var1 = if var4 == 1 then "Feature.Friends.Label.SingularMutualFriend" else "Feature.Friends.Label.MutualFriends"
		t = { path = "icons/status/player/friend" }
	elseif var3 == recommendationContextType.Frequents.rawValue() then
		var1 = "Feature.Friends.Label.Frequent"
	end
	return {
		icon = t,
		label = { text = nil, formatter = var2, textKey = var1 }
	}
end