local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local colorMode = require(parent.Foundation).Enums.ColorMode
local chromeModule = require(parent.Chrome)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local styleModule = require(parent.Style)
local UIBloxModule = require(parent.UIBlox)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local appFeaturePolicies = universalAppPolicyModule.AppFeaturePolicies
local roactAppPolicy = universalAppPolicyModule.RoactAppPolicy
local constants = UIBloxModule.App.Style.Constants
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local unibarStyle = chromeModule.UnibarStyle
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local var1 = if fFlagSideSheetFocusNav then reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui) else nil
local t = {
	isFocused = function()
		return true
	end,
	addListener = function(_, _)
		return { remove = function() end }
	end
}

return function(p1, p2, p3)
	-- upvalues: roduxModule (ref), isPioneerLaunch (ref), reactModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), fFlagEnableDrawerFocusNav (ref), roactNavigationModule (ref), t (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), fFlagSideSheetFocusNav (ref), unibarStyle (ref), reactFocusNavigationModule (ref), var1 (write), provider (ref)
	p3 = p3 or roduxModule.Store.new(function(p4)
		return p4 or {}
	end)
	local var2 = p1
	
	if isPioneerLaunch() then
		var2 = reactModule.createElement(roactAppPolicy.Provider, { policy = { appFeaturePolicies } }, var2)
	end
	for i, v in p2 do
		var2 = reactModule.createElement(v, nil, var2)
	end
	if fFlagEnableDrawerFocusNav then
		var2 = reactModule.createElement(roactNavigationModule.Provider, { value = t }, var2)
	end
	return reactModule.createElement(roactRoduxModule.StoreProvider, { store = p3 }, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			UiModeStyleProvider = reactModule.createElement(uiModeStyleProvider, {
				style = {
					themeName = colorMode.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				UnibarStyleProvider = if fFlagSideSheetFocusNav then reactModule.createElement(unibarStyle.Provider, {}, {
					FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
						Registry = reactModule.createElement(provider, nil, var2)
					})
				}) else reactModule.createElement(unibarStyle.Provider, {}, var2)
			})
		})
	})
end