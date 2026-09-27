local parent = script.Parent.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local fFlagMobileGameJoinCardEDPFromTitleModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local fFlagMobileGameJoinCardEDPFromThumbnailModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local fFlagGameJoinCardChatEntryPointModule = require(gameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewEDPsourceValues = analyticsConstantsModule.viewEDPsourceValues
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local gameJoinCardTelemetryModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTelemetry)
local fFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local foundationModule = require(parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local roactUtilsModule = require(parent.RoactUtils)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local useQuery = require(parent.ApolloClient).useQuery
local apolloLocalStateModule = require(parent.ApolloLocalState)
local playersService = game:GetService("Players")
local userProfilesModule = require(parent.UserProfiles)
local socialCommonModule = require(parent.SocialCommon)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPoint = socialCommonModule.Actions.EnteredChatFromEntryPoint
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSocialCarouselUseProfileStore = sharedFlagsModule.FFlagSocialCarouselUseProfileStore
local fFlagFriendSortedByPresenceSignalsImplementation = sharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local fFlagGameJoinCardAnalyticsCardId = sharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
local fFlagGameJoinCardSourceAttribution = sharedFlagsModule.FFlagGameJoinCardSourceAttribution
local fFlagMobileGameJoinCardGamepadSupport = sharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var1 = if fFlagSocialCarouselUseProfileStore then userProfilesModule.Stores.UserProfileStore.get() else nil
local gameDetailModule = require(parent.GameDetail)
local useExperienceBannerImage = gameDetailModule.useExperienceBannerImage
local openGameDetails = gameDetailModule.OpenGameDetails
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local gameDetailReferral = discoveryAnalyticsModule.Events.gameDetailReferral
local peopleListInHomePage = discoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appGuiService = roactServiceTagsModule.AppGuiService
local appSessionService = roactServiceTagsModule.AppSessionService
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appPage = robloxAppEnumsModule.AppPage
local notificationType = robloxAppEnumsModule.NotificationType
local dependencyArray = roactUtilsModule.Hooks.dependencyArray
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local mobileGameJoinCardModule = require(script.Parent.MobileGameJoinCard)
local var2 = dataHydrationModule.Presence.PresenceStore.get()
local t = {
	universeId = "",
	lastLocation = "",
	userPresenceType = "",
	placeId = "",
	rootPlaceId = "",
	gameId = ""
}

return function()
	-- upvalues: fFlagMobileGameJoinCardEDPFromTitleModule (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), fFlagGameJoinCardChatEntryPointModule (ref), useDispatch (ref), useNavigation (ref), fFlagMobileGameJoinCardGamepadSupport (ref), useNavigationFocus (ref), fFlagGameJoinCardSourceAttribution (ref), fFlagGameJoinCardAnalyticsCardId (ref), reactModule (ref), httpService (ref), useRoactService (ref), appEventIngestService (ref), appGuiService (ref), appSessionService (ref), useAppPolicy (ref), playersService (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), signalsModule (ref), var2 (ref), signalsReactModule (ref), useQuery (ref), apolloLocalStateModule (ref), useGameJoinCardAnalyticsModule (ref), fFlagSocialCarouselUseProfileStore (ref), var1 (ref), userProfilesModule (ref), useExperienceBannerImage (ref), fFlagMobileGameJoinCardThumbnailModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), gameJoinCardTelemetryModule (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), t (ref), useAgeCheckPressLogger (ref), gameJoinCardButtonAction (ref), gamePlayIntent (ref), peopleListInHomePage (ref), dependencyArray (ref), fFlagEnableSplitPane (ref), appPage (ref), viewProfileSourceValues (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), notificationType (ref), mobileGameJoinCardModule (ref)
-- FATAL: Failed to generate AST for `MobileGameJoinCardContainer` function:
runtime : [KeyError] :11990: 206
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end