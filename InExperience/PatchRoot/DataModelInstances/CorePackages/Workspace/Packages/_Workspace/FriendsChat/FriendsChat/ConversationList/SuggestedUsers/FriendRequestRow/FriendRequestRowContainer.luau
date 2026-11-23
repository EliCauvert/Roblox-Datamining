local Parent = script:FindFirstAncestor("FriendsChat").Parent
local FriendRequestsModule = require(Parent.FriendRequests)
local ReactModule = require(Parent.React)
local UseFriendRequestRowViewModelModule = require(script.Parent.useFriendRequestRowViewModel)

return function(p1)
	-- upvalues: UseFriendRequestRowViewModelModule (copy), ReactModule (copy), FriendRequestsModule (copy)
	return ReactModule.createElement(FriendRequestsModule.FriendRequestRow, (UseFriendRequestRowViewModelModule(p1)))
end