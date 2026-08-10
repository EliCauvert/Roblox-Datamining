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
local fFlagEnableRMOnMorePageGUAC = sharedFlagsModule.FFlagEnableRMOnMorePageGUAC
local fFlagEnableRMOnMorePageForAll = sharedFlagsModule.FFlagEnableRMOnMorePageForAll
local fFlagLuaAppFixNotificationBadgeCountsSync = sharedFlagsModule.FFlagLuaAppFixNotificationBadgeCountsSync
local fFlagFixMomentsExperienceFallback = sharedFlagsModule.FFlagFixMomentsExperienceFallback
local flyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local momentsCommonModule = require(parent.MomentsCommon)
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating
local canRenderNativeMoments = momentsCommonModule.canRenderNativeMoments
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)

local function updateNotifications(p0, p1, p2, p3) --[[ line: 25 ]]
	-- upvalues: flyoutContentSettingsModule (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var7 = 0
	
	if p0.itemType == flyoutContentSettingsModule.ItemType.Settings then
		var7 = p1.MorePageSettings
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Connections then
		var7 = if fFlagLuaAppFixNotificationBadgeCountsSync then p2 else p1.MorePageFriends
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Messages then
		var7 = if fFlagLuaAppFixNotificationBadgeCountsSync then p3 else p1.MorePageMessages
	end
	if var7 > 0 and (not p0.notificationCount or p0.notificationCount ~= var7) then
		p0.notificationCount = var7
	end
end

return function() --[[ line: 45 | named "useFlyoutNavigationItems" ]]
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), reactModule (ref), useAppPolicy (ref), flyoutGateMomentsTile (ref), fFlagFixMomentsExperienceFallback (ref), useMomentsGating (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableRMOnMorePageForAll (ref), canRenderNativeMoments (ref), appPage (ref)
	local FLYOUT_DEFAULT_POLICY = constantsModule.FLYOUT_DEFAULT_POLICY
	local var8 = useSelector(function(p4) --[[ line: 49 ]]
		return p4.NotificationBadgeCounts
	end)
	local var9 = useSelector(function(p5) --[[ line: 53 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p5.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end)
	local var10 = useSelector(function(p6) --[[ line: 62 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p6.SocialTab then p6.SocialTab.UnreadConversationCount else 0 else 0
	end)
	local var11 = useSelector(function(p7) --[[ line: 69 ]]
		return p7.OmniRecommendations and p7.OmniRecommendations.Home
	end)
	local var12 = if var11 then var11.sorts else {}
	local var13, var14 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: var12 (ref), constantsModule (copy)
		local var23 = nil
		local var24 = nil
		
		for i, v in pairs(var12) do
			if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
				var23 = true
			elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
				var24 = true
			end
		end
		return var23, var24
	end, { var12 })
	local var15 = useAppPolicy(function(p8) --[[ line: 85 ]]
		return p8.getDisablePremiumEntrypoint() or false
	end)
	local var16 = useAppPolicy(function(p9) --[[ line: 88 ]]
		return p9.getDisableBlackbirdEntrypoints() or false
	end)
	local var17 = useAppPolicy(function(p10) --[[ line: 91 ]]
		return p10.getGiftCardSourceRefOverride()
	end)
	local var18 = useAppPolicy(function(p11) --[[ line: 94 ]]
		return p11.getRedeemTileEnabled()
	end)
	local var19 = if flyoutGateMomentsTile or fFlagFixMomentsExperienceFallback then useMomentsGating() else nil
	local var20 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then useAppPolicy(function(p12) --[[ line: 101 ]]
		return p12.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var21 = not var17 or var17 == ""
	
	return reactModule.useMemo(function() --[[ line: 111 ]]
		-- upvalues: FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), var14 (ref), var13 (ref), var15 (ref), var21 (ref), var18 (ref), fFlagEnableBlackbird (copy), fFlagEnableBlackbirdOnFlyoutMenu (copy), var16 (ref), updateNotifications (copy), var8 (ref), var9 (ref), var10 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), flyoutGateMomentsTile (copy), var19 (ref), fFlagEnableRMOnMorePageForAll (copy), var20 (ref), fFlagFixMomentsExperienceFallback (copy), canRenderNativeMoments (copy), appPage (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var29 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var29 ~= nil and (v ~= flyoutContentSettingsModule.ItemType.Favorites or var14) and ((v ~= flyoutContentSettingsModule.ItemType.ContinuePlaying or var13) and (v ~= flyoutContentSettingsModule.ItemType.Premium or not var15)) and ((v ~= flyoutContentSettingsModule.ItemType.GiftCards or not var21) and (v ~= flyoutContentSettingsModule.ItemType.Redeem or var18)) and (not fFlagEnableBlackbird or not fFlagEnableBlackbirdOnFlyoutMenu or v ~= flyoutContentSettingsModule.ItemType.Premium and (v ~= flyoutContentSettingsModule.ItemType.Blackbird or not var16)) then
				local cloned = table.clone(var29)
				updateNotifications(cloned, var8, var9, var10)
				table.insert(t, cloned)
			end
		end
		for i, v in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var27 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var27 ~= nil then
				if v == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						local cloned = table.clone(var27)
						
						if v == flyoutContentSettingsModule.ItemType.Moments and var19 ~= nil then
							if fFlagFixMomentsExperienceFallback then
								cloned.context = if canRenderNativeMoments(var19) then { appPage = appPage.Moments } else {
									appUri = flyoutContentSettingsModule.MomentsExperienceUri
								}
							elseif var19.isFlyoutEntryEnabled and var19.platformIntegrationEnabled then
								cloned.context = { appPage = appPage.Moments }
							end
						end
						table.insert(t_1, cloned)
					end
				elseif v ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile or var19 ~= nil and var19.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var20) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var14, var13, FLYOUT_DEFAULT_POLICY, var8, var15, var16, var21,
		if flyoutGateMomentsTile then var20 else nil, var19,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var9 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var10 else nil
	})
end