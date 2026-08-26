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
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var1 = userProfilesModule.Stores.UserProfileStore.get()
local presenceTypes = socialCommonModule.Enums.PresenceTypes
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local enums_1 = require(parent.SocialLuaAnalytics).Analytics.Enums
local enumsModule = require(socialCarousel.Common.Enums)
local localizationModule = require(parent.Localization)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local usePreferredInput = responsiveModule.usePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local view = foundationModule.View
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
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
local fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(parent.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagSocialCarouselPressXToViewProfile = require(parent.SharedFlags).FFlagSocialCarouselPressXToViewProfile
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagSocialCarouselFixConsoleCtaForInGameModule = require(socialCarousel.Flags.FFlagSocialCarouselFixConsoleCtaForInGame)
local fFlagSocialCarouselUseConsolePolicyForCtaModule = require(socialCarousel.Flags.FFlagSocialCarouselUseConsolePolicyForCta)
local fFlagSocialCarouselFixGameJoinCardDismissModule = require(socialCarousel.Flags.FFlagSocialCarouselFixGameJoinCardDismiss)
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local fFlagDeprecatePeopleListContextualMenu = require(parent.SharedFlags).FFlagDeprecatePeopleListContextualMenu
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p1)
	-- upvalues: tile (ref)
	return if p1.tileType == tile.Recommendation then if p1.isFriendWithUser then Enum.FriendStatus.Friend elseif p1.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p1.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagEnableMobileGameJoinCard (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagSocialCarouselPressXToViewProfile (ref), usePreferredInput (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), fFlagSocialCarouselUseConsolePolicyForCtaModule (ref), useAppPolicy (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var1 (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), presenceTypes (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagDeprecatePeopleListContextualMenu (ref), setCentralOverlay (ref), centralOverlayType (ref), enumsModule (ref), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (ref), enums_1 (ref), fFlagEnableSplitPane (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), fFlagSocialCarouselFixGameJoinCardDismissModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = useDispatch()
	local var4 = useNavigation()
	local var5 = if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then usePreferredInput() else nil
	local var6 = false
	
	if fFlagSocialCarouselFixConsoleCtaForInGameModule or not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then
		var6 = (if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then var5 else usePreferredInput()) == responsiveModule.Input.Directional
	end
	local var7
	local var8 = if fFlagSocialCarouselUseConsolePolicyForCtaModule then useAppPolicy(function(p2)
		return p2.getUseConsoleGameJoinCard()
	end) else var6
	
	if fFlagSocialCarouselPressXToViewProfile then
		var7 = var5 == responsiveModule.Input.Directional
		var7 = nil
	else
		var7 = false
	end
	local var9, var10
	local var11 = useSocialCarouselContextModule()
	local var12 = useSocialCarouselAnalyticsModule()
	local var13 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var14 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var15 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var16 = reactModule.useMemo(function()
			-- upvalues: var1 (copy), p1 (ref)
			return var1.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var16 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var16 (copy)
				local var17 = var16(p2)
				local var18 = var17 and (var17.data and var17.data[1])
				
				return if var18 and var18.names then var18.names.getCombinedName(p2) else nil
			end)
		end, { var16 }))
		var10 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var16 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var16 (copy)
				local var17 = var16(p2)
				local var18 = var17 and (var17.data and var17.data[1])
				
				return if var18 and var18.names then var18.names.getPlatformName(p2) else nil
			end)
		end, { var16 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var15 = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: signalsModule (copy), var16 (ref)
				return signalsModule.createComputed(function(p2)
					-- upvalues: var16 (copy)
					local var17 = var16(p2)
					local var18 = var17 and (var17.data and var17.data[1])
					
					return if var18 then var18.getPlatformProfileId(p2) else nil
				end)
			end, { var16 }))
		end
	else
		local var17 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var9 = reactModule.useMemo(function()
			-- upvalues: var17 (ref), userProfilesModule (copy), p1 (ref)
			return if var17.data then userProfilesModule.Selectors.getCombinedNameFromId(var17.data, p1.item.id) else nil
		end, { var17.data })
		var10 = reactModule.useMemo(function()
			-- upvalues: var17 (ref), userProfilesModule (copy), p1 (ref)
			return if var17.data then userProfilesModule.Selectors.getPlatformNameFromId(var17.data, p1.item.id) else nil
		end, { var17.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var15 = reactModule.useMemo(function()
				-- upvalues: var17 (ref), userProfilesModule (copy), p1 (ref)
				return if var17.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var17.data, p1.item.id) else nil
			end, { var17.data, p1.item.id })
		end
	end
	local var18 = nil
	local var19 = nil
	
	if fFlagEnableDesktopGameJoinCard or fFlagEnableConsoleGameJoinCard then
		local var20, var21 = reactModule.useState(false)
		var18 = var20
		var19 = var21
		local setOpenGameJoinCardUserId = var11.setOpenGameJoinCardUserId
		
		if setOpenGameJoinCardUserId then
			var18 = var11.openGameJoinCardUserId == p1.item.id
			
			var19 = function(p2)
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
	end
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (copy), presenceTypes (copy), var8 (write), fFlagPPVEnabledOnConsole (copy), var3 (ref), playerContextualMenuModule (copy), var14 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagEnableMobileGameJoinCard (copy), var5 (ref), responsiveModule (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var4 (ref), appPage (copy), fFlagEnableDesktopGameJoinCard (copy), var19 (write), var18 (write), fFlagDeprecatePeopleListContextualMenu (copy), setCentralOverlay (copy), centralOverlayType (copy), var9 (write), enumsModule (copy), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), enums_1 (copy), fFlagEnableSplitPane (copy), var12 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local _ = nil
			
			if if fFlagSocialCarouselFixConsoleCtaForInGameModule then var8 and (not fFlagPPVEnabledOnConsole or (p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame)) else not fFlagPPVEnabledOnConsole and var8 then
				local var23 = var3
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var14 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var23(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if fFlagEnableMobileGameJoinCard and var5 == responsiveModule.Input.Touch then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var4.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				elseif fFlagEnableDesktopGameJoinCard then
					var19(not var18)
				elseif not fFlagDeprecatePeopleListContextualMenu then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackPeopleListClickStart()
					end
					var3(setCentralOverlay(centralOverlayType.PeopleList, {
						user = {
							id = p1.item.id,
							combinedName = var9,
							presence = enumsModule.OldPresence.IN_GAME,
							universeId = p1.item.presence.universeId,
							rootPlaceId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.rootPlaceId else nil,
							placeId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.placeId else nil,
							gameInstanceId = p1.item.presence.gameId,
							lastLocation = p1.item.presence.lastLocation
						},
						positionIndex = p1.index,
						absolutePosition = p1.index,
						anchorSpaceSize = p2.AbsoluteSize,
						anchorSpacePosition = p2.AbsolutePosition,
						source = enums_1.Sources.HomePageFriendsCarousel
					}))
				end
			else
				(if fFlagEnableSplitPane then var4.push else var4.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var12.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, var18 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), tile (copy), var13 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var13.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local var24 = nil
	local var25 = nil
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var26, var27 = reactModule.useState(nil)
		var24 = var26
		var25 = var27
	end
	local var28 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var29 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function()
		-- upvalues: fFlagEnableSplitPane (copy), var4 (ref), appPage (copy), p1 (ref), enums_1 (copy), var12 (ref)
		;(if fFlagEnableSplitPane then var4.push else var4.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var12.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var4.navigate,
		var4.push,
		var12.userPressed
	}) else nil
	local var30 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function()
		-- upvalues: var29 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var29,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { var29 }) else nil
	local var31 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p2)
		-- upvalues: var28 (ref), var25 (write)
		var28.current = p2
		
		if var25 then
			var25(p2)
		end
	end, { var25 }) else nil
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var2 (ref), p1 (ref)
		if var11.unifiedLogging then
			var11.unifiedLogging.tagTileForImpressions(var2, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var12 (ref), p1 (ref)
		var11.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var12.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var32
		local _ = nil
		
		if fFlagSocialCarouselFixGameJoinCardDismissModule then
			local setOpenGameJoinCardUserId = var11.setOpenGameJoinCardUserId
			local id = p1.item.id
			var32 = reactModule.useCallback(function()
				-- upvalues: setOpenGameJoinCardUserId (ref), id (ref), var19 (write)
				if setOpenGameJoinCardUserId then
					setOpenGameJoinCardUserId(function(p2)
						-- upvalues: id (copy)
						return if p2 == id then nil else p2
					end)
					
					return
				elseif var19 then
					var19(false)
				end
			end, { id, setOpenGameJoinCardUserId })
		else
			var32 = reactModule.useCallback(function()
				-- upvalues: var19 (write)
				if var19 then
					var19(false)
				end
			end, {})
		end
		local var33
		local var34 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var24, var6, var2) else false
		local presence = p1.item.presence
		local var35 = presence and presence.userPresenceType == presenceTypes.InGame
		
		if not var18 then
			var33 = var34 and (var35 and var14 ~= nil)
		end
		local var36 = fFlagEnableConsoleGameJoinCard and (var35 and (var6 and var33))
		reactModule.useEffect(function()
			-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var33 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
			if enableFriendCarouselInGameFriendExposureLoggingV2 and var33 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
		end, { var33 })
		
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
				onActivated = var22,
				name = if p1.item.tileType == tile.Recommendation then var10 else var9,
				contextualText = var23,
				tileRef = var2,
				titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if fFlagEnableDesktopGameJoinCard and var14 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = var9 or "",
				platformName = var10 or "",
				platformProfileId = if fFlagEnableConsoleGameJoinCard then var15 else nil,
				universeId = tostring(presence.universeId),
				experienceName = presence.lastLocation,
				userId = p1.item.id,
				presence = presence,
				anchorRef = var2,
				isOpen = var33 == true,
				onClose = var32,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = var36 == true,
				onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var31 else var25,
				isFocused = var34
			}) else nil,
			TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
				tileRef = var2,
				buttons = if var7 then var30 else nil,
				onTileActivated = function() end
			}) else nil,
			CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var7 and var24 then reactModule.createElement(userTileEventHandlers, {
				tileRef = var28,
				buttons = var30,
				onTileActivated = function() end
			}) else nil
		})
	else
		local var37 = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			onActivated = var22,
			name = if p1.item.tileType == tile.Recommendation then var10 else var9,
			contextualText = var23,
			tileRef = var2,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
		}))
		
		return if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(reactModule.Fragment, nil, {
			UserTile = var37,
			TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
				tileRef = var2,
				buttons = if var7 then var30 else nil,
				onTileActivated = function() end
			})
		}) else var37
	end
end