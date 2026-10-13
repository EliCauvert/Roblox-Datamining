local parent = script:FindFirstAncestor("GameInvite").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local verticalUserList = require(parent.UserList).VerticalUserList.VerticalUserList
local friendsMenuShareGameInviteLink = require(parent.FriendsMenu).FriendsMenuShareGameInviteLink
local t = { disableRowActivation = true }

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), friendsMenuShareGameInviteLink (ref), verticalUserList (ref), t (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col",
		testId = "GameInviteFriendsListView",
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		ShareGameInviteLink = if p1.showShareGameInviteLink then reactModule.createElement(friendsMenuShareGameInviteLink, { layoutOrder = 1 }) else nil,
		Rows = reactModule.createElement(foundationModule.View, {
			tag = "col fill size-full-0 padding-x-xxlarge",
			testId = "GameInviteFriendsListRows",
			LayoutOrder = 2
		}, {
			List = reactModule.createElement(verticalUserList, {
				isScrollEnabled = true,
				entities = p1.entities,
				renderRow = p1.renderRow,
				onRowSelected = p1.onRowSelected,
				configs = t
			})
		})
	})
end