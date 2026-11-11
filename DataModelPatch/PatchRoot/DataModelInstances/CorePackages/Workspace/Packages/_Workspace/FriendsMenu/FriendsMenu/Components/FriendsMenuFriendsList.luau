local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Components = FriendsMenu.Components
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local FriendRowModule = require(Components.FriendRow)
local EmptyFriendsListModule = require(Components.EmptyFriendsList)
local FriendsListMsgModule = require(Components.FriendsListMsg)
local FriendsListContextModule = require(FriendsMenu.Context.FriendsListContext)
local _ = require(FriendsMenu.Enums.FriendMenuType)
local _ = require(FriendsMenu.friendsMenuModalType)
local VerticalScrollView = require(Parent.UIBlox).App.Container.VerticalScrollView
local FFlagUpdateInvitesToUsePaginatedFriendsModule = require(FriendsMenu.Flags.FFlagUpdateInvitesToUsePaginatedFriends)
local FriendsMenuShareGameInviteLinkModule = require(Components.FriendsMenuShareGameInviteLink)
local EnableFriendsMenuShareGameInviteLink3 = game:DefineFastFlag("EnableFriendsMenuShareGameInviteLink3", false)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy

return function(p1)
	-- upvalues: ReactModule (copy), FriendsListContextModule (copy), UserInputService (copy), GuiService (copy), UseAppPolicyFunction (copy), EnableFriendsMenuShareGameInviteLink3 (copy), FriendRowModule (copy), FriendsMenuShareGameInviteLinkModule (copy), FriendsListMsgModule (copy), EmptyFriendsListModule (copy), VerticalScrollView (copy), FFlagUpdateInvitesToUsePaginatedFriendsModule (copy)
	local UseContextResult = ReactModule.useContext(FriendsListContextModule)
	local Friends = UseContextResult.friends
	local IsFetchingFriends = UseContextResult.isFetchingFriends
	local IsFetchingFriends1 = IsFetchingFriends or UseContextResult.friendsNames and UseContextResult.friendsNames.loading
	local IsFriendsListFetchFailed = UseContextResult.isFriendsListFetchFailed
	local HasFriends = UseContextResult.hasFriends
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), p1 (copy), UseRefResult (copy), GuiService (upval)
		if not UserInputService.GamepadEnabled or p1.disableListFocus then return end
		local Current = UseRefResult.current
		local ScreenGui = nil
		
		if Current then
			ScreenGui = Current:FindFirstAncestorOfClass("ScreenGui")
			
			if ScreenGui and ScreenGui.Enabled and GuiService.SelectedCoreObject == nil then
				if not p1.disableSelectionParentManagement then
					GuiService:AddSelectionParent(p1.parentComponentName, Current)
				end
				for _, Button in ipairs(Current:GetChildren()) do
					if Button:IsA("ImageButton") and Button.LayoutOrder == 1 then
						GuiService.SelectedCoreObject = Button
					end
				end
			end
		end
		return function()
			-- upvalues: GuiService (upval), ScreenGui (ref), p1 (upval)
			if GuiService.SelectedCoreObject and ScreenGui and (GuiService.SelectedCoreObject.Parent == nil or ScreenGui:IsAncestorOf(GuiService.SelectedCoreObject)) then
				GuiService.SelectedCoreObject = nil
			end
			if not p1.disableSelectionParentManagement then
				GuiService:RemoveSelectionGroup(p1.parentComponentName)
			end
		end
	end, {
		Friends,
		p1.disableListFocus,
		p1.disableSelectionParentManagement
	})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getExperienceInviteShareLinkEnabled()
	end)
	local UseAppPolicyResult1 = EnableFriendsMenuShareGameInviteLink3 and (p1.parentComponentName == "GameInviteModal" and game.GameId > 0 and (p1.gameDetailsData and (p1.gameDetailsData.isCoreScript and (p1.gameDetailsData.serverType == "StandardServer" and UseAppPolicyResult))))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Friends (copy), FriendRowModule (upval), UserInputService (upval), p1 (copy), IsFetchingFriends (copy), IsFetchingFriends1 (copy)
		local config = {
			RowListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}
		
		for LayoutOrder, friend in ipairs(Friends) do
			config["User-" .. tostring(friend.id)] = ReactModule.createElement(FriendRowModule, {
				friend = friend,
				layoutOrder = LayoutOrder,
				isFullRowActivatable = (UserInputService.GamepadEnabled or p1.isFullRowActivatable) == true,
				menuType = p1.menuType,
				sidePadding = p1.sidePadding,
				backgroundTransparency = p1.backgroundTransparency,
				isFetchingFriends = IsFetchingFriends,
				isFetchingFriendsNames = IsFetchingFriends1
			})
		end
		return config
	end, { Friends })
	local Config = nil
	
	if IsFriendsListFetchFailed then
		Config = if UseAppPolicyResult1 then {
			InviteLink = ReactModule.createElement(FriendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			FriendsListMsg = ReactModule.createElement(FriendsListMsgModule, { msgType = "errorFriendsList" })
		} else ReactModule.createElement(FriendsListMsgModule, { msgType = "errorFriendsList" })
	elseif IsFetchingFriends then
		Config = UseMemoResult
		
		if UseAppPolicyResult1 then
			Config.InviteLink = ReactModule.createElement(FriendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
		end
	elseif HasFriends then
		if #Friends > 0 then
			Config = UseMemoResult
			
			if UseAppPolicyResult1 then
				Config.InviteLink = ReactModule.createElement(FriendsMenuShareGameInviteLinkModule, { layoutOrder = 0 })
			end
		else
			Config = if UseAppPolicyResult1 then {
				InviteLink = ReactModule.createElement(FriendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
				FriendsListMsg = ReactModule.createElement(FriendsListMsgModule, { msgType = "noResultFriendsList" })
			} else ReactModule.createElement(FriendsListMsgModule, { msgType = "noResultFriendsList" })
		end
	else
		Config = if UseAppPolicyResult1 then {
			InviteLink = ReactModule.createElement(FriendsMenuShareGameInviteLinkModule, { layoutOrder = 0 }),
			EmptyFriendsList = ReactModule.createElement(EmptyFriendsListModule)
		} else ReactModule.createElement(EmptyFriendsListModule)
	end
	return ReactModule.createElement(VerticalScrollView, {
		layoutOrder = p1.layoutOrder,
		size = p1.size,
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(1, 0),
		selectable = false,
		scrollingFrameRef = UseRefResult,
		[ReactModule.Change.CanvasPosition] = if FFlagUpdateInvitesToUsePaginatedFriendsModule then function(ScrollFrame)
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseContextResult (copy)
			if ScrollFrame.CanvasPosition.Y / (ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) >= 0.8 and UseStateResult < ScrollFrame.AbsoluteCanvasSize.Y then
				UseStateResult2(ScrollFrame.AbsoluteCanvasSize.Y)
				UseContextResult.fetchMoreFriends()
			end
		end else nil
	}, Config)
end