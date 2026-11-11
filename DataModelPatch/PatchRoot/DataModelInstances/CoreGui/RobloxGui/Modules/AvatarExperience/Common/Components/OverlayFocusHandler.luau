local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local WithNavigationFocusFunction = require(CorePackages.Packages.RoactNavigation).withNavigationFocus
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local Focusable = RoactGamepadModule.Focusable
local TModule = require(CorePackages.Packages.t)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local AxGamepad = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad")
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local GamepadFocusRecoveryModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusRecovery)
local AvatarVRPanelWrapperModule = require(Modules.AvatarExperience.Common.Components.AvatarVRPanelWrapper)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetFFlagLuafiedReportEntryPointsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuafiedReportEntryPoints
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AXOverlayShouldNotAutofocusForNonDirectionalInput = game:DefineFastFlag("AXOverlayShouldNotAutofocusForNonDirectionalInput", false)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(UseRefResult, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
end

local OverlayFocusHandler = RoactModule.PureComponent:extend("OverlayFocusHandler")
OverlayFocusHandler.validateProps = TModule.strictInterface({
	overlayComponent = TModule.union(TModule.table, TModule.callback),
	arguments = TModule.table,
	focusNavigationRef = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then TModule.table else nil,
	navigation = TModule.table,
	isFocused = TModule.boolean,
	forwardRef = if FFlagAXMigrateAXToGlobalAutofocus then TModule.optional(TModule.any) else nil
})

function OverlayFocusHandler.init(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), UserInputService (copy), IsGamepadInputFunction (copy), RoactGamepadModule (copy), RoactModule (copy), NavigationUtilsModule (copy)
	if not FFlagAXMigrateAXToGlobalAutofocus then
		p1:setState({
			gamepadFocused = false,
			lastInputIsGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
		})
	end
	p1.mounted = false
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController()
	p1.defaultChildRef = RoactModule.createRef()
	
	if not FFlagAXMigrateAXToGlobalAutofocus then
		function p1.onFocusChanged(GamepadFocused)
			-- upvalues: p1 (copy)
			if p1.mounted then
				p1:setState({ gamepadFocused = GamepadFocused })
			end
		end
	end
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function OverlayFocusHandler.didMount(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), CryoModule (copy)
	p1.mounted = true
	
	if not FFlagAXMigrateAXToGlobalAutofocus then
		p1:handleUpdate(CryoModule.Dictionary.join(p1.props, { isFocused = false }), p1.state)
	end
end

function OverlayFocusHandler.willUnmount(p1)
	p1.mounted = false
end

if not FFlagAXMigrateAXToGlobalAutofocus then
	function OverlayFocusHandler.didUpdate(p1, p2, p3)
		p1:handleUpdate(p2, p3)
	end
	
	function OverlayFocusHandler.cancelCaptureFocus(p1)
		if p1.captureFocusPromise then
			p1.captureFocusPromise:cancel()
			p1.captureFocusPromise = nil
		end
	end
	
	function OverlayFocusHandler.captureFocusAfterDelay(p1, p2)
		-- upvalues: PromiseModule (copy)
		p1:cancelCaptureFocus()
		p1.captureFocusPromise = PromiseModule.delay(p2):andThen(p1.focusController.captureFocus)
	end
	
	function OverlayFocusHandler.handleUpdate(p1, JoinResult, State)
		-- upvalues: AxGamepad (copy)
		local LastInputIsGamepad = p1.state.lastInputIsGamepad
		local LastInputIsGamepad1 = State.lastInputIsGamepad
		local LastInputIsGamepad2 = not LastInputIsGamepad1 and LastInputIsGamepad
		local NoLastInputIsGamepad: boolean = LastInputIsGamepad1 and not LastInputIsGamepad
		local IsFocused = not JoinResult.isFocused and p1.props.isFocused
		
		if LastInputIsGamepad and p1.props.isFocused and (IsFocused or LastInputIsGamepad2) then
			AxGamepad:trace("captureFocus [Overlay], navigatedToPage: {}, acquiredGamepadInput: {}", IsFocused, LastInputIsGamepad2)
			p1.focusController.captureFocus()
			
			return
		end
		if NoLastInputIsGamepad then
			AxGamepad:trace("releaseFocus [Overlay]")
			p1.focusController.releaseFocus()
		end
	end
end
function OverlayFocusHandler.getChildren(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), CryoModule (copy), RoactModule (copy), NavigationEventsLoggerModule (copy), ExternalEventConnection (copy), UserInputService (copy), IsGamepadInputFunction (copy), IsVRAppBuildFunction (copy), BoundInputsUpdaterModule (copy), GamepadFocusRecoveryModule (copy)
	local OverlayComponent = p1.props.overlayComponent
	local Arguments = p1.props.arguments
	
	if not FFlagAXMigrateAXToGlobalAutofocus then
		if Arguments.focusController then
			Arguments = CryoModule.Dictionary.join(Arguments, { defaultChildRef = p1.defaultChildRef })
		else
			Arguments = CryoModule.Dictionary.join(Arguments, {
				defaultChildRef = p1.defaultChildRef,
				focusController = p1.focusController
			})
		end
	end
	return {
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "[Overlay]" }),
		LastInputTypeChangedConnection = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
				local IsGamepadInput = IsGamepadInputFunction(p2)
				
				if IsGamepadInput ~= p1.state.lastInputIsGamepad then
					p1:setState({ lastInputIsGamepad = IsGamepadInput })
				end
			end
		}),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif IsVRAppBuildFunction() then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		GamepadFocusRecovery = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusRecoveryModule, {
			debugName = "[Overlay]",
			focusController = p1.focusController,
			isGamepadInput = p1.state.lastInputIsGamepad
		}),
		OverlayScreen = RoactModule.createElement(OverlayComponent, Arguments)
	}
