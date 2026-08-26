local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local components = friendsMenu.Components
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local enums = friendsMenu.Enums
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableCommonFriendsMenu = sharedFlagsModule.GetFFlagEnableCommonFriendsMenu
local getFFlagFriendsMenuDummyLoadingFriendsFix = sharedFlagsModule.GetFFlagFriendsMenuDummyLoadingFriendsFix
local foundationModule = require(parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local friendThumbnailModule = require(components.FriendThumbnail)
local friendsMenuButtonModule = require(components.FriendsMenuButton)
local friendInfoModule = require(components.FriendInfo)
local friendsMenuCheckboxModule = require(components.FriendsMenuCheckbox)
local var1 = if getFFlagEnableCommonFriendsMenu() then require(context.InviteCallbackContext) else require(context.InviteFriendContext)
local selectedUsersContextModule = require(context.SelectedUsersContext)
local friendMenuTypeModule = require(enums.FriendMenuType)
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = require(friendsMenu.friendsMenuModalType)
local uDim2 = UDim2.new(1, 0, 0.5, 0)
local vector2 = Vector2.new(1, 0.5)

local var2 = function() end

local t = {
	sidePadding = 24,
	isFullRowActivatable = false,
	backgroundTransparency = nil
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), useStyle (ref), var1 (ref), selectedUsersContextModule (ref), useCursor (ref), foundationModule (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (ref), friendMenuTypeModule (ref), var2 (ref), friendThumbnailModule (ref), friendInfoModule (ref), friendsMenuCheckboxModule (ref), uDim2 (ref), vector2 (ref), friendsMenuButtonModule (ref)
	local var3 = cryoModule.Dictionary.join(t, p1)
	local var4, var5 = reactModule.useState(false)
	local theme = useStyle().Theme
	local friend = var3.friend
	assert(friend, "friend should be non-nil. Silence type checker.")
	local var6 = reactModule.useContext(var1)
	local var7 = reactModule.useContext(selectedUsersContextModule)
	local sidePadding = var3.sidePadding
	local var8 = useCursor(foundationModule.Enums.CursorType.RoundedSlot)
	local var9 = var3.isFullRowActivatable and not var3.isFetchingFriends
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), friend (ref), var3 (ref)
		if var6 and var6.inviteSingleFriend and not friend.isLoadingPlaceholder then
			var6.inviteSingleFriend(friend.id, var3.layoutOrder)
		end
	end, {
		var6,
		var6.inviteSingleFriend,
		friend.id,
		friend.isLoadingPlaceholder,
		var3.layoutOrder
	})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var3 (ref)
		if var7.isFriendSelected(var3.friend.id) then
			var7.removeFriend(var3.friend.id, var3.friend.displayName)
			
			return
		end
		var7.addFriend(var3.friend.id, var3.friend.displayName)
	end, {
		var7.isFriendSelected,
		var7.removeFriend,
		var7.addFriend,
		var3.friend.id
	})
	
	return reactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, 72),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = if var4 then theme.BackgroundOnHover.Color else theme.BackgroundDefault.Color,
		BackgroundTransparency = if var4 then theme.BackgroundOnHover.Transparency elseif var3.backgroundTransparency then var3.backgroundTransparency else theme.BackgroundDefault.Transparency,
		BorderSizePixel = 0,
		LayoutOrder = var3.layoutOrder,
		SelectionImageObject = if var3.isFullRowActivatable then var8 else nil,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var3 (ref), var5 (ref)
			if not var3.isFetchingFriends then
				var5(true)
			end
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var5 (ref)
			var5(false)
		end,
		[reactModule.Event.Activated] = if getFFlagFriendsMenuDummyLoadingFriendsFix() and friend.isLoadingPlaceholder or not var9 then var2 else reactModule.useCallback(function()
			-- upvalues: var9 (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (copy), friend (ref), var3 (ref), friendMenuTypeModule (copy), var10 (ref), var11 (ref)
			if not var9 or getFFlagFriendsMenuDummyLoadingFriendsFix() and friend.isLoadingPlaceholder then return end
			if var3.menuType == friendMenuTypeModule.MultiSelect then
				var11()
				
				return
			end
			var10()
		end, {
			var9,
			var3.menuType,
			var10,
			var11,
			friend.isLoadingPlaceholder
		}),
		AutoButtonColor = var9
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 12)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, sidePadding),
			PaddingLeft = UDim.new(0, sidePadding),
			PaddingBottom = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8)
		}),
		ThumbnailAndPresenceWrapper = reactModule.createElement(friendThumbnailModule, {
			LayoutOrder = 1,
			friend = friend,
			isHoverRow = var4,
			size = UDim2.new(0, 56, 0, 56),
			position = UDim2.new(0, 0, 0.5, 0),
			anchorPoint = Vector2.new(0, 0.5),
			isFetchingFriends = var3.isFetchingFriends
		}),
		UserInfo = reactModule.createElement(friendInfoModule, {
			LayoutOrder = 2,
			position = UDim2.new(0, 56, 0, 0),
			size = UDim2.new(1, -134, 0, 0),
			friend = friend,
			isFetchingFriendsNames = var3.isFetchingFriendsNames
		}),
		InviteButton = if var3.menuType == friendMenuTypeModule.MultiSelect then reactModule.createElement(friendsMenuCheckboxModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = uDim2,
			anchorPoint = vector2,
			friend = friend,
			isDisabled = var3.isFetchingFriends,
			selectable = if var3.isFullRowActivatable then false else nil
		}) else reactModule.createElement(friendsMenuButtonModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = uDim2,
			anchorPoint = vector2,
			friend = friend,
			onInvite = var10,
			isFullRowActivatable = var3.isFullRowActivatable
		})
	})
end