local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Components = FriendsMenu.Components
local Parent = FriendsMenu.Parent
local Context = FriendsMenu.Context
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagFriendsMenuDummyLoadingFriendsFixFunction = SharedFlagsModule.GetFFlagFriendsMenuDummyLoadingFriendsFix
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local FriendThumbnailModule = require(Components.FriendThumbnail)
local FriendsMenuButtonModule = require(Components.FriendsMenuButton)
local FriendInfoModule = require(Components.FriendInfo)
local FriendsMenuCheckboxModule = require(Components.FriendsMenuCheckbox)
local InviteCallbackContextModule = if SharedFlagsModule.GetFFlagEnableCommonFriendsMenu() then require(Context.InviteCallbackContext) else require(Context.InviteFriendContext)
local SelectedUsersContextModule = require(Context.SelectedUsersContext)
local FriendMenuTypeModule = require(FriendsMenu.Enums.FriendMenuType)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local _ = require(FriendsMenu.friendsMenuModalType)
local _UDim2 = UDim2.new(1, 0, 0.5, 0)
local _Vector2 = Vector2.new(1, 0.5)

local function v18() end

local config = {
	sidePadding = 24,
	isFullRowActivatable = false,
	backgroundTransparency = nil
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), UseStyleFunction (copy), InviteCallbackContextModule (copy), SelectedUsersContextModule (copy), UseCursorFunction (copy), FoundationModule (copy), GetFFlagFriendsMenuDummyLoadingFriendsFixFunction (copy), FriendMenuTypeModule (copy), v18 (copy), FriendThumbnailModule (copy), FriendInfoModule (copy), FriendsMenuCheckboxModule (copy), _UDim2 (copy), _Vector2 (copy), FriendsMenuButtonModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Theme = UseStyleFunction().Theme
	local Friend = JoinResult.friend
	assert(Friend, "friend should be non-nil. Silence type checker.")
	local UseContextResult = ReactModule.useContext(InviteCallbackContextModule)
	local UseContextResult1 = ReactModule.useContext(SelectedUsersContextModule)
	local SidePadding = JoinResult.sidePadding
	local UseCursorResult = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedSlot)
	local NoIsFetchingFriends: boolean = JoinResult.isFullRowActivatable and not JoinResult.isFetchingFriends
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), Friend (copy), JoinResult (copy)
		if UseContextResult and UseContextResult.inviteSingleFriend and not Friend.isLoadingPlaceholder then
			UseContextResult.inviteSingleFriend(Friend.id, JoinResult.layoutOrder)
		end
	end, {
		UseContextResult,
		UseContextResult.inviteSingleFriend,
		Friend.id,
		Friend.isLoadingPlaceholder,
		JoinResult.layoutOrder
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult1 (copy), JoinResult (copy)
		if UseContextResult1.isFriendSelected(JoinResult.friend.id) then
			UseContextResult1.removeFriend(JoinResult.friend.id, JoinResult.friend.displayName)
			
			return
		else
			UseContextResult1.addFriend(JoinResult.friend.id, JoinResult.friend.displayName)
		end
	end, {
		UseContextResult1.isFriendSelected,
		UseContextResult1.removeFriend,
		UseContextResult1.addFriend,
		JoinResult.friend.id
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: NoIsFetchingFriends (copy), GetFFlagFriendsMenuDummyLoadingFriendsFixFunction (upval), Friend (copy), JoinResult (copy), FriendMenuTypeModule (upval), UseResult (copy), UseResult1 (copy)
		if not NoIsFetchingFriends or GetFFlagFriendsMenuDummyLoadingFriendsFixFunction() and Friend.isLoadingPlaceholder then return end
		if JoinResult.menuType == FriendMenuTypeModule.MultiSelect then
			UseResult1()
			
			return
		else
			UseResult()
		end
	end, {
		NoIsFetchingFriends,
		JoinResult.menuType,
		UseResult,
		UseResult1,
		Friend.isLoadingPlaceholder
	})
	
	return ReactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, 72),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseStateResult and Theme.BackgroundOnHover.Color or Theme.BackgroundDefault.Color,
		BackgroundTransparency = if UseStateResult then Theme.BackgroundOnHover.Transparency elseif JoinResult.backgroundTransparency then JoinResult.backgroundTransparency else Theme.BackgroundDefault.Transparency,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.layoutOrder,
		SelectionImageObject = if JoinResult.isFullRowActivatable then UseCursorResult else nil,
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: JoinResult (copy), UseStateResult2 (copy)
			if not JoinResult.isFetchingFriends then
				UseStateResult2(true)
			end
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end,
		[ReactModule.Event.Activated] = if GetFFlagFriendsMenuDummyLoadingFriendsFixFunction() and Friend.isLoadingPlaceholder then v18 elseif NoIsFetchingFriends then UseResult2 else v18,
		AutoButtonColor = NoIsFetchingFriends
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 12)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, SidePadding),
			PaddingLeft = UDim.new(0, SidePadding),
			PaddingBottom = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8)
		}),
		ThumbnailAndPresenceWrapper = ReactModule.createElement(FriendThumbnailModule, {
			LayoutOrder = 1,
			friend = Friend,
			isHoverRow = UseStateResult,
			size = UDim2.new(0, 56, 0, 56),
			position = UDim2.new(0, 0, 0.5, 0),
			anchorPoint = Vector2.new(0, 0.5),
			isFetchingFriends = JoinResult.isFetchingFriends
		}),
		UserInfo = ReactModule.createElement(FriendInfoModule, {
			LayoutOrder = 2,
			position = UDim2.new(0, 56, 0, 0),
			size = UDim2.new(1, -134, 0, 0),
			friend = Friend,
			isFetchingFriendsNames = JoinResult.isFetchingFriendsNames
		}),
		InviteButton = if JoinResult.menuType == FriendMenuTypeModule.MultiSelect then ReactModule.createElement(FriendsMenuCheckboxModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = _UDim2,
			anchorPoint = _Vector2,
			friend = Friend,
			isDisabled = JoinResult.isFetchingFriends,
			selectable = not JoinResult.isFullRowActivatable and nil
		}) else ReactModule.createElement(FriendsMenuButtonModule, {
			layoutOrder = 3,
			size = UDim2.new(0, 66, 0, 36),
			position = _UDim2,
			anchorPoint = _Vector2,
			friend = Friend,
			onInvite = UseResult,
			isFullRowActivatable = JoinResult.isFullRowActivatable
		})
	})
end