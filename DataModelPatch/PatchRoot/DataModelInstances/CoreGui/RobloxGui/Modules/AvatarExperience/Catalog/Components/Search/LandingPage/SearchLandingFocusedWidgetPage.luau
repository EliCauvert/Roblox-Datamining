local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceSearchModule = require(CorePackages.Workspace.Packages.AvatarExperienceSearch)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local Common = Modules.AvatarExperience.Common
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local NamedRefsContextModule = require(Common.Context.NamedRefsContext)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseFullViewModule = require(Common.Hooks.useFullView)
local SelectIsPortraitModule = require(Common.Selectors.selectIsPortrait)
local SearchLandingFocusedWidgetPageItemsViewModule = require(Modules.AvatarExperience.Catalog.Components.Search.LandingPage.SearchLandingFocusedWidgetPageItemsView)
local BoundInputsUpdaterModule = require(Common.Components.BoundInputsUpdater)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local GamepadFocusHandlerForPageModule = require(Common.Components.GamepadFocusHandlerForPage)
local WithStackVisibilityWrapperModule = require(Common.Components.RoactNavigation.withStackVisibilityWrapper)
local SearchBar = AvatarExperienceSearchModule.Components.SearchBar
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local Counter = AvatarExperienceSearchModule.Enums.Counter
local SearchLandingPageWidgetEnum = AvatarExperienceSearchModule.Enums.SearchLandingPageWidgetEnum
local ClearResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget)
local SetResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget)
local AXRecentlyViewedSearchItemsIXPTest = AvatarExperienceCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

function selectTopBarHeight(p1)
	-- upvalues: TopBarModule (copy)
	return TopBarModule.selectTopBarHeight(p1)
end

function selectWidgetState(p1)
	return p1.AvatarExperience.Common.Widgets.ContextWidgetInfo
end

function selectWidgetInfo(p1, p2)
	local v1 = if p1 then p1[p2] else nil
	
	return if v1 and v1.Details then v1.Details[p2] else nil
end

