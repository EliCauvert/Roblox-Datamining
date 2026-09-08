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
local fFlagGameJoinCardAnalyticsCardId = sharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
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
	-- upvalues: useDispatch (ref), useNavigation (ref), useNavigationFocus (ref), fFlagGameJoinCardAnalyticsCardId (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), httpService (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), fFlagEnableSplitPane (ref), appPage (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useNavigationFocus() ~= false
	local var4 = nil
	local var5 = nil
	
	if fFlagGameJoinCardAnalyticsCardId then
		local var6, var7 = reactModule.useState(nil)
		var4 = var6
		var5 = var7
	end
	local layoutOrder = p1.layoutOrder
	local playerName = p1.playerName
	local platformName = p1.platformName
	local presence = p1.presence
	local var8 = tostring(presence.universeId)
	local lastLocation = presence.lastLocation
	local var9 = reactModule.useMemo(function()
		-- upvalues: getRbxThumb (copy), thumbnailType (copy), var8 (ref), thumbnailSize (copy)
		return getRbxThumb(thumbnailType.GameIcon, var8, thumbnailSize.Small)
	end, { var8 })
	local var10, var11 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), contentProviderService (copy), var9 (ref)
		var11(contentProviderService:GetAssetFetchStatus(var9))
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: contentProviderService (copy), var9 (ref), var11 (ref)
		local var12 = contentProviderService:GetAssetFetchStatusChangedSignal(var9):Connect(var11)
		
		return function()
			-- upvalues: var12 (ref)
			var12:Disconnect()
		end
	end, { var9 })
	local var12 = useJoinUserInExperience(p1.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition,
		presence = p1.presence,
		onAgeCheckCompletion = if fFlagJoinCardAgeCheckUpsell then useAgeCheckCompletionLogger(var8) else nil
	})
	local var13 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckPressLogger({
		userId = p1.userId,
		universeId = var8,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil,
		joinAgeCheckUpsellFlow = var12.joinAgeCheckUpsellFlow
	}) else nil
	local var14 = fFlagJoinCardAgeCheckUpsell and var12.ageCheckRequired == true
	local var15 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var15 (ref), fFlagGameJoinCardAnalyticsCardId (copy), httpService (copy), var5 (write), useGameJoinCardAnalyticsModule (copy)
		local var16 = p1.isOpen == true and var3
		
		if var16 and not var15.current then
			local var17 = if fFlagGameJoinCardAnalyticsCardId then httpService:GenerateGUID(false) else nil
			
			if fFlagGameJoinCardAnalyticsCardId then
				var5(var17)
			end
			local universeId = p1.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var17 else nil
			})
		end
		var15.current = var16
	end, dependencyArray(p1.isOpen, var3, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.isOpen and not var3 then
			p1.onClose()
		end
	end, dependencyArray(var3, p1))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var14 (ref), useGameJoinCardAnalyticsModule (copy), var8 (ref)
		if p1.isOpen and var3 and var14 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var8 ~= "" then nil else var8 })
			
			return
		end
	end, dependencyArray(p1.isOpen, var3, var14, var8))
	local var16 = if var8 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var10 == Enum.AssetFetchStatus.Loading else true else true else true
	local var17 = usePreferredInput() == responsiveModule.Input.Directional
	local var18 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p1.platformProfileId
		var18 = reactModule.useCallback(function()
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local var19 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and var3
	}) else nil
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var20 (ref), var19 (ref), p1 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var20.current = p2
		
		if var19 then
			var19(p2)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(p2)
		end
	end, { var19, p1.onCardGuiObjectChanged })
	local var22 = useRoactService(appEventIngestService)
	local var23 = useRoactService(appSessionService)
	local var24 = useRoactService(appGuiService)
	local var25 = useAppPolicy(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var26 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), presence (ref), gamePlayIntent (copy), var22 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p1.userId
		
		if userId == "" then return end
		local var27 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var28 = tonumber(presence.rootPlaceId)
		
		if var27 == "" or var28 == nil then
			return
		end
		gamePlayIntent(var22, peopleListInHomePage, {
			placeId = var27,
			rootPlaceId = var28,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p1.userId, presence))
	local var27 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), presence (ref), p1 (ref), var23 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var22 (ref), var1 (ref), openGameDetails (copy), var2 (ref)
		if var8 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var28 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var8 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if var23 then
			setGamePlaySession(var23, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var22, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = var28,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = var8
		})
		var1(openGameDetails(var8, var2))
	end, dependencyArray(var1, var2, var8, presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), p1 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var27 (ref)
		if var8 == "" then return end
		if p1.userId ~= "" then
			local t = {
				friendId = p1.userId,
				universeId = if var8 ~= "" then nil else var8,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
			}
			
			if p2 == viewEDPsourceValues.Thumbnail then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, t)
			elseif p2 == viewEDPsourceValues.Title then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromTitle, t)
			end
		end
		var27()
	end, dependencyArray(var27, var8, p1.userId, p1.homepageCarouselAbsolutePosition, var4))
	local var29 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var8 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), var26 (ref), var12 (ref)
		if p1.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if var8 ~= "" then nil else var8,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
			})
		end
		var26()
		var12.joinExperience()
		p1.onClose()
	end, dependencyArray(var26, var12.joinExperience, p1.userId, var8, p1.homepageCarouselAbsolutePosition, p1.onClose, var4))
	local createElement = reactModule.createElement
	createElement = createElement(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var9,
		isLoading = var16,
		onJoin = var29,
		onViewExperienceDetails = var28,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and var3,
		onClose = p1.onClose,
		isConsole = var17,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var21 else nil,
		ageCheckRequired = if fFlagJoinCardAgeCheckUpsell then var12.ageCheckRequired else nil,
		onAgeCheckPressed = var13,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var17 then var18 else nil,
		onChat = if var17 or not var25 then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var8 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), var24 (ref), notificationType (copy)
			if p1.userId == "" then
				return
			end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if var8 ~= "" then nil else var8,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
			})
			var24:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			p1.onClose()
		end, dependencyArray(p1.userId, var8, p1.homepageCarouselAbsolutePosition, var24, p1.onClose, var4)),
		onViewProfile = if not var17 then reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var8 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), var2 (ref), appPage (copy)
			if p1.userId ~= "" then
				local t = {
					friendId = p1.userId,
					universeId = if var8 ~= "" then nil else var8,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
				}
				
				if p2 == viewProfileSourceValues.UserTile then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, t)
				elseif p2 == viewProfileSourceValues.ViewProfileButton then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, t)
				end
			end;
			(if fFlagEnableSplitPane then var2.push else var2.navigate)(appPage.ProfilePlatform, { detail = p1.userId })
			p1.onClose()
		end, dependencyArray(var2, p1.userId, var8, p1.homepageCarouselAbsolutePosition, p1.onClose, var4)) else nil
	})
	
	return if p1.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var20 else nil,
			joinExperience = var29
		}),
		Card = createElement
	}) else createElement
end