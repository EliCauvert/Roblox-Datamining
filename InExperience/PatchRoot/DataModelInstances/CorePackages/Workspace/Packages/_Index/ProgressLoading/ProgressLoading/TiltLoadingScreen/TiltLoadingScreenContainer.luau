local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local ResponsiveModule = require(Parent.Responsive)
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local GetBuilderIconForKeycodeFunction = FoundationModule.Utility.getBuilderIconForKeycode
local TiltLoadingScreenContentModule = require(script.Parent.TiltLoadingScreenContent)
local UseExperienceLoadingLifecycleModule = require(script.Parent.Hooks.useExperienceLoadingLifecycle)
local UseDeferredLoadingLifecycleModule = require(script.Parent.Hooks.useDeferredLoadingLifecycle)
local ConstantsModule = require(script.Parent.Constants)
local FFlagEnableTiltLoadingScreen = require(Parent.SharedFlags).FFlagEnableTiltLoadingScreen
local FFlagIncreaseLoadingScreenOrder = require(Parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local FFlagTiltLoadingScreenConsoleHints = require(Parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local FFlagTiltLoadingScreenEnterExitHold = require(Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local ContextActionService = game:GetService("ContextActionService")
local LocalizationService = game:GetService("LocalizationService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: FFlagEnableTiltLoadingScreen (copy), UseExperienceLoadingLifecycleModule (copy), UseDeferredLoadingLifecycleModule (copy), UserGameSettings (copy), ReactModule (copy), FFlagTiltLoadingScreenConsoleHints (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), GetBuilderIconForKeycodeFunction (copy), UseDeviceInsetsFunction (copy), InExperienceLocalesModule (copy), LocalizationService (copy), IsPioneerLaunchFunction (copy), ContextActionService (copy), FFlagIncreaseLoadingScreenOrder (copy), ConstantsModule (copy), FoundationModule (copy), LocalizationModule (copy), TiltLoadingScreenContentModule (copy), FFlagTiltLoadingScreenEnterExitHold (copy)
	if FFlagEnableTiltLoadingScreen then
		local HasDeferredJoin = p1.deferredJoin ~= nil
		local UseExperienceLoadingLifecycleModuleResult = UseExperienceLoadingLifecycleModule(not HasDeferredJoin, p1.milestones, p1.onDismissComplete)
		local UseDeferredLoadingLifecycleModuleResult, UseDeferredLoadingLifecycleModuleResult2 = UseDeferredLoadingLifecycleModule(HasDeferredJoin, if p1.deferredJoin then p1.deferredJoin.assetService else nil, p1.onCancel)
		local ReducedMotion = UserGameSettings.ReducedMotion
		local UseRefResult = ReactModule.useRef(p1.onCancel)
		UseRefResult.current = if HasDeferredJoin then UseDeferredLoadingLifecycleModuleResult2 else p1.onCancel
		local UsePreferredInputResult = if FFlagTiltLoadingScreenConsoleHints then UsePreferredInputFunction() else nil
		local IsUsePreferredInputResultMatch: boolean = FFlagTiltLoadingScreenConsoleHints and UsePreferredInputResult == ResponsiveModule.Input.Directional
		local BuilderIconForKeycode = if IsUsePreferredInputResultMatch then GetBuilderIconForKeycodeFunction(Enum.KeyCode.ButtonB) else nil
		local UseDeviceInsetsResult = UseDeviceInsetsFunction()
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
			return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: IsPioneerLaunchFunction (upval), p1 (copy), ContextActionService (upval), UseRefResult (copy)
			if IsPioneerLaunchFunction() then return end
			local ContextActionService1 = p1.contextActionService or ContextActionService
			local Flag = false
			ContextActionService1:BindCoreAction("CancelGameLoad", function(_, UserInputState)
				-- upvalues: Flag (ref), UseRefResult (upval)
				if UserInputState == Enum.UserInputState.Begin then
					Flag = true
					
					return
				end
				if UserInputState == Enum.UserInputState.End and Flag then
					Flag = false
					
					if UseRefResult.current then
						UseRefResult.current(false, true)
					end
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: ContextActionService1 (copy)
				ContextActionService1:UnbindCoreAction("CancelGameLoad")
			end
		end, { p1.contextActionService })
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: ReducedMotion (copy)
			return { reducedMotion = ReducedMotion }
		end, { ReducedMotion })
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy)
			if UseRefResult.current then
				UseRefResult.current(true)
			end
		end, {})
		
		return if UseExperienceLoadingLifecycleModuleResult.isVisible then ReactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = if p1.deferredJoin then p1.deferredJoin.displayOrder elseif FFlagIncreaseLoadingScreenOrder then ConstantsModule.DISPLAY_ORDER + 1 else ConstantsModule.DISPLAY_ORDER,
			OnTopOfCoreBlur = HasDeferredJoin,
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Foundation = ReactModule.createElement(FoundationModule.FoundationProvider, {
				colorMode = FoundationModule.Enums.ColorMode.Dark,
				preferences = UseMemoResult1
			}, {
				Localization = ReactModule.createElement(LocalizationModule.LocalizationProvider, { localization = UseMemoResult }, {
					View = ReactModule.createElement(TiltLoadingScreenContentModule, {
						placeId = p1.placeId,
						destinationUniverseId = if p1.deferredJoin then p1.deferredJoin.universeId else nil,
						milestones = if HasDeferredJoin then UseDeferredLoadingLifecycleModuleResult else UseExperienceLoadingLifecycleModuleResult.milestones,
						reducedMotion = ReducedMotion,
						isDismissing = UseExperienceLoadingLifecycleModuleResult.isDismissing,
						onEnterComplete = if HasDeferredJoin or not FFlagTiltLoadingScreenEnterExitHold then nil else UseExperienceLoadingLifecycleModuleResult.onEnterComplete,
						isDirectionalInput = IsUsePreferredInputResultMatch,
						gamepadCancelIcon = BuilderIconForKeycode,
						chromeReveal = UseExperienceLoadingLifecycleModuleResult.chromeReveal,
						onCancel = UseResult,
						safeAreaInsets = UseDeviceInsetsResult
					})
				})
			})
		}) else nil
	else
		return nil
	end
end