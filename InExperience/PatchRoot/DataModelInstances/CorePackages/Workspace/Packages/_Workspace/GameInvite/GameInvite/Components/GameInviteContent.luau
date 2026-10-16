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

local var1 = function(p1)
	-- upvalues: reactModule (ref), gameInviteModalLayoutContextModule (ref), gameDetailsContextModule (ref), getFFlagEnableGameInviteRewardsBanner (ref), getRewardMetadataModule (ref), name (ref), useSelector (ref), deviceInfo (ref), titleHeight (ref), gameInviteTitleModule (ref), sidePadding (ref), friendsMenuSearch (ref), gameInviteAnalyticsManagerModule (ref), gameInviteCustomTextModule (ref), gameInviteRewardsBannerModule (ref), friendsMenuFriendsList (ref), gameInviteConstantsModule (ref), friendMenuType (ref)
	local var2 = reactModule.useContext(gameInviteModalLayoutContextModule)
	local var3 = reactModule.useContext(gameDetailsContextModule)
	local var4, var5 = reactModule.useState(nil)
	
	if getFFlagEnableGameInviteRewardsBanner() then
		reactModule.useEffect(function()
			-- upvalues: getRewardMetadataModule (copy), var5 (ref), name (copy)
			if game.GameId > 0 then
				getRewardMetadataModule():andThen(function(p2)
					-- upvalues: var5 (copy)
					if p2.responseBody and p2.responseBody.name and p2.responseBody.description then
						var5(p2.responseBody)
					end
				end):catch(function(p2)
					-- upvalues: name (copy)
					name:error(`Error fetching reward metadata: {p2}`)
				end)
			end
		end, {})
	end
	local var6 = useSelector(function(p2)
		return p2.TopBar
	end)
	local var7 = deviceInfo.isConsole()
	local isCompact = var2.modalMode == "compact"
	local promptMessage = var3.promptMessage
	local var8 = promptMessage and #promptMessage > 0
	local var9 = titleHeight + 12
	local var10 = not isCompact and not var7
	
	if var10 then
		var9 += 48
	end
	if var8 then
		var9 += 48
	end
	local var11 = titleHeight
	
	if (if var3.isCoreScript or not var6 or not var6.statusBarHeight then false else true) and var6 then
		var9 += var6.statusBarHeight
		var11 += var6.statusBarHeight
	end
	local var12
	local createElement = reactModule.createElement
	local var13 = "Frame"
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
			Size = UDim2.new(1, 0, 0, var11)
		}, {
			GameInviteTitle = reactModule.createElement(gameInviteTitleModule, {
				layoutOrder = 0,
				size = UDim2.new(1, 0, 0, titleHeight),
				hideCloseButton = p1.hideCloseButton
			})
		}),
		SearchBox = var10 and reactModule.createElement("Frame", {
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
				onFocus = function()
					-- upvalues: gameInviteAnalyticsManagerModule (copy)
					gameInviteAnalyticsManagerModule:onSearchFocused()
				end
			})
		}) or nil,
		CustomTextContainer = var8 and reactModule.createElement(gameInviteCustomTextModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 0, 36),
			promptMessage = promptMessage
		}) or nil
	}
	
	if getFFlagEnableGameInviteRewardsBanner() and var4 ~= nil then
		var12 = reactModule.createElement(gameInviteRewardsBannerModule, { layoutOrder = 2, rewardMetadata = var4 }) or nil
	end
	t_1.RewardsBanner = var12
	t_1.FriendsList = reactModule.createElement(friendsMenuFriendsList, {
		layoutOrder = 3,
		size = UDim2.new(1, 0, 1, -var9),
		parentComponentName = gameInviteConstantsModule.ParentComponentName,
		menuType = friendMenuType.SingleSelect,
		gameDetailsData = var3,
		disableSelectionParentManagement = p1.disableSelectionParentManagement
	})
	
	return createElement(var13, t, t_1)
end

return function(p1)
	-- upvalues: getFFlagEnableCommonFriendsMenu (ref), reactModule (ref), inviteFriendContext (ref), friendsMenuContextWrapper (ref), var1 (ref)
	return if getFFlagEnableCommonFriendsMenu() then reactModule.createElement(friendsMenuContextWrapper, {
		inviteSingleFriend = (if getFFlagEnableCommonFriendsMenu() then reactModule.useContext(inviteFriendContext) else {
			inviteSingleFriend = function() end,
			getMaxRecipientRowNum = function() end
		}).inviteSingleFriend,
		inviteMultiFriends = function() end,
		isLoadingCustomParams = p1.isLoadingCustomParams
	}, { GameInviteContent = reactModule.createElement(var1, p1) }) else reactModule.createElement(var1, p1)
end