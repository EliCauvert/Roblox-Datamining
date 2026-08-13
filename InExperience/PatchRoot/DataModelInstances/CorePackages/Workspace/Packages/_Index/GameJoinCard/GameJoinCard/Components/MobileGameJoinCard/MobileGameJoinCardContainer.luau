local parent = script.Parent.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local fFlagMobileGameJoinCardEDPFromTitleModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local fFlagMobileGameJoinCardEDPFromThumbnailModule = require(gameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
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
local userProfilesModule = require(parent.UserProfiles)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSocialCarouselUseProfileStore = sharedFlagsModule.FFlagSocialCarouselUseProfileStore
local fFlagJoinCardAgeCheckUpsell = sharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var19 = if fFlagSocialCarouselUseProfileStore then userProfilesModule.Stores.UserProfileStore.get() else nil
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
local var25 = dataHydrationModule.Presence.PresenceStore.get()
local t = {
	universeId = "",
	lastLocation = "",
	userPresenceType = "",
	placeId = "",
	rootPlaceId = "",
	gameId = ""
}

return function() --[[ line: 85 | named "MobileGameJoinCardContainer" ]]
	-- upvalues: fFlagMobileGameJoinCardEDPFromTitleModule (ref), fFlagMobileGameJoinCardEDPFromThumbnailModule (ref), useDispatch (ref), useNavigation (ref), useRoactService (ref), appEventIngestService (ref), appGuiService (ref), appSessionService (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), var25 (ref), signalsReactModule (ref), useGameJoinCardAnalyticsModule (ref), fFlagSocialCarouselUseProfileStore (ref), var19 (ref), userProfilesModule (ref), useExperienceBannerImage (ref), fFlagMobileGameJoinCardThumbnailModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), gameJoinCardTelemetryModule (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckCompletionLogger (ref), useJoinUserInExperience (ref), t (ref), useAgeCheckPressLogger (ref), gameJoinCardButtonAction (ref), gamePlayIntent (ref), peopleListInHomePage (ref), httpService (ref), dependencyArray (ref), fFlagEnableSplitPane (ref), appPage (ref), viewProfileSourceValues (ref), setGamePlaySession (ref), sessionType (ref), gameDetailReferral (ref), openGameDetails (ref), viewEDPsourceValues (ref), notificationType (ref), mobileGameJoinCardModule (ref)
-- FATAL: Failed to generate AST for `MobileGameJoinCardContainer` function:
runtime : [KeyError] :11990: 165
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end