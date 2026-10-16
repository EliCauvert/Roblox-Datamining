local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(script.Parent.Parent.Constants)
local appPage = require(parent.RobloxAppEnums).AppPage
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useHomeSortDropDownOptionsModule = require(parent.Home.useHomeSortDropDownOptions)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagPlatformEventEnabled = sharedFlagsModule.GetFFlagPlatformEventEnabled
local getFStringPlatformEventUrl = sharedFlagsModule.GetFStringPlatformEventUrl
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagEnableRMOnMorePageGUAC = sharedFlagsModule.FFlagEnableRMOnMorePageGUAC
local fFlagEnableRMOnMorePageForAll = sharedFlagsModule.FFlagEnableRMOnMorePageForAll
local fFlagLuaAppFixNotificationBadgeCountsSync = sharedFlagsModule.FFlagLuaAppFixNotificationBadgeCountsSync
local fFlagFixMomentsExperienceFallback = sharedFlagsModule.FFlagFixMomentsExperienceFallback
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local fFlagFlyoutRemoveMomentsForArgoEnabled = sharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagArgoEnableMoments = sharedFlagsModule.FFlagArgoEnableMoments
local fFlagLuaAppEnableSduiHomePage = sharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local flyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local fFlagFlyoutFilterWebViewsAndBrowserLinks = sharedFlagsModule.FFlagFlyoutFilterWebViewsAndBrowserLinks
local fFlagFlyoutSidePanelTradesEntryModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelTradesEntry)
local fFlagFlyoutHideSortDeeplinkItemsModule = require(script.Parent.Parent.Flags.FFlagFlyoutHideSortDeeplinkItems)
local fFlagFlyoutGateLearnPlace = sharedFlagsModule.FFlagFlyoutGateLearnPlace
local fFlagEnableTradesEntryForNonPremium = sharedFlagsModule.FFlagEnableTradesEntryForNonPremium
local momentsCommonModule = require(parent.MomentsCommon)
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating
local canRenderNativeMoments = momentsCommonModule.canRenderNativeMoments
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)

