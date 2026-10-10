local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local gameDetailModule = require(parent.GameDetail)
local dataHydrationModule = require(parent.DataHydration)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local useLocalization = require(parent.Localization).Hooks.useLocalization
local socialCommonModule = require(parent.SocialCommon)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPoint = socialCommonModule.Actions.EnteredChatFromEntryPoint
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
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local fFlagEnableOnScreenAPIIntegration = sharedFlagsModule.FFlagEnableOnScreenAPIIntegration
local fFlagGameJoinCardAnalyticsCardId = sharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
local fFlagJoinabilityCTARefactor = sharedFlagsModule.FFlagJoinabilityCTARefactor
local fFlagJoinUserCTAsIxpEnabled = sharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local fStringJoinUserCTAsIxpLayer = sharedFlagsModule.FStringJoinUserCTAsIxpLayer
local var1 = if fFlagJoinUserCTAsIxpEnabled then require(parent.IXPServiceWrapper).IXPServiceWrapper else nil
local fFlagGameJoinCardChatEntryPointModule = require(gameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local var2 = if fFlagEnableOnScreenAPIIntegration then require(parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local getPlatformFriendsServiceModule = require(gameJoinCard.Utils.getPlatformFriendsService)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local gameJoinCardSurface = analyticsConstantsModule.GameJoinCardSurface
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local actionsModule = require(gameJoinCard.Components.Actions)
local containsActionModule = require(gameJoinCard.Components.Actions.containsAction)
local useJoinUserActionsModule = require(gameJoinCard.Hooks.useJoinUserActions)
local useLogActionsResolveTimeModule = require(gameJoinCard.Telemetry.useLogActionsResolveTime)
local dataStatus = dataHydrationModule.DataStatus

return function(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), fFlagEnableOnScreenAPIIntegration (ref), var2 (ref), useNavigationFocus (ref), fFlagGameJoinCardAnalyticsCardId (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), fFlagJoinabilityCTARefactor (ref), useJoinUserActionsModule (ref), useLocalization (ref), actionsModule (ref), useLogActionsResolveTimeModule (ref), gameJoinCardSurface (ref), dataStatus (ref), containsActionModule (ref), userCtaAction (ref), httpService (ref), fFlagJoinUserCTAsIxpEnabled (ref), var1 (ref), fStringJoinUserCTAsIxpLayer (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), fFlagEnableSplitPane (ref), appPage (ref), fFlagGameJoinCardChatEntryPointModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
	local var3 = useDispatch()
	local var4 = useNavigation()
	local var5 = if fFlagEnableOnScreenAPIIntegration then var2() else useNavigationFocus() ~= false
	local var6 = nil
	local var7 = nil
	
	if fFlagGameJoinCardAnalyticsCardId then
		local var8, var9 = reactModule.useState(nil)
		var6 = var8
		var7 = var9
	end
	local layoutOrder = p1.layoutOrder
	local playerName = p1.playerName
	local platformName = p1.platformName
	local presence = p1.presence
	local var10 = tostring(presence.universeId)
	local lastLocation = presence.lastLocation
	local var11 = reactModule.useMemo(function()
		-- upvalues: getRbxThumb (copy), thumbnailType (copy), var10 (ref), thumbnailSize (copy)
		return getRbxThumb(thumbnailType.GameIcon, var10, thumbnailSize.Small)
	end, { var10 })
	local var12, var13 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), contentProviderService (copy), var11 (ref)
		var13(contentProviderService:GetAssetFetchStatus(var11))
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: contentProviderService (copy), var11 (ref), var13 (ref)
		local var14 = contentProviderService:GetAssetFetchStatusChangedSignal(var11):Connect(var13)
		
		return function()
			-- upvalues: var14 (ref)
			var14:Disconnect()
		end
	end, { var11 })
	local var14 = useJoinUserInExperience(p1.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition,
		presence = p1.presence,
		onAgeCheckCompletion = useAgeCheckCompletionLogger(var10)
	})
	local var15 = useAgeCheckPressLogger({
		userId = p1.userId,
		universeId = var10,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil,
		joinAgeCheckUpsellFlow = var14.joinAgeCheckUpsellFlow
	})
	local var16 = nil
	local var17 = nil
	local var18 = nil
	
	if fFlagJoinabilityCTARefactor then
		local var19, var20 = useJoinUserActionsModule(p1.userId, p1.isOpen == true and var5, `{tostring(presence.userPresenceType)}:{tostring(presence.universeId)}:{tostring(presence.placeId)}:{tostring(presence.rootPlaceId)}:{tostring(var14.ageCheckRequired)}`)
		var16 = var19
		var17 = var20
		var18 = useLocalization(actionsModule.TextKeys)
	end
	useLogActionsResolveTimeModule(if fFlagJoinabilityCTARefactor then var17 else nil, p1.isOpen == true and var5, gameJoinCardSurface.Desktop)
	local var21 = if fFlagJoinabilityCTARefactor then var17 == dataStatus.Ready and containsActionModule(var16, userCtaAction.UnlockExperience) else var14.ageCheckRequired == true
	local var22 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var22 (ref), fFlagGameJoinCardAnalyticsCardId (copy), httpService (copy), var7 (write), fFlagJoinUserCTAsIxpEnabled (copy), var1 (copy), fStringJoinUserCTAsIxpLayer (copy), useGameJoinCardAnalyticsModule (copy)
		local var23 = p1.isOpen == true and var5
		
		if var23 and not var22.current then
			local var24 = if fFlagGameJoinCardAnalyticsCardId then httpService:GenerateGUID(false) else nil
			
			if fFlagGameJoinCardAnalyticsCardId then
				var7(var24)
			end
			if fFlagJoinUserCTAsIxpEnabled then
				var1:LogFlagLinkedUserLayerExposure(fStringJoinUserCTAsIxpLayer)
			end
			local universeId = p1.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var24 else nil
			})
		end
		var22.current = var23
	end, dependencyArray(p1.isOpen, var5, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref)
		if p1.isOpen and not var5 then
			p1.onClose()
		end
	end, dependencyArray(var5, p1))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var21 (ref), useGameJoinCardAnalyticsModule (copy), var10 (ref)
		if p1.isOpen and var5 and var21 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var10 ~= "" then nil else var10 })
			
			return
		end
	end, dependencyArray(p1.isOpen, var5, var21, var10))
	local var23 = if var10 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var12 == Enum.AssetFetchStatus.Loading else true else true else true
	local var24 = usePreferredInput() == responsiveModule.Input.Directional
	local var25 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p1.platformProfileId
		var25 = reactModule.useCallback(function()
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local v
	local var26 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and var5
	}) else nil
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var27 (ref), var26 (ref), p1 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var27.current = p2
		
		if var26 then
			var26(p2)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(p2)
		end
	end, { var26, p1.onCardGuiObjectChanged })
	local var29 = useRoactService(appEventIngestService)
	local var30 = useRoactService(appSessionService)
	local var31 = useRoactService(appGuiService)
	local var32 = useAppPolicy(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var33 = nil
	local var34 = false
	
	if fFlagJoinabilityCTARefactor then
		var34 = var17 == dataStatus.NotReady
		local t = {}
		
		if var17 == dataStatus.Ready and var18 ~= nil then
			for i, v in actionsModule.resolveJoinCardActions(var16, {
				localized = var18,
				userId = p1.userId,
				telemetry = {
					universeId = if var10 ~= "" then nil else var10,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil
				},
				presence = {
					placeId = if presence.placeId ~= nil then nil else tostring(presence.placeId),
					rootPlaceId = if presence.rootPlaceId ~= nil then nil else tostring(presence.rootPlaceId)
				},
				experience = {
					isLoading = var23,
					isInExperience = var14.isInExperience,
					joinExperience = var14.joinExperience,
					playExperience = var14.playExperience
				},
				eventIngest = var29,
				dispatch = var3,
				guiService = var31,
				navigation = var4,
				joinAgeCheckUpsellFlow = var14.joinAgeCheckUpsellFlow
			}) do
				if v.id ~= userCtaAction.Chat or var32 then
					table.insert(t, v)
				end
			end
		end
		var33 = t
	end
	local var35 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), presence (ref), gamePlayIntent (copy), var29 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p1.userId
		
		if userId == "" then return end
		local var36 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var37 = tonumber(presence.rootPlaceId)
		
		if var36 == "" or var37 == nil then
			return
		end
		gamePlayIntent(var29, peopleListInHomePage, {
			placeId = var36,
			rootPlaceId = var37,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p1.userId, presence))
	local var36 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), presence (ref), p1 (ref), var30 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var29 (ref), var3 (ref), openGameDetails (copy), var4 (ref)
		if var10 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var37 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var10 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if var30 then
			setGamePlaySession(var30, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var29, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = var37,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = var10
		})
		var3(openGameDetails(var10, var4))
	end, dependencyArray(var3, var4, var10, presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local var37 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), p1 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var6 (write), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var36 (ref)
		if var10 == "" then return end
		if p1.userId ~= "" then
			local t = {
				friendId = p1.userId,
				universeId = if var10 ~= "" then nil else var10,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil
			}
			
			if p2 == viewEDPsourceValues.Thumbnail then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, t)
			elseif p2 == viewEDPsourceValues.Title then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromTitle, t)
			end
		end
		var36()
	end, dependencyArray(var36, var10, p1.userId, p1.homepageCarouselAbsolutePosition, var6))
	local var38 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var10 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var6 (write), var35 (ref), var14 (ref)
		if p1.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if var10 ~= "" then nil else var10,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil
			})
		end
		var35()
		var14.joinExperience()
		p1.onClose()
	end, dependencyArray(var35, var14.joinExperience, p1.userId, var10, p1.homepageCarouselAbsolutePosition, p1.onClose, var6))
	v = reactModule.createElement
	v = v(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var11,
		isLoading = var23,
		onJoin = var38,
		onViewExperienceDetails = var37,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and var5,
		onClose = p1.onClose,
		isConsole = var24,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var28 else nil,
		ageCheckRequired = var14.ageCheckRequired,
		onAgeCheckPressed = var15,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var24 then var25 else nil,
		onChat = if var24 or not var32 then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var10 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var6 (write), fFlagGameJoinCardChatEntryPointModule (copy), var3 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var31 (ref), notificationType (copy)
			if p1.userId == "" then return end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if var10 ~= "" then nil else var10,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil
			})
			
			if fFlagGameJoinCardChatEntryPointModule then
				var3(enteredChatFromEntryPoint(chatEntryPointNames.GameJoinCard))
			end
			var31:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			p1.onClose()
		end, dependencyArray(p1.userId, var10, p1.homepageCarouselAbsolutePosition, var31, p1.onClose, var6, var3)),
		onViewProfile = if not var24 then reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var10 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var6 (write), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), var4 (ref), appPage (copy)
			if p1.userId ~= "" then
				local t = {
					friendId = p1.userId,
					universeId = if var10 ~= "" then nil else var10,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var6 else nil
				}
				
				if p2 == viewProfileSourceValues.UserTile then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, t)
				elseif p2 == viewProfileSourceValues.ViewProfileButton then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, t)
				end
			end;
			(if fFlagEnableSplitPane then var4.push else var4.navigate)(appPage.ProfilePlatform, { detail = p1.userId })
			p1.onClose()
		end, dependencyArray(var4, p1.userId, var10, p1.homepageCarouselAbsolutePosition, p1.onClose, var6)) else nil,
		actions = if fFlagJoinabilityCTARefactor then var33 else {},
		areActionsLoading = if fFlagJoinabilityCTARefactor then var34 else nil
	})
	
	return if p1.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var27 else nil,
			joinExperience = var38
		}),
		Card = v
	}) else v
end