local ReactModule = require(script:FindFirstAncestor("GameInvite").Parent.React)
local GameInviteFriendsListViewModule = require(script.Parent.GameInviteFriendsListView)
local UseGameInviteFriendsListViewModelModule = require(script.Parent.useGameInviteFriendsListViewModel)

return function(p1)
	-- upvalues: UseGameInviteFriendsListViewModelModule (copy), ReactModule (copy), GameInviteFriendsListViewModule (copy)
	return ReactModule.createElement(GameInviteFriendsListViewModule, (UseGameInviteFriendsListViewModelModule(p1)))
end