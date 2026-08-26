local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(script.Parent.Parent.Constants)
local appPage = require(parent.RobloxAppEnums).AppPage
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
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
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), reactModule (ref), useAppPolicy (ref), fFlagFlyoutSidePanelTradesEntryModule (ref), fFlagEnableBlackbirdCheck (ref), flyoutGateMomentsTile (ref), fFlagFixMomentsExperienceFallback (ref), useMomentsGating (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), fFlagEnableTradesEntryForNonPremium (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableRMOnMorePageForAll (ref), canRenderNativeMoments (ref), appPage (ref)
	local FLYOUT_DEFAULT_POLICY = constantsModule.FLYOUT_DEFAULT_POLICY
	local var1 = useSelector(function(p1)
		return p1.NotificationBadgeCounts
	end)
	local var2 = useSelector(function(p1)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p1.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end)
	local var3 = useSelector(function(p1)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p1.SocialTab then p1.SocialTab.UnreadConversationCount else 0 else 0
	end)
	local var4 = useSelector(function(p1)
		return p1.OmniRecommendations and p1.OmniRecommendations.Home
	end)
	local var5 = if var4 then var4.sorts else {}
	local var6, var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), constantsModule (copy)
		local var8 = nil
		local var9 = nil
		
		for i, v in pairs(var5) do
			if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
				var8 = true
			elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
				var9 = true
			end
		end
		return var8, var9
	end, { var5 })
	local var10 = useAppPolicy(function(p1)
		return p1.getDisablePremiumEntrypoint() or false
	end)
	local var11 = useAppPolicy(function(p1)
		return p1.getDisableBlackbirdEntrypoints() or false
	end)
	local var12 = useAppPolicy(function(p1)
		return p1.getGiftCardSourceRefOverride()
	end)
	local var13 = useAppPolicy(function(p1)
		return p1.getRedeemTileEnabled()
	end)
	local var14 = if fFlagFlyoutSidePanelTradesEntryModule then useSelector(function(p1)
		-- upvalues: fFlagEnableBlackbirdCheck (copy)
		local localUserId = p1.Users[p1.LocalUserId]
		
		return if localUserId then localUserId.membership == Enum.MembershipType.Premium or fFlagEnableBlackbirdCheck and localUserId.hasRobloxSubscription == true else false
	end) else false
	local var15 = if flyoutGateMomentsTile or fFlagFixMomentsExperienceFallback then useMomentsGating() else nil
	local var16 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var17 = not var12 or var12 == ""
	
	return reactModule.useMemo(function()
		-- upvalues: FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), var7 (ref), var6 (ref), var10 (ref), var17 (ref), var13 (ref), var14 (ref), fFlagEnableTradesEntryForNonPremium (copy), fFlagEnableBlackbird (copy), fFlagEnableBlackbirdOnFlyoutMenu (copy), var11 (ref), updateNotifications (copy), var1 (ref), var2 (ref), var3 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), flyoutGateMomentsTile (copy), var15 (ref), fFlagEnableRMOnMorePageForAll (copy), var16 (ref), fFlagFixMomentsExperienceFallback (copy), canRenderNativeMoments (copy), appPage (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var18 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var18 ~= nil and (v ~= flyoutContentSettingsModule.ItemType.Favorites or var7) and ((v ~= flyoutContentSettingsModule.ItemType.ContinuePlaying or var6) and (v ~= flyoutContentSettingsModule.ItemType.Premium or not var10)) and ((v ~= flyoutContentSettingsModule.ItemType.GiftCards or not var17) and (v ~= flyoutContentSettingsModule.ItemType.Redeem or var13) and (v ~= flyoutContentSettingsModule.ItemType.Trades or var14 or fFlagEnableTradesEntryForNonPremium)) and (not fFlagEnableBlackbird or not fFlagEnableBlackbirdOnFlyoutMenu or v ~= flyoutContentSettingsModule.ItemType.Premium and (v ~= flyoutContentSettingsModule.ItemType.Blackbird or not var11)) then
				local cloned = table.clone(var18)
				updateNotifications(cloned, var1, var2, var3)
				table.insert(t, cloned)
			end
		end
		for i, v in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var19 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var19 ~= nil then
				if v == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						local cloned = table.clone(var19)
						
						if v == flyoutContentSettingsModule.ItemType.Moments and var15 ~= nil then
							if fFlagFixMomentsExperienceFallback then
								cloned.context = if canRenderNativeMoments(var15) then { appPage = appPage.Moments } else {
									appUri = flyoutContentSettingsModule.MomentsExperienceUri
								}
							elseif var15.isFlyoutEntryEnabled and var15.platformIntegrationEnabled then
								cloned.context = { appPage = appPage.Moments }
							end
						end
						table.insert(t_1, cloned)
					end
				elseif v ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile or var15 ~= nil and var15.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var16) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var7, var6, FLYOUT_DEFAULT_POLICY, var1, var10, var11, var17,
		if fFlagFlyoutSidePanelTradesEntryModule then var14 else nil,
		if flyoutGateMomentsTile then var16 else nil, var15,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var2 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var3 else nil
	})
end