local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local signalsReactModule = require(parent.SignalsReact)
local reactRobloxModule = require(parent.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent
local localizationProvider = require(parent.Localization).LocalizationProvider
local var1 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
local getOverlayStoreModule = require(socialUpsell.Store.getOverlayStore)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local foundationProvider = foundationModule.FoundationProvider
local useOverlay = foundationModule.Hooks.useOverlay
local OVERLAY_TYPES = require(socialUpsell.Constants).OVERLAY_TYPES
local _ = require(socialUpsell.Types)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

function OverlayContent(_)
	-- upvalues: useOverlay (ref), signalsReactModule (ref), getOverlayStoreModule (ref), reactModule (ref), OVERLAY_TYPES (ref), createLazyComponent (ref), socialUpsell (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactRobloxModule (ref), focusRoot (ref), t (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2 = useOverlay()
	local var3 = signalsReactModule.useSignalState(getOverlayStoreModule(false).getCurrentOverlay)
	local var4 = reactModule.useMemo(function()
		-- upvalues: OVERLAY_TYPES (copy), createLazyComponent (copy), socialUpsell (copy)
		return {
			[OVERLAY_TYPES.SocialUpsell] = {
				Component = createLazyComponent(function()
					-- upvalues: socialUpsell (copy)
					return require(socialUpsell.Components.InAppSocialUpsellOverlayWrapper)
				end)
			}
		}
	end, {})
	
	return if var2 and var3 and (var3.overlayType and var4[var3.overlayType]) then reactRobloxModule.createPortal(reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		shouldRestoreFocus = true,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), getOverlayStoreModule (copy)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1)
						-- upvalues: getOverlayStoreModule (copy)
						getOverlayStoreModule(false).dismissCurrentOverlay()
						p1:cancel()
					end)
				}
			}
		end, {}),
		eventMap = t,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		Content = reactModule.createElement(var4[var3.overlayType].Component, var3.overlayProps or {})
	}), var2) else nil
end

return function(_)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), roactRoduxModule (ref), roduxModule (ref), localizationProvider (ref), var1 (ref), foundationProvider (ref), provider (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: reactFocusNavigationModule (copy)
		return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			if var2 then
				var2:teardown()
			end
		end
	end, { var2 })
	
	return reactModule.createElement(roactRoduxModule.StoreProvider, {
		store = roduxModule.Store.new(roduxModule.createReducer({}, {}), nil, { roduxModule.thunkMiddleware })
	}, {
		LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var1 }, {
			FoundationProvider = reactModule.createElement(foundationProvider, nil, {
				FocusProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var2 }, {
					FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, { Content = reactModule.createElement(OverlayContent) })
				})
			})
		})
	})
end