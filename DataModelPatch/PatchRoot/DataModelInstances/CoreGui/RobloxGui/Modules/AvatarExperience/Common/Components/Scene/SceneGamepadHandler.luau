local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useFocusRegistryEntry
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UseSceneInteractionCallbacksModule = require(Modules.AvatarExperience.Common.Context.useSceneInteractionCallbacks)
local AXAdjustmentFullscreenFix = game:DefineFastFlag("AXAdjustmentFullscreenFix", false)
local AXDisableGamepadPanning = game:DefineFastFlag("AXDisableGamepadPanning", false)
local AXRemoveExtraButtonText = game:DefineFastFlag("AXRemoveExtraButtonText", false)
local AXSceneGamepadHandlerOnlySelectDescendantOfGame = game:DefineFastFlag("AXSceneGamepadHandlerOnlySelectDescendantOfGame", false)

local function useSceneGamepadHandlerFocusNavigationBindings(p1, p2)
	-- upvalues: ReactModule (copy), RunService (copy), UserInputService (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), p1 (copy), UserInputService (upval)
		local Input = nil
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: Input (ref), p1 (upval)
			if Input then
				if Input.KeyCode == Enum.KeyCode.Thumbstick1 and p1.onPanAvatar then
					p1.onPanAvatar(Input, DeltaTime)
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.Thumbstick2 then
					p1.onRotateAndZoomAvatar(Input, DeltaTime)
				end
			end
		end)
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input1, _)
			-- upvalues: Input (ref)
			if Input1.KeyCode == Enum.KeyCode.Thumbstick1 or Input1.KeyCode == Enum.KeyCode.Thumbstick2 then
				if Input1.UserInputState == Enum.UserInputState.Change then
					Input = Input1
					
					return
				end
				if Input1.UserInputState == Enum.UserInputState.End then
					Input = nil
				end
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy), InputChangedConnection (copy)
			HeartbeatConnection:Disconnect()
			InputChangedConnection:Disconnect()
		end
	end, { p1.onPanAvatar, p1.onRotateAndZoomAvatar })
	
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.RotateAndZoomAvatar] = {
				handler = InputHandlersModule.onRelease(function() end)
			},
			[FocusNavigationEventNameEnum.PanAvatar] = if p1.onPanAvatar then {
				handler = InputHandlersModule.onRelease(function() end)
			} else nil,
			[FocusNavigationEventNameEnum.EnterAvatarFullView] = if p1.onEnterAvatarFullView then {
				handler = InputHandlersModule.onRelease(p1.onEnterAvatarFullView)
			} else nil,
			[FocusNavigationEventNameEnum.ExitAvatarFullView] = if p1.onExitAvatarFullView then {
				handler = InputHandlersModule.onRelease(p1.onExitAvatarFullView)
			} else nil,
			[FocusNavigationEventNameEnum.NavigateBack] = if p1.onGoBack then { handler = InputHandlersModule.onRelease(p1.onGoBack) } else nil
		}
	end, {
		p1.onRotateAndZoomAvatar,
		p1.onPanAvatar,
		p1.onEnterAvatarFullView,
		p1.onExitAvatarFullView,
		p1.onGoBack
	}), (ReactFocusNavigationModule.useEventMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p1 (copy)
		return {
			[Enum.KeyCode.Thumbstick2] = FocusNavigationEventNameEnum.RotateAndZoomAvatar,
			[Enum.KeyCode.Thumbstick1] = FocusNavigationEventNameEnum.PanAvatar,
			[Enum.KeyCode.ButtonR3] = if p1.onEnterAvatarFullView then FocusNavigationEventNameEnum.EnterAvatarFullView elseif p1.onExitAvatarFullView then FocusNavigationEventNameEnum.ExitAvatarFullView else nil,
			[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
			[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
		}
	end, { p1.onEnterAvatarFullView, p1.onExitAvatarFullView }), p2)))
end

