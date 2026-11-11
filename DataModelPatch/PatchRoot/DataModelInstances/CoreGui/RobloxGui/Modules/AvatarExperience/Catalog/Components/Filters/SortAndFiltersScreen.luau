local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseInitializedValueFunction = require(CorePackages.Packages.ReactUtils).useInitializedValue
local UseFullViewModule = require(Modules.AvatarExperience.Common.Hooks.useFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local FiltersTopBarModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FiltersTopBar)
local ResetApplyBarModule = require(Modules.AvatarExperience.Catalog.Components.Filters.ResetApplyBar)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local FilterSectionModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterSection)
local FiltersModule = require(Modules.AvatarExperience.Catalog.Components.Filters.Filters)
local SortsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.Sorts)
local UseFiltersControllerModule = require(Modules.AvatarExperience.Catalog.Hooks.useFiltersController)
local UseSortsControllerModule = require(Modules.AvatarExperience.Catalog.Hooks.useSortsController)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local NamedRefsContextModule = require(Modules.AvatarExperience.Common.Context.NamedRefsContext)
local UseCloseFiltersSignalModule = require(Modules.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SendApplySortAndFiltersAnalyticsModule = require(Modules.AvatarExperience.Catalog.Thunks.SendApplySortAndFiltersAnalytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SortAndFiltersApply,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.SortAndFiltersReset
}

local function _(p1: number): number
	return p1 + 24 + 24
end

local function useSearchParameters()
	-- upvalues: UseAvatarRouteFunction (copy), AvatarScreen (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local IsNameMatch = UseAvatarRouteResult.opaque.name == AvatarScreen.CatalogSearch
	local Detail = if IsNameMatch then UseAvatarRouteResult.opaque.params.detail else nil
	
	return (UseSelectorFunction(function(p1)
		-- upvalues: Detail (copy)
		return if Detail then p1.SearchesParameters[Detail] else nil
	end, GetUseSelectorDeepEqualsFunction()))
end

local function useSortAndFiltersScreenFocusNavigationBindings(SortAndFiltersContent, Callback, Callback1)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), Callback (copy), InputHandlersModule (upval), Callback1 (copy)
		return {
			[FocusNavigationEventNameEnum.SortAndFiltersApply] = if Callback then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.SortAndFiltersReset] = if Callback1 then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback1 (upval)
					Callback1()
				end)
			} else nil
		}
	end, { Callback, Callback1 }), (ReactFocusNavigationModule.useEventMap(config, SortAndFiltersContent)))
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(_)
	-- upvalues: UseFiltersControllerModule (copy), UseSortsControllerModule (copy), UseNavigationFunction (copy), ReactModule (copy), NamedRefsContextModule (copy), RoactGamepadModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseCloseFiltersSignalModule (copy), useSearchParameters (copy), SendApplySortAndFiltersAnalyticsModule (copy), NavigateToSearchModule (copy), UseFullViewModule (copy), FullView (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), UseIsGamepadFunction (copy), TopBarModule (copy), UseStyleFunction (copy), IsTenFootInterface (copy), ConstantsModule1 (copy), UseLocalizationFunction (copy), FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation (copy), useSortAndFiltersScreenFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), FilterUtilsModule (copy), UseInitializedValueFunction (copy), Focusable (copy), AvatarScreen (copy), NavigationUtilsModule (copy), GamepadFocusHandlerForPageModule (copy), NavigationEventsLoggerModule (copy), BoundInputsUpdaterModule (copy), FiltersTopBarModule (copy), PeekView (copy), PeekViewState (copy), ResetApplyBarModule (copy), FilterSectionModule (copy), FiltersModule (copy), SortsModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy)
	local UseFiltersControllerModuleResult = UseFiltersControllerModule()
	local UseSortsControllerModuleResult = UseSortsControllerModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local CanApply = UseFiltersControllerModuleResult.canApply or UseSortsControllerModuleResult.canApply
	local CanReset = UseFiltersControllerModuleResult.canReset or UseSortsControllerModuleResult.canReset
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseCloseFiltersSignalModuleResult = UseCloseFiltersSignalModule()
	local UseSearchParametersResult = useSearchParameters()
	
	local function apply()
		-- upvalues: UseFiltersControllerModuleResult (copy), UseSortsControllerModuleResult (copy), UseCloseFiltersSignalModuleResult (copy), UseDispatchResult (copy), SendApplySortAndFiltersAnalyticsModule (upval), UseRoactServiceModuleResult (copy), UseSearchParametersResult (copy), NavigateToSearchModule (upval), UseNavigationResult (copy)
		UseFiltersControllerModuleResult.apply()
		UseSortsControllerModuleResult.apply()
		UseCloseFiltersSignalModuleResult:fire()
		UseDispatchResult(SendApplySortAndFiltersAnalyticsModule(UseRoactServiceModuleResult))
		
		if UseSearchParametersResult then
			UseDispatchResult(NavigateToSearchModule(UseNavigationResult, UseSearchParametersResult))
		end
	end
	
	local function reset()
		-- upvalues: UseFiltersControllerModuleResult (copy), UseSortsControllerModuleResult (copy)
		UseFiltersControllerModuleResult.reset()
		UseSortsControllerModuleResult.reset()
	end
	
	local IsUseFullViewModuleResultMatch = UseFullViewModule() == FullView.SceneFullView
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if UseSelectorResult then
		_UDim2 = UDim2.fromScale(0, 0)
		_UDim2_1 = UDim2.fromScale(1, 1)
	else
		_UDim2 = UDim2.fromScale(ConstantsModule.LandscapeNavWidth, 0)
		_UDim2_1 = UDim2.fromScale(ConstantsModule.LandscapeSceneWidth, 1)
	end
	local UseIsGamepadResult = UseIsGamepadFunction()
	local UseSelectorResult1 = UseSelectorFunction(TopBarModule.selectTopBarHeight, GetUseSelectorDeepEqualsFunction())
	local Theme = UseStyleFunction().Theme
	local NewGAMEPADBOTTOMBARSIZE = 80
	
	if UseIsGamepadResult and IsTenFootInterface then
		NewGAMEPADBOTTOMBARSIZE += ConstantsModule1.GAMEPAD_BOTTOM_BAR_SIZE
	end
	local UseLocalizationResult = UseLocalizationFunction({
		sorts = "Feature.Catalog.Label.Filter.Sorts",
		filters = "Feature.Catalog.Label.Filter.Filters"
	})
	local v1 = nil
	
	if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: apply (copy)
			apply()
		end, { apply })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseFiltersControllerModuleResult (copy), UseSortsControllerModuleResult (copy)
			UseFiltersControllerModuleResult.reset()
			UseSortsControllerModuleResult.reset()
		end, { reset })
		v1 = UseTableWrappedCallbackRefFunction((useSortAndFiltersScreenFocusNavigationBindings(UseRefCacheResult.SortAndFiltersContent, if CanApply then UseResult else nil, if CanReset then UseResult1 else nil)))
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local MapResult = UseBindingResult:map(FilterUtilsModule.mapHeightToSize)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local MapResult1 = UseBindingResult1:map(FilterUtilsModule.mapHeightToSize)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult)
		}),
		Size = UDim2.fromScale(1, 1),
		Visible = not IsUseFullViewModuleResultMatch
	}, (ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		restorePreviousChildFocus = true,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = not IsUseFullViewModuleResultMatch,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = UseRefCacheResult.SortAndFiltersContent,
		ref = UseContextResult[AvatarScreen.SortAndFilters],
		NextSelectionLeft = UseContextResult[AvatarScreen.Catalog],
		inputBindings = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
				NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
			end)
		}
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = UseRootFocusControllerResult
		}),
		NavigationEventsLogger = ReactModule.createElement(NavigationEventsLoggerModule),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(BoundInputsUpdaterModule),
		Content = ReactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			restorePreviousChildFocus = true,
			Size = _UDim2_1,
			Position = _UDim2,
			inputBindings = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then nil else {
				Close = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: UseCloseFiltersSignalModuleResult (copy)
					UseCloseFiltersSignalModuleResult:fire()
				end, { key = "CommonUI.Controls.Action.Back" }),
				Apply = if CanApply then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, apply, { key = "CommonUI.Messages.Action.Apply" }) else nil,
				Reset = if CanReset then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, reset, { key = "CommonUI.Messages.Action.Reset" }) else nil
			}
		}, {
			Background = ReactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				AutoButtonColor = false,
				BackgroundTransparency = UseSelectorResult and Theme.Overlay.Transparency or 1,
				BackgroundColor3 = Theme.Overlay.Color,
				Size = UDim2.new(1, 0, 1, UseSelectorResult1),
				Position = UDim2.fromOffset(0, -UseSelectorResult1)
			}),
			FiltersTopBar = ReactModule.createElement(FiltersTopBarModule, {
				buttonRef = UseRefCacheResult.FiltersTopBar,
				NextSelectionDown = UseRefCacheResult.SortAndFiltersContent,
				closePeekViewSignal = UseCloseFiltersSignalModuleResult
			}),
			PeekViewContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				ZIndex = 2,
				Position = UDim2.fromOffset(0, UseSelectorResult1),
				Size = UDim2.new(1, 0, 1, -UseSelectorResult1)
			}, {
				PeekView = ReactModule.createElement(PeekView, {
					mountAnimation = true,
					mountAsFullView = true,
					canDragFullViewToBrief = false,
					showDraggerInClosedState = false,
					returnToFullView = true,
					thumbstickScrollEnabled = true,
					peekHeaderClose = true,
					isScrollingEnabled = true,
					briefViewContentHeight = UDim.new(0, 0),
					contentFrameRef = UseRefResult,
					closeSignal = UseCloseFiltersSignalModuleResult,
					viewStateChanged = function(Closed, _)
						-- upvalues: PeekViewState (upval), UseNavigationResult (copy)
						if Closed == PeekViewState.Closed then
							UseNavigationResult.goBack()
						end
					end,
					bottomDockedContainerHeight = NewGAMEPADBOTTOMBARSIZE,
					bottomDockedContainerContent = ReactModule.createElement(ResetApplyBarModule, {
						height = NewGAMEPADBOTTOMBARSIZE,
						canReset = CanReset,
						canApply = CanApply,
						onReset = reset,
						onApply = apply,
						frameRef = UseRefCacheResult.BottomBar,
						NextSelectionUp = UseRefCacheResult.SortAndFiltersContent
					}),
					backgroundColor3 = Theme.BackgroundDefault.Color,
					backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
					shouldCaptureFocus = not FFlagAXMigrateAXToGlobalAutofocus and nil
				}, {
					SortAndFiltersContent = ReactModule.createElement(Focusable.Frame, {
						Size = UseInitializedValueFunction(function()
							-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy)
							return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry): UDim2
								return UDim2.new(1, 0, 0, Entry[1] + 24 + 24 + (Entry[2] + 24 + 24))
							end)
						end),
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ref = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then v1 else UseRefCacheResult.SortAndFiltersContent,
						NextSelectionUp = UseRefCacheResult.FiltersTopBar,
						NextSelectionDown = UseRefCacheResult.BottomBar,
						[ReactModule.Change.AbsoluteSize] = function(Frame)
							-- upvalues: UseRefResult (copy)
							local Current = UseRefResult.current
							
							if Frame and Current then
								local Y = Frame.AbsoluteSize.Y
								Current.AutomaticSize = Enum.AutomaticSize.None
								Current.Size = UDim2.new(1, 0, 0, Y)
							end
						end,
						defaultChild = UseRefCacheResult.Filters,
						restorePreviousChildFocus = true
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical
						}),
						FiltersSection = ReactModule.createElement(FilterSectionModule, {
							title = UseLocalizationResult.filters,
							Size = UseBindingResult:map(function(p1: number): UDim2
								return UDim2.new(1, 0, 0, p1 + 24 + 24)
							end),
							contentSize = MapResult
						}, {
							Filters = ReactModule.createElement(FiltersModule, {
								Size = MapResult,
								filtersController = UseFiltersControllerModuleResult,
								frameRef = UseRefCacheResult.Filters,
								NextSelectionDown = UseRefCacheResult.Sorts,
								onHeightChanged = UseBindingResult2
							})
						}),
						SortsSection = ReactModule.createElement(FilterSectionModule, {
							title = UseLocalizationResult.sorts,
							Size = UseBindingResult1:map(function(p1: number): UDim2
								return UDim2.new(1, 0, 0, p1 + 24 + 24)
							end),
							contentSize = MapResult1
						}, {
							Sorts = ReactModule.createElement(SortsModule, {
								Size = MapResult1,
								sortsController = UseSortsControllerModuleResult,
								frameRef = UseRefCacheResult.Sorts,
								NextSelectionUp = UseRefCacheResult.Filters,
								onHeightChanged = UseBindingResult2_1
							})
						})
					})
				})
			})
		})
	})))
end)