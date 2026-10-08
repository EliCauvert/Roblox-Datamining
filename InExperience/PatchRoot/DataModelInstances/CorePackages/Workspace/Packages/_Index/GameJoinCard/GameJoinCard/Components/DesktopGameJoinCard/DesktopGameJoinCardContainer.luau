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
local fFlagGameJoinCardAnalyticsCardId = sharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
local fFlagJoinabilityCTARefactor = sharedFlagsModule.FFlagJoinabilityCTARefactor
local fFlagJoinUserCTAsIxpEnabled = sharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local fStringJoinUserCTAsIxpLayer = sharedFlagsModule.FStringJoinUserCTAsIxpLayer
local var1 = if fFlagJoinUserCTAsIxpEnabled then require(parent.IXPServiceWrapper).IXPServiceWrapper else nil
local fFlagGameJoinCardChatEntryPointModule = require(gameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
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
	-- upvalues: useDispatch (ref), useNavigation (ref), useNavigationFocus (ref), fFlagGameJoinCardAnalyticsCardId (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), fFlagJoinabilityCTARefactor (ref), useJoinUserActionsModule (ref), useLocalization (ref), actionsModule (ref), useLogActionsResolveTimeModule (ref), gameJoinCardSurface (ref), dataStatus (ref), containsActionModule (ref), userCtaAction (ref), httpService (ref), fFlagJoinUserCTAsIxpEnabled (ref), var1 (ref), fStringJoinUserCTAsIxpLayer (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), fFlagEnableSplitPane (ref), appPage (ref), fFlagGameJoinCardChatEntryPointModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
	local var2 = useDispatch()
	local var3 = useNavigation()
	local var4 = useNavigationFocus() ~= false
	local var5 = nil
	local var6 = nil
	
	if fFlagGameJoinCardAnalyticsCardId then
		local var7, var8 = reactModule.useState(nil)
		var5 = var7
		var6 = var8
	end
	local layoutOrder = p1.layoutOrder
	local playerName = p1.playerName
	local platformName = p1.platformName
	local presence = p1.presence
	local var9 = tostring(presence.universeId)
	local lastLocation = presence.lastLocation
	local var10 = reactModule.useMemo(function()
		-- upvalues: getRbxThumb (copy), thumbnailType (copy), var9 (ref), thumbnailSize (copy)
		return getRbxThumb(thumbnailType.GameIcon, var9, thumbnailSize.Small)
	end, { var9 })
	local var11, var12 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), contentProviderService (copy), var10 (ref)
		var12(contentProviderService:GetAssetFetchStatus(var10))
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: contentProviderService (copy), var10 (ref), var12 (ref)
		local var13 = contentProviderService:GetAssetFetchStatusChangedSignal(var10):Connect(var12)
		
		return function()
			-- upvalues: var13 (ref)
			var13:Disconnect()
		end
	end, { var10 })
	local var13 = useJoinUserInExperience(p1.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition,
		presence = p1.presence,
		onAgeCheckCompletion = useAgeCheckCompletionLogger(var9)
	})
	local var14 = useAgeCheckPressLogger({
		userId = p1.userId,
		universeId = var9,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil,
		joinAgeCheckUpsellFlow = var13.joinAgeCheckUpsellFlow
	})
	local var15 = nil
	local var16 = nil
	local var17 = nil
	
	if fFlagJoinabilityCTARefactor then
		local var18, var19 = useJoinUserActionsModule(p1.userId, p1.isOpen == true and var4, `{tostring(presence.userPresenceType)}:{tostring(presence.universeId)}:{tostring(presence.placeId)}:{tostring(presence.rootPlaceId)}:{tostring(var13.ageCheckRequired)}`)
		var15 = var18
		var16 = var19
		var17 = useLocalization(actionsModule.TextKeys)
	end
	useLogActionsResolveTimeModule(if fFlagJoinabilityCTARefactor then var16 else nil, p1.isOpen == true and var4, gameJoinCardSurface.Desktop)
	local var20 = if fFlagJoinabilityCTARefactor then var16 == dataStatus.Ready and containsActionModule(var15, userCtaAction.UnlockExperience) else var13.ageCheckRequired == true
	local var21 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var21 (ref), fFlagGameJoinCardAnalyticsCardId (copy), httpService (copy), var6 (write), fFlagJoinUserCTAsIxpEnabled (copy), var1 (copy), fStringJoinUserCTAsIxpLayer (copy), useGameJoinCardAnalyticsModule (copy)
		local var22 = p1.isOpen == true and var4
		
		if var22 and not var21.current then
			local var23 = if fFlagGameJoinCardAnalyticsCardId then httpService:GenerateGUID(false) else nil
			
			if fFlagGameJoinCardAnalyticsCardId then
				var6(var23)
			end
			if fFlagJoinUserCTAsIxpEnabled then
				var1:LogFlagLinkedUserLayerExposure(fStringJoinUserCTAsIxpLayer)
			end
			local universeId = p1.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var23 else nil
			})
		end
		var21.current = var22
	end, dependencyArray(p1.isOpen, var4, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		if p1.isOpen and not var4 then
			p1.onClose()
		end
	end, dependencyArray(var4, p1))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var20 (ref), useGameJoinCardAnalyticsModule (copy), var9 (ref)
		if p1.isOpen and var4 and var20 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var9 ~= "" then nil else var9 })
			
			return
		end
	end, dependencyArray(p1.isOpen, var4, var20, var9))
	local var22 = if var9 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var11 == Enum.AssetFetchStatus.Loading else true else true else true
	local var23 = usePreferredInput() == responsiveModule.Input.Directional
	local var24 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p1.platformProfileId
		var24 = reactModule.useCallback(function()
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local v
	local var25 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and var4
	}) else nil
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var26 (ref), var25 (ref), p1 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var26.current = p2
		
		if var25 then
			var25(p2)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(p2)
		end
	end, { var25, p1.onCardGuiObjectChanged })
	local var28 = useRoactService(appEventIngestService)
	local var29 = useRoactService(appSessionService)
	local var30 = useRoactService(appGuiService)
	local var31 = useAppPolicy(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var32 = nil
	local var33 = false
	
	if fFlagJoinabilityCTARefactor then
		var33 = var16 == dataStatus.NotReady
		local t = {}
		
		if var16 == dataStatus.Ready and var17 ~= nil then
			for i, v in actionsModule.resolveJoinCardActions(var15, {
				localized = var17,
				userId = p1.userId,
				telemetry = {
					universeId = if var9 ~= "" then nil else var9,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil
				},
				presence = {
					placeId = if presence.placeId ~= nil then nil else tostring(presence.placeId),
					rootPlaceId = if presence.rootPlaceId ~= nil then nil else tostring(presence.rootPlaceId)
				},
				experience = {
					isLoading = var22,
					isInExperience = var13.isInExperience,
					joinExperience = var13.joinExperience,
					playExperience = var13.playExperience
				},
				eventIngest = var28,
				dispatch = var2,
				guiService = var30,
				navigation = var3,
				joinAgeCheckUpsellFlow = var13.joinAgeCheckUpsellFlow
			}) do
				if v.id ~= userCtaAction.Chat or var31 then
					table.insert(t, v)
				end
			end
		end
		var32 = t
	end
	local var34 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), presence (ref), gamePlayIntent (copy), var28 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p1.userId
		
		if userId == "" then return end
		local var35 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var36 = tonumber(presence.rootPlaceId)
		
		if var35 == "" or var36 == nil then
			return
		end
		gamePlayIntent(var28, peopleListInHomePage, {
			placeId = var35,
			rootPlaceId = var36,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p1.userId, presence))
	local var35 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), presence (ref), p1 (ref), var29 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var28 (ref), var2 (ref), openGameDetails (copy), var3 (ref)
		if var9 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var36 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var9 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if var29 then
			setGamePlaySession(var29, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var28, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = var36,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = var9
		})
		var2(openGameDetails(var9, var3))
	end, dependencyArray(var2, var3, var9, presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local var36 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), p1 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var5 (write), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var35 (ref)
		if var9 == "" then return end
		if p1.userId ~= "" then
			local t = {
				friendId = p1.userId,
				universeId = if var9 ~= "" then nil else var9,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil
			}
			
			if p2 == viewEDPsourceValues.Thumbnail then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, t)
			elseif p2 == viewEDPsourceValues.Title then
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.ViewExperienceDetailsFromTitle, t)
			end
		end
		var35()
	end, dependencyArray(var35, var9, p1.userId, p1.homepageCarouselAbsolutePosition, var5))
	local var37 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var9 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var5 (write), var34 (ref), var13 (ref)
		if p1.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if var9 ~= "" then nil else var9,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil
			})
		end
		var34()
		var13.joinExperience()
		p1.onClose()
	end, dependencyArray(var34, var13.joinExperience, p1.userId, var9, p1.homepageCarouselAbsolutePosition, p1.onClose, var5))
	v = reactModule.createElement
	v = v(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var10,
		isLoading = var22,
		onJoin = var37,
		onViewExperienceDetails = var36,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and var4,
		onClose = p1.onClose,
		isConsole = var23,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var27 else nil,
		ageCheckRequired = var13.ageCheckRequired,
		onAgeCheckPressed = var14,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var23 then var24 else nil,
		onChat = if var23 or not var31 then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var9 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var5 (write), fFlagGameJoinCardChatEntryPointModule (copy), var2 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var30 (ref), notificationType (copy)
			if p1.userId == "" then return end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if var9 ~= "" then nil else var9,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil
			})
			
			if fFlagGameJoinCardChatEntryPointModule then
				var2(enteredChatFromEntryPoint(chatEntryPointNames.GameJoinCard))
			end
			var30:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			p1.onClose()
		end, dependencyArray(p1.userId, var9, p1.homepageCarouselAbsolutePosition, var30, p1.onClose, var5, var2)),
		onViewProfile = if not var23 then reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var9 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var5 (write), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), var3 (ref), appPage (copy)
			if p1.userId ~= "" then
				local t = {
					friendId = p1.userId,
					universeId = if var9 ~= "" then nil else var9,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var5 else nil
				}
				
				if p2 == viewProfileSourceValues.UserTile then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, t)
				elseif p2 == viewProfileSourceValues.ViewProfileButton then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, t)
				end
			end;
			(if fFlagEnableSplitPane then var3.push else var3.navigate)(appPage.ProfilePlatform, { detail = p1.userId })
			p1.onClose()
		end, dependencyArray(var3, p1.userId, var9, p1.homepageCarouselAbsolutePosition, p1.onClose, var5)) else nil,
		actions = if fFlagJoinabilityCTARefactor then var32 else {},
		areActionsLoading = if fFlagJoinabilityCTARefactor then var33 else nil
	})
	
	return if p1.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var26 else nil,
			joinExperience = var37
		}),
		Card = v
	}) else v
end