end

function OverlayFocusHandler.render(p1)
	-- upvalues: IsVRAppBuildFunction (copy), RoactModule (copy), AvatarVRPanelWrapperModule (copy), AvatarScreenProperties (copy), GetFFlagLuafiedReportEntryPointsFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), RoactGamepadModule (copy)
	if IsVRAppBuildFunction() then
		local RouteName = p1.props.navigation.state.routeName
		
		return RoactModule.createElement(AvatarVRPanelWrapperModule, {
			panelPlacement = AvatarScreenProperties[RouteName].VRPanelPlacement,
			roundedCornersFrame = if GetFFlagLuafiedReportEntryPointsFunction() then AvatarScreenProperties[RouteName].VRPanelRoundedCorners else false
		}, p1:getChildren())
	else
		return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
			[RoactModule.Ref] = if FFlagAXMigrateAXToGlobalAutofocus then p1.props.forwardRef else nil,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			SelectionGroup = if FFlagAXMigrateAXToGlobalAutofocus then true else nil,
			SelectionBehaviorLeft = if FFlagAXMigrateAXToGlobalAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if FFlagAXMigrateAXToGlobalAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if FFlagAXMigrateAXToGlobalAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if FFlagAXMigrateAXToGlobalAutofocus then Enum.SelectionBehavior.Stop else nil,
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
			onFocusChanged = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.onFocusChanged,
			defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.defaultChildRef,
			[RoactModule.Ref] = p1.props.focusNavigationRef,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then nil else {
				closePrompt = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.closePrompt)
			}
		}, p1:getChildren())
	end
end

if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then
	OverlayFocusHandler = WithNavigationFocusFunction(OverlayFocusHandler)
	
	return function(p1)
		-- upvalues: UseNavigationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), UseFocusGuiObjectFunction (copy), AXOverlayShouldNotAutofocusForNonDirectionalInput (copy), ResponsiveModule (copy), OverlayFocusHandler (ref), CryoModule (copy)
		local UseNavigationResult = UseNavigationFunction()
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
			NavigationUtilsModule.closeOverlay(UseNavigationResult)
		end, { UseNavigationResult })
		local UseRefResult = ReactModule.useRef(nil)
		
		if FFlagAXMigrateAXToGlobalAutofocus then
			UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.CentralOverlay)
		end
		local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(UseRefResult, UseResult)))
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local IsUsePreferredInputResultMatch = if AXOverlayShouldNotAutofocusForNonDirectionalInput then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else nil
		ReactModule.useEffect(function()
			-- upvalues: AXOverlayShouldNotAutofocusForNonDirectionalInput (upval), UseRefResult (copy), IsUsePreferredInputResultMatch (copy), UseFocusGuiObjectResult (copy)
			if if AXOverlayShouldNotAutofocusForNonDirectionalInput then UseRefResult.current and IsUsePreferredInputResultMatch else UseRefResult.current then
				task.delay(0.1, function()
					-- upvalues: UseFocusGuiObjectResult (upval), UseRefResult (upval)
					UseFocusGuiObjectResult(UseRefResult.current)
				end)
			end
		end, {
			UseFocusGuiObjectResult,
			if AXOverlayShouldNotAutofocusForNonDirectionalInput then IsUsePreferredInputResultMatch else nil
		})
		
		return ReactModule.createElement(OverlayFocusHandler, CryoModule.Dictionary.join(p1, { focusNavigationRef = UseTableWrappedCallbackRefResult }))
	end
else
	return WithNavigationFocusFunction(OverlayFocusHandler)
end