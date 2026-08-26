local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local checkbox = require(parent.Foundation).Checkbox
local _ = require(friendsMenu.friendsMenuModalType)
local selectedUsersContextModule = require(context.SelectedUsersContext)

return function(p1)
	-- upvalues: reactModule (ref), selectedUsersContextModule (ref), checkbox (ref)
	local var1 = reactModule.useContext(selectedUsersContextModule)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		LayoutOrder = p1.layoutOrder
	}, {
		CheckboxAlignment = reactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
		Button = reactModule.createElement(checkbox, {
			label = "",
			onActivated = reactModule.useCallback(function()
				-- upvalues: var1 (ref), p1 (ref)
				if var1.isFriendSelected(p1.friend.id) then
					var1.removeFriend(p1.friend.id)
					
					return
				end
				var1.addFriend(p1.friend.id, p1.friend.displayName)
			end, {
				var1.isFriendSelected(p1.friend.id),
				var1.removeFriend,
				var1.addFriend,
				p1.friend.id
			}),
			isChecked = var1.isFriendSelected(p1.friend.id),
			isDisabled = p1.isDisabled,
			Selectable = p1.selectable
		})
	})
end