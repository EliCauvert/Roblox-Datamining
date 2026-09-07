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
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local getPlatformFriendsServiceModule = require(gameJoinCard.Utils.getPlatformFriendsService)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger

return function(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useNavigationFocus (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), httpService (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), fFlagEnableSplitPane (ref), appPage (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useNavigationFocus() ~= false
	local layoutOrder = p1.layoutOrder
	local playerName = p1.playerName
	local platformName = p1.platformName
	local presence = p1.presence
	local var4 = tostring(presence.universeId)
	local lastLocation = presence.lastLocation
	local var5 = reactModule.useMemo(function()
		-- upvalues: getRbxThumb (copy), thumbnailType (copy), var4 (ref), thumbnailSize (copy)
		return getRbxThumb(thumbnailType.GameIcon, var4, thumbnailSize.Small)
	end, { var4 })
	local var6, var7 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), contentProviderService (copy), var5 (ref)
		var7(contentProviderService:GetAssetFetchStatus(var5))
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: contentProviderService (copy), var5 (ref), var7 (ref)
		local var8 = contentProviderService:GetAssetFetchStatusChangedSignal(var5):Connect(var7)
		
		return function()
			-- upvalues: var8 (ref)
			var8:Disconnect()
		end
	end, { var5 })
	local var8 = useJoinUserInExperience(p1.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition,
		presence = p1.presence,
		onAgeCheckCompletion = if fFlagJoinCardAgeCheckUpsell then useAgeCheckCompletionLogger(var4) else nil
	})
	local var9 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckPressLogger({
		userId = p1.userId,
		universeId = var4,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinAgeCheckUpsellFlow = var8.joinAgeCheckUpsellFlow
	}) else nil
	local var10 = fFlagJoinCardAgeCheckUpsell and var8.ageCheckRequired == true
	local var11 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var11 (ref), useGameJoinCardAnalyticsModule (copy)
		local var12 = p1.isOpen == true and var3
		
		if var12 and not var11.current then
			local universeId = p1.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
		end
		var11.current = var12
	end, dependencyArray(p1.isOpen, var3, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.isOpen and not var3 then
			p1.onClose()
		end
	end, dependencyArray(var3, p1))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var10 (ref), useGameJoinCardAnalyticsModule (copy), var4 (ref)
		if p1.isOpen and var3 and var10 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var4 ~= "" then nil else var4 })
			
			return
		end
	end, dependencyArray(p1.isOpen, var3, var10, var4))
	local var12 = if var4 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var6 == Enum.AssetFetchStatus.Loading else true else true else true
	local var13 = usePreferredInput() == responsiveModule.Input.Directional
	local var14 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p1.platformProfileId
		var14 = reactModule.useCallback(function()
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local var15 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and var3
	}) else nil
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var16 (ref), var15 (ref), p1 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var16.current = p2
		
		if var15 then
			var15(p2)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(p2)
		end
	end, { var15, p1.onCardGuiObjectChanged })
	local var18 = useRoactService(appEventIngestService)
	local var19 = useRoactService(appSessionService)
	local var20 = useRoactService(appGuiService)
	local var21 = useAppPolicy(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var22 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), presence (ref), gamePlayIntent (copy), var18 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p1.userId
		
		if userId == "" then return end
		local var23 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var24 = tonumber(presence.rootPlaceId)
		
		if var23 == "" or var24 == nil then
			return
		end
		gamePlayIntent(var18, peopleListInHomePage, {
			placeId = var23,
			rootPlaceId = var24,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p1.userId, presence))
	local var23 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), presence (ref), p1 (ref), var19 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var18 (ref), var1 (ref), openGameDetails (copy), var2 (ref)
		if var4 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var24 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var4 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if var19 then
			setGamePlaySession(var19, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var18, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = var24,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = var4
		})
		var1(openGameDetails(var4, var2))
	end, dependencyArray(var1, var2, var4, presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var23 (ref)
		if var4 == "" then return end
		if p1.userId ~= "" then
			local t = {
				friendId = p1.userId,
				universeId = if var4 ~= "" then nil else var4,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			}
			
			if p2 == viewEDPsourceValues.Thumbnail then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, t)
			elseif p2 == viewEDPsourceValues.Title then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromTitle, t)
			end
		end
		var23()
	end, dependencyArray(var23, var4, p1.userId, p1.homepageCarouselAbsolutePosition))
	local var25 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var4 (ref), var22 (ref), var8 (ref)
		if p1.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if var4 ~= "" then nil else var4,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
		end
		var22()
		var8.joinExperience()
		p1.onClose()
	end, dependencyArray(var22, var8.joinExperience, p1.userId, var4, p1.homepageCarouselAbsolutePosition, p1.onClose))
	local createElement = reactModule.createElement
	createElement = createElement(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var5,
		isLoading = var12,
		onJoin = var25,
		onViewExperienceDetails = var24,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and var3,
		onClose = p1.onClose,
		isConsole = var13,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var17 else nil,
		ageCheckRequired = if fFlagJoinCardAgeCheckUpsell then var8.ageCheckRequired else nil,
		onAgeCheckPressed = var9,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var13 then var14 else nil,
		onChat = if var13 or not var21 then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var4 (ref), var20 (ref), notificationType (copy)
			if p1.userId == "" then
				return
			end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if var4 ~= "" then nil else var4,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
			var20:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			p1.onClose()
		end, dependencyArray(p1.userId, var4, p1.homepageCarouselAbsolutePosition, var20, p1.onClose)),
		onViewProfile = if not var13 then reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var4 (ref), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), var2 (ref), appPage (copy)
			if p1.userId ~= "" then
				local t = {
					friendId = p1.userId,
					universeId = if var4 ~= "" then nil else var4,
					absolutePosition = p1.homepageCarouselAbsolutePosition
				}
				
				if p2 == viewProfileSourceValues.UserTile then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, t)
				elseif p2 == viewProfileSourceValues.ViewProfileButton then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, t)
				end
			end;
			(if fFlagEnableSplitPane then var2.push else var2.navigate)(appPage.ProfilePlatform, { detail = p1.userId })
			p1.onClose()
		end, dependencyArray(var2, p1.userId, var4, p1.homepageCarouselAbsolutePosition, p1.onClose)) else nil
	})
	
	return if p1.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var16 else nil,
			joinExperience = var25
		}),
		Card = createElement
	}) else createElement
end