return function(p1)
	-- upvalues: UseAvatarRouteFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), ReactModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UseSceneInteractionCallbacksModule (copy), UtilsModule (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), GamepadUtils (copy), AvatarScreen (copy), UseFocusGuiObjectFunction (copy), AXSceneGamepadHandlerOnlySelectDescendantOfGame (copy), UseFocusRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), GuiService (copy), FullView (copy), SetFullViewModule (copy), useSceneGamepadHandlerFocusNavigationBindings (copy), AXAdjustmentFullscreenFix (copy), AXDisableGamepadPanning (copy), CryoModule (copy), AXRemoveExtraButtonText (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local Name = UseAvatarRouteResult.opaque.name
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.Invisible)
	local UseSceneInteractionCallbacksModuleResult = UseSceneInteractionCallbacksModule()
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: UtilsModule (upval), UseAvatarRouteResult (copy)
		return UtilsModule.getIsSceneFullViewFromState(p2, UseAvatarRouteResult)
	end, { UseAvatarRouteResult })))
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GamepadUtils (upval), UseSceneInteractionCallbacksModuleResult (copy)
		GamepadUtils.rotateAndZoom(p2, p3, UseSceneInteractionCallbacksModuleResult.setAngularVelocityByPixels, UseSceneInteractionCallbacksModuleResult.rotateByRadians, UseSceneInteractionCallbacksModuleResult.zoomStraight)
	end, {
		UseSceneInteractionCallbacksModuleResult.setAngularVelocityByPixels,
		UseSceneInteractionCallbacksModuleResult.rotateByRadians,
		UseSceneInteractionCallbacksModuleResult.zoomStraight
	})
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GamepadUtils (upval), UseSceneInteractionCallbacksModuleResult (copy)
		local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone(Vector2.new(p2.Position.X, p2.Position.Y))
		
		if NormalizeStickByDeadzoneResult == Vector2.new(0, 0) then return end
		if UseSceneInteractionCallbacksModuleResult.panByDistance then
			UseSceneInteractionCallbacksModuleResult.panByDistance(p3 * NormalizeStickByDeadzoneResult * 5)
		end
	end, { UseSceneInteractionCallbacksModuleResult.panByDistance })
	local IsNameMatch: boolean = Name == AvatarScreen.AvatarEditor or (Name == AvatarScreen.MySharedAvatars or (Name == AvatarScreen.Catalog or (Name == AvatarScreen.CatalogSearch or Name == AvatarScreen.ProfilePictureEditorEmotes)))
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseFocusRegistryEntryResult = if AXSceneGamepadHandlerOnlySelectDescendantOfGame then UseFocusRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.SubRouterView) else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UseFocusGuiObjectResult (copy), UseRefResult1 (copy), AXSceneGamepadHandlerOnlySelectDescendantOfGame (upval), UseFocusRegistryEntryResult (copy), GuiService (upval), UseRefResult (copy), FullView (upval), UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceResult (copy), Name (copy)
		if UseSelectorResult then
			if UseFocusGuiObjectResult and UseRefResult1.current and (not AXSceneGamepadHandlerOnlySelectDescendantOfGame or UseRefResult1.current:IsDescendantOf(game)) then
				UseFocusGuiObjectResult(UseRefResult1.current)
			elseif AXSceneGamepadHandlerOnlySelectDescendantOfGame and UseFocusRegistryEntryResult then
				UseFocusRegistryEntryResult()
			end
			UseRefResult1.current = nil
		else
			UseRefResult1.current = GuiService.SelectedCoreObject
			
			if UseFocusGuiObjectResult and UseRefResult.current then
				UseFocusGuiObjectResult(UseRefResult.current)
			end
		end
		UseDispatchResult(SetFullViewModule(UseRoactServiceResult, Name, if UseSelectorResult then FullView.None else FullView.SceneFullView))
	end, {
		UseSelectorResult, UseDispatchResult, Name, UseRoactServiceResult,
		UseFocusGuiObjectResult,
		if AXSceneGamepadHandlerOnlySelectDescendantOfGame then UseFocusRegistryEntryResult else nil
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ref = useSceneGamepadHandlerFocusNavigationBindings({
			onGoBack = if UseSelectorResult then UseResult2 else nil,
			onEnterAvatarFullView = if UseSelectorResult or not IsNameMatch then nil else UseResult2,
			onExitAvatarFullView = if AXAdjustmentFullscreenFix then if UseSelectorResult and IsNameMatch then UseResult2 else nil elseif UseSelectorResult then UseResult2 else nil,
			onPanAvatar = if AXDisableGamepadPanning then nil elseif UseSelectorResult then UseResult1 else nil,
			onRotateAndZoomAvatar = UseResult
		})
	}, CryoModule.Dictionary.join(p1.children, {
		FocusIsolate = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Text = if AXRemoveExtraButtonText then "" else nil,
			SelectionImageObject = UseSelectionCursorResult,
			ref = UseRefResult,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		})
	}))
end