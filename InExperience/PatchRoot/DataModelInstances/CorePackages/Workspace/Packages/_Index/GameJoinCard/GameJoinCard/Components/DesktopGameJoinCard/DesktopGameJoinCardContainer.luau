local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local DataHydrationModule = require(Parent.DataHydration)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SocialCommonModule = require(Parent.SocialCommon)
local ChatEntryPointNames = SocialCommonModule.Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = SocialCommonModule.Actions.EnteredChatFromEntryPoint
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local GameDetailReferralFunction = DiscoveryAnalyticsModule.Events.gameDetailReferral
local PeopleListInHomePage = DiscoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local AppPage = RobloxAppEnumsModule.AppPage
local NotificationType = RobloxAppEnumsModule.NotificationType
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local AppGuiService = RoactServiceTagsModule.AppGuiService
local SetGamePlaySessionFunction = require(Parent.RobloxAppSessionization).SetGamePlaySession
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local UseDeviceTypeFunction = RobloxAppHooksModule.useDeviceType
local ContentProvider = game:GetService("ContentProvider")
local DesktopGameJoinCardModule = require(script.Parent.DesktopGameJoinCard)
local GamepadJoinFocusBehaviorModule = require(script.Parent.GamepadJoinFocusBehavior)
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local Hooks = require(Parent.RoactUtils).Hooks
local DependencyArrayFunction = Hooks.dependencyArray
local UseDispatchFunction = Hooks.RoactRodux.useDispatch
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagDesktopGameJoinCardGamepadSupport = SharedFlagsModule.FFlagDesktopGameJoinCardGamepadSupport
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
local FFlagEnableOnScreenAPIIntegration = SharedFlagsModule.FFlagEnableOnScreenAPIIntegration
local FFlagGameJoinCardAnalyticsCardId = SharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor
local FFlagJoinUserCTAsIxpEnabled = SharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local FStringJoinUserCTAsIxpLayer = SharedFlagsModule.FStringJoinUserCTAsIxpLayer
local IXPServiceWrapper = if FFlagJoinUserCTAsIxpEnabled then require(Parent.IXPServiceWrapper).IXPServiceWrapper else nil
local FFlagGameJoinCardChatEntryPointModule = require(GameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local UseIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(Parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local GetPlatformFriendsServiceModule = require(GameJoinCard.Utils.getPlatformFriendsService)
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction
local GameJoinCardSurface = AnalyticsConstantsModule.GameJoinCardSurface
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local UseGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local UseAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local UseAgeCheckCompletionLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local UseAgeCheckPressLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local ActionsModule = require(GameJoinCard.Components.Actions)
local ContainsActionModule = require(GameJoinCard.Components.Actions.containsAction)
local UseJoinUserActionsModule = require(GameJoinCard.Hooks.useJoinUserActions)
local UseLogActionsResolveTimeModule = require(GameJoinCard.Telemetry.useLogActionsResolveTime)
local DataStatus = DataHydrationModule.DataStatus

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagEnableOnScreenAPIIntegration (copy), UseIsRouteOnScreen (copy), UseNavigationFocusFunction (copy), FFlagGameJoinCardAnalyticsCardId (copy), ReactModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), ContentProvider (copy), UseAgeCheckCompletionLoggerFunction (copy), UseJoinUserInExperienceFunction (copy), UseAgeCheckPressLoggerFunction (copy), FFlagJoinabilityCTARefactor (copy), UseJoinUserActionsModule (copy), UseLocalizationFunction (copy), ActionsModule (copy), UseLogActionsResolveTimeModule (copy), GameJoinCardSurface (copy), DataStatus (copy), ContainsActionModule (copy), UserCtaAction (copy), HttpService (copy), FFlagJoinUserCTAsIxpEnabled (copy), IXPServiceWrapper (copy), FStringJoinUserCTAsIxpLayer (copy), UseGameJoinCardAnalyticsModule (copy), DependencyArrayFunction (copy), UsePreferredInputFunction (copy), FFlagDesktopGameJoinCardGamepadSupport (copy), UseDeviceTypeFunction (copy), ResponsiveModule (copy), RobloxAppEnumsModule (copy), GetPlatformFriendsServiceModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppSessionService (copy), AppGuiService (copy), UseAppPolicyFunction (copy), GamePlayIntentFunction (copy), PeopleListInHomePage (copy), SetGamePlaySessionFunction (copy), SessionType (copy), GameDetailReferralFunction (copy), OpenGameDetailsFunction (copy), ViewEDPsourceValues (copy), GameJoinCardButtonAction (copy), ViewProfileSourceValues (copy), FFlagEnableSplitPane (copy), AppPage (copy), FFlagGameJoinCardChatEntryPointModule (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), NotificationType (copy), DesktopGameJoinCardModule (copy), GamepadJoinFocusBehaviorModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseIsRouteOnScreenResult = if FFlagEnableOnScreenAPIIntegration then UseIsRouteOnScreen() else UseNavigationFocusFunction() ~= false
	local v1 = nil
	local Callback = nil
	
	if FFlagGameJoinCardAnalyticsCardId then
		v1, Callback = ReactModule.useState(nil)
	end
	local LayoutOrder = p1.layoutOrder
	local PlayerName = p1.playerName
	local PlatformName = p1.platformName
	local Presence = p1.presence
	local Text = tostring(Presence.universeId)
	local LastLocation = Presence.lastLocation
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetRbxThumbFunction (upval), ThumbnailType (upval), Text (copy), ThumbnailSize (upval)
		return GetRbxThumbFunction(ThumbnailType.GameIcon, Text, ThumbnailSize.Small)
	end, { Text })
	local UseStateResult, UseStateResult2 = ReactModule.useState(Enum.AssetFetchStatus.None)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), ContentProvider (upval), UseMemoResult (copy)
		UseStateResult2(ContentProvider:GetAssetFetchStatus(UseMemoResult))
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: ContentProvider (upval), UseMemoResult (copy), UseStateResult2 (copy)
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(UseMemoResult):Connect(UseStateResult2)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseMemoResult })
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(p1.userId, {
		isHomePageCarousel = true,
		homepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition,
		presence = p1.presence,
		onAgeCheckCompletion = UseAgeCheckCompletionLoggerFunction(Text)
	})
	local UseAgeCheckPressLoggerResult = UseAgeCheckPressLoggerFunction({
		userId = p1.userId,
		universeId = Text,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil,
		joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
	})
	local v2 = nil
	local Ready = nil
	local Localized = nil
	
	if FFlagJoinabilityCTARefactor then
		v2, Ready = UseJoinUserActionsModule(p1.userId, p1.isOpen == true and UseIsRouteOnScreenResult, `{tostring(Presence.userPresenceType)}:{tostring(Presence.universeId)}:{tostring(Presence.placeId)}:{tostring(Presence.rootPlaceId)}:{tostring(UseJoinUserInExperienceResult.ageCheckRequired)}`)
		Localized = UseLocalizationFunction(ActionsModule.TextKeys)
	end
	UseLogActionsResolveTimeModule(if FFlagJoinabilityCTARefactor then Ready else nil, p1.isOpen == true and UseIsRouteOnScreenResult, GameJoinCardSurface.Desktop)
	local ContainsActionModuleResult = if FFlagJoinabilityCTARefactor then Ready == DataStatus.Ready and ContainsActionModule(v2, UserCtaAction.UnlockExperience) else UseJoinUserInExperienceResult.ageCheckRequired == true
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsRouteOnScreenResult (copy), UseRefResult (copy), FFlagGameJoinCardAnalyticsCardId (upval), HttpService (upval), Callback (ref), FFlagJoinUserCTAsIxpEnabled (upval), IXPServiceWrapper (upval), FStringJoinUserCTAsIxpLayer (upval), UseGameJoinCardAnalyticsModule (upval)
		local UseIsRouteOnScreenResult1 = p1.isOpen == true and UseIsRouteOnScreenResult
		
		if UseIsRouteOnScreenResult1 and not UseRefResult.current then
			local Guid = if FFlagGameJoinCardAnalyticsCardId then HttpService:GenerateGUID(false) else nil
			
			if FFlagGameJoinCardAnalyticsCardId then
				Callback(Guid)
			end
			if FFlagJoinUserCTAsIxpEnabled then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringJoinUserCTAsIxpLayer)
			end
			local UniverseId = p1.presence.universeId
			UseGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if UniverseId == nil or tostring(UniverseId) == "" then nil else tostring(UniverseId),
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then Guid else nil
			})
		end
		UseRefResult.current = UseIsRouteOnScreenResult1
	end, DependencyArrayFunction(p1.isOpen, UseIsRouteOnScreenResult, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsRouteOnScreenResult (copy)
		if p1.isOpen and not UseIsRouteOnScreenResult then
			p1.onClose()
		end
	end, DependencyArrayFunction(UseIsRouteOnScreenResult, p1))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsRouteOnScreenResult (copy), ContainsActionModuleResult (copy), UseGameJoinCardAnalyticsModule (upval), Text (copy)
		if p1.isOpen and UseIsRouteOnScreenResult and ContainsActionModuleResult then
			UseGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if Text == "" then nil else Text })
			
			return
		end
	end, DependencyArrayFunction(p1.isOpen, UseIsRouteOnScreenResult, ContainsActionModuleResult, Text))
	local IsTextMatch: boolean = Text == "" or (LastLocation == nil or (LastLocation == "" or UseStateResult == Enum.AssetFetchStatus.Loading))
	local UseDeviceTypeResult = if FFlagDesktopGameJoinCardGamepadSupport then UseDeviceTypeFunction() else nil
	local Inverted: boolean = UsePreferredInputFunction() == ResponsiveModule.Input.Directional and not (FFlagDesktopGameJoinCardGamepadSupport and UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Desktop)
	local PlatformProfileId = p1.platformProfileId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetPlatformFriendsServiceModule (upval), PlatformProfileId (copy)
		if GetPlatformFriendsServiceModule ~= nil and PlatformProfileId ~= nil and PlatformProfileId ~= "" then
			GetPlatformFriendsServiceModule:ShowProfile(PlatformProfileId)
			
			return
		end
	end, { PlatformProfileId })
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and UseIsRouteOnScreenResult
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	local Inverted1 = not (FFlagDesktopGameJoinCardGamepadSupport and not Inverted)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseAppFocusRootResult (copy), Inverted1 (copy), p1 (copy)
		UseRefResult1.current = Current
		
		if UseAppFocusRootResult and Inverted1 then
			UseAppFocusRootResult(Current)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(Current)
		end
	end, {
		UseAppFocusRootResult,
		p1.onCardGuiObjectChanged,
		Inverted1
	})
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppGuiService)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local v3 = nil
	local IsNotReadyMatch = false
	
	if FFlagJoinabilityCTARefactor then
		IsNotReadyMatch = Ready == DataStatus.NotReady
		local List = {}
		
		if Ready == DataStatus.Ready and Localized ~= nil then
			for _, value in ActionsModule.resolveJoinCardActions(v2, {
				localized = Localized,
				userId = p1.userId,
				telemetry = {
					universeId = if Text == "" then nil else Text,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil
				},
				presence = {
					placeId = if Presence.placeId == nil then nil else tostring(Presence.placeId),
					rootPlaceId = if Presence.rootPlaceId == nil then nil else tostring(Presence.rootPlaceId)
				},
				experience = {
					isLoading = IsTextMatch,
					isInExperience = UseJoinUserInExperienceResult.isInExperience,
					joinExperience = UseJoinUserInExperienceResult.joinExperience,
					playExperience = UseJoinUserInExperienceResult.playExperience
				},
				eventIngest = UseRoactServiceResult,
				dispatch = UseDispatchResult,
				guiService = UseRoactServiceResult2,
				navigation = UseNavigationResult,
				joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
			}) do
				if value.id ~= UserCtaAction.Chat or UseAppPolicyResult then
					table.insert(List, value)
				end
			end
		end
		v3 = List
	end
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Presence (copy), GamePlayIntentFunction (upval), UseRoactServiceResult (copy), PeopleListInHomePage (upval), HttpService (upval)
		local UserId = p1.userId
		
		if UserId == "" then return end
		local Text: string = if Presence.placeId == nil or tostring(Presence.placeId) == "" then "" else tostring(Presence.placeId)
		local Number: number? = tonumber(Presence.rootPlaceId)
		
		if Text ~= "" and Number ~= nil then
			GamePlayIntentFunction(UseRoactServiceResult, PeopleListInHomePage, {
				placeId = Text,
				rootPlaceId = Number,
				friendId = UserId,
				joinAttemptId = HttpService:GenerateGUID(false)
			})
			
			return
		end
	end, DependencyArrayFunction(p1.userId, Presence))
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: Text (copy), Presence (copy), p1 (copy), UseRoactServiceResult1 (copy), SetGamePlaySessionFunction (upval), SessionType (upval), GameDetailReferralFunction (upval), UseRoactServiceResult (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy)
		if Text == "" then return end
		local RootPlaceId = Presence.rootPlaceId
		local Text1 = if RootPlaceId == nil or tostring(RootPlaceId) == "" then Text else tostring(RootPlaceId)
		local HomepageCarouselAbsolutePosition = p1.homepageCarouselAbsolutePosition or 0
		
		if UseRoactServiceResult1 then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GameDetailSource, false)
		end
		GameDetailReferralFunction(UseRoactServiceResult, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = p1.userId,
			pid = Text1,
			pos = HomepageCarouselAbsolutePosition,
			sortPos = p1.layoutOrder,
			universeId = Text
		})
		UseDispatchResult(OpenGameDetailsFunction(Text, UseNavigationResult))
	end, DependencyArrayFunction(UseDispatchResult, UseNavigationResult, Text, Presence, p1.homepageCarouselAbsolutePosition, p1.layoutOrder, p1.userId))
	local UseResult4 = ReactModule.useCallback(function(Thumbnail)
		-- upvalues: Text (copy), p1 (copy), FFlagGameJoinCardAnalyticsCardId (upval), v1 (ref), ViewEDPsourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UseResult3 (copy)
		if Text == "" then return end
		if p1.userId ~= "" then
			local config = {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil
			}
			
			if Thumbnail == ViewEDPsourceValues.Thumbnail then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, config)
			elseif Thumbnail == ViewEDPsourceValues.Title then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.ViewExperienceDetailsFromTitle, config)
			end
		end
		UseResult3()
	end, DependencyArrayFunction(UseResult3, Text, p1.userId, p1.homepageCarouselAbsolutePosition, v1))
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), Text (copy), FFlagGameJoinCardAnalyticsCardId (upval), v1 (ref), UseResult2 (copy), UseJoinUserInExperienceResult (copy)
		if p1.userId ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil
			})
		end
		UseResult2()
		UseJoinUserInExperienceResult.joinExperience()
		p1.onClose()
	end, DependencyArrayFunction(UseResult2, UseJoinUserInExperienceResult.joinExperience, p1.userId, Text, p1.homepageCarouselAbsolutePosition, p1.onClose, v1))
	local UseResult6 = ReactModule.useCallback(function(UserTile)
		-- upvalues: p1 (copy), Text (copy), FFlagGameJoinCardAnalyticsCardId (upval), v1 (ref), ViewProfileSourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval)
		if p1.userId ~= "" then
			local config = {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil
			}
			
			if UserTile == ViewProfileSourceValues.UserTile then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromUserTile, config)
			elseif UserTile == ViewProfileSourceValues.ViewProfileButton then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, config)
			end
		end;
		(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, { detail = p1.userId })
		p1.onClose()
	end, DependencyArrayFunction(UseNavigationResult, p1.userId, Text, p1.homepageCarouselAbsolutePosition, p1.onClose, v1))
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), Text (copy), FFlagGameJoinCardAnalyticsCardId (upval), v1 (ref), FFlagGameJoinCardChatEntryPointModule (upval), UseDispatchResult (copy), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), UseRoactServiceResult2 (copy), NotificationType (upval)
		if p1.userId == "" then return end
		UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, {
			friendId = p1.userId,
			universeId = if Text == "" then nil else Text,
			absolutePosition = p1.homepageCarouselAbsolutePosition,
			joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then v1 else nil
		})
		
		if FFlagGameJoinCardChatEntryPointModule then
			UseDispatchResult(EnteredChatFromEntryPointFunction(ChatEntryPointNames.GameJoinCard))
		end
		UseRoactServiceResult2:BroadcastNotification(p1.userId, NotificationType.LAUNCH_CONVERSATION)
		p1.onClose()
	end, DependencyArrayFunction(p1.userId, Text, p1.homepageCarouselAbsolutePosition, UseRoactServiceResult2, p1.onClose, v1, UseDispatchResult))
	local Element = ReactModule.createElement(DesktopGameJoinCardModule, {
		layoutOrder = LayoutOrder,
		playerName = PlayerName,
		experienceName = LastLocation,
		gameIconUrl = UseMemoResult,
		isLoading = IsTextMatch,
		onJoin = UseResult5,
		onViewExperienceDetails = UseResult4,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and UseIsRouteOnScreenResult,
		onClose = p1.onClose,
		isConsole = Inverted,
		consolePlatformLabel = PlatformName,
		focusRootRef = UseResult1,
		ageCheckRequired = UseJoinUserInExperienceResult.ageCheckRequired,
		onAgeCheckPressed = UseAgeCheckPressLoggerResult,
		onPlatformProfilePressed = if Inverted then UseResult else nil,
		onChat = if Inverted or not UseAppPolicyResult then nil else UseResult7,
		onViewProfile = if Inverted then nil else UseResult6,
		actions = if FFlagJoinabilityCTARefactor then v3 else {},
		areActionsLoading = if FFlagJoinabilityCTARefactor then IsNotReadyMatch else nil
	})
	
	return if p1.showGamepadJoinFocus then ReactModule.createElement(ReactModule.Fragment, nil, {
		GamepadJoinFocus = ReactModule.createElement(GamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = UseRefResult1,
			joinExperience = UseResult5
		}),
		Card = Element
	}) else Element
end