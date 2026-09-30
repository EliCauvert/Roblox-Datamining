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
local fFlagGameJoinCardChatEntryPointModule = require(gameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local getPlatformFriendsServiceModule = require(gameJoinCard.Utils.getPlatformFriendsService)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local actionsModule = require(gameJoinCard.Components.Actions)
local containsActionModule = require(gameJoinCard.Components.Actions.containsAction)
local useJoinUserActionsModule = require(gameJoinCard.Hooks.useJoinUserActions)
local dataStatus = dataHydrationModule.DataStatus

return function(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useNavigationFocus (ref), fFlagGameJoinCardAnalyticsCardId (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), useAgeCheckPressLogger (ref), fFlagJoinabilityCTARefactor (ref), useJoinUserActionsModule (ref), useLocalization (ref), actionsModule (ref), dataStatus (ref), containsActionModule (ref), userCtaAction (ref), httpService (ref), useGameJoinCardAnalyticsModule (ref), dependencyArray (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableConsoleGameJoinCard (ref), getPlatformFriendsServiceModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), appGuiService (ref), useAppPolicy (ref), gamePlayIntent (ref), peopleListInHomePage (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), gameJoinCardButtonAction (ref), viewProfileSourceValues (ref), fFlagEnableSplitPane (ref), appPage (ref), fFlagGameJoinCardChatEntryPointModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), notificationType (ref), desktopGameJoinCardModule (ref), gamepadJoinFocusBehaviorModule (ref)
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
		onAgeCheckCompletion = useAgeCheckCompletionLogger(var8)
	})
	local var13 = useAgeCheckPressLogger({
		userId = p1.userId,
		universeId = var8,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil,
		joinAgeCheckUpsellFlow = var12.joinAgeCheckUpsellFlow
	})
	local var14 = nil
	local var15 = nil
	local var16 = nil
	
	if fFlagJoinabilityCTARefactor then
		local var17, var18 = useJoinUserActionsModule(p1.userId, p1.isOpen == true and var3, `{tostring(presence.userPresenceType)}:{tostring(presence.universeId)}:{tostring(presence.placeId)}:{tostring(presence.rootPlaceId)}:{tostring(var12.ageCheckRequired)}`)
		var14 = var17
		var15 = var18
		var16 = useLocalization(actionsModule.TextKeys)
	end
	local var19 = if fFlagJoinabilityCTARefactor then var15 == dataStatus.Ready and containsActionModule(var14, userCtaAction.UnlockExperience) else var12.ageCheckRequired == true
	local var20 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var20 (ref), fFlagGameJoinCardAnalyticsCardId (copy), httpService (copy), var5 (write), useGameJoinCardAnalyticsModule (copy)
		local var21 = p1.isOpen == true and var3
		
		if var21 and not var20.current then
			local var22 = if fFlagGameJoinCardAnalyticsCardId then httpService:GenerateGUID(false) else nil
			
			if fFlagGameJoinCardAnalyticsCardId then
				var5(var22)
			end
			local universeId = p1.presence.universeId
			useGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if universeId == nil or tostring(universeId) == "" then nil else tostring(universeId),
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var22 else nil
			})
		end
		var20.current = var21
	end, dependencyArray(p1.isOpen, var3, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.isOpen and not var3 then
			p1.onClose()
		end
	end, dependencyArray(var3, p1))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var19 (ref), useGameJoinCardAnalyticsModule (copy), var8 (ref)
		if p1.isOpen and var3 and var19 then
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if var8 ~= "" then nil else var8 })
			
			return
		end
	end, dependencyArray(p1.isOpen, var3, var19, var8))
	local var21 = if var8 ~= "" then if lastLocation ~= nil then if lastLocation ~= "" then var10 == Enum.AssetFetchStatus.Loading else true else true else true
	local var22 = usePreferredInput() == responsiveModule.Input.Directional
	local var23 = nil
	
	if fFlagEnableConsoleGameJoinCard then
		local platformProfileId = p1.platformProfileId
		var23 = reactModule.useCallback(function()
			-- upvalues: getPlatformFriendsServiceModule (copy), platformProfileId (ref)
			if getPlatformFriendsServiceModule == nil or platformProfileId == nil or platformProfileId == "" then
				return
			end
			getPlatformFriendsServiceModule:ShowProfile(platformProfileId)
		end, { platformProfileId })
	end
	local v
	local var24 = if fFlagEnableConsoleGameJoinCard then useAppFocusRoot({
		isAutoFocusRoot = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and var3
	}) else nil
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleGameJoinCard (copy), var25 (ref), var24 (ref), p1 (ref)
		if not fFlagEnableConsoleGameJoinCard then return end
		var25.current = p2
		
		if var24 then
			var24(p2)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(p2)
		end
	end, { var24, p1.onCardGuiObjectChanged })
	local var27 = useRoactService(appEventIngestService)
	local var28 = useRoactService(appSessionService)
	local var29 = useRoactService(appGuiService)
	local var30 = useAppPolicy(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var31 = nil
	local var32 = false
	
	if fFlagJoinabilityCTARefactor then
		var32 = var15 == dataStatus.NotReady
		local t = {}
		
		if var15 == dataStatus.Ready and var16 ~= nil then
			for i, v in actionsModule.resolveJoinCardActions(var14, {
				localized = var16,
				userId = p1.userId,
				telemetry = {
					universeId = if var8 ~= "" then nil else var8,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
				},
				presence = {
					placeId = if presence.placeId ~= nil then nil else tostring(presence.placeId),
					rootPlaceId = if presence.rootPlaceId ~= nil then nil else tostring(presence.rootPlaceId)
				},
				experience = {
					isLoading = var21,
					isInExperience = var12.isInExperience,
					joinExperience = var12.joinExperience,
					playExperience = var12.playExperience
				},
				eventIngest = var27,
				dispatch = var1,
				guiService = var29,
				navigation = var2,
				joinAgeCheckUpsellFlow = var12.joinAgeCheckUpsellFlow
			}) do
				if v.id ~= userCtaAction.Chat or var30 then
					table.insert(t, v)
				end
			end
		end
		var31 = t
	end
	local var33 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), presence (ref), gamePlayIntent (copy), var27 (ref), peopleListInHomePage (copy), httpService (copy)
		local userId = p1.userId
		
		if userId == "" then return end
		local var34 = if presence.placeId == nil or tostring(presence.placeId) == "" then "" else tostring(presence.placeId)
		local var35 = tonumber(presence.rootPlaceId)
		
		if var34 == "" or var35 == nil then
			return
		end
		gamePlayIntent(var27, peopleListInHomePage, {
			placeId = var34,
			rootPlaceId = var35,
			friendId = userId,
			joinAttemptId = httpService:GenerateGUID(false)
		})
	end, dependencyArray(p1.userId, presence))
	local var34 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), presence (ref), p1 (ref), var28 (ref), setGamePlaySession (copy), sessionType (copy), gameDetailReferral (copy), var27 (ref), var1 (ref), openGameDetails (copy), var2 (ref)
		if var8 == "" then return end
		local rootPlaceId = presence.rootPlaceId
		local var35 = if rootPlaceId == nil or tostring(rootPlaceId) == "" then var8 else tostring(rootPlaceId)
		local homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if var28 then
			setGamePlaySession(var28, sessionType.StructuralIdentifier.GameDetailSource, false)
		end
		gameDetailReferral(var27, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = var35,
			pos = homepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = var8
		})
		var1(openGameDetails(var8, var2))
	end, dependencyArray(var1, var2, var8, presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), p1 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), viewEDPsourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var34 (ref)
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
		var34()
	end, dependencyArray(var34, var8, p1.userId, p1.homepageCarouselAbsolutePosition, var4))
	local var36 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var8 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), var33 (ref), var12 (ref)
		if p1.userId ~= "" then
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if var8 ~= "" then nil else var8,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
			})
		end
		var33()
		var12.joinExperience()
		p1.onClose()
	end, dependencyArray(var33, var12.joinExperience, p1.userId, var8, p1.homepageCarouselAbsolutePosition, p1.onClose, var4))
	v = reactModule.createElement
	v = v(desktopGameJoinCardModule, {
		layoutOrder = layoutOrder,
		playerName = playerName,
		experienceName = lastLocation,
		gameIconUrl = var9,
		isLoading = var21,
		onJoin = var36,
		onViewExperienceDetails = var35,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and var3,
		onClose = p1.onClose,
		isConsole = var22,
		consolePlatformLabel = platformName,
		focusRootRef = if fFlagEnableConsoleGameJoinCard then var26 else nil,
		ageCheckRequired = var12.ageCheckRequired,
		onAgeCheckPressed = var13,
		onPlatformProfilePressed = if fFlagEnableConsoleGameJoinCard and var22 then var23 else nil,
		onChat = if var22 or not var30 then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), var8 (ref), fFlagGameJoinCardAnalyticsCardId (copy), var4 (write), fFlagGameJoinCardChatEntryPointModule (copy), var1 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var29 (ref), notificationType (copy)
			if p1.userId == "" then return end
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if var8 ~= "" then nil else var8,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if fFlagGameJoinCardAnalyticsCardId then var4 else nil
			})
			
			if fFlagGameJoinCardChatEntryPointModule then
				var1(enteredChatFromEntryPoint(chatEntryPointNames.GameJoinCard))
			end
			var29:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			p1.onClose()
		end, dependencyArray(p1.userId, var8, p1.homepageCarouselAbsolutePosition, var29, p1.onClose, var4, var1)),
		onViewProfile = if not var22 then reactModule.useCallback(function(p2)
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
		end, dependencyArray(var2, p1.userId, var8, p1.homepageCarouselAbsolutePosition, p1.onClose, var4)) else nil,
		actions = if fFlagJoinabilityCTARefactor then var31 else {},
		areActionsLoading = if fFlagJoinabilityCTARefactor then var32 else nil
	})
	
	return if p1.showGamepadJoinFocus then reactModule.createElement(reactModule.Fragment, nil, {
		GamepadJoinFocus = reactModule.createElement(gamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if fFlagEnableConsoleGameJoinCard then var25 else nil,
			joinExperience = var36
		}),
		Card = v
	}) else v
end