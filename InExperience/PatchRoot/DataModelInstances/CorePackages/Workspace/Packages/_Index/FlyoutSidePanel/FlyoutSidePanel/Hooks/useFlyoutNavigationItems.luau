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
local flyoutGateMomentsTile = game:DefineFastFlag("FlyoutGateMomentsTile", false)
local useMomentsGating = require(parent.MomentsCommon).Hooks.useMomentsGating
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)

local function updateNotifications(p0, p1, p2, p3) --[[ line: 22 ]]
	-- upvalues: flyoutContentSettingsModule (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref)
	local var6 = 0
	
	if p0.itemType == flyoutContentSettingsModule.ItemType.Settings then
		var6 = p1.MorePageSettings
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Connections then
		var6 = if fFlagLuaAppFixNotificationBadgeCountsSync then p2 else p1.MorePageFriends
	elseif p0.itemType == flyoutContentSettingsModule.ItemType.Messages then
		var6 = if fFlagLuaAppFixNotificationBadgeCountsSync then p3 else p1.MorePageMessages
	end
	if var6 > 0 and (not p0.notificationCount or p0.notificationCount ~= var6) then
		p0.notificationCount = var6
	end
end

return function() --[[ line: 42 | named "useFlyoutNavigationItems" ]]
	-- upvalues: constantsModule (ref), useSelector (ref), fFlagLuaAppFixNotificationBadgeCountsSync (ref), reactModule (ref), useAppPolicy (ref), flyoutGateMomentsTile (ref), useMomentsGating (ref), fFlagEnableRMOnMorePageGUAC (ref), flyoutContentSettingsModule (ref), fFlagEnableBlackbird (ref), fFlagEnableBlackbirdOnFlyoutMenu (ref), updateNotifications (ref), getFFlagPlatformEventEnabled (ref), getFStringPlatformEventUrl (ref), fFlagEnableRMOnMorePageForAll (ref), appPage (ref)
	local FLYOUT_DEFAULT_POLICY = constantsModule.FLYOUT_DEFAULT_POLICY
	local var7 = useSelector(function(p4) --[[ line: 46 ]]
		return p4.NotificationBadgeCounts
	end)
	local var8 = useSelector(function(p5) --[[ line: 50 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		if fFlagLuaAppFixNotificationBadgeCountsSync then
			local friendsCarousel = p5.FriendsCarousel
			local requests = friendsCarousel and (friendsCarousel.Friends and friendsCarousel.Friends.requests)
			
			return if requests then requests.receivedCount else 0
		end
		return 0
	end)
	local var9 = useSelector(function(p6) --[[ line: 59 ]]
		-- upvalues: fFlagLuaAppFixNotificationBadgeCountsSync (copy)
		return if fFlagLuaAppFixNotificationBadgeCountsSync then if p6.SocialTab then p6.SocialTab.UnreadConversationCount else 0 else 0
	end)
	local var10 = useSelector(function(p7) --[[ line: 66 ]]
		return p7.OmniRecommendations and p7.OmniRecommendations.Home
	end)
	local var11 = if var10 then var10.sorts else {}
	local var12, var13 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: var11 (ref), constantsModule (copy)
		local var22 = nil
		local var23 = nil
		
		for i, v in pairs(var11) do
			if v.topicId == constantsModule.SORT_ID_CONTINUE_PLAYING then
				var22 = true
			elseif v.topicId == constantsModule.SORT_ID_FAVORITES then
				var23 = true
			end
		end
		return var22, var23
	end, { var11 })
	local var14 = useAppPolicy(function(p8) --[[ line: 82 ]]
		return p8.getDisablePremiumEntrypoint() or false
	end)
	local var15 = useAppPolicy(function(p9) --[[ line: 85 ]]
		return p9.getDisableBlackbirdEntrypoints() or false
	end)
	local var16 = useAppPolicy(function(p10) --[[ line: 88 ]]
		return p10.getGiftCardSourceRefOverride()
	end)
	local var17 = useAppPolicy(function(p11) --[[ line: 91 ]]
		return p11.getRedeemTileEnabled()
	end)
	local var18 = if flyoutGateMomentsTile then useMomentsGating() else nil
	local var19 = if flyoutGateMomentsTile and fFlagEnableRMOnMorePageGUAC then if flyoutGateMomentsTile then useAppPolicy(function(p12) --[[ line: 96 ]]
		return p12.getDisplayMomentsMoreTabTile()
	end) else false else true
	local var20 = not var16 or var16 == ""
	
	return reactModule.useMemo(function() --[[ line: 106 ]]
		-- upvalues: FLYOUT_DEFAULT_POLICY (ref), flyoutContentSettingsModule (copy), var13 (ref), var12 (ref), var14 (ref), var20 (ref), var17 (ref), fFlagEnableBlackbird (copy), fFlagEnableBlackbirdOnFlyoutMenu (copy), var15 (ref), updateNotifications (copy), var7 (ref), var8 (ref), var9 (ref), getFFlagPlatformEventEnabled (copy), getFStringPlatformEventUrl (copy), flyoutGateMomentsTile (copy), var18 (ref), fFlagEnableRMOnMorePageForAll (copy), var19 (ref), appPage (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in FLYOUT_DEFAULT_POLICY.MyLibrary do
			local var28 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var28 ~= nil and (v ~= flyoutContentSettingsModule.ItemType.Favorites or var13) and ((v ~= flyoutContentSettingsModule.ItemType.ContinuePlaying or var12) and (v ~= flyoutContentSettingsModule.ItemType.Premium or not var14)) and ((v ~= flyoutContentSettingsModule.ItemType.GiftCards or not var20) and (v ~= flyoutContentSettingsModule.ItemType.Redeem or var17)) and (not fFlagEnableBlackbird or not fFlagEnableBlackbirdOnFlyoutMenu or v ~= flyoutContentSettingsModule.ItemType.Premium and (v ~= flyoutContentSettingsModule.ItemType.Blackbird or not var15)) then
				local cloned = table.clone(var28)
				updateNotifications(cloned, var7, var8, var9)
				table.insert(t, cloned)
			end
		end
		for i, v in FLYOUT_DEFAULT_POLICY.AdditionalNavigation do
			local var26 = flyoutContentSettingsModule.ItemInfo[v]
			
			if var26 ~= nil then
				if v == flyoutContentSettingsModule.ItemType.Events then
					if getFFlagPlatformEventEnabled() and getFStringPlatformEventUrl() ~= "" then
						local cloned = table.clone(var26)
						
						if v == flyoutContentSettingsModule.ItemType.Moments and var18 ~= nil and (var18.isFlyoutEntryEnabled and var18.platformIntegrationEnabled) then
							cloned.context = { appPage = appPage.Moments }
						end
						table.insert(t_1, cloned)
					end
				elseif v ~= flyoutContentSettingsModule.ItemType.Moments or not flyoutGateMomentsTile or var18 ~= nil and var18.isFlyoutEntryEnabled or (fFlagEnableRMOnMorePageForAll or var19) then
				end
			end
		end
		return { myLibraryItems = t, additionalNavigationItems = t_1 }
	end, {
		var13, var12, FLYOUT_DEFAULT_POLICY, var7, var14, var15, var20,
		if flyoutGateMomentsTile then var19 else nil, var18,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var8 else nil,
		if fFlagLuaAppFixNotificationBadgeCountsSync then var9 else nil
	})
end