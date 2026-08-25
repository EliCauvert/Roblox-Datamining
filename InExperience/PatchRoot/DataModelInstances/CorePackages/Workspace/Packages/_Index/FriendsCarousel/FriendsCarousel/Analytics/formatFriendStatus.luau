local parent = script.Parent.Parent
local friendStatuses = require(parent.dependencies).SocialLuaAnalytics.Analytics.Enums.FriendStatuses
local _ = require(parent.Common.LocalTypes)

return function(p0)
	-- upvalues: friendStatuses (ref)
	return if p0.isFriendWithUser then friendStatuses.Friends elseif p0.hasPendingFriendRequest then friendStatuses.RequestSent elseif p0.hasIncomingFriendRequest then friendStatuses.RequestReceived else friendStatuses.NotFriends
end