local Parent = script:FindFirstAncestor("AddFriends").Parent
local TModule = require(Parent.t)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local _ = require(script.Parent.getFriendRequestHandlersExtraProps)
local IconName = require(Parent.Foundation).Enums.IconName
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ButtonTypes = require(Parent.UserList).Enums.ButtonTypes
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled
local StrictInterfaceResult = TModule.strictInterface({
	isFriendRequest = TModule.boolean,
	hasIncomingFriendRequest = TModule.optional(TModule.boolean),
	friendStatus = TModule.optional(TModule.enum(Enum.FriendStatus)),
	handleRequestFriendship = TModule.optional(TModule.callback),
	handleAcceptFriendRequest = TModule.optional(TModule.callback),
	handleDeclineFriendRequest = TModule.optional(TModule.callback),
	shouldAddFocusEventName = TModule.optional(TModule.boolean)
})

return function(p1)
	-- upvalues: StrictInterfaceResult (copy), FFlagAddFriendsUserListEnabled (copy), IconName (copy), Images (copy), FocusNavigationEventNameEnum (copy), ButtonTypes (copy)
	assert(StrictInterfaceResult(p1))
	local List = {}
	
	if not p1.isFriendRequest then
		local FriendStatus = p1.friendStatus or Enum.FriendStatus.NotFriend
		
		if p1.hasIncomingFriendRequest then
			table.insert(List, {
				icon = Images["icons/actions/friends/friendAdd"],
				isSecondary = if FFlagAddFriendsUserListEnabled then nil else false,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.handleAcceptFriendRequest()
				end,
				focusEventName = if p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
				type = if FFlagAddFriendsUserListEnabled then ButtonTypes.Accept else nil
			})
			
			return List
		end
		if FriendStatus == Enum.FriendStatus.NotFriend then
			table.insert(List, {
				icon = Images["icons/actions/friends/friendAdd"],
				isSecondary = if FFlagAddFriendsUserListEnabled then nil else false,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.handleRequestFriendship()
				end,
				focusEventName = if p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToAddFriend else nil,
				type = if FFlagAddFriendsUserListEnabled then ButtonTypes.Add else nil
			})
			
			return List
		end
		if FriendStatus == Enum.FriendStatus.FriendRequestSent then
			table.insert(List, {
				isDisabled = true,
				icon = Images["icons/actions/friends/friendpending"],
				isSecondary = if FFlagAddFriendsUserListEnabled then nil else false,
				onActivated = function() end,
				type = if FFlagAddFriendsUserListEnabled then ButtonTypes.Pending else nil
			})
		end
	elseif (p1.friendStatus or Enum.FriendStatus.FriendRequestReceived) == Enum.FriendStatus.FriendRequestReceived then
		table.insert(List, {
			icon = if FFlagAddFriendsUserListEnabled then IconName.X else Images["icons/actions/reject"],
			isSecondary = not FFlagAddFriendsUserListEnabled or nil,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.handleDeclineFriendRequest()
			end,
			focusEventName = if p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.IgnoreFriendRequest else nil,
			type = if FFlagAddFriendsUserListEnabled then ButtonTypes.Dismiss else nil
		})
		table.insert(List, {
			icon = Images["icons/actions/friends/friendAdd"],
			isSecondary = if FFlagAddFriendsUserListEnabled then nil else false,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.handleAcceptFriendRequest()
			end,
			focusEventName = if p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			type = if FFlagAddFriendsUserListEnabled then ButtonTypes.Accept else nil
		})
		
		return List
	end
	return List
end