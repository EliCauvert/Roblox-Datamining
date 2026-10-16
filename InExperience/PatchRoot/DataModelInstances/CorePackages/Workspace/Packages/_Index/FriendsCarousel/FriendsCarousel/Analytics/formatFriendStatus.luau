local Parent = script.Parent.Parent
local FriendStatuses = require(Parent.dependencies).SocialLuaAnalytics.Analytics.Enums.FriendStatuses
local _ = require(Parent.Common.LocalTypes)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: FriendStatuses (copy)
	return if p1.isFriendWithUser then FriendStatuses.Friends elseif p1.hasPendingFriendRequest then FriendStatuses.RequestSent elseif p1.hasIncomingFriendRequest then FriendStatuses.RequestReceived else FriendStatuses.NotFriends
end