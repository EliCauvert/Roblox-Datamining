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
local fFlagSocialCarouselPressXToViewProfile = require(parent.SharedFlags).FFlagSocialCarouselPressXToViewProfile
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagSocialCarouselFixConsoleCtaForInGameModule = require(socialCarousel.Flags.FFlagSocialCarouselFixConsoleCtaForInGame)
local fFlagSocialCarouselUseConsolePolicyForCtaModule = require(socialCarousel.Flags.FFlagSocialCarouselUseConsolePolicyForCta)
local fFlagSocialCarouselFixGameJoinCardDismissModule = require(socialCarousel.Flags.FFlagSocialCarouselFixGameJoinCardDismiss)
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local fFlagMobileGameJoinCardGamepadSupport = require(parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p1)
	-- upvalues: tile (ref)
	return if p1.tileType == tile.Recommendation then if p1.isFriendWithUser then Enum.FriendStatus.Friend elseif p1.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p1.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagMobileGameJoinCardGamepadSupport (ref), useDeviceType (ref), usePreferredInput (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), fFlagSocialCarouselUseConsolePolicyForCtaModule (ref), useAppPolicy (ref), fFlagSocialCarouselPressXToViewProfile (ref), robloxAppEnumsModule (ref), fFlagEnableMobileGameJoinCard (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var1 (ref), fFlagUserProfilePlatformProfile (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), presenceTypes (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagEnableSplitPane (ref), enums_1 (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), fFlagSocialCarouselFixGameJoinCardDismissModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var2
	local var3 = reactModule.useRef(nil)
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = if fFlagMobileGameJoinCardGamepadSupport then useDeviceType() else nil
	local var7 = usePreferredInput()
	local var8 = if fFlagSocialCarouselFixConsoleCtaForInGameModule or not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then var7 == responsiveModule.Input.Directional else false
	local var9 = if fFlagSocialCarouselUseConsolePolicyForCtaModule or fFlagMobileGameJoinCardGamepadSupport then useAppPolicy(function(p2)
		return p2.getUseConsoleGameJoinCard()
	end) else var8
	
	if fFlagSocialCarouselPressXToViewProfile then
		var2 = var7 == responsiveModule.Input.Directional
		var2 = nil
	else
		var2 = false
	end
	local var10 = if var6 ~= robloxAppEnumsModule.DeviceType.Phone then var6 == robloxAppEnumsModule.DeviceType.Tablet else true
	local var11 = fFlagEnableMobileGameJoinCard
	
	if var11 then
		if fFlagMobileGameJoinCardGamepadSupport then
			var11 = var10
			
			if not var11 then
				var11 = var7 == responsiveModule.Input.Touch
				var11 = nil
			end
		else
			var11 = var7 == responsiveModule.Input.Touch
		end
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
	local _ = nil
	local _ = nil
	local var21, var22 = reactModule.useState(false)
	local var23 = var21
	local var24 = var22
	local setOpenGameJoinCardUserId = var14.setOpenGameJoinCardUserId
	
	if setOpenGameJoinCardUserId then
		var23 = var14.openGameJoinCardUserId == p1.item.id
		
		var24 = function(p2)
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
	local var25
	local var26 = reactModule.useCallback(function(_)
		-- upvalues: p1 (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (copy), presenceTypes (copy), var9 (write), fFlagPPVEnabledOnConsole (copy), var4 (ref), playerContextualMenuModule (copy), var17 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), var11 (ref), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var5 (ref), appPage (copy), var24 (write), var23 (write), fFlagEnableSplitPane (copy), enums_1 (copy), var15 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local _ = nil
			
			if if fFlagSocialCarouselFixConsoleCtaForInGameModule then var9 and (not fFlagPPVEnabledOnConsole or (p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame)) else not fFlagPPVEnabledOnConsole and var9 then
				local var27 = var4
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var17 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var27(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if var11 then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var5.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				else
					var24(not var23)
				end
			else
				(if fFlagEnableSplitPane then var5.push else var5.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var15.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		var23,
		if fFlagMobileGameJoinCardGamepadSupport then var11 else nil,
		if fFlagMobileGameJoinCardGamepadSupport then var9 else nil
	})
	local var27 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), tile (copy), var16 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var16.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local _ = nil
	local _ = nil
	local var28, var29 = reactModule.useState(nil)
	local var30 = var29
	local var31 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var32 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function()
		-- upvalues: fFlagEnableSplitPane (copy), var5 (ref), appPage (copy), p1 (ref), enums_1 (copy), var15 (ref)
		;(if fFlagEnableSplitPane then var5.push else var5.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var15.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var5.navigate,
		var5.push,
		var15.userPressed
	}) else nil
	local var33 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function()
		-- upvalues: var32 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var32,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { var32 }) else nil
	local var34 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p2)
		-- upvalues: var31 (ref), var30 (write)
		var31.current = p2
		
		if var30 then
			var30(p2)
		end
	end, { var30 }) else nil
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var3 (ref), p1 (ref)
		if var14.unifiedLogging then
			var14.unifiedLogging.tagTileForImpressions(var3, p1.index)
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
		var25 = reactModule.useCallback(function()
			-- upvalues: setOpenGameJoinCardUserId (ref), id (ref), var24 (write)
			if setOpenGameJoinCardUserId then
				setOpenGameJoinCardUserId(function(p2)
					-- upvalues: id (copy)
					return if p2 == id then nil else p2
				end)
				
				return
			elseif var24 then
				var24(false)
			end
		end, { id, setOpenGameJoinCardUserId })
	else
		var25 = reactModule.useCallback(function()
			-- upvalues: var24 (write)
			if var24 then
				var24(false)
			end
		end, {})
	end
	local var35
	local var36 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var28, var8, var3) else false
	local presence = p1.item.presence
	local var37 = presence and presence.userPresenceType == presenceTypes.InGame
	
	if not var23 then
		var35 = var36 and (var37 and var17 ~= nil)
	end
	local var38 = fFlagEnableConsoleGameJoinCard and (var37 and (var8 and var35))
	reactModule.useEffect(function()
		-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var35 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
		if enableFriendCarouselInGameFriendExposureLoggingV2 and var35 then
			IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
		end
	end, { var35 })
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = var3,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			itemSize = UDim2.fromScale(1, 1),
			onActivated = var26,
			name = if p1.item.tileType == tile.Recommendation then var13 else var12,
			contextualText = var27,
			tileRef = var3,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
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
			anchorRef = var3,
			isOpen = var35 == true,
			onClose = var25,
			homepageCarouselAbsolutePosition = p1.index,
			showGamepadJoinFocus = var38 == true,
			onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var34 else var30,
			isFocused = var36
		}) else nil,
		TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
			tileRef = var3,
			buttons = if var2 then var33 else nil,
			onTileActivated = function() end
		}) else nil,
		CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var2 and var28 then reactModule.createElement(userTileEventHandlers, {
			tileRef = var31,
			buttons = var33,
			onTileActivated = function() end
		}) else nil
	})
end