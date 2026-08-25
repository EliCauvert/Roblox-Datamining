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
local var13 = userProfilesModule.Stores.UserProfileStore.get()
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

local _ = function(p0)
	-- upvalues: tile (ref)
	return if p0.tileType == tile.Recommendation then if p0.isFriendWithUser then Enum.FriendStatus.Friend elseif p0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagEnableMobileGameJoinCard (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagSocialCarouselPressXToViewProfile (ref), usePreferredInput (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), fFlagSocialCarouselUseConsolePolicyForCtaModule (ref), useAppPolicy (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var13 (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), presenceTypes (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagDeprecatePeopleListContextualMenu (ref), setCentralOverlay (ref), centralOverlayType (ref), enumsModule (ref), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (ref), enums_1 (ref), fFlagEnableSplitPane (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), fFlagSocialCarouselFixGameJoinCardDismissModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var27 = reactModule.useRef(nil)
	local var28 = useDispatch()
	local var29 = useNavigation()
	local var30 = if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then usePreferredInput() else nil
	local var31 = false
	
	if fFlagSocialCarouselFixConsoleCtaForInGameModule or not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then
		var31 = (if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then var30 else usePreferredInput()) == responsiveModule.Input.Directional
	end
	local var33
	local var32 = if fFlagSocialCarouselUseConsolePolicyForCtaModule then useAppPolicy(function(p2)
		return p2.getUseConsoleGameJoinCard()
	end) else var31
	
	if fFlagSocialCarouselPressXToViewProfile then
		var33 = var30 == responsiveModule.Input.Directional
		var33 = nil
	else
		var33 = false
	end
	local var40, var41
	local var34 = useSocialCarouselContextModule()
	local var35 = useSocialCarouselAnalyticsModule()
	local var36 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var37 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var38 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var42 = reactModule.useMemo(function()
			-- upvalues: var13 (copy), p1 (ref)
			return var13.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		var40 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var42 (ref)
			return signalsModule.createComputed(function(p3)
				-- upvalues: var42 (copy)
				local var63 = var42(p3)
				local var64 = var63 and (var63.data and var63.data[1])
				
				return if var64 and var64.names then var64.names.getCombinedName(p3) else nil
			end)
		end, { var42 }))
		var41 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var42 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: var42 (copy)
				local var65 = var42(p4)
				local var66 = var65 and (var65.data and var65.data[1])
				
				return if var66 and var66.names then var66.names.getPlatformName(p4) else nil
			end)
		end, { var42 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var38 = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: signalsModule (copy), var42 (ref)
				return signalsModule.createComputed(function(p5)
					-- upvalues: var42 (copy)
					local var67 = var42(p5)
					local var68 = var67 and (var67.data and var67.data[1])
					
					return if var68 then var68.getPlatformProfileId(p5) else nil
				end)
			end, { var42 }))
		end
	else
		local var39 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var40 = reactModule.useMemo(function()
			-- upvalues: var39 (ref), userProfilesModule (copy), p1 (ref)
			return if var39.data then userProfilesModule.Selectors.getCombinedNameFromId(var39.data, p1.item.id) else nil
		end, { var39.data })
		var41 = reactModule.useMemo(function()
			-- upvalues: var39 (ref), userProfilesModule (copy), p1 (ref)
			return if var39.data then userProfilesModule.Selectors.getPlatformNameFromId(var39.data, p1.item.id) else nil
		end, { var39.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var38 = reactModule.useMemo(function()
				-- upvalues: var39 (ref), userProfilesModule (copy), p1 (ref)
				return if var39.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var39.data, p1.item.id) else nil
			end, { var39.data, p1.item.id })
		end
	end
	local var43 = nil
	local var44 = nil
	
	if fFlagEnableDesktopGameJoinCard or fFlagEnableConsoleGameJoinCard then
		local var45, var46 = reactModule.useState(false)
		var43 = var45
		var44 = var46
		local setOpenGameJoinCardUserId = var34.setOpenGameJoinCardUserId
		
		if setOpenGameJoinCardUserId then
			var43 = var34.openGameJoinCardUserId == p1.item.id
			
			var44 = function(p6)
				-- upvalues: setOpenGameJoinCardUserId (ref), p1 (ref)
				if p6 then
					setOpenGameJoinCardUserId(p1.item.id)
					
					return
				end
				setOpenGameJoinCardUserId(function(p7)
					-- upvalues: p1 (copy)
					return if p7 == p1.item.id then nil else p7
				end)
			end
		end
	end
	local var47 = reactModule.useCallback(function(p8)
		-- upvalues: p1 (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (copy), presenceTypes (copy), var32 (write), fFlagPPVEnabledOnConsole (copy), var28 (ref), playerContextualMenuModule (copy), var37 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagEnableMobileGameJoinCard (copy), var30 (ref), responsiveModule (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var29 (ref), appPage (copy), fFlagEnableDesktopGameJoinCard (copy), var44 (write), var43 (write), fFlagDeprecatePeopleListContextualMenu (copy), setCentralOverlay (copy), centralOverlayType (copy), var40 (write), enumsModule (copy), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), enums_1 (copy), fFlagEnableSplitPane (copy), var35 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local _ = nil
			
			if if fFlagSocialCarouselFixConsoleCtaForInGameModule then var32 and (not fFlagPPVEnabledOnConsole or (p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame)) else not fFlagPPVEnabledOnConsole and var32 then
				local var69 = var28
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var37 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var69(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if fFlagEnableMobileGameJoinCard and var30 == responsiveModule.Input.Touch then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var29.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				elseif fFlagEnableDesktopGameJoinCard then
					var44(not var43)
				elseif not fFlagDeprecatePeopleListContextualMenu then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackPeopleListClickStart()
					end
					var28(setCentralOverlay(centralOverlayType.PeopleList, {
						user = {
							id = p1.item.id,
							combinedName = var40,
							presence = enumsModule.OldPresence.IN_GAME,
							universeId = p1.item.presence.universeId,
							rootPlaceId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.rootPlaceId else nil,
							placeId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.placeId else nil,
							gameInstanceId = p1.item.presence.gameId,
							lastLocation = p1.item.presence.lastLocation
						},
						positionIndex = p1.index,
						absolutePosition = p1.index,
						anchorSpaceSize = p8.AbsoluteSize,
						anchorSpacePosition = p8.AbsolutePosition,
						source = enums_1.Sources.HomePageFriendsCarousel
					}))
				end
			else
				(if fFlagEnableSplitPane then var29.push else var29.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var35.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, var43 })
	local var48 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), tile (copy), var36 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var36.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local var49 = nil
	local var50 = nil
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var51, var52 = reactModule.useState(nil)
		var49 = var51
		var50 = var52
	end
	local var53 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var54 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function()
		-- upvalues: fFlagEnableSplitPane (copy), var29 (ref), appPage (copy), p1 (ref), enums_1 (copy), var35 (ref)
		;(if fFlagEnableSplitPane then var29.push else var29.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var35.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var29.navigate,
		var29.push,
		var35.userPressed
	}) else nil
	local var55 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function()
		-- upvalues: var54 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var54,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { var54 }) else nil
	local var56 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p9)
		-- upvalues: var53 (ref), var50 (write)
		var53.current = p9
		
		if var50 then
			var50(p9)
		end
	end, { var50 }) else nil
	reactModule.useEffect(function()
		-- upvalues: var34 (ref), var27 (ref), p1 (ref)
		if var34.unifiedLogging then
			var34.unifiedLogging.tagTileForImpressions(var27, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function()
		-- upvalues: var34 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var35 (ref), p1 (ref)
		var34.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var35.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var57
		local _ = nil
		
		if fFlagSocialCarouselFixGameJoinCardDismissModule then
			local setOpenGameJoinCardUserId = var34.setOpenGameJoinCardUserId
			local id = p1.item.id
			var57 = reactModule.useCallback(function()
				-- upvalues: setOpenGameJoinCardUserId (ref), id (ref), var44 (write)
				if setOpenGameJoinCardUserId then
					setOpenGameJoinCardUserId(function(p10)
						-- upvalues: id (copy)
						return if p10 == id then nil else p10
					end)
					
					return
				elseif var44 then
					var44(false)
				end
			end, { id, setOpenGameJoinCardUserId })
		else
			var57 = reactModule.useCallback(function()
				-- upvalues: var44 (write)
				if var44 then
					var44(false)
				end
			end, {})
		end
		local var60
		local var58 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var49, var31, var27) else false
		local presence = p1.item.presence
		local var59 = presence and presence.userPresenceType == presenceTypes.InGame
		
		if not var43 then
			var60 = var58 and (var59 and var37 ~= nil)
		end
		local var60_1 = fFlagEnableConsoleGameJoinCard and (var59 and (var31 and var60))
		reactModule.useEffect(function()
			-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var60 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
			if enableFriendCarouselInGameFriendExposureLoggingV2 and var60 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
		end, { var60 })
		
		return reactModule.createElement(view, {
			BackgroundTransparency = 1,
			Size = p1.itemSize,
			LayoutOrder = p1.index,
			ref = var27,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
				itemSize = UDim2.fromScale(1, 1),
				onActivated = var47,
				name = if p1.item.tileType == tile.Recommendation then var41 else var40,
				contextualText = var48,
				tileRef = var27,
				titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if fFlagEnableDesktopGameJoinCard and var37 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = var40 or "",
				platformName = var41 or "",
				platformProfileId = if fFlagEnableConsoleGameJoinCard then var38 else nil,
				universeId = tostring(presence.universeId),
				experienceName = presence.lastLocation,
				userId = p1.item.id,
				presence = presence,
				anchorRef = var27,
				isOpen = var60 == true,
				onClose = var57,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = var60_1 == true,
				onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var56 else var50,
				isFocused = var58
			}) else nil,
			TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
				tileRef = var27,
				buttons = if var33 then var55 else nil,
				onTileActivated = function() end
			}) else nil,
			CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var33 and var49 then reactModule.createElement(userTileEventHandlers, {
				tileRef = var53,
				buttons = var55,
				onTileActivated = function() end
			}) else nil
		})
	else
		local var62 = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			onActivated = var47,
			name = if p1.item.tileType == tile.Recommendation then var41 else var40,
			contextualText = var48,
			tileRef = var27,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
		}))
		
		return if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(reactModule.Fragment, nil, {
			UserTile = var62,
			TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
				tileRef = var27,
				buttons = if var33 then var55 else nil,
				onTileActivated = function() end
			})
		}) else var62
	end
end