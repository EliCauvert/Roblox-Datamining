local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local components = friendsMenu.Components
local context = friendsMenu.Context
local enums = friendsMenu.Enums
local parent = friendsMenu.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local friendRowModule = require(components.FriendRow)
local emptyFriendsListModule = require(components.EmptyFriendsList)
local friendsListMsgModule = require(components.FriendsListMsg)
local friendsListContextModule = require(context.FriendsListContext)
local _ = require(enums.FriendMenuType)
local _ = require(friendsMenu.friendsMenuModalType)
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local fFlagUpdateInvitesToUsePaginatedFriendsModule = require(friendsMenu.Flags.FFlagUpdateInvitesToUsePaginatedFriends)
local friendsMenuShareGameInviteLinkModule = require(components.FriendsMenuShareGameInviteLink)
local enableFriendsMenuShareGameInviteLink3 = game:DefineFastFlag("EnableFriendsMenuShareGameInviteLink3", false)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

return function(p1)
	-- upvalues: reactModule (ref), friendsListContextModule (ref), userInputService (ref), guiService (ref), useAppPolicy (ref), enableFriendsMenuShareGameInviteLink3 (ref), friendRowModule (ref), friendsMenuShareGameInviteLinkModule (ref), friendsListMsgModule (ref), emptyFriendsListModule (ref), verticalScrollView (ref), fFlagUpdateInvitesToUsePaginatedFriendsModule (ref)
	local var1
	local var2 = reactModule.useContext(friendsListContextModule)
	local friends = var2.friends
	local isFetchingFriends = var2.isFetchingFriends
	local isFetchingFriends_1 = isFetchingFriends or var2.friendsNames and var2.friendsNames.loading
	local isFriendsListFetchFailed = var2.isFriendsListFetchFailed
	local hasFriends = var2.hasFriends
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), p1 (ref), var3 (ref), guiService (copy)
		if not userInputService.GamepadEnabled or p1.disableListFocus then return end
		local current = var3.current
		local screenGui = nil
		
		if current then
			screenGui = current:FindFirstAncestorOfClass("ScreenGui")
			
			if screenGui and screenGui.Enabled and guiService.SelectedCoreObject == nil then
				if not p1.disableSelectionParentManagement then
					guiService:AddSelectionParent(p1.parentComponentName, current)
				end
				for i, v in ipairs(current:GetChildren()) do
					if v:IsA("ImageButton") and v.LayoutOrder == 1 then
						guiService.SelectedCoreObject = v
					end
				end
			end
		end
		return function()
			-- upvalues: guiService (copy), screenGui (write), p1 (copy)
			if guiService.SelectedCoreObject and screenGui and (guiService.SelectedCoreObject.Parent == nil or screenGui:IsAncestorOf(guiService.SelectedCoreObject)) then
				guiService.SelectedCoreObject = nil
			end
			if not p1.disableSelectionParentManagement then
				guiService:RemoveSelectionGroup(p1.parentComponentName)
			end
		end
	end, {
		friends,
		p1.disableListFocus,
		p1.disableSelectionParentManagement
	})
	local var6 = enableFriendsMenuShareGameInviteLink3 and (p1.parentComponentName == "GameInviteModal" and (game.GameId > 0 and (p1.gameDetailsData and (p1.gameDetailsData.isCoreScript and (p1.gameDetailsData.serverType == "StandardServer" and useAppPolicy(function(p2)
		return p2.getExperienceInviteShareLinkEnabled()
	end))))))
	local var7 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), friends (ref), friendRowModule (copy), userInputService (copy), p1 (ref), isFetchingFriends (ref), isFetchingFriends_1 (ref)
		local t = {
			RowListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}
		
		for i, v in ipairs(friends) do
			t["User-" .. tostring(v.id)] = reactModule.createElement(friendRowModule, {
				friend = v,
				layoutOrder = i,
				isFullRowActivatable = (userInputService.GamepadEnabled or p1.isFullRowActivatable) == true,
				menuType = p1.menuType,
				sidePadding = p1.sidePadding,
				backgroundTransparency = p1.backgroundTransparency,
				isFetchingFriends = isFetchingFriends,
				isFetchingFriendsNames = isFetchingFriends_1
			})
		end
		return t
	end, { friends })
	local _ = nil
	
	if isFriendsListFetchFailed then
		var1 = if var6 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			FriendsListMsg = reactModule.createElement(friendsListMsgModule, { msgType = "errorFriendsList" })
		} else reactModule.createElement(friendsListMsgModule, { msgType = "errorFriendsList" })
	elseif isFetchingFriends then
		var1 = var7
		
		if var6 then
			var1.InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
		end
	elseif not hasFriends then
		var1 = if var6 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			EmptyFriendsList = reactModule.createElement(emptyFriendsListModule)
		} else reactModule.createElement(emptyFriendsListModule)
	elseif #friends > 0 then
		var1 = var7
		
		if var6 then
			var1.InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
		end
	else
		var1 = if var6 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			FriendsListMsg = reactModule.createElement(friendsListMsgModule, { msgType = "noResultFriendsList" })
		} else reactModule.createElement(friendsListMsgModule, { msgType = "noResultFriendsList" })
	end
	return reactModule.createElement(verticalScrollView, {
		layoutOrder = p1.layoutOrder,
		size = p1.size,
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(1, 0),
		selectable = false,
		scrollingFrameRef = var3,
		[reactModule.Change.CanvasPosition] = if fFlagUpdateInvitesToUsePaginatedFriendsModule then function(p2)
			-- upvalues: var4 (ref), var5 (ref), var2 (ref)
			if p2.CanvasPosition.Y / (p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y) >= 0.8 and var4 < p2.AbsoluteCanvasSize.Y then
				var5(p2.AbsoluteCanvasSize.Y)
				var2.fetchMoreFriends()
			end
		end else nil
	}, var1)
end