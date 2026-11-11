local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Focusable = RoactGamepadModule.Focusable
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Common = Modules.AvatarExperience.Common
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local NamedRefsContextModule = require(Common.Context.NamedRefsContext)
local ConstantsModule = require(Common.Constants)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseFullViewModule = require(Common.Hooks.useFullView)
local ItemsViewModule = require(Modules.AvatarExperience.AvatarEditor.Components.MySharedAvatars.ItemsView)
local AvatarEditorTopBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar)
local BoundInputsUpdaterModule = require(Common.Components.BoundInputsUpdater)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local GamepadFocusHandlerForPageModule = require(Common.Components.GamepadFocusHandlerForPage)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local ClearResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget)
local SetResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget)
local FetchMySharedAvatarsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars)
local MySharedAvatars = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants.ContextWidgets.MySharedAvatars
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

local function selectMySharedAvatarsApiFetchStatus(p1)
	-- upvalues: PerformFetch (copy), ConstantsModule1 (copy)
	return PerformFetch.GetStatus(p1, ConstantsModule1.GetMySharedAvatarsKey)
end

return (require(Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(_)
	-- upvalues: UseNavigationFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseSelectorFunction (copy), selectMySharedAvatarsApiFetchStatus (copy), UseFullViewModule (copy), FullView (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), NamedRefsContextModule (copy), UtilsModule (copy), RetrievalStatusModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FetchMySharedAvatarsModule (copy), UseLocalizationFunction (copy), MySharedAvatars (copy), SetResultsListFocusedWidgetModule (copy), ClearResultsListFocusedWidgetModule (copy), Focusable (copy), AvatarScreen (copy), BoundInputsUpdaterModule (copy), NavigationEventsLoggerModule (copy), AvatarExperienceViewModule (copy), AvatarEditorTopBarModule (copy), GamepadFocusHandlerForPageModule (copy), ItemsViewModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseRefResult = ReactModule.useRef(nil)
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseSelectorResult = UseSelectorFunction(selectMySharedAvatarsApiFetchStatus)
	local UseFullViewModuleResult, UseFullViewModuleResult2 = UseFullViewModule()
	local IsUseFullViewModuleResultMatch = UseFullViewModuleResult == FullView.SceneFullView
	local IsUseFullViewModuleResultMatch1 = UseFullViewModuleResult == FullView.UIFullView
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult
	})
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UtilsModule (upval), UseFullViewModuleResult (copy), UseFullViewModuleResult2 (copy)
		UseFullViewModuleResult2((UtilsModule.getNewFullViewEnum(UseFullViewModuleResult)))
	end, { UseFullViewModuleResult, UseFullViewModuleResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), RetrievalStatusModule (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), UseDispatchResult (copy), FetchMySharedAvatarsModule (upval), UseRoactServiceModuleResult (copy)
		if UseSelectorResult == RetrievalStatusModule.NotStarted then
			SendAXCounterV2Function(ConstantsModule.Counter.MySharedAvatars.ReloadTriggedInPage)
			UseDispatchResult(FetchMySharedAvatarsModule(UseRoactServiceModuleResult))
		end
	end, {
		UseSelectorResult,
		UseDispatchResult,
		UseRoactServiceModuleResult
	})
	local UseLocalizationResult = UseLocalizationFunction({
		mySharedAvatarsTooltip = "Feature.Avatar.Label.MyPostedAvatars.Tooltip"
	})
	ReactModule.useEffect(function()
		-- upvalues: MySharedAvatars (upval), UseLocalizationResult (copy), UseDispatchResult (copy), SetResultsListFocusedWidgetModule (upval), ClearResultsListFocusedWidgetModule (upval)
		UseDispatchResult(SetResultsListFocusedWidgetModule(MySharedAvatars.RequestId, MySharedAvatars.WidgetId, {
			title = MySharedAvatars.Title,
			localizedTooltip = UseLocalizationResult.mySharedAvatarsTooltip
		}))
		
		return function()
			-- upvalues: UseDispatchResult (upval), ClearResultsListFocusedWidgetModule (upval), MySharedAvatars (upval)
			UseDispatchResult(ClearResultsListFocusedWidgetModule(MySharedAvatars.RequestId))
		end
	end, { UseDispatchResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseAvatarExperienceFocusNavigationBindingsModuleResult,
		Size = UDim2.fromScale(1, 1)
	}, ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		restorePreviousChildFocus = false,
		Size = UDim2.new(1, 0, 1, 0),
		ref = UseContextResult[AvatarScreen.MySharedAvatars],
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		defaultChild = UseRefResult5
	}, {
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(BoundInputsUpdaterModule),
		NavigationEventsLogger = ReactModule.createElement(NavigationEventsLoggerModule, { pageName = AvatarScreen.MySharedAvatars }),
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			bottomBarEnabled = false,
			changeViewFunction = UseResult,
			isSceneFullView = IsUseFullViewModuleResultMatch,
			isUIFullView = IsUseFullViewModuleResultMatch1,
			topBar = ReactModule.createElement(AvatarEditorTopBarModule, {
				showManageOutfitButton = true,
				navigation = UseNavigationResult,
				avatarRoute = UseAvatarRouteResult,
				overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
				topBarRef = UseRefResult1,
				defaultChildRef = UseRefResult5,
				sceneUIContainerRef = UseRefResult2
			}),
			refinementButtonsRef = UseRefResult3,
			quickButtonsRef = UseRefResult4,
			ref = UseRefResult2,
			NextSelectionDown = UseRefResult5,
			NextSelectionLeft = UseRefResult1,
			defaultChildRef = UseRefResult5,
			multiTryOnBottomBarRef = UseRefResult,
			itemDetailsPeekViewRefs = UseRefCacheResult
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, { captureFocusOnMount = true, focusController = Current }),
			MySharedAvatarsItemsView = ReactModule.createElement(ItemsViewModule, {
				defaultChildRef = UseRefResult5,
				NextSelectionUp = UseRefResult1,
				NextSelectionRight = UseRefResult4,
				multiTryOnBottomBarRef = UseRefResult,
				itemDetailsPeekViewRefs = UseRefCacheResult
			})
		})
	}))
end))