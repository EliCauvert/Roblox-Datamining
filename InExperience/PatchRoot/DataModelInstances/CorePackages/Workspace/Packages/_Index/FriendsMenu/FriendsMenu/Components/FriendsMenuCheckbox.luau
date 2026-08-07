local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local checkbox = require(parent.Foundation).Checkbox
local _ = require(friendsMenu.friendsMenuModalType)
local selectedUsersContextModule = require(context.SelectedUsersContext)

return function(p0) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), selectedUsersContextModule (ref), checkbox (ref)
	local var3 = reactModule.useContext(selectedUsersContextModule)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		LayoutOrder = p0.layoutOrder
	}, {
		CheckboxAlignment = reactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
		Button = reactModule.createElement(checkbox, {
			label = "",
			onActivated = reactModule.useCallback(function() --[[ line: 27 ]]
				-- upvalues: var3 (ref), p0 (ref)
				if var3.isFriendSelected(p0.friend.id) then
					var3.removeFriend(p0.friend.id)
					
					return
				end
				var3.addFriend(p0.friend.id, p0.friend.displayName)
			end, {
				var3.isFriendSelected(p0.friend.id),
				var3.removeFriend,
				var3.addFriend,
				p0.friend.id
			}),
			isChecked = var3.isFriendSelected(p0.friend.id),
			isDisabled = p0.isDisabled,
			Selectable = p0.selectable
		})
	})
end