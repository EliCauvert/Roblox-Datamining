local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local Checkbox = require(Parent.Foundation).Checkbox
local _ = require(FriendsMenu.friendsMenuModalType)
local SelectedUsersContextModule = require(FriendsMenu.Context.SelectedUsersContext)

return function(p1)
	-- upvalues: ReactModule (copy), SelectedUsersContextModule (copy), Checkbox (copy)
	local UseContextResult = ReactModule.useContext(SelectedUsersContextModule)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		LayoutOrder = p1.layoutOrder
	}, {
		CheckboxAlignment = ReactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
		Button = ReactModule.createElement(Checkbox, {
			label = "",
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseContextResult (copy), p1 (copy)
				if UseContextResult.isFriendSelected(p1.friend.id) then
					UseContextResult.removeFriend(p1.friend.id)
					
					return
				else
					UseContextResult.addFriend(p1.friend.id, p1.friend.displayName)
				end
			end, {
				UseContextResult.isFriendSelected(p1.friend.id),
				UseContextResult.removeFriend,
				UseContextResult.addFriend,
				p1.friend.id
			}),
			isChecked = UseContextResult.isFriendSelected(p1.friend.id),
			isDisabled = p1.isDisabled,
			Selectable = p1.selectable
		})
	})
end