return (WithStackVisibilityWrapperModule(function()
	-- upvalues: UseTokensFunction (copy), UseNavigationFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseDispatchFunction (copy), UseFullViewModule (copy), FullView (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), SelectIsPortraitModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), NamedRefsContextModule (copy), UtilsModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), SearchLandingPageWidgetEnum (copy), IxpUtilsModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), Counter (copy), SetResultsListFocusedWidgetModule (copy), ClearResultsListFocusedWidgetModule (copy), Focusable (copy), BoundInputsUpdaterModule (copy), NavigationEventsLoggerModule (copy), AvatarExperienceViewModule (copy), FoundationModule (copy), SearchBar (copy), GamepadFocusHandlerForPageModule (copy), SearchLandingFocusedWidgetPageItemsViewModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseRefResult = ReactModule.useRef(nil)
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseFullViewModuleResult, UseFullViewModuleResult2 = UseFullViewModule()
	local IsUseFullViewModuleResultMatch = UseFullViewModuleResult == FullView.SceneFullView
	local IsUseFullViewModuleResultMatch1 = UseFullViewModuleResult == FullView.UIFullView
	local UseSelectorResult = UseSelectorFunction(selectTopBarHeight, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule((ReactModule.useMemo(function()
		-- upvalues: UseOverlayClosedCallbackModuleResult (copy)
		return {
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		}
	end, { UseOverlayClosedCallbackModuleResult })))
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local WidgetTypeParam = UseNavigationResult.getParam("widgetType")
	local UseSelectorResult2 = UseSelectorFunction(selectWidgetState, GetUseSelectorDeepEqualsFunction())
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult2 (copy), WidgetTypeParam (copy)
		return selectWidgetInfo(UseSelectorResult2, WidgetTypeParam)
	end, { UseSelectorResult2, WidgetTypeParam })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UtilsModule (upval), UseFullViewModuleResult (copy), UseFullViewModuleResult2 (copy)
		UseFullViewModuleResult2((UtilsModule.getNewFullViewEnum(UseFullViewModuleResult)))
	end, { UseFullViewModuleResult, UseFullViewModuleResult2 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
		NavigationUtilsModule.closeSearchLandingPageFocusedWidget(UseNavigationResult)
		UseNavigationResult.navigate(AvatarScreen.CatalogSearchLanding)
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function(TextBox)
		-- upvalues: UseResult1 (copy)
		TextBox:ReleaseFocus()
		UseResult1()
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
		NavigationUtilsModule.closeSearchLandingPageFocusedWidget(UseNavigationResult)
		UseNavigationResult.navigate(AvatarScreen.Catalog)
	end, { UseDispatchResult, UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRoactServiceModuleResult (copy), WidgetTypeParam (copy), SearchLandingPageWidgetEnum (upval), IxpUtilsModule (upval), AXRecentlyViewedSearchItemsIXPTest (upval), Counter (upval), UseDispatchResult (copy), SetResultsListFocusedWidgetModule (upval), ClearResultsListFocusedWidgetModule (upval), UseFullViewModuleResult2 (copy), FullView (upval)
		if UseMemoResult then
			if UseRoactServiceModuleResult and WidgetTypeParam == SearchLandingPageWidgetEnum.RecentlyViewedItems then
				UseRoactServiceModuleResult.sendAXCounterV2(Counter.RecentlyViewedFocusedWidgetEntered, {
					isPositionTopVariant = tostring(IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledTopVariant) or false),
					isGlobalSaveVariant = tostring(IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledSaveInCatalog) or false)
				})
			end
			UseDispatchResult(SetResultsListFocusedWidgetModule(UseMemoResult.requestId, UseMemoResult.id, UseMemoResult.template))
		end
		return function()
			-- upvalues: UseMemoResult (upval), UseDispatchResult (upval), ClearResultsListFocusedWidgetModule (upval), UseFullViewModuleResult2 (upval), FullView (upval)
			if UseMemoResult then
				UseDispatchResult(ClearResultsListFocusedWidgetModule(UseMemoResult.requestId))
			end
			UseFullViewModuleResult2(FullView.None)
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseAvatarExperienceFocusNavigationBindingsModuleResult,
		Size = UDim2.fromScale(1, 1)
	}, ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		restorePreviousChildFocus = false,
		Size = UDim2.new(1, 0, 1, 0),
		ref = UseContextResult[AvatarScreen.SearchLandingFocusedWidgetPage],
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		defaultChild = UseRefResult5
	}, {
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(BoundInputsUpdaterModule),
		NavigationEventsLogger = ReactModule.createElement(NavigationEventsLoggerModule, { pageName = AvatarScreen.SearchLandingFocusedWidgetPage }),
		SearchLandingFocusedWidgetPageAvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			bottomBarEnabled = false,
			changeViewFunction = UseResult,
			isSceneFullView = IsUseFullViewModuleResultMatch,
			isUIFullView = IsUseFullViewModuleResultMatch1,
			topBar = ReactModule.createElement(FoundationModule.View, {
				ZIndex = 2,
				tag = "padding-x-large auto-xy col align-y-bottom",
				Size = UDim2.new(1, 0, 0, UseSelectorResult),
				backgroundStyle = {
					Color3 = UseTokensResult.Color.Surface.Surface_0.Color3,
					Transparency = if UseSelectorResult1 then 1 else UseTokensResult.Color.Surface.Surface_0.Transparency
				}
			}, {
				SearchBar = ReactModule.createElement(SearchBar, {
					showCancelButton = true,
					autofocus = false,
					onFocus = UseResult2,
					onCancel = UseResult3
				})
			}),
			refinementButtonsRef = UseRefResult3,
			quickButtonsRef = UseRefResult4,
			ref = UseRefResult2,
			NextSelectionDown = UseRefResult5,
			NextSelectionLeft = UseRefResult1,
			defaultChildRef = UseRefResult5,
			multiTryOnBottomBarRef = UseRefResult,
			itemDetailsPeekViewRefs = UseRefCacheResult,
			adaptiveScrollingProps = {
				fullHeightOptions = { opaqueBackground = true, draggerToDivider = true }
			}
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, { captureFocusOnMount = true, focusController = Current }),
			FocusedWidgetItemsView = if UseMemoResult then ReactModule.createElement(SearchLandingFocusedWidgetPageItemsViewModule, {
				defaultChildRef = UseRefResult5,
				NextSelectionUp = UseRefResult1,
				NextSelectionRight = UseRefResult4,
				multiTryOnBottomBarRef = UseRefResult,
				itemDetailsPeekViewRefs = UseRefCacheResult,
				onCloseFocusedWidget = UseResult1,
				searchUuid = UseMemoResult.requestId
			}) else nil
		})
	}))
end))