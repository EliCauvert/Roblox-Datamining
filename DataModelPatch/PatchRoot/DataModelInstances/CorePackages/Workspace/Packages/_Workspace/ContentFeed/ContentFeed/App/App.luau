local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local CloseCentralOverlayFunction = require(Parent1.CentralOverlay).Thunks.CloseCentralOverlay
local NavigationRoduxModule = require(Parent1.NavigationRodux)
local ReactModule = require(Parent1.React)
local RoactAppPolicy = require(Parent1.UniversalAppPolicy).RoactAppPolicy
local RoactRoduxModule = require(Parent1.RoactRodux)
local AnalyticsServiceModule = require(Parent.Analytics.AnalyticsService)
local AppFeaturePolicies = require(Parent1.UniversalAppPolicy).AppFeaturePolicies
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local ConstantsModule = require(Parent.Constants)
local FeedModule = require(Parent.Components.Feed)
local FeedContextModule = require(Parent.App.FeedContext)
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetExperiencesDetails = require(Parent.App.Networking).NetworkingGames.GetExperiencesDetails
local GetUniverseIdsModule = require(Parent.Utils.getUniverseIds)
local Localization = require(Parent1.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local NavigateBackFunction = NavigationRoduxModule.Thunks.NavigateBack
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent1.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local NetworkingModule = require(Parent.App.Networking)
local OnViewportSizeChangedFunction = require(Parent1.CapturesCommon).Utils.onViewportSizeChanged
local OpenAppItemDetailsModule = require(Parent.Thunks.OpenAppItemDetails)
local ScreenSizeChangedModule = require(Parent.Actions.ScreenSizeChanged)
local SetupFireEventModule = require(Parent.Analytics.setupFireEvent)
local StyleProviderWithDefaultTheme = require(Parent1.Style).StyleProviderWithDefaultTheme
local _ = require(Parent.Types)
local Url = require(Parent1.Http).Url
local FoundationModule = require(Parent1.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local AbuseVectorModule = require(Parent1.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent1.GenericAbuseReporting.OpenDynamicAbuseReport)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseNavigationPropsFunction = require(Parent1.RobloxAppNavigation).useNavigationProps
local UseStateFunction = ReactModule.useState
local FIntContentFeedInitialPostLoadLimitModule = require(Parent.Flags.FIntContentFeedInitialPostLoadLimit)
local FFlagEnableAbuseReportRevampFlow = require(Parent1.SharedFlags).FFlagEnableAbuseReportRevampFlow
local EnableAbuseReportRevampPost = game:DefineFastFlag("EnableAbuseReportRevampPost", false)
local Store = require(Parent.createStore)()

return function()
	-- upvalues: UseDispatchFunction (copy), UseStateFunction (copy), UseNavigationPropsFunction (copy), UseEffectFunction (copy), Store (copy), NetworkingModule (copy), FIntContentFeedInitialPostLoadLimitModule (copy), GetDeepValueFunction (copy), GetUniverseIdsModule (copy), GetExperiencesDetails (copy), OnViewportSizeChangedFunction (copy), ScreenSizeChangedModule (copy), UseCallbackFunction (copy), SetupFireEventModule (copy), AnalyticsServiceModule (copy), ConstantsModule (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampPost (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), AppPage (copy), Url (copy), HttpService (copy), NavigateDownFunction (copy), OpenAppItemDetailsModule (copy), RoactRoduxModule (copy), FeedContextModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FoundationProvider (copy), FoundationModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), FeedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1, _)
		return {
			onNavigateBackCallback = p1.onNavigateBackCallback,
			postId = p1.postId,
			userId = tostring(p1.userId)
		}
	end)
	UseEffectFunction(function()
		-- upvalues: Store (upval), NetworkingModule (upval), FIntContentFeedInitialPostLoadLimitModule (upval), UseNavigationPropsResult (copy), GetDeepValueFunction (upval), GetUniverseIdsModule (upval), GetExperiencesDetails (upval), UseStateResult2 (copy)
		Store:dispatch(NetworkingModule.ContentSharingNetworking.GetPostsByPostId.API({
			limit = FIntContentFeedInitialPostLoadLimitModule,
			postId = UseNavigationPropsResult.postId,
			userId = UseNavigationPropsResult.userId
		})):andThen(function()
			-- upvalues: GetDeepValueFunction (upval), Store (upval), UseNavigationPropsResult (upval), GetUniverseIdsModule (upval), GetExperiencesDetails (upval)
			Store:dispatch(GetExperiencesDetails.API((GetUniverseIdsModule(GetDeepValueFunction(Store:getState(), "ContentSharing.byUserId." .. UseNavigationPropsResult.userId .. ".posts") or {}))))
		end):catch(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
	end, {
		UseNavigationPropsResult.postId,
		UseNavigationPropsResult.userId
	})
	UseEffectFunction(function()
		-- upvalues: OnViewportSizeChangedFunction (upval), Store (upval), ScreenSizeChangedModule (upval)
		return (OnViewportSizeChangedFunction(function(p1)
			-- upvalues: Store (upval), ScreenSizeChangedModule (upval)
			Store:dispatch(ScreenSizeChangedModule(p1))
		end))
	end, {})
	
	return ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
		ContextProvider = ReactModule.createElement(FeedContextModule.Provider, {
			value = {
				fireAnalyticsEvent = UseCallbackFunction(SetupFireEventModule({
					analytics = AnalyticsServiceModule,
					infoForAllEvents = {
						creatorUserId = UseNavigationPropsResult.userId,
						source = ConstantsModule.AnalyticsSource
					}
				}), { UseNavigationPropsResult.userId }),
				isZooming = UseStateResult1,
				navigateBack = ReactModule.useCallback(function(p1)
					-- upvalues: UseNavigationPropsResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
					if UseNavigationPropsResult.onNavigateBackCallback ~= nil then
						UseNavigationPropsResult.onNavigateBackCallback(p1)
					end
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back()
						
						return
					else
						UseDispatchResult(NavigateBackFunction())
					end
				end, { UseNavigationPropsResult.onNavigateBackCallback }),
				navigateToItemDetailPage = ReactModule.useCallback(function(p1)
					-- upvalues: UseDispatchResult (copy), OpenAppItemDetailsModule (upval)
					UseDispatchResult(OpenAppItemDetailsModule(p1))
				end, {}),
				navigateToReportPage = ReactModule.useCallback(function(TargetId)
					-- upvalues: FFlagEnableAbuseReportRevampFlow (upval), EnableAbuseReportRevampPost (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), AppPage (upval), ConstantsModule (upval), Url (upval), HttpService (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampPost then
						UseDispatchResult(OpenDynamicAbuseReportModule({
							abuseVector = AbuseVectorModule.ContentPostScreenshot,
							targetId = TargetId,
							onClose = function()
								-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
								UseDispatchResult(CloseCentralOverlayFunction())
							end
						}))
						
						return
					end
					local config = {
						name = AppPage.GenericWebPage,
						detail = string.format(ConstantsModule.AbuseReportUrl, Url.BASE_URL, HttpService:UrlEncode(TargetId)),
						extraProps = { titleKey = "Feature.Catalog.Action.Report" }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config, nil))
					end
				end, {}),
				setIsZooming = UseStateResult2_1
			}
		}, {
			PolicyProvider = ReactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies } }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					DONOTUSE_colorUpdate = true,
					theme = FoundationModule.Enums.Theme.Dark
				}, {
					LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
						localization = Localization.new(LocalizationService.RobloxLocaleId)
					}, {
						StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
							Feed = ReactModule.createElement(FeedModule, {
								creatorUserId = UseNavigationPropsResult.userId,
								initialPostId = UseNavigationPropsResult.postId,
								initialPostsCallFailed = UseStateResult
							})
						})
					})
				})
			})
		})
	})
end