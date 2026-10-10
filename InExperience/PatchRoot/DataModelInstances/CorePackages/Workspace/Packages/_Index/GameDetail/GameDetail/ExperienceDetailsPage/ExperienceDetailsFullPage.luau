local gameDetail = script:FindFirstAncestor("GameDetail")
local parent = gameDetail.Parent
local isTenFootInterface = require(parent.AppCommonLib).isTenFootInterface
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsPageScopeFieldsModule = require(script.Parent.ExperienceDetailsPageScopeFields)
local fetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local getExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local removeGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local useEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local usePublishContainerWidthModule = require(script.Parent.usePublishContainerWidth)
local experienceDetailsFallbackBannerImageModule = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage)
local experienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local experienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local detailsPageLayout = require(parent.AppBlox).DetailsPageLayout
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local responsiveModule = require(parent.Responsive)
local useGetCurrentLegacyRoute = require(parent.DiscoveryRouting).useGetCurrentLegacyRoute
local EDPTTIConstants = require(parent.GameDetailTelemetry).EDPTTIConstants
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local uiStatus = sduiSharedUtilitiesModule.UiStatus
local useUiStatus = sduiSharedUtilitiesModule.useUiStatus
local filterPlayWithReward = experienceDetailsPageScopeFieldsModule.FilterPlayWithReward
local isTenFoot = experienceDetailsPageScopeFieldsModule.IsTenFoot
local compositionTags = require(parent.AppComposition).CompositionTags
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiPageEntryUseSharedHooks = sharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local fFlagSduiContainerQueries = sharedFlagsModule.FFlagSduiContainerQueries
local sduiEdpPageScopeIsTenFoot = game:DefineFastFlag("SduiEdpPageScopeIsTenFoot", false)
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppEdpDirectionalGradientMidTransparency = sharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local fFlagEnableSplitPaneEDPFix = sharedFlagsModule.FFlagEnableSplitPaneEDPFix
local edpBannerAspectRatioTenths = game:DefineFastInt("EdpBannerAspectRatioTenths", 0)
local edpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local edpGradientTopBleedOffset = game:DefineFastInt("EdpGradientTopBleedOffset", 120)
local edpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local edpDirectionalFullBleedOverlapOffset = game:DefineFastInt("EdpDirectionalFullBleedOverlapOffset", 195)
local edpDirectionalBannerBottomVisiblePercent = game:DefineFastInt("EdpDirectionalBannerBottomVisiblePercent", 50)
local edpDirectionalGradientMidTransparencyHundredths = game:DefineFastInt("EdpDirectionalGradientMidTransparencyHundredths", 12)
local t = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return reactModule.memo(function(_)
	-- upvalues: gameDetail (ref), experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), reactModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useTokens (ref), useGetCurrentLegacyRoute (ref), filterPlayWithReward (ref), sduiEdpPageScopeIsTenFoot (ref), isTenFoot (ref), isTenFootInterface (ref), removeGameDetailSessionIfDepartedModule (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), fFlagSduiContainerQueries (ref), usePublishContainerWidthModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), responsiveModule (ref), fFlagEnableSplitPaneEDPFix (ref), experienceDetailsPageScopeFieldsModule (ref), detailsPageLayout (ref), t (ref), edpBannerAspectRatioTenths (ref), edpDirectionalFullBleedOverlapOffset (ref), edpFullBleedOverlapOffset (ref), edpGradientTopBleedOffset (ref), fFlagLuaAppEdpDirectionalGradientMidTransparency (ref), edpDirectionalGradientMidTransparencyHundredths (ref), edpDirectionalBannerBottomVisiblePercent (ref), edpBannerBottomVisiblePercent (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackBannerImageModule (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), experienceDetailsPersistentActionBarModule (ref)
-- FATAL: Failed to generate AST for `ExperienceDetailsFullPage` function:
runtime : [KeyError] :11990: 90
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end)