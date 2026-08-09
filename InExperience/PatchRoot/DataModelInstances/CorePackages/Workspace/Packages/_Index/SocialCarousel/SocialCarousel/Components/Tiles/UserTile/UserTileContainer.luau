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
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p0) --[[ line: 92 ]]
	-- upvalues: tile (ref)
	return if p0.tileType == tile.Recommendation then if p0.isFriendWithUser then Enum.FriendStatus.Friend elseif p0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1) --[[ line: 108 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagEnableMobileGameJoinCard (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagSocialCarouselPressXToViewProfile (ref), usePreferredInput (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var13 (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), presenceTypes (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), setCentralOverlay (ref), centralOverlayType (ref), enumsModule (ref), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (ref), enums_1 (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var29
	local var24 = reactModule.useRef(nil)
	local var25 = useDispatch()
	local var26 = useNavigation()
	local var27 = if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then usePreferredInput() else nil
	local var28 = false
	
	if not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then
		var28 = (if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then var27 else usePreferredInput()) == responsiveModule.Input.Directional
	end
	if fFlagSocialCarouselPressXToViewProfile then
		var29 = var27 == responsiveModule.Input.Directional
		var29 = nil
	else
		var29 = false
	end
	local var36, var37
	local var30 = useSocialCarouselContextModule()
	local var31 = useSocialCarouselAnalyticsModule()
	local var32 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var33 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var34 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var38 = reactModule.useMemo(function() --[[ line: 152 ]]
			-- upvalues: var13 (copy), p1 (ref)
			return var13.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		var36 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 156 ]]
			-- upvalues: signalsModule (copy), var38 (ref)
			return signalsModule.createComputed(function(p2) --[[ line: 157 ]]
				-- upvalues: var38 (copy)
				local var59 = var38(p2)
				local var60 = var59 and (var59.data and var59.data[1])
				
				return if var60 and var60.names then var60.names.getCombinedName(p2) else nil
			end)
		end, { var38 }))
		var37 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 164 ]]
			-- upvalues: signalsModule (copy), var38 (ref)
			return signalsModule.createComputed(function(p3) --[[ line: 165 ]]
				-- upvalues: var38 (copy)
				local var61 = var38(p3)
				local var62 = var61 and (var61.data and var61.data[1])
				
				return if var62 and var62.names then var62.names.getPlatformName(p3) else nil
			end)
		end, { var38 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var34 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 176 ]]
				-- upvalues: signalsModule (copy), var38 (ref)
				return signalsModule.createComputed(function(p4) --[[ line: 177 ]]
					-- upvalues: var38 (copy)
					local var63 = var38(p4)
					local var64 = var63 and (var63.data and var63.data[1])
					
					return if var64 then var64.getPlatformProfileId(p4) else nil
				end)
			end, { var38 }))
		end
	else
		local var35 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var36 = reactModule.useMemo(function() --[[ line: 200 ]]
			-- upvalues: var35 (ref), userProfilesModule (copy), p1 (ref)
			return if var35.data then userProfilesModule.Selectors.getCombinedNameFromId(var35.data, p1.item.id) else nil
		end, { var35.data })
		var37 = reactModule.useMemo(function() --[[ line: 208 ]]
			-- upvalues: var35 (ref), userProfilesModule (copy), p1 (ref)
			return if var35.data then userProfilesModule.Selectors.getPlatformNameFromId(var35.data, p1.item.id) else nil
		end, { var35.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var34 = reactModule.useMemo(function() --[[ line: 217 ]]
				-- upvalues: var35 (ref), userProfilesModule (copy), p1 (ref)
				return if var35.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var35.data, p1.item.id) else nil
			end, { var35.data, p1.item.id })
		end
	end
	local var39 = nil
	local var40 = nil
	
	if fFlagEnableDesktopGameJoinCard or fFlagEnableConsoleGameJoinCard then
		local var41, var42 = reactModule.useState(false)
		var39 = var41
		var40 = var42
		local setOpenGameJoinCardUserId = var30.setOpenGameJoinCardUserId
		
		if setOpenGameJoinCardUserId then
			var39 = var30.openGameJoinCardUserId == p1.item.id
			
			var40 = function(p5) --[[ line: 234 ]]
				-- upvalues: setOpenGameJoinCardUserId (ref), p1 (ref)
				if p5 then
					setOpenGameJoinCardUserId(p1.item.id)
					
					return
				end
				setOpenGameJoinCardUserId(function(p6) --[[ line: 238 ]]
					-- upvalues: p1 (copy)
					return if p6 == p1.item.id then nil else p6
				end)
			end
		end
	end
	local var43 = reactModule.useCallback(function(p7) --[[ line: 249 ]]
		-- upvalues: p1 (ref), fFlagPPVEnabledOnConsole (copy), var28 (write), var25 (ref), playerContextualMenuModule (copy), var33 (ref), tile (copy), enums (copy), presenceTypes (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagEnableMobileGameJoinCard (copy), var27 (ref), responsiveModule (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var26 (ref), appPage (copy), fFlagEnableDesktopGameJoinCard (copy), var40 (write), var39 (write), setCentralOverlay (copy), centralOverlayType (copy), var36 (write), enumsModule (copy), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), enums_1 (copy), var31 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		elseif not fFlagPPVEnabledOnConsole and var28 then
			local var65 = var25
			local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
			local t = { subjectUserId = p1.item.id, subjectPresence = var33 }
			local item = p1.item
			t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
			t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
			var65(openPlayerContextualMenu(t))
		elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
			if enableFriendCarouselInGameFriendExposureLoggingV2 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
			if fFlagEnableMobileGameJoinCard and var27 == responsiveModule.Input.Touch then
				if fFlagMobileGameJoinCardTTITracking then
					gameJoinCardTTI.trackMobileCardClickStart()
				end
				var26.navigate(appPage.GameJoinCard, {
					userId = p1.item.id,
					homepageCarouselAbsolutePosition = p1.index
				})
			elseif fFlagEnableDesktopGameJoinCard then
				var40(not var39)
			elseif fFlagMobileGameJoinCardTTITracking then
				gameJoinCardTTI.trackPeopleListClickStart()
			end
			var25(setCentralOverlay(centralOverlayType.PeopleList, {
				user = {
					id = p1.item.id,
					combinedName = var36,
					presence = enumsModule.OldPresence.IN_GAME,
					universeId = p1.item.presence.universeId,
					rootPlaceId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.rootPlaceId else nil,
					placeId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.placeId else nil,
					gameInstanceId = p1.item.presence.gameId,
					lastLocation = p1.item.presence.lastLocation
				},
				positionIndex = p1.index,
				absolutePosition = p1.index,
				anchorSpaceSize = p7.AbsoluteSize,
				anchorSpacePosition = p7.AbsolutePosition,
				source = enums_1.Sources.HomePageFriendsCarousel
			}))
		else
			var26.navigate(appPage.ProfilePlatform, {
				detail = p1.item.id,
				extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
			})
		end
		var31.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, var39 })
	local var44 = reactModule.useMemo(function() --[[ line: 317 ]]
		-- upvalues: p1 (ref), tile (copy), var32 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var32.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local var45 = nil
	local var46 = nil
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var47, var48 = reactModule.useState(nil)
		var45 = var47
		var46 = var48
	end
	local var49 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var50 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function() --[[ line: 334 ]]
		-- upvalues: var26 (ref), appPage (copy), p1 (ref), enums_1 (copy), var31 (ref)
		var26.navigate(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var31.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, p1.index, var26.navigate, var31.userPressed }) else nil
	local var51 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function() --[[ line: 348 ]]
		-- upvalues: var50 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var50,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() --[[ line: 354 ]] end }
		}
	end, { var50 }) else nil
	local var52 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p8) --[[ line: 360 ]]
		-- upvalues: var49 (ref), var46 (write)
		var49.current = p8
		
		if var46 then
			var46(p8)
		end
	end, { var46 }) else nil
	reactModule.useEffect(function() --[[ line: 368 ]]
		-- upvalues: var30 (ref), var24 (ref), p1 (ref)
		if var30.unifiedLogging then
			var30.unifiedLogging.tagTileForImpressions(var24, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function() --[[ line: 374 ]]
		-- upvalues: var30 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var31 (ref), p1 (ref)
		var30.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var31.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 383 ]]
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var56
		local var53 = reactModule.useCallback(function() --[[ line: 390 ]]
			-- upvalues: var40 (write)
			if var40 then
				var40(false)
			end
		end, {})
		local var54 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var45, var28, var24) else false
		local presence = p1.item.presence
		local var55 = presence and presence.userPresenceType == presenceTypes.InGame
		
		if not var39 then
			var56 = var54 and (var55 and var33 ~= nil)
		end
		local var56_1 = fFlagEnableConsoleGameJoinCard and (var55 and (var28 and var56))
		reactModule.useEffect(function() --[[ line: 406 ]]
			-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var56 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
			if enableFriendCarouselInGameFriendExposureLoggingV2 and var56 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
		end, { var56 })
		
		return reactModule.createElement(view, {
			BackgroundTransparency = 1,
			Size = p1.itemSize,
			LayoutOrder = p1.index,
			ref = var24,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
				itemSize = UDim2.fromScale(1, 1),
				onActivated = var43,
				name = if p1.item.tileType == tile.Recommendation then var37 else var36,
				contextualText = var44,
				tileRef = var24,
				titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if fFlagEnableDesktopGameJoinCard and var33 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = var36 or "",
				platformName = var37 or "",
				platformProfileId = if fFlagEnableConsoleGameJoinCard then var34 else nil,
				universeId = tostring(presence.universeId),
				experienceName = presence.lastLocation,
				userId = p1.item.id,
				presence = presence,
				anchorRef = var24,
				isOpen = var56 == true,
				onClose = var53,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = var56_1 == true,
				onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var52 else var46,
				isFocused = var54
			}) else nil,
			TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
				tileRef = var24,
				buttons = if var29 then var51 else nil,
				onTileActivated = function() --[[ line: 460 ]] end
			}) else nil,
			CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var29 and var45 then reactModule.createElement(userTileEventHandlers, {
				tileRef = var49,
				buttons = var51,
				onTileActivated = function() --[[ line: 469 ]] end
			}) else nil
		})
	else
		local var58 = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			onActivated = var43,
			name = if p1.item.tileType == tile.Recommendation then var37 else var36,
			contextualText = var44,
			tileRef = var24,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
		}))
		
		return if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(reactModule.Fragment, nil, {
			UserTile = var58,
			TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
				tileRef = var24,
				buttons = if var29 then var51 else nil,
				onTileActivated = function() --[[ line: 492 ]] end
			})
		}) else var58
	end
end