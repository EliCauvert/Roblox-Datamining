local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local VerticalUserList = require(Parent.UserList).VerticalUserList.VerticalUserList
local FriendsMenuShareGameInviteLink = require(Parent.FriendsMenu).FriendsMenuShareGameInviteLink
local Configs = { disableRowActivation = true }

return function(p1) --[[ Line: 29 | Named "GameInviteFriendsListView" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), FriendsMenuShareGameInviteLink (copy), VerticalUserList (copy), Configs (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col",
		testId = "GameInviteFriendsListView",
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		ShareGameInviteLink = if p1.showShareGameInviteLink then ReactModule.createElement(FriendsMenuShareGameInviteLink, { layoutOrder = 1 }) else nil,
		Rows = ReactModule.createElement(FoundationModule.View, {
			tag = "col fill size-full-0 padding-x-xxlarge",
			testId = "GameInviteFriendsListRows",
			LayoutOrder = 2
		}, {
			List = ReactModule.createElement(VerticalUserList, {
				isScrollEnabled = true,
				entities = p1.entities,
				renderRow = p1.renderRow,
				onRowSelected = p1.onRowSelected,
				configs = Configs
			})
		})
	})
end