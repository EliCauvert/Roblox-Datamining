local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(script.Parent.Parent.Constants)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagPlatformEventEnabledFunction = SharedFlagsModule.GetFFlagPlatformEventEnabled
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local FFlagEnableRMOnMorePageGUAC = SharedFlagsModule.FFlagEnableRMOnMorePageGUAC
local FFlagEnableRMOnMorePageForAll = SharedFlagsModule.FFlagEnableRMOnMorePageForAll
local FFlagLuaAppFixNotificationBadgeCountsSync = SharedFlagsModule.FFlagLuaAppFixNotificationBadgeCountsSync
local FlyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local UseMomentsGatingFunction = require(Parent.MomentsCommon).Hooks.useMomentsGating
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)

local function updateNotifications(p1, p2, p3, p4)
	-- upvalues: FlyoutContentSettingsModule (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy)
	local NotificationCount = 0
	
	if p1.itemType == FlyoutContentSettingsModule.ItemType.Settings then
		NotificationCount = p2.MorePageSettings
	elseif p1.itemType == FlyoutContentSettingsModule.ItemType.Connections then
		NotificationCount = if FFlagLuaAppFixNotificationBadgeCountsSync then p3 else p2.MorePageFriends
	elseif p1.itemType == FlyoutContentSettingsModule.ItemType.Messages then
		NotificationCount = if FFlagLuaAppFixNotificationBadgeCountsSync then p4 else p2.MorePageMessages
	end
	if NotificationCount > 0 and (not p1.notificationCount or p1.notificationCount ~= NotificationCount) then
		p1.notificationCount = NotificationCount
	end
end

