local parent = script.Parent.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local analyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local useAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local useAgeCheckCompletionLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local useAgeCheckPressLogger = useAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local gameJoinCardTelemetryModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTelemetry)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local roactUtilsModule = require(parent.RoactUtils)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local useNavigation = require(parent.Navigation).useNavigation
local useQuery = require(parent.ApolloClient).useQuery
local apolloLocalStateModule = require(parent.ApolloLocalState)
local playersService = game:GetService("Players")
local userProfilesModule = require(parent.UserProfiles)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSocialCarouselUseProfileStore = sharedFlagsModule.FFlagSocialCarouselUseProfileStore
local fFlagFriendSortedByPresenceSignalsImplementation = sharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local fFlagJoinCardAgeCheckUpsell = sharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local dataHydrationModule = require(parent.DataHydration)
local var14 = if fFlagSocialCarouselUseProfileStore or fFlagFriendSortedByPresenceSignalsImplementation then require(parent.Signals) else nil
local var15 = if fFlagSocialCarouselUseProfileStore or fFlagFriendSortedByPresenceSignalsImplementation then require(parent.SignalsReact) else nil
local var16 = if fFlagSocialCarouselUseProfileStore then userProfilesModule.Stores.UserProfileStore.get() else nil
local useExperienceBannerImage = require(parent.GameDetail).useExperienceBannerImage
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local peopleListInHomePage = discoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appGuiService = roactServiceTagsModule.AppGuiService
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appPage = robloxAppEnumsModule.AppPage
local notificationType = robloxAppEnumsModule.NotificationType
local dependencyArray = roactUtilsModule.Hooks.dependencyArray
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local mobileGameJoinCardModule = require(script.Parent.MobileGameJoinCard)
local var20 = if fFlagFriendSortedByPresenceSignalsImplementation then dataHydrationModule.Presence.PresenceStore.get() else nil
local t = {
	universeId = "",
	lastLocation = "",
	userPresenceType = "",
	placeId = "",
	rootPlaceId = "",
	gameId = ""
}

return function() --[[ line: 77 | named "MobileGameJoinCardContainer" ]]
	-- upvalues: useNavigation (ref), useRoactService (ref), appEventIngestService (ref), appGuiService (ref), useAppPolicy (ref), playersService (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), reactModule (ref), var14 (ref), var20 (ref), var15 (ref), useQuery (ref), apolloLocalStateModule (ref), useGameJoinCardAnalyticsModule (ref), fFlagSocialCarouselUseProfileStore (ref), var16 (ref), userProfilesModule (ref), useExperienceBannerImage (ref), gameJoinCardTelemetryModule (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), t (ref), useAgeCheckPressLogger (ref), gameJoinCardButtonAction (ref), gamePlayIntent (ref), peopleListInHomePage (ref), httpService (ref), dependencyArray (ref), appPage (ref), viewProfileSourceValues (ref), notificationType (ref), mobileGameJoinCardModule (ref)
-- FATAL: Failed to generate AST for `MobileGameJoinCardContainer` function:
runtime : [KeyError] :11990: 140
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end