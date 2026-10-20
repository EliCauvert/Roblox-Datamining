local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(script.Parent.Parent.Constants)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseHomeSortDropDownOptionsModule = require(Parent.Home.useHomeSortDropDownOptions)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagPlatformEventEnabledFunction = SharedFlagsModule.GetFFlagPlatformEventEnabled
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagEnableRMOnMorePageGUAC = SharedFlagsModule.FFlagEnableRMOnMorePageGUAC
local FFlagEnableRMOnMorePageForAll = SharedFlagsModule.FFlagEnableRMOnMorePageForAll
local FFlagLuaAppFixNotificationBadgeCountsSync = SharedFlagsModule.FFlagLuaAppFixNotificationBadgeCountsSync
local FFlagFixMomentsExperienceFallback = SharedFlagsModule.FFlagFixMomentsExperienceFallback
local FFlagFlyoutRemoveMomentsForArgoEnabled = SharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local FFlagLuaAppEnableSduiHomePage = SharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local FlyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local FFlagFlyoutFilterWebViewsAndBrowserLinks = SharedFlagsModule.FFlagFlyoutFilterWebViewsAndBrowserLinks
local FFlagFlyoutSidePanelTradesEntryModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelTradesEntry)
local FFlagFlyoutHideSortDeeplinkItemsModule = require(script.Parent.Parent.Flags.FFlagFlyoutHideSortDeeplinkItems)
local FFlagFlyoutGateLearnPlace = SharedFlagsModule.FFlagFlyoutGateLearnPlace
local FFlagEnableTradesEntryForNonPremium = SharedFlagsModule.FFlagEnableTradesEntryForNonPremium
local MomentsCommonModule = require(Parent.MomentsCommon)
local UseMomentsGatingFunction = MomentsCommonModule.Hooks.useMomentsGating
local CanRenderNativeMomentsFunction = MomentsCommonModule.canRenderNativeMoments
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

