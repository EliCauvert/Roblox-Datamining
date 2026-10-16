local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactRoduxModule = require(Parent.RoactRodux)
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local NewResult = require(Parent.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local GetOverlayStoreModule = require(SocialUpsell.Store.getOverlayStore)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FoundationProvider = FoundationModule.FoundationProvider
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local OVERLAYTYPES = require(SocialUpsell.Constants).OVERLAY_TYPES
local _ = require(SocialUpsell.Types)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

function OverlayContent(_) --[[ Line: 52 ]]
	-- upvalues: UseOverlayFunction (copy), SignalsReactModule (copy), GetOverlayStoreModule (copy), ReactModule (copy), OVERLAYTYPES (copy), CreateLazyComponentFunction (copy), SocialUpsell (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactRobloxModule (copy), FocusRoot (copy), EventMap (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseOverlayResult = UseOverlayFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetOverlayStoreModule(false).getCurrentOverlay)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: OVERLAYTYPES (upval), CreateLazyComponentFunction (upval), SocialUpsell (upval)
		return {
			[OVERLAYTYPES.SocialUpsell] = {
				Component = CreateLazyComponentFunction(function() --[[ Line: 60 ]]
					-- upvalues: SocialUpsell (upval)
					return require(SocialUpsell.Components.InAppSocialUpsellOverlayWrapper)
				end)
			}
		}
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 67 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), GetOverlayStoreModule (upval)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1) --[[ Line: 70 ]]
					-- upvalues: GetOverlayStoreModule (upval)
					GetOverlayStoreModule(false).dismissCurrentOverlay()
					p1:cancel()
				end)
			}
		}
	end, {})
	
	return if UseOverlayResult and UseSignalStateResult and UseSignalStateResult.overlayType and UseMemoResult[UseSignalStateResult.overlayType] then ReactRobloxModule.createPortal(ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		shouldRestoreFocus = true,
		eventHandlers = UseMemoResult1,
		eventMap = EventMap,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		Content = ReactModule.createElement(UseMemoResult[UseSignalStateResult.overlayType].Component, UseSignalStateResult.overlayProps or {})
	}), UseOverlayResult) else nil
end

return function(_) --[[ Line: 99 ]]
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), RoactRoduxModule (copy), RoduxModule (copy), LocalizationProvider (copy), NewResult (copy), FoundationProvider (copy), Provider (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 108 ]]
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 112 ]]
		-- upvalues: UseMemoResult (copy)
		return function() --[[ Line: 113 ]]
			-- upvalues: UseMemoResult (upval)
			if UseMemoResult then
				UseMemoResult:teardown()
			end
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
		store = RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.thunkMiddleware })
	}, {
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
			FoundationProvider = ReactModule.createElement(FoundationProvider, nil, {
				FocusProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseMemoResult }, {
					FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, { Content = ReactModule.createElement(OverlayContent) })
				})
			})
		})
	})
end