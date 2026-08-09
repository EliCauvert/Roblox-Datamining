local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local gameDetailModule = require(parent.GameDetail)
local _ = require(parent.SocialCommon)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local gameDetailReferral = discoveryAnalyticsModule.Events.gameDetailReferral
local peopleListInHomePage = discoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local appPage = robloxAppEnumsModule.AppPage
local notificationType = robloxAppEnumsModule.NotificationType
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appSessionService = roactServiceTagsModule.AppSessionService
local appGuiService = roactServiceTagsModule.AppGuiService
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local sessionType = require(parent.RobloxAppSessionization).SessionType
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local contentProviderService = game:GetService("ContentProvider")
local desktopGameJoinCardModule = require(script.Parent.DesktopGameJoinCard)
local gamepadJoinFocusBehaviorModule = require(script.Parent.GamepadJoinFocusBehavior)
local openGameDetails = gameDetailModule.OpenGameDetails
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local hooks = require(parent.RoactUtils).Hooks
local dependencyArray = hooks.dependencyArray
local useDispatch = hooks.RoactRodux.useDispatch
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local usePreferredInput = responsiveModule.usePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableConsoleGameJoinCard = sharedFlagsModule.FFlagEnableConsoleGameJoinCard
local fFlagJoinCardAgeCheckUpsell = sharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local getPlatformFriendsServiceModule = require(gameJoinCard.Utils.getPlatformFriendsService)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger

