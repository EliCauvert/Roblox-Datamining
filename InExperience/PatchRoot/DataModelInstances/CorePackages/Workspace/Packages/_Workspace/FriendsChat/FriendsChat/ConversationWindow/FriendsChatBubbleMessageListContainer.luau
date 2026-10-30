local ReactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local UseFriendsChatBubbleMessageListViewModelModule = require(script.Parent.useFriendsChatBubbleMessageListViewModel)
local FriendsChatBubbleMessageListViewModule = require(script.Parent.FriendsChatBubbleMessageListView)

return function(p1)
	-- upvalues: UseFriendsChatBubbleMessageListViewModelModule (copy), ReactModule (copy), FriendsChatBubbleMessageListViewModule (copy)
	return ReactModule.createElement(FriendsChatBubbleMessageListViewModule, (UseFriendsChatBubbleMessageListViewModelModule(p1)))
end