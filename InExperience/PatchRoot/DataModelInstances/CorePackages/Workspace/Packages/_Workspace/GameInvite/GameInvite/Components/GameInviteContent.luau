local gameInvite = script:FindFirstAncestor("GameInvite")
local components = gameInvite.Components
local context = gameInvite.Context
local parent = gameInvite.Parent
local friendsMenuModule = require(parent.FriendsMenu)
local reactModule = require(parent.React)
local deviceInfo = require(parent.NotificationsCommon).DeviceInfo
local roactUtilsModule = require(parent.RoactUtils)
local friendsMenuFriendsList = friendsMenuModule.FriendsMenuFriendsList
local inviteFriendContext = friendsMenuModule.InviteFriendContext
local friendsMenuContextWrapper = friendsMenuModule.FriendsMenuContextWrapper
local friendsMenuSearch = friendsMenuModule.FriendsMenuSearch
local friendMenuType = friendsMenuModule.FriendMenuType
local gameInviteAnalyticsManagerModule = require(gameInvite.analytics.GameInviteAnalyticsManager)
local gameInviteTitleModule = require(components.GameInviteTitle)
local gameInviteRewardsBannerModule = require(components.GameInviteRewardsBanner)
local gameInviteCustomTextModule = require(components.GameInviteCustomText)
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local gameInviteModalLayoutContextModule = require(context.GameInviteModalLayoutContext)
local gameDetailsContextModule = require(context.GameDetailsContext)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local getFFlagEnableCommonFriendsMenu = require(parent.SharedFlags).GetFFlagEnableCommonFriendsMenu
local getFFlagEnableGameInviteRewardsBanner = require(parent.SharedFlags).GetFFlagEnableGameInviteRewardsBanner
local name = require(parent.Loggers).Logger:new(script.Name)
local getRewardMetadataModule = require(gameInvite.Requests.GetRewardMetadata)
local sidePadding = gameInviteConstantsModule.Layout.SidePadding
local titleHeight = gameInviteConstantsModule.Layout.TitleHeight

local var13 = function(p0) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), gameInviteModalLayoutContextModule (ref), gameDetailsContextModule (ref), getFFlagEnableGameInviteRewardsBanner (ref), getRewardMetadataModule (ref), name (ref), useSelector (ref), deviceInfo (ref), titleHeight (ref), gameInviteTitleModule (ref), sidePadding (ref), friendsMenuSearch (ref), gameInviteAnalyticsManagerModule (ref), gameInviteCustomTextModule (ref), gameInviteRewardsBannerModule (ref), friendsMenuFriendsList (ref), gameInviteConstantsModule (ref), friendMenuType (ref)
	local var14 = reactModule.useContext(gameInviteModalLayoutContextModule)
	local var15 = reactModule.useContext(gameDetailsContextModule)
	local var16, var17 = reactModule.useState(nil)
	
	if getFFlagEnableGameInviteRewardsBanner() then
		reactModule.useEffect(function() --[[ line: 50 ]]
			-- upvalues: getRewardMetadataModule (copy), var17 (ref), name (copy)
			if game.GameId > 0 then
				getRewardMetadataModule():andThen(function(p2) --[[ line: 52 ]]
					-- upvalues: var17 (copy)
					if p2.responseBody and p2.responseBody.name and p2.responseBody.description then
						var17(p2.responseBody)
					end
				end):catch(function(p1) --[[ line: 56 ]]
					-- upvalues: name (copy)
					name:error(`Error fetching reward metadata: {p1}`)
				end)
			end
		end, {})
	end
	local var18 = useSelector(function(p3) --[[ line: 63 ]]
		return p3.TopBar
	end)
	local var19 = deviceInfo.isConsole()
	local isCompact = var14.modalMode == "compact"
	local promptMessage = var15.promptMessage
	local var21 = promptMessage and #promptMessage > 0
	local var22 = titleHeight + 12
	local var23 = not isCompact and not var19
	
	if var23 then
		var22 += 48
	end
	if var21 then
		var22 += 48
	end
	local var24 = titleHeight
	
	if (if var15.isCoreScript or not var18 or not var18.statusBarHeight then false else true) and var18 then
		var22 += var18.statusBarHeight
		var24 += var18.statusBarHeight
	end
	local var28
	local createElement = reactModule.createElement
	local var25 = "Frame"
	local t = {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		TitleContainer = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, var24)
		}, {
			GameInviteTitle = reactModule.createElement(gameInviteTitleModule, {
				layoutOrder = 0,
				size = UDim2.new(1, 0, 0, titleHeight),
				hideCloseButton = p0.hideCloseButton
			})
		}),
		SearchBox = var23 and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 36)
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, sidePadding),
				PaddingRight = UDim.new(0, sidePadding)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			FriendsMenuSearch = reactModule.createElement(friendsMenuSearch, {
				layoutOrder = 1,
				focusElement = false,
				size = UDim2.new(1, 0, 0, 36),
				onFocus = function() --[[ line: 142 ]]
					-- upvalues: gameInviteAnalyticsManagerModule (copy)
					gameInviteAnalyticsManagerModule:onSearchFocused()
				end
			})
		}) or nil,
		CustomTextContainer = var21 and reactModule.createElement(gameInviteCustomTextModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 0, 36),
			promptMessage = promptMessage
		}) or nil
	}
	
	if getFFlagEnableGameInviteRewardsBanner() and var16 ~= nil then
		var28 = reactModule.createElement(gameInviteRewardsBannerModule, { layoutOrder = 2, rewardMetadata = var16 }) or nil
	end
	t_1.RewardsBanner = var28
	t_1.FriendsList = reactModule.createElement(friendsMenuFriendsList, {
		layoutOrder = 3,
		size = UDim2.new(1, 0, 1, -var22),
		parentComponentName = gameInviteConstantsModule.ParentComponentName,
		menuType = friendMenuType.SingleSelect,
		gameDetailsData = var15,
		disableSelectionParentManagement = p0.disableSelectionParentManagement
	})
	
	return createElement(var25, t, t_1)
end

return function(p4) --[[ line: 170 ]]
	-- upvalues: getFFlagEnableCommonFriendsMenu (ref), reactModule (ref), inviteFriendContext (ref), friendsMenuContextWrapper (ref), var13 (ref)
	return if getFFlagEnableCommonFriendsMenu() then reactModule.createElement(friendsMenuContextWrapper, {
		inviteSingleFriend = (if getFFlagEnableCommonFriendsMenu() then reactModule.useContext(inviteFriendContext) else {
			inviteSingleFriend = function() --[[ line: 173 ]] end,
			getMaxRecipientRowNum = function() --[[ line: 173 ]] end
		}).inviteSingleFriend,
		inviteMultiFriends = function() --[[ line: 177 ]] end,
		isLoadingCustomParams = p4.isLoadingCustomParams
	}, { GameInviteContent = reactModule.createElement(var13, p4) }) else reactModule.createElement(var13, p4)
end