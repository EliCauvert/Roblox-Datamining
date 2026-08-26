local parent = script.Parent.Parent
local friendStatuses = require(parent.dependencies).SocialLuaAnalytics.Analytics.Enums.FriendStatuses
local _ = require(parent.Common.LocalTypes)

return function(p1)
	-- upvalues: friendStatuses (ref)
	return if p1.isFriendWithUser then friendStatuses.Friends elseif p1.hasPendingFriendRequest then friendStatuses.RequestSent elseif p1.hasIncomingFriendRequest then friendStatuses.RequestReceived else friendStatuses.NotFriends
end