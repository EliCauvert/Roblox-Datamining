local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local AvatarExperienceSearchModule = require(CorePackages.Workspace.Packages.AvatarExperienceSearch)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Common = Modules.AvatarExperience.Common
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local FetchAutocompleteSuggestionModule = require(Modules.LuaApp.Thunks.FetchAutocompleteSuggestion)
local FetchSearchRecentlyViewedModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSearchRecentlyViewed)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local SetFullViewModule = require(Common.Thunks.SetFullView)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSendCounterModule = require(Modules.AvatarExperience.Common.Hooks.useSendCounter)
local UseSearchTelemetryModule = require(script.Parent.useSearchTelemetry)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local GetAvatarEventCounterNameWithPlatformFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).getAvatarEventCounterNameWithPlatform
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local Focusable = RoactGamepadModule.Focusable
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local SearchLandingPage = AvatarExperienceSearchModule.Features.SearchLandingPage
local UseSearchLandingPagePropsFunction = AvatarExperienceSearchModule.Features.useSearchLandingPageProps
local GamepadFocusHandlerForPageModule = require(Common.Components.GamepadFocusHandlerForPage)
local AXRecentlyViewedSearchItemsIXPTest = AvatarExperienceCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest
local FFlagAXMoveRobuxBalanceButtonLowerModule = require(Modules.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseDispatchFunction (copy), AXRecentlyViewedSearchItemsIXPTest (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), RoactNetworkingModule (copy), RoactAnalyticsModule (copy), UseSendCounterModule (copy), UseSearchTelemetryModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), SelectIsPortraitModule (copy), FetchSearchRecentlyViewedModule (copy), FetchAutocompleteSuggestionModule (copy), RobloxAppEnumsModule (copy), SetSearchTypeModule (copy), SetSearchParametersModule (copy), SetFullViewModule (copy), AvatarScreen (copy), FullView (copy), NavigationUtilsModule (copy), CatalogUtilsModule (copy), ToggleTryOnThunkModule (copy), GetAvatarEventCounterNameWithPlatformFunction (copy), Focusable (copy), AvatarExperienceViewModule (copy), DeviceOrientationMode (copy), FFlagAXMoveRobuxBalanceButtonLowerModule (copy), GamepadFocusHandlerForPageModule (copy), WasLastInputGamepadFunction (copy), SearchLandingPage (copy), UseSearchLandingPagePropsFunction (copy), SearchUuidModule (copy)
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseRoactServiceModule(AnalyticsModule) else nil
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(RoactAnalyticsModule)
	local UseSendCounterModuleResult = UseSendCounterModule()
	local UseSearchTelemetryModuleResult = UseSearchTelemetryModule()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarAutocompleteSuggestions
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.DeviceOrientation
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local UseResult = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), FetchSearchRecentlyViewedModule (upval), UseRoactServiceModuleResult1 (copy)
		UseDispatchResult(FetchSearchRecentlyViewedModule(UseRoactServiceModuleResult1, p2, p3))
	end, { UseRoactServiceModuleResult1, UseDispatchResult }) else nil
	local UseResult1 = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then ReactModule.useCallback(function(p2)
		-- upvalues: CatalogUtilsModule (upval), UseDispatchResult (copy), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult2 (copy), p1 (copy)
		local ItemType = p2.itemType
		UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult2, ItemType, CatalogUtilsModule.GetItemSubType(ItemType, p2), p2.id, true, p1.avatarRoute, p1.navigation))
	end, {
		UseRoactServiceModuleResult1,
		UseRoactServiceModuleResult2,
		p1.avatarRoute,
		p1.navigation,
		UseDispatchResult
	}) else nil
	
	return ReactModule.createElement(Focusable.Frame, {
		restorePreviousChildFocus = true,
		BackgroundTransparency = 1,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		defaultChild = UseRefResult,
		Size = UDim2.fromScale(1, 1)
	}, {
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = false,
			isSceneFullView = false,
			defaultChildRef = UseRefResult,
			avatarRoute = p1.avatarRoute,
			isUIFullView = UseSelectorResult2 == DeviceOrientationMode.Portrait,
			NextSelectionDown = UseRefResult,
			showMultiTryOnBottomBar = not UseSelectorResult3,
			showRobuxBalance = if FFlagAXMoveRobuxBalanceButtonLowerModule then not UseSelectorResult3 else nil
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = Current,
				isGamepadInput = WasLastInputGamepadFunction()
			}),
			SearchLandingPage = ReactModule.createElement(SearchLandingPage, UseSearchLandingPagePropsFunction({
				navigation = p1.navigation,
				statusBarHeight = UseSelectorResult1,
				deviceOrientation = UseSelectorResult2,
				autocompleteState = UseSelectorResult,
				navigateToSearch = ReactModule.useCallback(function(p2, p3)
					-- upvalues: NavigationUtilsModule (upval), p1 (copy)
					NavigationUtilsModule.navigateToSearch(p1.navigation, p2, p3)
				end, { p1.navigation }),
				fetchAutocompleteSuggestions = ReactModule.useCallback(function(p2)
					-- upvalues: UseDispatchResult (copy), FetchAutocompleteSuggestionModule (upval), UseRoactServiceModuleResult1 (copy), RobloxAppEnumsModule (upval)
					UseDispatchResult(FetchAutocompleteSuggestionModule.Fetch(UseRoactServiceModuleResult1, p2, nil, RobloxAppEnumsModule.SearchTypes.Catalog))
				end, {
					UseRoactServiceModuleResult1,
					UseDispatchResult,
					UseSelectorResult
				}),
				fetchSearchRecentlyViewed = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseResult else nil,
				createSearchUuid = SearchUuidModule,
				setSearchType = ReactModule.useCallback(function(p2)
					-- upvalues: UseDispatchResult (copy), SetSearchTypeModule (upval), RobloxAppEnumsModule (upval)
					UseDispatchResult(SetSearchTypeModule(p2, RobloxAppEnumsModule.SearchTypes.Catalog))
				end, { UseDispatchResult }),
				setSearchParameters = ReactModule.useCallback(function(p2, p3)
					-- upvalues: UseDispatchResult (copy), SetSearchParametersModule (upval)
					UseDispatchResult(SetSearchParametersModule(p2, p3))
				end, { UseDispatchResult }),
				setFullView = ReactModule.useCallback(function()
					-- upvalues: UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceModuleResult2 (copy), AvatarScreen (upval), FullView (upval)
					UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult2, AvatarScreen.CatalogSearch, FullView.UIFullView))
				end, { UseDispatchResult, UseRoactServiceModuleResult2 }),
				toggleTryOn = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseResult1 else nil,
				searchBarRef = UseRefResult,
				firstSuggestedItemRef = UseRefResult1,
				focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
				sendStats = ReactModule.useCallback(function(p2, p3)
					-- upvalues: GetAvatarEventCounterNameWithPlatformFunction (upval), UseRoactServiceModuleResult2 (copy)
					UseRoactServiceModuleResult2.Diag:reportStats(GetAvatarEventCounterNameWithPlatformFunction(p2), p3)
				end, { UseRoactServiceModuleResult2 }),
				sendCounter = UseSendCounterModuleResult,
				searchTelemetry = UseSearchTelemetryModuleResult,
				catalogAnalytics = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseRoactServiceModuleResult else nil
			}))
		})
	})
end))))