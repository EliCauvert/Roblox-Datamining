local IXPService = game:GetService("IXPService")
local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local gameJoinCardModule = require(parent.GameJoinCard)
local playerContextualMenuModule = require(parent.PlayerContextualMenu)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local userProfilesModule = require(parent.UserProfiles)
local socialCommonModule = require(parent.SocialCommon)
local enums = require(parent.FriendsNetworking).Enums
local fFlagSocialCarouselUseProfileStore = require(parent.SharedFlags).FFlagSocialCarouselUseProfileStore
local fFlagUserProfilePlatformProfile = require(parent.SharedFlags).FFlagUserProfilePlatformProfile
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var1 = userProfilesModule.Stores.UserProfileStore.get()
local presenceTypes = socialCommonModule.Enums.PresenceTypes
local enums_1 = require(parent.SocialLuaAnalytics).Analytics.Enums
local enumsModule = require(socialCarousel.Common.Enums)
local localizationModule = require(parent.Localization)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local usePreferredInput = responsiveModule.usePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local view = foundationModule.View
local appPage = robloxAppEnumsModule.AppPage
local useLocalization = localizationModule.Hooks.useLocalization
local tile = enumsModule.Tile
local userTileModule = require(script.Parent.UserTile)
local userTileEventHandlers = require(parent.UserTile).UserTileEventHandlers
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local constantsModule = require(socialCarousel.Common.Constants)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local desktopGameJoinCardContainer = gameJoinCardModule.DesktopGameJoinCardContainer
local useGameJoinCardNavigation = gameJoinCardModule.useGameJoinCardNavigation
local gameJoinCardTTI = gameJoinCardModule.Telemetry.GameJoinCardTTI
local socialCarouselVendorImagePath = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagSocialCarouselUseConsolePolicyForCtaModule = require(socialCarousel.Flags.FFlagSocialCarouselUseConsolePolicyForCta)
local fFlagSocialCarouselFixGameJoinCardDismissModule = require(socialCarousel.Flags.FFlagSocialCarouselFixGameJoinCardDismiss)
local fFlagSocialCarouselShowPlusBadgeModule = require(socialCarousel.Flags.FFlagSocialCarouselShowPlusBadge)
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagConsoleOpenMobileGameJoinCard = require(parent.SharedFlags).FFlagConsoleOpenMobileGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local fFlagMobileGameJoinCardGamepadSupport = require(parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local fFlagDesktopGameJoinCardGamepadSupport = require(parent.SharedFlags).FFlagDesktopGameJoinCardGamepadSupport
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p1)
	-- upvalues: tile (ref)
	return if p1.tileType == tile.Recommendation then if p1.isFriendWithUser then Enum.FriendStatus.Friend elseif p1.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p1.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagMobileGameJoinCardGamepadSupport (ref), fFlagDesktopGameJoinCardGamepadSupport (ref), useDeviceType (ref), usePreferredInput (ref), responsiveModule (ref), fFlagSocialCarouselUseConsolePolicyForCtaModule (ref), useAppPolicy (ref), robloxAppEnumsModule (ref), fFlagEnableMobileGameJoinCard (ref), fFlagConsoleOpenMobileGameJoinCard (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var1 (ref), fFlagUserProfilePlatformProfile (ref), signalsModule (ref), signalsReactModule (ref), fFlagEnableConsoleGameJoinCard (ref), userProfilesModule (ref), fFlagSocialCarouselShowPlusBadgeModule (ref), presenceTypes (ref), fFlagPPVEnabledOnConsole (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagEnableSplitPane (ref), enums_1 (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), fFlagSocialCarouselFixGameJoinCardDismissModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = useDispatch()
	local var4 = useNavigation()
	local var5 = if fFlagMobileGameJoinCardGamepadSupport or fFlagDesktopGameJoinCardGamepadSupport then useDeviceType() else nil
	local var6 = usePreferredInput()
	local var7 = var6 == responsiveModule.Input.Directional
	local var8 = if fFlagSocialCarouselUseConsolePolicyForCtaModule or fFlagMobileGameJoinCardGamepadSupport then useAppPolicy(function(p2)
		return p2.getUseConsoleGameJoinCard()
	end) else var7
	
	if fFlagDesktopGameJoinCardGamepadSupport and var5 == robloxAppEnumsModule.DeviceType.Desktop then
		var8 = false
	end
	local var9
	local var10 = var6 == responsiveModule.Input.Directional
	local var11 = if var5 ~= robloxAppEnumsModule.DeviceType.Phone then var5 == robloxAppEnumsModule.DeviceType.Tablet else true
	
	if fFlagEnableMobileGameJoinCard then
		if fFlagMobileGameJoinCardGamepadSupport then
			var9 = var11
			
			if not var9 then
				var9 = var6 == responsiveModule.Input.Touch
				var9 = nil
			end
		else
			var9 = var6 == responsiveModule.Input.Touch
		end
		var9 = var9 or fFlagConsoleOpenMobileGameJoinCard and var8
	end
	local var12, var13
	local var14 = useSocialCarouselContextModule()
	local var15 = useSocialCarouselAnalyticsModule()
	local var16 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var17 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var18 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var19 = reactModule.useMemo(function()
			-- upvalues: var1 (copy), p1 (ref), fFlagUserProfilePlatformProfile (copy)
			return var1.fetchNamesByUserIds({ p1.item.id }, nil, fFlagUserProfilePlatformProfile)
		end, { p1.item.id })
		var12 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var19 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var19 (copy)
				local var20 = var19(p2)
				local var21 = var20 and (var20.data and var20.data[1])
				
				return if var21 and var21.names then var21.names.getCombinedName(p2) else nil
			end)
		end, { var19 }))
		var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var19 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var19 (copy)
				local var20 = var19(p2)
				local var21 = var20 and (var20.data and var20.data[1])
				
				return if var21 and var21.names then var21.names.getPlatformName(p2) else nil
			end)
		end, { var19 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var18 = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: signalsModule (copy), var19 (ref)
				return signalsModule.createComputed(function(p2)
					-- upvalues: var19 (copy)
					local var20 = var19(p2)
					local var21 = var20 and (var20.data and var20.data[1])
					
					return if var21 then var21.getPlatformProfileId(p2) else nil
				end)
			end, { var19 }))
		end
	else
		local var20 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var12 = reactModule.useMemo(function()
			-- upvalues: var20 (ref), userProfilesModule (copy), p1 (ref)
			return if var20.data then userProfilesModule.Selectors.getCombinedNameFromId(var20.data, p1.item.id) else nil
		end, { var20.data })
		var13 = reactModule.useMemo(function()
			-- upvalues: var20 (ref), userProfilesModule (copy), p1 (ref)
			return if var20.data then userProfilesModule.Selectors.getPlatformNameFromId(var20.data, p1.item.id) else nil
		end, { var20.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var18 = reactModule.useMemo(function()
				-- upvalues: var20 (ref), userProfilesModule (copy), p1 (ref)
				return if var20.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var20.data, p1.item.id) else nil
			end, { var20.data, p1.item.id })
		end
	end
	local var21 = if fFlagSocialCarouselShowPlusBadgeModule then userProfilesModule.Hooks.useIsRobloxSubscriber(p1.item.id) else nil
	local _ = nil
	local _ = nil
	local var22, var23 = reactModule.useState(false)
	local var24 = var22
	local var25 = var23
	local setOpenGameJoinCardUserId = var14.setOpenGameJoinCardUserId
	
	if setOpenGameJoinCardUserId then
		var24 = var14.openGameJoinCardUserId == p1.item.id
		
		var25 = function(p2)
			-- upvalues: setOpenGameJoinCardUserId (ref), p1 (ref)
			if p2 then
				setOpenGameJoinCardUserId(p1.item.id)
				
				return
			end
			setOpenGameJoinCardUserId(function(p3)
				-- upvalues: p1 (copy)
				return if p3 == p1.item.id then nil else p3
			end)
		end
	end
	local var26
	local var27 = reactModule.useCallback(function(_)
		-- upvalues: p1 (ref), presenceTypes (copy), var8 (write), fFlagPPVEnabledOnConsole (copy), fFlagConsoleOpenMobileGameJoinCard (copy), var9 (ref), var3 (ref), playerContextualMenuModule (copy), var17 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var4 (ref), appPage (copy), var25 (write), var24 (write), fFlagEnableSplitPane (copy), enums_1 (copy), var15 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local var28 = p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame
			
			if (var8 and (not fFlagPPVEnabledOnConsole or var28)) and (not fFlagConsoleOpenMobileGameJoinCard or not var9 or not var28) then
				local var29 = var3
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var17 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var29(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if var9 then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var4.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				else
					var25(not var24)
				end
			else
				(if fFlagEnableSplitPane then var4.push else var4.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var15.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		var24,
		if fFlagMobileGameJoinCardGamepadSupport then var9 else nil,
		if fFlagMobileGameJoinCardGamepadSupport or fFlagDesktopGameJoinCardGamepadSupport then var8 else nil
	})
	local var28 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), tile (copy), var16 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var16.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local _ = nil
	local _ = nil
	local var29, var30 = reactModule.useState(nil)
	local var31 = var30
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useCallback(function()
		-- upvalues: fFlagEnableSplitPane (copy), var4 (ref), appPage (copy), p1 (ref), enums_1 (copy), var15 (ref)
		;(if fFlagEnableSplitPane then var4.push else var4.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var15.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var4.navigate,
		var4.push,
		var15.userPressed
	})
	local var34 = reactModule.useMemo(function()
		-- upvalues: var33 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var33,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { var33 })
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: var32 (ref), var31 (write)
		var32.current = p2
		
		if var31 then
			var31(p2)
		end
	end, { var31 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var2 (ref), p1 (ref)
		if var14.unifiedLogging then
			var14.unifiedLogging.tagTileForImpressions(var2, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var15 (ref), p1 (ref)
		var14.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var15.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	local _ = nil
	
	if fFlagSocialCarouselFixGameJoinCardDismissModule then
		local id = p1.item.id
		var26 = reactModule.useCallback(function()
			-- upvalues: setOpenGameJoinCardUserId (ref), id (ref), var25 (write)
			if setOpenGameJoinCardUserId then
				setOpenGameJoinCardUserId(function(p2)
					-- upvalues: id (copy)
					return if p2 == id then nil else p2
				end)
				
				return
			elseif var25 then
				var25(false)
			end
		end, { id, setOpenGameJoinCardUserId })
	else
		var26 = reactModule.useCallback(function()
			-- upvalues: var25 (write)
			if var25 then
				var25(false)
			end
		end, {})
	end
	local var36
	if fFlagDesktopGameJoinCardGamepadSupport then
		var36 = var7
		
		if var36 then
			var36 = var5 ~= robloxAppEnumsModule.DeviceType.Desktop
			var36 = nil
		end
	else
		var36 = var7
	end
	local var37 = false
	
	if fFlagEnableConsoleGameJoinCard then
		var37 = useGameJoinCardNavigation(if fFlagDesktopGameJoinCardGamepadSupport and not var36 then nil else var29, var36, var2)
	end
	local var38
	local presence = p1.item.presence
	local var39 = presence and presence.userPresenceType == presenceTypes.InGame
	
	if not var24 then
		var38 = var37 and (var39 and var17 ~= nil)
	end
	local var40 = fFlagEnableConsoleGameJoinCard and (var39 and (var36 and var38))
	reactModule.useEffect(function()
		-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var38 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
		if enableFriendCarouselInGameFriendExposureLoggingV2 and var38 then
			IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
		end
	end, { var38 })
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = var2,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			itemSize = UDim2.fromScale(1, 1),
			onActivated = var27,
			name = if p1.item.tileType == tile.Recommendation then var13 else var12,
			contextualText = var28,
			tileRef = var2,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil,
			isRobloxSubscriber = if fFlagSocialCarouselShowPlusBadgeModule then var21 else nil
		})),
		GameJoinCardPopover = if var17 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
			layoutOrder = 1,
			playerName = var12 or "",
			platformName = var13 or "",
			platformProfileId = if fFlagEnableConsoleGameJoinCard then var18 else nil,
			universeId = tostring(presence.universeId),
			experienceName = presence.lastLocation,
			userId = p1.item.id,
			presence = presence,
			anchorRef = var2,
			isOpen = var38 == true,
			onClose = var26,
			homepageCarouselAbsolutePosition = p1.index,
			showGamepadJoinFocus = var40 == true,
			onCardGuiObjectChanged = var35,
			isFocused = var37
		}) else nil,
		TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
			tileRef = var2,
			buttons = if var10 then var34 else nil,
			onTileActivated = function() end
		}),
		CardEventHandlers = if var10 and var29 then reactModule.createElement(userTileEventHandlers, {
			tileRef = var32,
			buttons = var34,
			onTileActivated = function() end
		}) else nil
	})
end