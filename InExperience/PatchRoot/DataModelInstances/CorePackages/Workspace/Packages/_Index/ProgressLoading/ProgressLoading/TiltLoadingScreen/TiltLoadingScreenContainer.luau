local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local responsiveModule = require(parent.Responsive)
local useDeviceInsets = responsiveModule.useDeviceInsets
local usePreferredInput = responsiveModule.usePreferredInput
local getBuilderIconForKeycode = foundationModule.Utility.getBuilderIconForKeycode
local tiltLoadingScreenContentModule = require(script.Parent.TiltLoadingScreenContent)
local useExperienceLoadingLifecycleModule = require(script.Parent.Hooks.useExperienceLoadingLifecycle)
local useDeferredLoadingLifecycleModule = require(script.Parent.Hooks.useDeferredLoadingLifecycle)
local constantsModule = require(script.Parent.Constants)
local fFlagEnableTiltLoadingScreen = require(parent.SharedFlags).FFlagEnableTiltLoadingScreen
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local fFlagTiltLoadingScreenConsoleHints = require(parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local fFlagTiltLoadingScreenEnterExitHold = require(parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), useExperienceLoadingLifecycleModule (ref), useDeferredLoadingLifecycleModule (ref), userGameSettingsService (ref), reactModule (ref), fFlagTiltLoadingScreenConsoleHints (ref), usePreferredInput (ref), responsiveModule (ref), getBuilderIconForKeycode (ref), useDeviceInsets (ref), inExperienceLocalesModule (ref), localizationService (ref), isPioneerLaunch (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenContentModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var1 = p1.deferredJoin ~= nil
	local var2 = useExperienceLoadingLifecycleModule(not var1, p1.milestones, p1.onDismissComplete)
	local var3, var4 = useDeferredLoadingLifecycleModule(var1, if p1.deferredJoin then p1.deferredJoin.assetService else nil, p1.onCancel)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var5 = reactModule.useRef(p1.onCancel)
	var5.current = if var1 then var4 else p1.onCancel
	local var6 = fFlagTiltLoadingScreenConsoleHints and (if fFlagTiltLoadingScreenConsoleHints then usePreferredInput() else nil) == responsiveModule.Input.Directional
	local var7 = if var6 then getBuilderIconForKeycode(Enum.KeyCode.ButtonB) else nil
	local var8 = useDeviceInsets()
	local var9 = reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPioneerLaunch (copy), p1 (ref), contextActionService (copy), var5 (ref)
		if isPioneerLaunch() then
			return
		end
		local contextActionService_1 = p1.contextActionService or contextActionService
		local var10 = false
		contextActionService_1:BindCoreAction("CancelGameLoad", function(_, p2)
			-- upvalues: var10 (write), var5 (copy)
			if p2 == Enum.UserInputState.Begin then
				var10 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var10 then
				var10 = false
				
				if var5.current then
					var5.current(false, true)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: contextActionService_1 (ref)
			contextActionService_1:UnbindCoreAction("CancelGameLoad")
		end
	end, { p1.contextActionService })
	
	return if var2.isVisible then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		DisplayOrder = if p1.deferredJoin then p1.deferredJoin.displayOrder elseif fFlagIncreaseLoadingScreenOrder then constantsModule.DISPLAY_ORDER + 1 else constantsModule.DISPLAY_ORDER,
		OnTopOfCoreBlur = var1,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Foundation = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			preferences = reactModule.useMemo(function()
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var9 }, {
				View = reactModule.createElement(tiltLoadingScreenContentModule, {
					placeId = p1.placeId,
					destinationUniverseId = if p1.deferredJoin then p1.deferredJoin.universeId else nil,
					milestones = if var1 then var3 else var2.milestones,
					reducedMotion = reducedMotion,
					isDismissing = var2.isDismissing,
					onEnterComplete = if var1 or not fFlagTiltLoadingScreenEnterExitHold then nil else var2.onEnterComplete,
					isDirectionalInput = var6,
					gamepadCancelIcon = var7,
					chromeReveal = var2.chromeReveal,
					onCancel = reactModule.useCallback(function()
						-- upvalues: var5 (ref)
						if var5.current then
							var5.current(true)
						end
					end, {}),
					safeAreaInsets = var8
				})
			})
		})
	}) else nil
end