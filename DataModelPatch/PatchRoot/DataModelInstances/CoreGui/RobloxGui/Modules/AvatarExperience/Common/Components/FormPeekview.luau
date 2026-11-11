local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseFullViewModule = require(Modules.AvatarExperience.Common.Hooks.useFullView)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
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
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NamedRefsContextModule = require(Modules.AvatarExperience.Common.Context.NamedRefsContext)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local FFlagAXMigrateFormPeekViewToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateFormPeekViewToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCloseFilterOnBackgroundTap = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXCloseFilterOnBackgroundTap
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.FormPeekViewApply,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.FormPeekViewReset
}

local function useFocusNavigationBindings(BottomBar, Callback, OnApply, OnReset)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), OnApply (copy), OnReset (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.FormPeekViewApply] = if OnApply then { handler = InputHandlersModule.onRelease(OnApply) } else nil,
			[FocusNavigationEventNameEnum.FormPeekViewReset] = if OnReset then { handler = InputHandlersModule.onRelease(OnReset) } else nil
		}
	end, { Callback, OnApply, OnReset }), (ReactFocusNavigationModule.useEventMap(config, BottomBar)))
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(p1)
	-- upvalues: UseFullViewModule (copy), FullView (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), ReactModule (copy), NamedRefsContextModule (copy), UseNavigationFunction (copy), ConstantsModule (copy), TopBarModule (copy), UseStyleFunction (copy), UseIsGamepadFunction (copy), ResponsiveModule (copy), ConstantsModule1 (copy), FFlagAXCloseFilterOnBackgroundTap (copy), FFlagAXMigrateFormPeekViewToFocusNavigation (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), Focusable (copy), AvatarScreen (copy), NavigationUtilsModule (copy), GamepadFocusHandlerForPageModule (copy), NavigationEventsLoggerModule (copy), BoundInputsUpdaterModule (copy), FiltersTopBarModule (copy), PeekView (copy), PeekViewState (copy), ResetApplyBarModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy)
	local IsUseFullViewModuleResultMatch = UseFullViewModule() == FullView.SceneFullView
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseNavigationResult = UseNavigationFunction()
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if UseSelectorResult then
		_UDim2 = UDim2.fromScale(0, 0)
		_UDim2_1 = UDim2.fromScale(1, 1)
	else
		_UDim2 = UDim2.fromScale(ConstantsModule.LandscapeNavWidth, 0)
		_UDim2_1 = UDim2.fromScale(ConstantsModule.LandscapeSceneWidth, 1)
	end
	local UseSelectorResult1 = UseSelectorFunction(TopBarModule.selectTopBarHeight, GetUseSelectorDeepEqualsFunction())
	local Theme = UseStyleFunction().Theme
	local UseRefResult = ReactModule.useRef(nil)
	local NewGAMEPADBOTTOMBARSIZE = 80
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	
	if UseIsGamepadFunction() and IsUsePreferredInputResultMatch then
		NewGAMEPADBOTTOMBARSIZE += ConstantsModule1.GAMEPAD_BOTTOM_BAR_SIZE
	end
	local function updatePeekViewContentFrameSize(Frame)
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Frame and Current then
			local Y = Frame.AbsoluteSize.Y
			Current.AutomaticSize = Enum.AutomaticSize.None
			Current.Size = UDim2.new(1, 0, 0, Y)
		end
	end
	
	local UseResult = if FFlagAXCloseFilterOnBackgroundTap then ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.closePeekViewSignal:fire()
	end, { p1.closePeekViewSignal }) else nil
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagAXMigrateFormPeekViewToFocusNavigation then
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.closePeekViewSignal:fire()
		end, { p1.closePeekViewSignal })
		local UseFocusNavigationBindingsResult = useFocusNavigationBindings(UseRefCacheResult.SortAndFiltersContent, UseResult1, if p1.canApply then p1.onApply else nil, if p1.canReset then p1.onReset else nil)
		local UseFocusNavigationBindingsResult1 = useFocusNavigationBindings(UseRefCacheResult.FiltersTopBar, UseResult1, if p1.canApply then p1.onApply else nil, if p1.canReset then p1.onReset else nil)
		local UseFocusNavigationBindingsResult2 = useFocusNavigationBindings(UseRefCacheResult.BottomBar, UseResult1, if p1.canApply then p1.onApply else nil, if p1.canReset then p1.onReset else nil)
		v1 = UseTableWrappedCallbackRefFunction(UseFocusNavigationBindingsResult)
		v2 = UseTableWrappedCallbackRefFunction(UseFocusNavigationBindingsResult1)
		v3 = UseTableWrappedCallbackRefFunction(UseFocusNavigationBindingsResult2)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult)
		}),
		Size = UDim2.fromScale(1, 1),
		Visible = not IsUseFullViewModuleResultMatch
	}, (ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = not IsUseFullViewModuleResultMatch,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefCacheResult.SortAndFiltersContent,
		ref = UseContextResult[AvatarScreen.SortAndFilters],
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseContextResult[AvatarScreen.Catalog],
		inputBindings = if FFlagAXMigrateFormPeekViewToFocusNavigation then nil else {
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
		Content = ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = _UDim2_1,
			Position = _UDim2,
			restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateFormPeekViewToFocusNavigation then nil else {
				Close = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: p1 (copy)
					p1.closePeekViewSignal:fire()
				end, { key = "CommonUI.Controls.Action.Back" }),
				Apply = if p1.canApply then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.onApply, { key = "CommonUI.Messages.Action.Apply" }) else nil,
				Reset = if p1.canReset then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, p1.onReset, { key = "CommonUI.Messages.Action.Reset" }) else nil
			}
		}, {
			Background = ReactModule.createElement("TextButton", {
				BackgroundTransparency = UseSelectorResult and Theme.Overlay.Transparency or 1,
				BackgroundColor3 = Theme.Overlay.Color,
				Size = UDim2.new(1, 0, 1, UseSelectorResult1),
				Position = UDim2.fromOffset(0, -UseSelectorResult1),
				ZIndex = 1,
				Text = "",
				AutoButtonColor = false,
				[ReactModule.Event.Activated] = if FFlagAXCloseFilterOnBackgroundTap then UseResult else nil
			}),
			FiltersTopBar = ReactModule.createElement(FiltersTopBarModule, {
				buttonRef = if FFlagAXMigrateFormPeekViewToFocusNavigation then v2 else UseRefCacheResult.FiltersTopBar,
				NextSelectionDown = UseRefCacheResult.SortAndFiltersContent,
				closePeekViewSignal = p1.closePeekViewSignal
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
					closeSignal = p1.closePeekViewSignal,
					viewStateChanged = function(Closed, _)
						-- upvalues: PeekViewState (upval), UseNavigationResult (copy)
						if Closed == PeekViewState.Closed then
							UseNavigationResult.goBack()
						end
					end,
					bottomDockedContainerHeight = NewGAMEPADBOTTOMBARSIZE,
					bottomDockedContainerContent = ReactModule.createElement(ResetApplyBarModule, {
						height = NewGAMEPADBOTTOMBARSIZE,
						canReset = p1.canReset,
						canApply = p1.canApply,
						onReset = p1.onReset,
						onApply = p1.onApply,
						frameRef = if FFlagAXMigrateFormPeekViewToFocusNavigation then v3 else UseRefCacheResult.BottomBar,
						NextSelectionUp = UseRefCacheResult.SortAndFiltersContent
					}),
					backgroundColor3 = Theme.BackgroundDefault.Color,
					backgroundTransparency = Theme.BackgroundUIDefault.Transparency
				}, {
					SortAndFiltersContent = ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
						Size = p1.totalSize,
						AutomaticSize = if p1.useAutomaticSize then Enum.AutomaticSize.Y else nil,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ref = if FFlagAXMigrateFormPeekViewToFocusNavigation then v1 else UseRefCacheResult.SortAndFiltersContent,
						NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif FFlagAXMigrateFormPeekViewToFocusNavigation then v2 else UseRefCacheResult.FiltersTopBar,
						NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefCacheResult.BottomBar,
						[ReactModule.Change.AbsoluteSize] = updatePeekViewContentFrameSize,
						defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefCacheResult.Filters,
						restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical
						}),
						Children = ReactModule.createElement(ReactModule.Fragment, {}, p1.children)
					})
				})
			})
		})
	})))
end)