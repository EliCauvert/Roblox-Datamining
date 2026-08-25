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

local function updateNotifications(p0, p1, p2, p3)
	-- upvalues: flyoutContentSettingsModule (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var8 = 0
	
	if p0.itemType == flyoutContentSettingsModule.ItemType.Settings then
		var8 = p1.MorePageSettings
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Connections then
		var8 = if fFlagLuaAppFixNotificationBadgeCountsSync then p2 else p1.MorePageFriends
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Messages then
		var8 = if fFlagLuaAppFixNotificationBadgeCountsSync then p3 else p1.MorePageMessages
	end
	if var8 > 0 and (not p0.notificationCount or p0.notificationCount ~= var8) then
		p0.notificationCount = var8
	end
end

return function()
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), reactModule (ref), useAppPolicy (ref), fFlagFlyoutSidePanelTradesEntryModule (ref), fFlagEnableBlackbirdCheck (ref), flyoutGateMomentsTile (ref), fFlagFixMomentsExperienceFallback (ref), useMomentsGating (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), fFlagEnableTradesEntryForNonPremium (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableRMOnMorePageForAll (ref), canRenderNativeMoments (ref), appPage (ref)
	local FLYOUT_DEFAULT_POLICY = constantsModule.FLYOUT_DEFAULT_POLICY
	local var9 = useSelector(function(p4)
		return p4.NotificationBadgeCounts
	end)
	local var10 = useSelector(function(p5)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p5.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end)
	local var11 = useSelector(function(p6)
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p6.SocialTab then p6.SocialTab.UnreadConversationCount else 0 else 0
	end)
	local var12 = useSelector(function(p7)
		return p7.OmniRecommendations and p7.OmniRecommendations.Home
	end)
	local var13 = if var12 then var12.sorts else {}
	local var14, var15 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), constantsModule (copy)
		local var25 = nil
		local var26 = nil
		
		for i, v in pairs(var13) do
			if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
				var25 = true
			elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
				var26 = true
			end
		end
		return var25, var26
	end, { var13 })
	local var16 = useAppPolicy(function(p8)
		return p8.getDisablePremiumEntrypoint() or false
	end)
	local var17 = useAppPolicy(function(p9)
		return p9.getDisableBlackbirdEntrypoints() or false
	end)
	local var18 = useAppPolicy(function(p10)
		return p10.getGiftCardSourceRefOverride()
	end)
	local var19 = useAppPolicy(function(p11)
		return p11.getRedeemTileEnabled()
	end)
	local var20 = if fFlagFlyoutSidePanelTradesEntryModule then useSelector(function(p12)
		-- upvalues: fFlagEnableBlackbirdCheck (copy)
		local localUserId = p12.Users[p12.LocalUserId]
		
		return if localUserId then localUserId.membership == Enum.MembershipType.Premium or fFlagEnableBlackbirdCheck and localUserId.hasRobloxSubscription == true else false
	end) else false
	local var21 = if flyoutGateMomentsTile or fFlagFixMomentsExperienceFallback then useMomentsGating() else nil
	local var22 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then useAppPolicy(function(p13)
		return p13.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var23 = not var18 or var18 == ""
	
	return reactModule.useMemo(function()
		-- upvalues: FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), var15 (ref), var14 (ref), var16 (ref), var23 (ref), var19 (ref), var20 (ref), fFlagEnableTradesEntryForNonPremium (copy), fFlagEnableBlackbird (copy), fFlagEnableBlackbirdOnFlyoutMenu (copy), var17 (ref), updateNotifications (copy), var9 (ref), var10 (ref), var11 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), flyoutGateMomentsTile (copy), var21 (ref), fFlagEnableRMOnMorePageForAll (copy), var22 (ref), fFlagFixMomentsExperienceFallback (copy), canRenderNativeMoments (copy), appPage (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var31 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var31 ~= nil and (v ~= flyoutContentSettingsModule.ItemType.Favorites or var15) and ((v ~= flyoutContentSettingsModule.ItemType.ContinuePlaying or var14) and (v ~= flyoutContentSettingsModule.ItemType.Premium or not var16)) and ((v ~= flyoutContentSettingsModule.ItemType.GiftCards or not var23) and (v ~= flyoutContentSettingsModule.ItemType.Redeem or var19) and (v ~= flyoutContentSettingsModule.ItemType.Trades or var20 or fFlagEnableTradesEntryForNonPremium)) and (not fFlagEnableBlackbird or not fFlagEnableBlackbirdOnFlyoutMenu or v ~= flyoutContentSettingsModule.ItemType.Premium and (v ~= flyoutContentSettingsModule.ItemType.Blackbird or not var17)) then
				local cloned = table.clone(var31)
				updateNotifications(cloned, var9, var10, var11)
				table.insert(t, cloned)
			end
		end
		for i, v in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var29 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var29 ~= nil then
				if v == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						local cloned = table.clone(var29)
						
						if v == flyoutContentSettingsModule.ItemType.Moments and var21 ~= nil then
							if fFlagFixMomentsExperienceFallback then
								cloned.context = if canRenderNativeMoments(var21) then { appPage = appPage.Moments } else {
									appUri = flyoutContentSettingsModule.MomentsExperienceUri
								}
							elseif var21.isFlyoutEntryEnabled and var21.platformIntegrationEnabled then
								cloned.context = { appPage = appPage.Moments }
							end
						end
						table.insert(t_1, cloned)
					end
				elseif v ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile or var21 ~= nil and var21.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var22) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var15, var14, FLYOUT_DEFAULT_POLICY, var9, var16, var17, var23,
		if fFlagFlyoutSidePanelTradesEntryModule then var20 else nil,
		if flyoutGateMomentsTile then var22 else nil, var21,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var10 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var11 else nil
	})
end