return function(p0) --[[ line: 90 | named "DesktopGameJoinCardContainer" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useNavigationFocus (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), httpService (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), appPage (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
	local var19 = useDispatch()
	local var20 = useNavigation()
	local var21 = useNavigationFocus() ~= false
	local layoutOrder = p0.layoutOrder
	local playerName = p0.playerName
	local platformName = p0.platformName
	local presence = p0.presence
	local var22 = tostring(presence.universeId)
	local lastLocation = presence.lastLocation
	local var23 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: getRbxThumb (copy), thumbnailType (copy), var22 (ref), thumbnailSize (copy)
		return getRbxThumb(thumbnailType.GameIcon, var22, thumbnailSize.Small)
	end, { var22 })
	local var24, var25 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function() --[[ line: 104 ]]
		-- upvalues: var25 (ref), contentProviderService (copy), var23 (ref)
		var25(contentProviderService:GetAssetFetchStatus(var23))
	end, { var23 })
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: contentProviderService (copy), var23 (ref), var25 (ref)
		local var44 = contentProviderService:GetAssetFetchStatusChangedSignal(var23):Connect(var25)
		
		return function() --[[ line: 110 ]]
			-- upvalues: var44 (ref)
			var44:Disconnect()
		end
	end, { var23 })
	local var26 = useJoinUserInExperience(p0.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p0.homepageCarouselAbsolutePosition,
		presence = p0.presence,
		onAgeCheckCompletion = if fFlagJoinCardAgeCheckUpsell then useAgeCheckCompletionLogger(var22) else nil
	})
	local var27 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckPressLogger({
		userId = p0.userId,
		universeId = var22,
		absolutePosition = p0.homepageCarouselAbsolutePosition,
		joinAgeCheckUpsellFlow = var26.joinAgeCheckUpsellFlow
	}) else nil
	local var28 = fFlagJoinCardAgeCheckUpsell and var26.ageCheckRequired == true
	local var29 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: p0 (ref), var21 (ref), var29 (ref), useGameJoinCardAnalyticsModule (copy)
		local var45 = p0.isOpen == true and var21
		
		if var45 and not var29.current then
			local universeId = p0.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p0.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p0.homepageCarouselAbsolutePosition
			})
		end
		var29.current = var45
	end, dependencyArray(p0.isOpen, var21, p0.userId, p0.presence, p0.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function() --[[ line: 161 ]]
		-- upvalues: p0 (ref), var21 (ref)
		if p0.isOpen and not var21 then
			p0.onClose()
		end
	end, dependencyArray(var21, p0))
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: p0 (ref), var21 (ref), var28 (ref), useGameJoinCardAnalyticsModule (copy), var22 (ref)
		if p0.isOpen and var21 and var28 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var22 ~= "" then nil else var22 })
			
			return
		end
	end, dependencyArray(p0.isOpen, var21, var28, var22))
	local var30 = if var22 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var24 == Enum.AssetFetchStatus.Loading else true else true else true
	local var31 = usePreferredInput() == responsiveModule.Input.Directional
	local var32 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p0.platformProfileId
		var32 = reactModule.useCallback(function() --[[ line: 189 ]]
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local var33 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p0.isFocused == true and var21
	}) else nil
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useCallback(function(p1) --[[ line: 207 ]]
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var34 (ref), var33 (ref), p0 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var34.current = p1
		
		if var33 then
			var33(p1)
		end
		if p0.onCardGuiObjectChanged then
			p0.onCardGuiObjectChanged(p1)
		end
	end, { var33, p0.onCardGuiObjectChanged })
	local var36 = useRoactService(appEventIngestService)
	local var37 = useRoactService(appSessionService)
	local var38 = useRoactService(appGuiService)
	local var39 = useAppPolicy(function(p2) --[[ line: 224 ]]
		return p2.getCanUsePlatformChat()
	end)
	local var40 = reactModule.useCallback(function() --[[ line: 228 ]]
		-- upvalues: p0 (ref), presence (ref), gamePlayIntent (copy), var36 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p0.userId
		
		if userId == "" then return end
		local var46 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var47 = tonumber(presence.rootPlaceId)
		
		if var46 == "" or var47 == nil then
			return
		end
		gamePlayIntent(var36, peopleListInHomePage, {
			placeId = var46,
			rootPlaceId = var47,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p0.userId, presence))
	local var41 = reactModule.useCallback(function() --[[ line: 249 ]]
		-- upvalues: var22 (ref), presence (ref), p0 (ref), var37 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var36 (ref), var19 (ref), openGameDetails (copy), var20 (ref)
		if var22 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var48 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var22 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p0.homepageCarouselAbsolutePosition or 0
		
		if var37 then
			setGamePlaySession(var37, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var36, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p0.userId,
			pid = var48,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p0.layoutOrder,
			universeId = var22
		})
		var19(openGameDetails(var22, var20))
	end, dependencyArray(var19, var20, var22, presence, p0.homepageCarouselAbsolutePosition, p0.layoutOrder, p0.userId))
	local var42 = reactModule.useCallback(function(p3) --[[ line: 285 ]]
		-- upvalues: var22 (ref), p0 (ref), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var41 (ref)
		if var22 == "" then return end
		if p0.userId ~= "" then
			local t = {
				friendId = p0.userId,
				universeId = if var22 ~= "" then nil else var22,
				absolutePosition = p0.homepageCarouselAbsolutePosition
			}
			
			if p3 == viewEDPsourceValues.Thumbnail then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, t)
			elseif p3 == viewEDPsourceValues.Title then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromTitle, t)
			end
		end
		var41()
	end, dependencyArray(var41, var22, p0.userId, p0.homepageCarouselAbsolutePosition))
	local var43 = reactModule.useCallback(function() --[[ line: 311 ]]
		-- upvalues: p0 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var22 (ref), var40 (ref), var26 (ref)
		if p0.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p0.userId,
				universeId = if var22 ~= "" then nil else var22,
				absolutePosition = p0.homepageCarouselAbsolutePosition
			})
		end
		var40()
		var26.joinExperience()
		p0.onClose()
	end, dependencyArray(var40, var26.joinExperience, p0.userId, var22, p0.homepageCarouselAbsolutePosition, p0.onClose))
	local createElement = reactModule.createElement
	createElement = createElement(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var23,
		isLoading = var30,
		onJoin = var43,
		onViewExperienceDetails = var42,
		anchorRef = p0.anchorRef,
		isOpen = p0.isOpen and var21,
		onClose = p0.onClose,
		isConsole = var31,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var35 else nil,
		ageCheckRequired = if fFlagJoinCardAgeCheckUpsell then var26.ageCheckRequired else nil,
		onAgeCheckPressed = var27,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var31 then var32 else nil,
		onChat = if var31 or not var39 then nil else reactModule.useCallback(function() --[[ line: 358 ]]
			-- upvalues: p0 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var22 (ref), var38 (ref), notificationType (copy)
			if p0.userId == "" then
				return
			end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p0.userId,
				universeId = if var22 ~= "" then nil else var22,
				absolutePosition = p0.homepageCarouselAbsolutePosition
			})
			var38:BroadcastNotification(p0.userId, notificationType.LAUNCH_CONVERSATION)
			p0.onClose()
		end, dependencyArray(p0.userId, var22, p0.homepageCarouselAbsolutePosition, var38, p0.onClose)),
		onViewProfile = if not var31 then reactModule.useCallback(function(p4) --[[ line: 333 ]]
			-- upvalues: p0 (ref), var22 (ref), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var20 (ref), appPage (copy)
			if p0.userId ~= "" then
				local t = {
					friendId = p0.userId,
					universeId = if var22 ~= "" then nil else var22,
					absolutePosition = p0.homepageCarouselAbsolutePosition
				}
				
				if p4 == viewProfileSourceValues.UserTile then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, t)
				elseif p4 == viewProfileSourceValues.ViewProfileButton then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, t)
				end
			end
			var20.navigate(appPage.ProfilePlatform, { detail = p0.userId })
			p0.onClose()
		end, dependencyArray(var20, p0.userId, var22, p0.homepageCarouselAbsolutePosition, p0.onClose)) else nil
	})
	
	return if p0.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p0.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var34 else nil,
			joinExperience = var43
		}),
		Card = createElement
	}) else createElement
end