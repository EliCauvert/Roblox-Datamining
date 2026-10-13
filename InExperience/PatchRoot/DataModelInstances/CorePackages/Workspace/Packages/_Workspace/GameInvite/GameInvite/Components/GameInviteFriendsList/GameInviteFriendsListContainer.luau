local reactModule = require(script:FindFirstAncestor("GameInvite").Parent.React)
local gameInviteFriendsListViewModule = require(script.Parent.GameInviteFriendsListView)
local useGameInviteFriendsListViewModelModule = require(script.Parent.useGameInviteFriendsListViewModel)

return function(p1)
	-- upvalues: useGameInviteFriendsListViewModelModule (ref), reactModule (ref), gameInviteFriendsListViewModule (ref)
	return reactModule.createElement(gameInviteFriendsListViewModule, useGameInviteFriendsListViewModelModule(p1))
end