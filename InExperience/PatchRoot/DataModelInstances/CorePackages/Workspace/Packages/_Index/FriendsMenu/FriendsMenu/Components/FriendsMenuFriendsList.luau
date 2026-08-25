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

return function(p0)
	-- upvalues: reactModule (ref), friendsListContextModule (ref), userInputService (ref), guiService (ref), useAppPolicy (ref), enableFriendsMenuShareGameInviteLink3 (ref), friendRowModule (ref), friendsMenuShareGameInviteLinkModule (ref), friendsListMsgModule (ref), emptyFriendsListModule (ref), verticalScrollView (ref), fFlagUpdateInvitesToUsePaginatedFriendsModule (ref)
	local var19
	local var12 = reactModule.useContext(friendsListContextModule)
	local friends = var12.friends
	local isFetchingFriends = var12.isFetchingFriends
	local isFetchingFriends_1 = isFetchingFriends or var12.friendsNames and var12.friendsNames.loading
	local isFriendsListFetchFailed = var12.isFriendsListFetchFailed
	local hasFriends = var12.hasFriends
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), p0 (ref), var14 (ref), guiService (copy)
		if not userInputService.GamepadEnabled or p0.disableListFocus then return end
		local current = var14.current
		local screenGui = nil
		
		if current then
			screenGui = current:FindFirstAncestorOfClass("ScreenGui")
			
			if screenGui and screenGui.Enabled and guiService.SelectedCoreObject == nil then
				if not p0.disableSelectionParentManagement then
					guiService:AddSelectionParent(p0.parentComponentName, current)
				end
				for i, v in ipairs(current:GetChildren()) do
					if v:IsA("ImageButton") and v.LayoutOrder == 1 then
						guiService.SelectedCoreObject = v
					end
				end
			end
		end
		return function()
			-- upvalues: guiService (copy), screenGui (write), p0 (copy)
			if guiService.SelectedCoreObject and screenGui and (guiService.SelectedCoreObject.Parent == nil or screenGui:IsAncestorOf(guiService.SelectedCoreObject)) then
				guiService.SelectedCoreObject = nil
			end
			if not p0.disableSelectionParentManagement then
				guiService:RemoveSelectionGroup(p0.parentComponentName)
			end
		end
	end, {
		friends,
		p0.disableListFocus,
		p0.disableSelectionParentManagement
	})
	local var17 = enableFriendsMenuShareGameInviteLink3 and (p0.parentComponentName == "GameInviteModal" and (game.GameId > 0 and (p0.gameDetailsData and (p0.gameDetailsData.isCoreScript and (p0.gameDetailsData.serverType == "StandardServer" and useAppPolicy(function(p1)
		return p1.getExperienceInviteShareLinkEnabled()
	end))))))
	local var18 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), friends (ref), friendRowModule (copy), userInputService (copy), p0 (ref), isFetchingFriends (ref), isFetchingFriends_1 (ref)
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
				isFullRowActivatable = (userInputService.GamepadEnabled or p0.isFullRowActivatable) == true,
				menuType = p0.menuType,
				sidePadding = p0.sidePadding,
				backgroundTransparency = p0.backgroundTransparency,
				isFetchingFriends = isFetchingFriends,
				isFetchingFriendsNames = isFetchingFriends_1
			})
		end
		return t
	end, { friends })
	local _ = nil
	
	if isFriendsListFetchFailed then
		var19 = if var17 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			FriendsListMsg = reactModule.createElement(friendsListMsgModule, { msgType = "errorFriendsList" })
		} else reactModule.createElement(friendsListMsgModule, { msgType = "errorFriendsList" })
	elseif isFetchingFriends then
		var19 = var18
		
		if var17 then
			var19.InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
		end
	elseif not hasFriends then
		var19 = if var17 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			EmptyFriendsList = reactModule.createElement(emptyFriendsListModule)
		} else reactModule.createElement(emptyFriendsListModule)
	elseif #friends > 0 then
		var19 = var18
		
		if var17 then
			var19.InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
		end
	else
		var19 = if var17 then {
			InviteLink = reactModule.createElement(friendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			FriendsListMsg = reactModule.createElement(friendsListMsgModule, { msgType = "noResultFriendsList" })
		} else reactModule.createElement(friendsListMsgModule, { msgType = "noResultFriendsList" })
	end
	return reactModule.createElement(verticalScrollView, {
		layoutOrder = p0.layoutOrder,
		size = p0.size,
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(1, 0),
		selectable = false,
		scrollingFrameRef = var14,
		[reactModule.Change.CanvasPosition] = if fFlagUpdateInvitesToUsePaginatedFriendsModule then function(p2)
			-- upvalues: var15 (ref), var16 (ref), var12 (ref)
			if p2.CanvasPosition.Y / (p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y) >= 0.8 and var15 < p2.AbsoluteCanvasSize.Y then
				var16(p2.AbsoluteCanvasSize.Y)
				var12.fetchMoreFriends()
			end
		end else nil
	}, var19)
end