local function updateNotifications(p1, p2, p3, p4)
	-- upvalues: flyoutContentSettingsModule (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var1 = 0
	
	if p1.itemType == flyoutContentSettingsModule.ItemType.Settings then
		var1 = p2.MorePageSettings
	elseif p1.itemType == flyoutContentSettingsModule.ItemType.Connections then
		var1 = if fFlagLuaAppFixNotificationBadgeCountsSync then p3 else p2.MorePageFriends
	elseif p1.itemType == flyoutContentSettingsModule.ItemType.Messages then
		var1 = if fFlagLuaAppFixNotificationBadgeCountsSync then p4 else p2.MorePageMessages
	end
	if var1 > 0 and (not p1.notificationCount or p1.notificationCount ~= var1) then
		p1.notificationCount = var1
	end
end

local function shouldSkipLibraryItem(p1, p2, p3)
	-- upvalues: fFlagFlyoutHideSortDeeplinkItemsModule (ref), flyoutContentSettingsModule (ref), fFlagFlyoutFilterWebViewsAndBrowserLinks (ref), fFlagEnableTradesEntryForNonPremium (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref)
	if p2 == nil then
		return true
	elseif fFlagFlyoutHideSortDeeplinkItemsModule and flyoutContentSettingsModule.itemIsGameSortDeeplink(p2) then
		return true
	elseif fFlagFlyoutFilterWebViewsAndBrowserLinks and not p3.webViewSupported and flyoutContentSettingsModule.itemRequiresWebView(p2, p3.externalBrowserAllowed) then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.Favorites and not p3.hasFavoritesData then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.ContinuePlaying and not p3.hasContinueData then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.Premium and p3.disablePremiumEntrypoint then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.GiftCards and p3.hideGiftCards then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.Redeem and not p3.redeemTileEnabled then
		return true
	elseif p1 == flyoutContentSettingsModule.ItemType.Trades and not p3.hasPaidTradingAccess and not fFlagEnableTradesEntryForNonPremium then
		return true
	elseif fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu then
		return p1 == flyoutContentSettingsModule.ItemType.Premium or p1 == flyoutContentSettingsModule.ItemType.Blackbird and p3.disableBlackbirdEntrypoints
	end
end

return function()
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), fFlagLuaAppEnableSduiHomePage (ref), useHomeSortDropDownOptionsModule (ref), reactModule (ref), useAppPolicy (ref), fFlagFlyoutGateLearnPlace (ref), fFlagFlyoutFilterWebViewsAndBrowserLinks (ref), fFlagFlyoutSidePanelTradesEntryModule (ref), fFlagEnableBlackbirdCheck (ref), flyoutGateMomentsTile (ref), fFlagFixMomentsExperienceFallback (ref), fFlagFlyoutRemoveMomentsForArgoEnabled (ref), useMomentsGating (ref), fFlagGuacMomentsFeatureList (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), shouldSkipLibraryItem (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableArgus (ref), fFlagArgoEnableMoments (ref), fFlagEnableRMOnMorePageForAll (ref), canRenderNativeMoments (ref), appPage (ref)
	local var1, var2
	local FLYOUT_DEFAULT_POLICY = constantsModule.FLYOUT_DEFAULT_POLICY
	local var3 = useSelector(function(p1)
		return p1.NotificationBadgeCounts
	end)
	local var4 = useSelector(function(p1)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p1.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end)
	local var5 = useSelector(function(p1)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p1.SocialTab then p1.SocialTab.UnreadConversationCount else 0 else 0
	end)
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppEnableSduiHomePage then
		local var6 = useHomeSortDropDownOptionsModule()
		local var7, var8 = reactModule.useMemo(function()
			-- upvalues: var6 (ref), constantsModule (copy)
			local var9 = nil
			local var10 = nil
			
			for i, v in var6 do
				if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
					var9 = true
				elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
					var10 = true
				end
			end
			return var9, var10
		end, { var6 })
		var1 = var7
		var2 = var8
	else
		local var11 = useSelector(function(p1)
			return p1.OmniRecommendations and p1.OmniRecommendations.Home
		end)
		local var12 = if var11 then var11.sorts else {}
		local var13, var14 = reactModule.useMemo(function()
			-- upvalues: var12 (ref), constantsModule (copy)
			local var15 = nil
			local var16 = nil
			
			for i, v in pairs(var12) do
				if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
					var15 = true
				elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
					var16 = true
				end
			end
			return var15, var16
		end, { var12 })
		var1 = var13
		var2 = var14
	end
	local var15 = useAppPolicy(function(p1)
		return p1.getDisablePremiumEntrypoint() or false
	end)
	local var16 = useAppPolicy(function(p1)
		return p1.getDisableBlackbirdEntrypoints() or false
	end)
	local var17 = useAppPolicy(function(p1)
		return p1.getGiftCardSourceRefOverride()
	end)
	local var18 = useAppPolicy(function(p1)
		return p1.getRedeemTileEnabled()
	end)
	local var19 = if fFlagFlyoutGateLearnPlace then useAppPolicy(function(p1)
		return p1.getLearnPlaceEnabled()
	end) else true
	local var20 = if fFlagFlyoutFilterWebViewsAndBrowserLinks then useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end) else true
	local var21 = if fFlagFlyoutFilterWebViewsAndBrowserLinks then useAppPolicy(function(p1)
		return p1.shouldUseExternalBrowserForMorePageItem()
	end) else false
	local var22 = if fFlagFlyoutSidePanelTradesEntryModule then useSelector(function(p1)
		-- upvalues: fFlagEnableBlackbirdCheck (copy)
		local localUserId = p1.Users[p1.LocalUserId]
		
		return if localUserId then localUserId.membership == Enum.MembershipType.Premium or fFlagEnableBlackbirdCheck and localUserId.hasRobloxSubscription == true else false
	end) else false
	local var23 = if flyoutGateMomentsTile or fFlagFixMomentsExperienceFallback or fFlagFlyoutRemoveMomentsForArgoEnabled then useMomentsGating() else nil
	local var24 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then if fFlagGuacMomentsFeatureList then var23.isAmpPolicyEnabled else useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var25 = not var17 or var17 == ""
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (write), var1 (write), var15 (ref), var25 (ref), var18 (ref), var22 (ref), var16 (ref), var20 (ref), var21 (ref), FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), shouldSkipLibraryItem (copy), updateNotifications (copy), var3 (ref), var4 (ref), var5 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), fFlagFlyoutGateLearnPlace (copy), var19 (ref), flyoutGateMomentsTile (copy), fFlagFlyoutRemoveMomentsForArgoEnabled (copy), fFlagEnableArgus (copy), fFlagArgoEnableMoments (copy), var23 (ref), fFlagEnableRMOnMorePageForAll (copy), var24 (ref), fFlagFlyoutFilterWebViewsAndBrowserLinks (copy), fFlagFixMomentsExperienceFallback (copy), canRenderNativeMoments (copy), appPage (copy)
		local t = {}
		local t_1 = {}
		local t_2 = {
			hasFavoritesData = var2,
			hasContinueData = var1,
			disablePremiumEntrypoint = var15,
			hideGiftCards = var25,
			redeemTileEnabled = var18,
			hasPaidTradingAccess = var22,
			disableBlackbirdEntrypoints = var16,
			webViewSupported = var20,
			externalBrowserAllowed = var21
		}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var26 = flyoutContentSettingsModule.ItemInfo[v]
			
			if not shouldSkipLibraryItem(v, var26, t_2) then
				local cloned = table.clone(var26)
				updateNotifications(cloned, var3, var4, var5)
				table.insert(t, cloned)
			end
		end
		for i, v_1 in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var27 = flyoutContentSettingsModule.ItemInfo[v_1]
			
			if var27 ~= nil then
				if v_1 == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						if not fFlagFlyoutFilterWebViewsAndBrowserLinks or var20 or not flyoutContentSettingsModule.itemRequiresWebView(var27, var21) then
							local cloned = table.clone(var27)
							
							if v_1 == flyoutContentSettingsModule.ItemType.Moments and var23 ~= nil then
								if fFlagFixMomentsExperienceFallback then
									cloned.context = if canRenderNativeMoments(var23) then {
										appPage = appPage.Moments,
										destinationType = flyoutContentSettingsModule.DestinationType.AppPage
									} else {
										appUri = flyoutContentSettingsModule.MomentsExperienceUri,
										destinationType = flyoutContentSettingsModule.DestinationType.PlaceLaunch
									}
								elseif var23.isFlyoutEntryEnabled and var23.platformIntegrationEnabled then
									cloned.context = {
										appPage = appPage.Moments,
										destinationType = flyoutContentSettingsModule.DestinationType.AppPage
									}
								end
							end
							table.insert(t_1, cloned)
						end
					end
				elseif v_1 == flyoutContentSettingsModule.ItemType.Learn and fFlagFlyoutGateLearnPlace then
					if var19 then
					end
				elseif v_1 ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile and not fFlagFlyoutRemoveMomentsForArgoEnabled or (not fFlagFlyoutRemoveMomentsForArgoEnabled or not fFlagEnableArgus or not fFlagArgoEnableMoments) and (not fFlagFlyoutRemoveMomentsForArgoEnabled or var23 == nil or var23.isSupportedOnPlatform) and (not flyoutGateMomentsTile or var23 ~= nil and var23.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var24)) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var2, var1, FLYOUT_DEFAULT_POLICY, var3, var15, var16, var25,
		if fFlagFlyoutFilterWebViewsAndBrowserLinks then var20 else nil,
		if fFlagFlyoutFilterWebViewsAndBrowserLinks then var21 else nil,
		if fFlagFlyoutSidePanelTradesEntryModule then var22 else nil,
		if flyoutGateMomentsTile then var24 else nil,
		if fFlagFlyoutGateLearnPlace then var19 else nil, var23,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var4 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var5 else nil
	})
end