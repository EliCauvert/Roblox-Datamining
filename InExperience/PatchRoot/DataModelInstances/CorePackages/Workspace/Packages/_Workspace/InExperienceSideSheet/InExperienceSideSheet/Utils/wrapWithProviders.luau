local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local Constants = require(Parent.UIBlox).App.Style.Constants
local UiModeStyleProvider = require(Parent.Style).UiModeStyleProvider
local UnibarStyle = require(Parent.Chrome).UnibarStyle
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local NewResult = if FFlagSideSheetFocusNav then ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui) else nil
local config = {
	isFocused = function(): boolean --[[ Line: 46 ]]
		return true
	end,
	addListener = function(_, _) --[[ Line: 49 ]]
		return { remove = function() --[[ Line: 51 ]] end }
	end
}

return function(Element, List, p1) --[[ Line: 56 | Named "wrapWithProviders" ]]
	-- upvalues: RoduxModule (copy), IsPioneerLaunchFunction (copy), ReactModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FFlagEnableDrawerFocusNav (copy), RoactNavigationModule (copy), config (copy), RoactRoduxModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UiModeStyleProvider (copy), ColorMode (copy), Constants (copy), FFlagSideSheetFocusNav (copy), UnibarStyle (copy), ReactFocusNavigationModule (copy), NewResult (ref), Provider (copy)
	local P4 = p1 or RoduxModule.Store.new(function(p2) --[[ Line: 57 ]]
		return p2 or {}
	end)
	local Element1 = Element
	
	if IsPioneerLaunchFunction() then
		Element1 = ReactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies } }, Element1)
	end
	for _, value in List do
		Element1 = ReactModule.createElement(value, nil, Element1)
	end
	if FFlagEnableDrawerFocusNav then
		Element1 = ReactModule.createElement(RoactNavigationModule.Provider, { value = config }, Element1)
	end
	return ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = P4 }, {
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			UiModeStyleProvider = ReactModule.createElement(UiModeStyleProvider, {
				style = {
					themeName = ColorMode.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, {
				UnibarStyleProvider = if FFlagSideSheetFocusNav then ReactModule.createElement(UnibarStyle.Provider, {}, {
					FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
						Registry = ReactModule.createElement(Provider, nil, Element1)
					})
				}) else ReactModule.createElement(UnibarStyle.Provider, {}, Element1)
			})
		})
	})
end