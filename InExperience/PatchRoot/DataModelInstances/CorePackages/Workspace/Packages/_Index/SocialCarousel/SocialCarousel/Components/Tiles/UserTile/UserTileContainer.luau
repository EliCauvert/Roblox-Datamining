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
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagSocialCarouselFixConsoleCtaForInGameModule = require(socialCarousel.Flags.FFlagSocialCarouselFixConsoleCtaForInGame)
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local fFlagDeprecatePeopleListContextualMenu = require(parent.SharedFlags).FFlagDeprecatePeopleListContextualMenu
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p0) --[[ line: 96 ]]
	-- upvalues: tile (ref)
	return if p0.tileType == tile.Recommendation then if p0.isFriendWithUser then Enum.FriendStatus.Friend elseif p0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1) --[[ line: 112 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagEnableMobileGameJoinCard (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagSocialCarouselPressXToViewProfile (ref), usePreferredInput (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var13 (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), presenceTypes (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagDeprecatePeopleListContextualMenu (ref), setCentralOverlay (ref), centralOverlayType (ref), enumsModule (ref), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (ref), enums_1 (ref), fFlagEnableSplitPane (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var30
	local var25 = reactModule.useRef(nil)
	local var26 = useDispatch()
	local var27 = useNavigation()
	local var28 = if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then usePreferredInput() else nil
	local var29 = false
	
	if fFlagSocialCarouselFixConsoleCtaForInGameModule or not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then
		var29 = (if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then var28 else usePreferredInput()) == responsiveModule.Input.Directional
	end
	if fFlagSocialCarouselPressXToViewProfile then
		var30 = var28 == responsiveModule.Input.Directional
		var30 = nil
	else
		var30 = false
	end
	local var37, var38
	local var31 = useSocialCarouselContextModule()
	local var32 = useSocialCarouselAnalyticsModule()
	local var33 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var34 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var35 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var39 = reactModule.useMemo(function() --[[ line: 156 ]]
			-- upvalues: var13 (copy), p1 (ref)
			return var13.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		var37 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 160 ]]
			-- upvalues: signalsModule (copy), var39 (ref)
			return signalsModule.createComputed(function(p2) --[[ line: 161 ]]
				-- upvalues: var39 (copy)
				local var60 = var39(p2)
				local var61 = var60 and (var60.data and var60.data[1])
				
				return if var61 and var61.names then var61.names.getCombinedName(p2) else nil
			end)
		end, { var39 }))
		var38 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 168 ]]
			-- upvalues: signalsModule (copy), var39 (ref)
			return signalsModule.createComputed(function(p3) --[[ line: 169 ]]
				-- upvalues: var39 (copy)
				local var62 = var39(p3)
				local var63 = var62 and (var62.data and var62.data[1])
				
				return if var63 and var63.names then var63.names.getPlatformName(p3) else nil
			end)
		end, { var39 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var35 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 180 ]]
				-- upvalues: signalsModule (copy), var39 (ref)
				return signalsModule.createComputed(function(p4) --[[ line: 181 ]]
					-- upvalues: var39 (copy)
					local var64 = var39(p4)
					local var65 = var64 and (var64.data and var64.data[1])
					
					return if var65 then var65.getPlatformProfileId(p4) else nil
				end)
			end, { var39 }))
		end
	else
		local var36 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var37 = reactModule.useMemo(function() --[[ line: 204 ]]
			-- upvalues: var36 (ref), userProfilesModule (copy), p1 (ref)
			return if var36.data then userProfilesModule.Selectors.getCombinedNameFromId(var36.data, p1.item.id) else nil
		end, { var36.data })
		var38 = reactModule.useMemo(function() --[[ line: 212 ]]
			-- upvalues: var36 (ref), userProfilesModule (copy), p1 (ref)
			return if var36.data then userProfilesModule.Selectors.getPlatformNameFromId(var36.data, p1.item.id) else nil
		end, { var36.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var35 = reactModule.useMemo(function() --[[ line: 221 ]]
				-- upvalues: var36 (ref), userProfilesModule (copy), p1 (ref)
				return if var36.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var36.data, p1.item.id) else nil
			end, { var36.data, p1.item.id })
		end
	end
	local var40 = nil
	local var41 = nil
	
	if fFlagEnableDesktopGameJoinCard or fFlagEnableConsoleGameJoinCard then
		local var42, var43 = reactModule.useState(false)
		var40 = var42
		var41 = var43
		local setOpenGameJoinCardUserId = var31.setOpenGameJoinCardUserId
		
		if setOpenGameJoinCardUserId then
			var40 = var31.openGameJoinCardUserId == p1.item.id
			
			var41 = function(p5) --[[ line: 238 ]]
				-- upvalues: setOpenGameJoinCardUserId (ref), p1 (ref)
				if p5 then
					setOpenGameJoinCardUserId(p1.item.id)
					
					return
				end
				setOpenGameJoinCardUserId(function(p6) --[[ line: 242 ]]
					-- upvalues: p1 (copy)
					return if p6 == p1.item.id then nil else p6
				end)
			end
		end
	end
	local var44 = reactModule.useCallback(function(p7) --[[ line: 253 ]]
		-- upvalues: p1 (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (copy), presenceTypes (copy), var29 (write), fFlagPPVEnabledOnConsole (copy), var26 (ref), playerContextualMenuModule (copy), var34 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagEnableMobileGameJoinCard (copy), var28 (ref), responsiveModule (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var27 (ref), appPage (copy), fFlagEnableDesktopGameJoinCard (copy), var41 (write), var40 (write), fFlagDeprecatePeopleListContextualMenu (copy), setCentralOverlay (copy), centralOverlayType (copy), var37 (write), enumsModule (copy), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), enums_1 (copy), fFlagEnableSplitPane (copy), var32 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local _ = nil
			
			if if fFlagSocialCarouselFixConsoleCtaForInGameModule then var29 and (not fFlagPPVEnabledOnConsole or (p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame)) else not fFlagPPVEnabledOnConsole and var29 then
				local var66 = var26
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var34 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var66(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if fFlagEnableMobileGameJoinCard and var28 == responsiveModule.Input.Touch then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var27.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				elseif fFlagEnableDesktopGameJoinCard then
					var41(not var40)
				elseif not fFlagDeprecatePeopleListContextualMenu then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackPeopleListClickStart()
					end
					var26(setCentralOverlay(centralOverlayType.PeopleList, {
						user = {
							id = p1.item.id,
							combinedName = var37,
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
				end
			else
				(if fFlagEnableSplitPane then var27.push else var27.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var32.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, var40 })
	local var45 = reactModule.useMemo(function() --[[ line: 330 ]]
		-- upvalues: p1 (ref), tile (copy), var33 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var33.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local var46 = nil
	local var47 = nil
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var48, var49 = reactModule.useState(nil)
		var46 = var48
		var47 = var49
	end
	local var50 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var51 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function() --[[ line: 348 ]]
		-- upvalues: fFlagEnableSplitPane (copy), var27 (ref), appPage (copy), p1 (ref), enums_1 (copy), var32 (ref)
		;(if fFlagEnableSplitPane then var27.push else var27.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var32.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var27.navigate,
		var27.push,
		var32.userPressed
	}) else nil
	local var52 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function() --[[ line: 365 ]]
		-- upvalues: var51 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var51,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() --[[ line: 371 ]] end }
		}
	end, { var51 }) else nil
	local var53 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p8) --[[ line: 377 ]]
		-- upvalues: var50 (ref), var47 (write)
		var50.current = p8
		
		if var47 then
			var47(p8)
		end
	end, { var47 }) else nil
	reactModule.useEffect(function() --[[ line: 385 ]]
		-- upvalues: var31 (ref), var25 (ref), p1 (ref)
		if var31.unifiedLogging then
			var31.unifiedLogging.tagTileForImpressions(var25, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function() --[[ line: 391 ]]
		-- upvalues: var31 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var32 (ref), p1 (ref)
		var31.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var32.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 400 ]]
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var57
		local var54 = reactModule.useCallback(function() --[[ line: 407 ]]
			-- upvalues: var41 (write)
			if var41 then
				var41(false)
			end
		end, {})
		local var55 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var46, var29, var25) else false
		local presence = p1.item.presence
		local var56 = presence and presence.userPresenceType == presenceTypes.InGame
		
		if not var40 then
			var57 = var55 and (var56 and var34 ~= nil)
		end
		local var57_1 = fFlagEnableConsoleGameJoinCard and (var56 and (var29 and var57))
		reactModule.useEffect(function() --[[ line: 423 ]]
			-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var57 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
			if enableFriendCarouselInGameFriendExposureLoggingV2 and var57 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
		end, { var57 })
		
		return reactModule.createElement(view, {
			BackgroundTransparency = 1,
			Size = p1.itemSize,
			LayoutOrder = p1.index,
			ref = var25,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
				itemSize = UDim2.fromScale(1, 1),
				onActivated = var44,
				name = if p1.item.tileType == tile.Recommendation then var38 else var37,
				contextualText = var45,
				tileRef = var25,
				titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if fFlagEnableDesktopGameJoinCard and var34 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = var37 or "",
				platformName = var38 or "",
				platformProfileId = if fFlagEnableConsoleGameJoinCard then var35 else nil,
				universeId = tostring(presence.universeId),
				experienceName = presence.lastLocation,
				userId = p1.item.id,
				presence = presence,
				anchorRef = var25,
				isOpen = var57 == true,
				onClose = var54,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = var57_1 == true,
				onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var53 else var47,
				isFocused = var55
			}) else nil,
			TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
				tileRef = var25,
				buttons = if var30 then var52 else nil,
				onTileActivated = function() --[[ line: 477 ]] end
			}) else nil,
			CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var30 and var46 then reactModule.createElement(userTileEventHandlers, {
				tileRef = var50,
				buttons = var52,
				onTileActivated = function() --[[ line: 486 ]] end
			}) else nil
		})
	else
		local var59 = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			onActivated = var44,
			name = if p1.item.tileType == tile.Recommendation then var38 else var37,
			contextualText = var45,
			tileRef = var25,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
		}))
		
		return if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(reactModule.Fragment, nil, {
			UserTile = var59,
			TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
				tileRef = var25,
				buttons = if var30 then var52 else nil,
				onTileActivated = function() --[[ line: 509 ]] end
			})
		}) else var59
	end
end