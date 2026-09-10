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
local fFlagLuaAppEnableSduiHomePage = sharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local flyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local fFlagFlyoutSidePanelTradesEntryModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelTradesEntry)
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

return function()
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), fFlagLuaAppEnableSduiHomePage (ref), useHomeSortDropDownOptionsModule (ref), reactModule (ref), useAppPolicy (ref), fFlagFlyoutSidePanelTradesEntryModule (ref), fFlagEnableBlackbirdCheck (ref), flyoutGateMomentsTile (ref), fFlagFixMomentsExperienceFallback (ref), useMomentsGating (ref), fFlagGuacMomentsFeatureList (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), fFlagEnableTradesEntryForNonPremium (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableRMOnMorePageForAll (ref), canRenderNativeMoments (ref), appPage (ref)
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
	local var19 = if fFlagFlyoutSidePanelTradesEntryModule then useSelector(function(p1)
		-- upvalues: fFlagEnableBlackbirdCheck (copy)
		local localUserId = p1.Users[p1.LocalUserId]
		
		return if localUserId then localUserId.membership == Enum.MembershipType.Premium or fFlagEnableBlackbirdCheck and localUserId.hasRobloxSubscription == true else false
	end) else false
	local var20 = if flyoutGateMomentsTile or fFlagFixMomentsExperienceFallback then useMomentsGating() else nil
	local var21 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then if fFlagGuacMomentsFeatureList then var20.isAmpPolicyEnabled else useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var22 = not var17 or var17 == ""
	
	return reactModule.useMemo(function()
		-- upvalues: FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), var2 (write), var1 (write), var15 (ref), var22 (ref), var18 (ref), var19 (ref), fFlagEnableTradesEntryForNonPremium (copy), fFlagEnableBlackbird (copy), fFlagEnableBlackbirdOnFlyoutMenu (copy), var16 (ref), updateNotifications (copy), var3 (ref), var4 (ref), var5 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), flyoutGateMomentsTile (copy), var20 (ref), fFlagEnableRMOnMorePageForAll (copy), var21 (ref), fFlagFixMomentsExperienceFallback (copy), canRenderNativeMoments (copy), appPage (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var23 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var23 ~= nil and (v ~= flyoutContentSettingsModule.ItemType.Favorites or var2) and ((v ~= flyoutContentSettingsModule.ItemType.ContinuePlaying or var1) and (v ~= flyoutContentSettingsModule.ItemType.Premium or not var15)) and ((v ~= flyoutContentSettingsModule.ItemType.GiftCards or not var22) and (v ~= flyoutContentSettingsModule.ItemType.Redeem or var18) and (v ~= flyoutContentSettingsModule.ItemType.Trades or var19 or fFlagEnableTradesEntryForNonPremium)) and (not fFlagEnableBlackbird or not fFlagEnableBlackbirdOnFlyoutMenu or v ~= flyoutContentSettingsModule.ItemType.Premium and (v ~= flyoutContentSettingsModule.ItemType.Blackbird or not var16)) then
				local cloned = table.clone(var23)
				updateNotifications(cloned, var3, var4, var5)
				table.insert(t, cloned)
			end
		end
		for i, v in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var24 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var24 ~= nil then
				if v == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						local cloned = table.clone(var24)
						
						if v == flyoutContentSettingsModule.ItemType.Moments and var20 ~= nil then
							if fFlagFixMomentsExperienceFallback then
								cloned.context = if canRenderNativeMoments(var20) then { appPage = appPage.Moments } else {
									appUri = flyoutContentSettingsModule.MomentsExperienceUri
								}
							elseif var20.isFlyoutEntryEnabled and var20.platformIntegrationEnabled then
								cloned.context = { appPage = appPage.Moments }
							end
						end
						table.insert(t_1, cloned)
					end
				elseif v ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile or var20 ~= nil and var20.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var21) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var2, var1, FLYOUT_DEFAULT_POLICY, var3, var15, var16, var22,
		if fFlagFlyoutSidePanelTradesEntryModule then var19 else nil,
		if flyoutGateMomentsTile then var21 else nil, var20,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var4 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var5 else nil
	})
end