return function()
	-- upvalues: ConstantsModule (copy), UseSelectorFunction (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy), ReactModule (copy), UseAppPolicyFunction (copy), FlyoutGateMomentsTile (copy), UseMomentsGatingFunction (copy), FFlagEnableRMOnMorePageGUAC (copy), FlyoutContentSettingsModule (copy), FFlagEnableBlackbird (copy), FFlagEnableBlackbirdOnFlyoutMenu (copy), updateNotifications (copy), GetFFlagPlatformEventEnabledFunction (copy), GetFStringPlatformEventUrlFunction (copy), FFlagEnableRMOnMorePageForAll (copy), AppPage (copy)
	local FLYOUTDEFAULTPOLICY = ConstantsModule.FLYOUT_DEFAULT_POLICY
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.NotificationBadgeCounts
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		if FFlagLuaAppFixNotificationBadgeCountsSync then
			local FriendsCarousel = p1.FriendsCarousel
			local Requests = FriendsCarousel and (FriendsCarousel.Friends and FriendsCarousel.Friends.requests)
			
			return Requests and Requests.receivedCount or 0
		else
			return 0
		end
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		return FFlagLuaAppFixNotificationBadgeCountsSync and (p1.SocialTab and p1.SocialTab.UnreadConversationCount) or 0
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		return p1.OmniRecommendations and p1.OmniRecommendations.Home
	end)
	local Sorts = UseSelectorResult3 and UseSelectorResult3.sorts or {}
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Sorts (copy), ConstantsModule (upval)
		local Flag: boolean? = nil
		local Flag1: boolean? = nil
		
		for _, sort in pairs(Sorts) do
			if sort.topicId == ConstantsModule.SORT_ID_CONTINUE_PLAYING then
				Flag = true
			elseif sort.topicId == ConstantsModule.SORT_ID_FAVORITES then
				Flag1 = true
			end
		end
		return Flag, Flag1
	end, { Sorts })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getDisablePremiumEntrypoint() or false
	end)
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p1)
		return p1.getDisableBlackbirdEntrypoints() or false
	end)
	local UseAppPolicyResult2 = UseAppPolicyFunction(function(p1)
		return p1.getGiftCardSourceRefOverride()
	end)
	local UseAppPolicyResult3 = UseAppPolicyFunction(function(p1)
		return p1.getRedeemTileEnabled()
	end)
	local UseMomentsGatingResult = if FlyoutGateMomentsTile then UseMomentsGatingFunction() else nil
	local UseAppPolicyResult4 = if FlyoutGateMomentsTile then UseAppPolicyFunction(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end) else false
	local NoFlyoutGateMomentsTile = not FlyoutGateMomentsTile or not FFlagEnableRMOnMorePageGUAC or UseAppPolicyResult4
	local NoUseAppPolicyResult2: boolean = not UseAppPolicyResult2 or UseAppPolicyResult2 == ""
	
	return ReactModule.useMemo(function()
		-- upvalues: FLYOUTDEFAULTPOLICY (copy), FlyoutContentSettingsModule (upval), UseMemoResult2 (copy), UseMemoResult (copy), UseAppPolicyResult (copy), NoUseAppPolicyResult2 (copy), UseAppPolicyResult3 (copy), FFlagEnableBlackbird (upval), FFlagEnableBlackbirdOnFlyoutMenu (upval), UseAppPolicyResult1 (copy), updateNotifications (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy), GetFFlagPlatformEventEnabledFunction (upval), GetFStringPlatformEventUrlFunction (upval), FlyoutGateMomentsTile (upval), UseMomentsGatingResult (copy), FFlagEnableRMOnMorePageForAll (upval), NoFlyoutGateMomentsTile (copy), AppPage (upval)
		local MyLibraryItems = {}
		local AdditionalNavigationItems = {}
		
		for _, Premium in FLYOUTDEFAULTPOLICY.MyLibrary do
			local Item = FlyoutContentSettingsModule.ItemInfo[Premium]
			
			if Item ~= nil and (Premium ~= FlyoutContentSettingsModule.ItemType.Favorites or UseMemoResult2) and (Premium ~= FlyoutContentSettingsModule.ItemType.ContinuePlaying or UseMemoResult) and (Premium ~= FlyoutContentSettingsModule.ItemType.Premium or not UseAppPolicyResult) and (Premium ~= FlyoutContentSettingsModule.ItemType.GiftCards or not NoUseAppPolicyResult2) and (Premium ~= FlyoutContentSettingsModule.ItemType.Redeem or UseAppPolicyResult3) and (not FFlagEnableBlackbird or not FFlagEnableBlackbirdOnFlyoutMenu or Premium ~= FlyoutContentSettingsModule.ItemType.Premium and (Premium ~= FlyoutContentSettingsModule.ItemType.Blackbird or not UseAppPolicyResult1)) then
				local Copy = table.clone(Item)
				updateNotifications(Copy, UseSelectorResult, UseSelectorResult1, UseSelectorResult2)
				table.insert(MyLibraryItems, Copy)
			end
		end
		for _, Moments in FLYOUTDEFAULTPOLICY.AdditionalNavigation do
			local Item = FlyoutContentSettingsModule.ItemInfo[Moments]
			
			if Item ~= nil then
				if Moments == FlyoutContentSettingsModule.ItemType.Events then
					if not GetFFlagPlatformEventEnabledFunction() or GetFStringPlatformEventUrlFunction() == "" then
						continue
					end
				elseif Moments == FlyoutContentSettingsModule.ItemType.Moments and FlyoutGateMomentsTile and (UseMomentsGatingResult == nil or not UseMomentsGatingResult.isFlyoutEntryEnabled) and (not FFlagEnableRMOnMorePageForAll and not NoFlyoutGateMomentsTile) then
					continue
				end
				local Copy = table.clone(Item)
				
				if Moments == FlyoutContentSettingsModule.ItemType.Moments and UseMomentsGatingResult ~= nil and UseMomentsGatingResult.isFlyoutEntryEnabled and UseMomentsGatingResult.platformIntegrationEnabled then
					Copy.context = { appPage = AppPage.Moments }
				end
				table.insert(AdditionalNavigationItems, Copy)
			end
		end
		return {
			myLibraryItems = MyLibraryItems,
			additionalNavigationItems = AdditionalNavigationItems
		}
	end, {
		UseMemoResult2, UseMemoResult, FLYOUTDEFAULTPOLICY, UseSelectorResult,
		UseAppPolicyResult, UseAppPolicyResult1, NoUseAppPolicyResult2,
		if FlyoutGateMomentsTile then NoFlyoutGateMomentsTile else nil,
		UseMomentsGatingResult,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult1 else nil,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult2 else nil
	})
end