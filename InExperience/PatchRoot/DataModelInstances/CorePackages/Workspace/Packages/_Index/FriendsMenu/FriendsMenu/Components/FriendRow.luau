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
local var10 = if getFFlagEnableCommonFriendsMenu() then require(context.InviteCallbackContext) else require(context.InviteFriendContext)
local selectedUsersContextModule = require(context.SelectedUsersContext)
local friendMenuTypeModule = require(enums.FriendMenuType)
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = require(friendsMenu.friendsMenuModalType)
local uDim2 = UDim2.new(1, 0, 0.5, 0)
local vector2 = Vector2.new(1, 0.5)

local var15 = function() end

local t = {
	sidePadding = 24,
	isFullRowActivatable = false,
	backgroundTransparency = nil
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), useStyle (ref), var10 (ref), selectedUsersContextModule (ref), useCursor (ref), foundationModule (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (ref), friendMenuTypeModule (ref), var15 (ref), friendThumbnailModule (ref), friendInfoModule (ref), friendsMenuCheckboxModule (ref), uDim2 (ref), vector2 (ref), friendsMenuButtonModule (ref)
	local var17 = cryoModule.Dictionary.join(t, p0)
	local var18, var19 = reactModule.useState(false)
	local theme = useStyle().Theme
	local friend = var17.friend
	assert(friend, "friend should be non-nil. Silence type checker.")
	local var20 = reactModule.useContext(var10)
	local var21 = reactModule.useContext(selectedUsersContextModule)
	local sidePadding = var17.sidePadding
	local var22 = useCursor(foundationModule.Enums.CursorType.RoundedSlot)
	local var23 = var17.isFullRowActivatable and not var17.isFetchingFriends
	local var24 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), friend (ref), var17 (ref)
		if var20 and var20.inviteSingleFriend and not friend.isLoadingPlaceholder then
			var20.inviteSingleFriend(friend.id, var17.layoutOrder)
		end
	end, {
		var20,
		var20.inviteSingleFriend,
		friend.id,
		friend.isLoadingPlaceholder,
		var17.layoutOrder
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var17 (ref)
		if var21.isFriendSelected(var17.friend.id) then
			var21.removeFriend(var17.friend.id, var17.friend.displayName)
			
			return
		end
		var21.addFriend(var17.friend.id, var17.friend.displayName)
	end, {
		var21.isFriendSelected,
		var21.removeFriend,
		var21.addFriend,
		var17.friend.id
	})
	
	return reactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, 72),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = if var18 then theme.BackgroundOnHover.Color else theme.BackgroundDefault.Color,
		BackgroundTransparency = if var18 then theme.BackgroundOnHover.Transparency elseif var17.backgroundTransparency then var17.backgroundTransparency else theme.BackgroundDefault.Transparency,
		BorderSizePixel = 0,
		LayoutOrder = var17.layoutOrder,
		SelectionImageObject = if var17.isFullRowActivatable then var22 else nil,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var17 (ref), var19 (ref)
			if not var17.isFetchingFriends then
				var19(true)
			end
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var19 (ref)
			var19(false)
		end,
		[reactModule.Event.Activated] = if getFFlagFriendsMenuDummyLoadingFriendsFix() and friend.isLoadingPlaceholder or not var23 then var15 else reactModule.useCallback(function()
			-- upvalues: var23 (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (copy), friend (ref), var17 (ref), friendMenuTypeModule (copy), var24 (ref), var25 (ref)
			if not var23 or getFFlagFriendsMenuDummyLoadingFriendsFix() and friend.isLoadingPlaceholder then return end
			if var17.menuType == friendMenuTypeModule.MultiSelect then
				var25()
				
				return
			end
			var24()
		end, {
			var23,
			var17.menuType,
			var24,
			var25,
			friend.isLoadingPlaceholder
		}),
		AutoButtonColor = var23
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
			isHoverRow = var18,
			size = UDim2.new(0, 56, 0, 56),
			position = UDim2.new(0, 0, 0.5, 0),
			anchorPoint = Vector2.new(0, 0.5),
			isFetchingFriends = var17.isFetchingFriends
		}),
		UserInfo = reactModule.createElement(friendInfoModule, {
			LayoutOrder = 2,
			position = UDim2.new(0, 56, 0, 0),
			size = UDim2.new(1, -134, 0, 0),
			friend = friend,
			isFetchingFriendsNames = var17.isFetchingFriendsNames
		}),
		InviteButton = if var17.menuType == friendMenuTypeModule.MultiSelect then reactModule.createElement(friendsMenuCheckboxModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = uDim2,
			anchorPoint = vector2,
			friend = friend,
			isDisabled = var17.isFetchingFriends,
			selectable = if var17.isFullRowActivatable then false else nil
		}) else reactModule.createElement(friendsMenuButtonModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = uDim2,
			anchorPoint = vector2,
			friend = friend,
			onInvite = var24,
			isFullRowActivatable = var17.isFullRowActivatable
		})
	})
end