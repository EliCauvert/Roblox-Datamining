local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(Parent.SocialCommon)
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
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
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
local FFlagEnableConsoleGameJoinCard = SharedFlagsModule.FFlagEnableConsoleGameJoinCard
local FFlagJoinCardAgeCheckUpsell = SharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local GetPlatformFriendsServiceModule = require(GameJoinCard.Utils.getPlatformFriendsService)
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local UseGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local UseAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local UseAgeCheckCompletionLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local UseAgeCheckPressLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseNavigationFocusFunction (copy), ReactModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), ContentProvider (copy), FFlagJoinCardAgeCheckUpsell (copy), UseAgeCheckCompletionLoggerFunction (copy), UseJoinUserInExperienceFunction (copy), UseAgeCheckPressLoggerFunction (copy), UseGameJoinCardAnalyticsModule (copy), DependencyArrayFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagEnableConsoleGameJoinCard (copy), GetPlatformFriendsServiceModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppSessionService (copy), AppGuiService (copy), UseAppPolicyFunction (copy), GamePlayIntentFunction (copy), PeopleListInHomePage (copy), HttpService (copy), SetGamePlaySessionFunction (copy), SessionType (copy), GameDetailReferralFunction (copy), OpenGameDetailsFunction (copy), ViewEDPsourceValues (copy), GameJoinCardButtonAction (copy), ViewProfileSourceValues (copy), AppPage (copy), NotificationType (copy), DesktopGameJoinCardModule (copy), GamepadJoinFocusBehaviorModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local IsUseNavigationFocusResult = UseNavigationFocusFunction() ~= false
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
		onAgeCheckCompletion = if FFlagJoinCardAgeCheckUpsell then UseAgeCheckCompletionLoggerFunction(Text) else nil
	})
	local UseAgeCheckPressLoggerResult = if FFlagJoinCardAgeCheckUpsell then UseAgeCheckPressLoggerFunction({
		userId = p1.userId,
		universeId = Text,
		absolutePosition = p1.homepageCarouselAbsolutePosition,
		joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
	}) else nil
	local IsAgeCheckRequired: boolean = FFlagJoinCardAgeCheckUpsell and UseJoinUserInExperienceResult.ageCheckRequired == true
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), IsUseNavigationFocusResult (copy), UseRefResult (copy), UseGameJoinCardAnalyticsModule (upval)
		local IsUseNavigationFocusResult1 = p1.isOpen == true and IsUseNavigationFocusResult
		
		if IsUseNavigationFocusResult1 and not UseRefResult.current then
			local UniverseId = p1.presence.universeId
			UseGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = p1.userId,
				universeId = if UniverseId == nil or tostring(UniverseId) == "" then nil else tostring(UniverseId),
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
		end
		UseRefResult.current = IsUseNavigationFocusResult1
	end, DependencyArrayFunction(p1.isOpen, IsUseNavigationFocusResult, p1.userId, p1.presence, p1.homepageCarouselAbsolutePosition))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), IsUseNavigationFocusResult (copy)
		if p1.isOpen and not IsUseNavigationFocusResult then
			p1.onClose()
		end
	end, DependencyArrayFunction(IsUseNavigationFocusResult, p1))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), IsUseNavigationFocusResult (copy), IsAgeCheckRequired (copy), UseGameJoinCardAnalyticsModule (upval), Text (copy)
		if p1.isOpen and IsUseNavigationFocusResult and IsAgeCheckRequired then
			UseGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = if Text == "" then nil else Text })
			
			return
		end
	end, DependencyArrayFunction(p1.isOpen, IsUseNavigationFocusResult, IsAgeCheckRequired, Text))
	local IsTextMatch: boolean = Text == "" or (LastLocation == nil or (LastLocation == "" or UseStateResult == Enum.AssetFetchStatus.Loading))
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseResult = nil
	
	if FFlagEnableConsoleGameJoinCard then
		local PlatformProfileId = p1.platformProfileId
		UseResult = ReactModule.useCallback(function()
			-- upvalues: GetPlatformFriendsServiceModule (upval), PlatformProfileId (copy)
			if GetPlatformFriendsServiceModule ~= nil and PlatformProfileId ~= nil and PlatformProfileId ~= "" then
				GetPlatformFriendsServiceModule:ShowProfile(PlatformProfileId)
				
				return
			end
		end, { PlatformProfileId })
	end
	local UseAppFocusRootResult = if FFlagEnableConsoleGameJoinCard then UseAppFocusRootFunction({
		isAutoFocusRoot = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = p1.isFocused == true and IsUseNavigationFocusResult
	}) else nil
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: FFlagEnableConsoleGameJoinCard (upval), UseRefResult1 (copy), UseAppFocusRootResult (copy), p1 (copy)
		if not FFlagEnableConsoleGameJoinCard then return end
		UseRefResult1.current = Current
		
		if UseAppFocusRootResult then
			UseAppFocusRootResult(Current)
		end
		if p1.onCardGuiObjectChanged then
			p1.onCardGuiObjectChanged(Current)
		end
	end, { UseAppFocusRootResult, p1.onCardGuiObjectChanged })
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppGuiService)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getCanUsePlatformChat()
	end)
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
		-- upvalues: Text (copy), p1 (copy), ViewEDPsourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UseResult3 (copy)
		if Text == "" then return end
		if p1.userId ~= "" then
			local config = {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			}
			
			if Thumbnail == ViewEDPsourceValues.Thumbnail then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail, config)
			elseif Thumbnail == ViewEDPsourceValues.Title then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.ViewExperienceDetailsFromTitle, config)
			end
		end
		UseResult3()
	end, DependencyArrayFunction(UseResult3, Text, p1.userId, p1.homepageCarouselAbsolutePosition))
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), Text (copy), UseResult2 (copy), UseJoinUserInExperienceResult (copy)
		if p1.userId ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.JoinGame, {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
		end
		UseResult2()
		UseJoinUserInExperienceResult.joinExperience()
		p1.onClose()
	end, DependencyArrayFunction(UseResult2, UseJoinUserInExperienceResult.joinExperience, p1.userId, Text, p1.homepageCarouselAbsolutePosition, p1.onClose))
	local UseResult6 = ReactModule.useCallback(function(UserTile)
		-- upvalues: p1 (copy), Text (copy), ViewProfileSourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UseNavigationResult (copy), AppPage (upval)
		if p1.userId ~= "" then
			local config = {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			}
			
			if UserTile == ViewProfileSourceValues.UserTile then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromUserTile, config)
			elseif UserTile == ViewProfileSourceValues.ViewProfileButton then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, config)
			end
		end
		UseNavigationResult.navigate(AppPage.ProfilePlatform, { detail = p1.userId })
		p1.onClose()
	end, DependencyArrayFunction(UseNavigationResult, p1.userId, Text, p1.homepageCarouselAbsolutePosition, p1.onClose))
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), Text (copy), UseRoactServiceResult2 (copy), NotificationType (upval)
		if p1.userId ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, {
				friendId = p1.userId,
				universeId = if Text == "" then nil else Text,
				absolutePosition = p1.homepageCarouselAbsolutePosition
			})
			UseRoactServiceResult2:BroadcastNotification(p1.userId, NotificationType.LAUNCH_CONVERSATION)
			p1.onClose()
			
			return
		end
	end, DependencyArrayFunction(p1.userId, Text, p1.homepageCarouselAbsolutePosition, UseRoactServiceResult2, p1.onClose))
	local Element = ReactModule.createElement(DesktopGameJoinCardModule, {
		layoutOrder = LayoutOrder,
		playerName = PlayerName,
		experienceName = LastLocation,
		gameIconUrl = UseMemoResult,
		isLoading = IsTextMatch,
		onJoin = UseResult5,
		onViewExperienceDetails = UseResult4,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen and IsUseNavigationFocusResult,
		onClose = p1.onClose,
		isConsole = IsUsePreferredInputResultMatch,
		consolePlatformLabel = PlatformName,
		focusRootRef = if FFlagEnableConsoleGameJoinCard then UseResult1 else nil,
		ageCheckRequired = if FFlagJoinCardAgeCheckUpsell then UseJoinUserInExperienceResult.ageCheckRequired else nil,
		onAgeCheckPressed = UseAgeCheckPressLoggerResult,
		onPlatformProfilePressed = if FFlagEnableConsoleGameJoinCard and IsUsePreferredInputResultMatch then UseResult else nil,
		onChat = if IsUsePreferredInputResultMatch or not UseAppPolicyResult then nil else UseResult7,
		onViewProfile = if IsUsePreferredInputResultMatch then nil else UseResult6
	})
	
	return if p1.showGamepadJoinFocus then ReactModule.createElement(ReactModule.Fragment, nil, {
		GamepadJoinFocus = ReactModule.createElement(GamepadJoinFocusBehaviorModule, {
			tileRef = p1.anchorRef,
			cardRef = if FFlagEnableConsoleGameJoinCard then UseRefResult1 else nil,
			joinExperience = UseResult5
		}),
		Card = Element
	}) else Element
end