local function shouldSkipLibraryItem(Premium, Item, p1): boolean
	-- upvalues: FFlagFlyoutHideSortDeeplinkItemsModule (copy), FlyoutContentSettingsModule (copy), FFlagFlyoutFilterWebViewsAndBrowserLinks (copy), FFlagEnableTradesEntryForNonPremium (copy), FFlagEnableBlackbird (copy), FFlagEnableBlackbirdOnFlyoutMenu (copy)
	if Item == nil then
		return true
	elseif FFlagFlyoutHideSortDeeplinkItemsModule and FlyoutContentSettingsModule.itemIsGameSortDeeplink(Item) then
		return true
	elseif FFlagFlyoutFilterWebViewsAndBrowserLinks and not p1.webViewSupported and FlyoutContentSettingsModule.itemRequiresWebView(Item, p1.externalBrowserAllowed) then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.Favorites and not p1.hasFavoritesData then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.ContinuePlaying and not p1.hasContinueData then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.Premium and p1.disablePremiumEntrypoint then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.GiftCards and p1.hideGiftCards then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.Redeem and not p1.redeemTileEnabled then
		return true
	elseif Premium == FlyoutContentSettingsModule.ItemType.Trades and not p1.hasPaidTradingAccess and not FFlagEnableTradesEntryForNonPremium then
		return true
	elseif FFlagEnableBlackbird and FFlagEnableBlackbirdOnFlyoutMenu then
		if Premium == FlyoutContentSettingsModule.ItemType.Premium then
			return true
		elseif Premium == FlyoutContentSettingsModule.ItemType.Blackbird and p1.disableBlackbirdEntrypoints then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: ConstantsModule (copy), UseSelectorFunction (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy), FFlagLuaAppEnableSduiHomePage (copy), UseHomeSortDropDownOptionsModule (copy), ReactModule (copy), UseAppPolicyFunction (copy), FFlagFlyoutGateLearnPlace (copy), FFlagFlyoutFilterWebViewsAndBrowserLinks (copy), FFlagFlyoutSidePanelTradesEntryModule (copy), FFlagEnableBlackbirdCheck (copy), FlyoutGateMomentsTile (copy), FFlagFixMomentsExperienceFallback (copy), FFlagFlyoutRemoveMomentsForArgoEnabled (copy), UseMomentsGatingFunction (copy), FFlagEnableRMOnMorePageGUAC (copy), FlyoutContentSettingsModule (copy), shouldSkipLibraryItem (copy), updateNotifications (copy), GetFFlagPlatformEventEnabledFunction (copy), GetFStringPlatformEventUrlFunction (copy), FFlagEnableArgus (copy), FFlagArgoEnableMoments (copy), FFlagEnableRMOnMorePageForAll (copy), CanRenderNativeMomentsFunction (copy), AppPage (copy)
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
	local UseMemoResult = nil
	local UseMemoResult2 = nil
	
	if FFlagLuaAppEnableSduiHomePage then
		local UseHomeSortDropDownOptionsModuleResult = UseHomeSortDropDownOptionsModule()
		UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: UseHomeSortDropDownOptionsModuleResult (copy), ConstantsModule (upval)
			local Flag: boolean? = nil
			local Flag1: boolean? = nil
			
			for _, value in UseHomeSortDropDownOptionsModuleResult do
				if value.topicId == ConstantsModule.SORT_ID_CONTINUE_PLAYING then
					Flag = true
				elseif value.topicId == ConstantsModule.SORT_ID_FAVORITES then
					Flag1 = true
				end
			end
			return Flag, Flag1
		end, { UseHomeSortDropDownOptionsModuleResult })
	else
		local UseSelectorResult3 = UseSelectorFunction(function(p1)
			return p1.OmniRecommendations and p1.OmniRecommendations.Home
		end)
		local Sorts = UseSelectorResult3 and UseSelectorResult3.sorts or {}
		UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
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
	end
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
	local NoFFlagFlyoutGateLearnPlace = not FFlagFlyoutGateLearnPlace or UseAppPolicyFunction(function(p1)
		return p1.getLearnPlaceEnabled()
	end)
	local NoFFlagFlyoutFilterWebViewsAndBrowserLinks = not FFlagFlyoutFilterWebViewsAndBrowserLinks or UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseAppPolicyResult4 = if FFlagFlyoutFilterWebViewsAndBrowserLinks then UseAppPolicyFunction(function(p1)
		return p1.shouldUseExternalBrowserForMorePageItem()
	end) else false
	local UseSelectorResult4 = if FFlagFlyoutSidePanelTradesEntryModule then UseSelectorFunction(function(p1): boolean
		-- upvalues: FFlagEnableBlackbirdCheck (upval)
		local User = p1.Users[p1.LocalUserId]
		
		if User then
			local IsHasRobloxSubscription: boolean = FFlagEnableBlackbirdCheck and User.hasRobloxSubscription == true
			
			return User.membership == Enum.MembershipType.Premium or IsHasRobloxSubscription
		else
			return false
		end
	end) else false
	local UseMomentsGatingResult = if FlyoutGateMomentsTile or FFlagFixMomentsExperienceFallback or FFlagFlyoutRemoveMomentsForArgoEnabled then UseMomentsGatingFunction() else nil
	local IsAmpPolicyEnabled = if FlyoutGateMomentsTile then UseMomentsGatingResult.isAmpPolicyEnabled else false
	local NoFlyoutGateMomentsTile = not FlyoutGateMomentsTile or not FFlagEnableRMOnMorePageGUAC or IsAmpPolicyEnabled
	local NoUseAppPolicyResult2: boolean = not UseAppPolicyResult2 or UseAppPolicyResult2 == ""
	
	return ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (ref), UseMemoResult (ref), UseAppPolicyResult (copy), NoUseAppPolicyResult2 (copy), UseAppPolicyResult3 (copy), UseSelectorResult4 (copy), UseAppPolicyResult1 (copy), NoFFlagFlyoutFilterWebViewsAndBrowserLinks (copy), UseAppPolicyResult4 (copy), FLYOUTDEFAULTPOLICY (copy), FlyoutContentSettingsModule (upval), shouldSkipLibraryItem (upval), updateNotifications (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy), GetFFlagPlatformEventEnabledFunction (upval), GetFStringPlatformEventUrlFunction (upval), FFlagFlyoutGateLearnPlace (upval), NoFFlagFlyoutGateLearnPlace (copy), FlyoutGateMomentsTile (upval), FFlagFlyoutRemoveMomentsForArgoEnabled (upval), FFlagEnableArgus (upval), FFlagArgoEnableMoments (upval), UseMomentsGatingResult (copy), FFlagEnableRMOnMorePageForAll (upval), NoFlyoutGateMomentsTile (copy), FFlagFlyoutFilterWebViewsAndBrowserLinks (upval), FFlagFixMomentsExperienceFallback (upval), CanRenderNativeMomentsFunction (upval), AppPage (upval)
		local MyLibraryItems = {}
		local AdditionalNavigationItems = {}
		local config = {
			hasFavoritesData = UseMemoResult2,
			hasContinueData = UseMemoResult,
			disablePremiumEntrypoint = UseAppPolicyResult,
			hideGiftCards = NoUseAppPolicyResult2,
			redeemTileEnabled = UseAppPolicyResult3,
			hasPaidTradingAccess = UseSelectorResult4,
			disableBlackbirdEntrypoints = UseAppPolicyResult1,
			webViewSupported = NoFFlagFlyoutFilterWebViewsAndBrowserLinks,
			externalBrowserAllowed = UseAppPolicyResult4
		}
		
		for _, value in FLYOUTDEFAULTPOLICY.MyLibrary do
			local Item = FlyoutContentSettingsModule.ItemInfo[value]
			
			if not shouldSkipLibraryItem(value, Item, config) then
				local Copy = table.clone(Item)
				updateNotifications(Copy, UseSelectorResult, UseSelectorResult1, UseSelectorResult2)
				table.insert(MyLibraryItems, Copy)
			end
		end
		for _, Moments in FLYOUTDEFAULTPOLICY.AdditionalNavigation do
			local Item = FlyoutContentSettingsModule.ItemInfo[Moments]
			
			if Item ~= nil then
				if Moments == FlyoutContentSettingsModule.ItemType.Events then
					if not GetFFlagPlatformEventEnabledFunction() or GetFStringPlatformEventUrlFunction() == "" then continue end
				elseif Moments == FlyoutContentSettingsModule.ItemType.Learn and FFlagFlyoutGateLearnPlace then
					if not NoFFlagFlyoutGateLearnPlace then
						continue
					end
				elseif Moments == FlyoutContentSettingsModule.ItemType.Moments and (FlyoutGateMomentsTile or FFlagFlyoutRemoveMomentsForArgoEnabled) and (FFlagFlyoutRemoveMomentsForArgoEnabled and FFlagEnableArgus and FFlagArgoEnableMoments or FFlagFlyoutRemoveMomentsForArgoEnabled and UseMomentsGatingResult ~= nil and not UseMomentsGatingResult.isSupportedOnPlatform or FlyoutGateMomentsTile and (UseMomentsGatingResult == nil or not UseMomentsGatingResult.isFlyoutEntryEnabled) and (not FFlagEnableRMOnMorePageForAll and not NoFlyoutGateMomentsTile)) then
					continue
				end
				if not FFlagFlyoutFilterWebViewsAndBrowserLinks or NoFFlagFlyoutFilterWebViewsAndBrowserLinks or not FlyoutContentSettingsModule.itemRequiresWebView(Item, UseAppPolicyResult4) then
					local Copy = table.clone(Item)
					
					if Moments == FlyoutContentSettingsModule.ItemType.Moments and UseMomentsGatingResult ~= nil then
						if FFlagFixMomentsExperienceFallback then
							Copy.context = if CanRenderNativeMomentsFunction(UseMomentsGatingResult) then {
								appPage = AppPage.Moments,
								destinationType = FlyoutContentSettingsModule.DestinationType.AppPage
							} else {
								appUri = FlyoutContentSettingsModule.MomentsExperienceUri,
								destinationType = FlyoutContentSettingsModule.DestinationType.PlaceLaunch
							}
						elseif UseMomentsGatingResult.isFlyoutEntryEnabled and UseMomentsGatingResult.platformIntegrationEnabled then
							Copy.context = {
								appPage = AppPage.Moments,
								destinationType = FlyoutContentSettingsModule.DestinationType.AppPage
							}
						end
					end
					table.insert(AdditionalNavigationItems, Copy)
				end
			end
		end
		return {
			myLibraryItems = MyLibraryItems,
			additionalNavigationItems = AdditionalNavigationItems
		}
	end, {
		UseMemoResult2, UseMemoResult, FLYOUTDEFAULTPOLICY, UseSelectorResult,
		UseAppPolicyResult, UseAppPolicyResult1, NoUseAppPolicyResult2,
		if FFlagFlyoutFilterWebViewsAndBrowserLinks then NoFFlagFlyoutFilterWebViewsAndBrowserLinks else nil,
		if FFlagFlyoutFilterWebViewsAndBrowserLinks then UseAppPolicyResult4 else nil,
		if FFlagFlyoutSidePanelTradesEntryModule then UseSelectorResult4 else nil,
		if FlyoutGateMomentsTile then NoFlyoutGateMomentsTile else nil,
		if FFlagFlyoutGateLearnPlace then NoFFlagFlyoutGateLearnPlace else nil,
		UseMomentsGatingResult,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult1 else nil,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult2 else nil
	})
end