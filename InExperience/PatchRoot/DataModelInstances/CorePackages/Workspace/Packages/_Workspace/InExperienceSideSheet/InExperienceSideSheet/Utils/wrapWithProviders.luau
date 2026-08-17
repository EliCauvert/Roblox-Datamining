local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local colorMode = require(parent.Foundation).Enums.ColorMode
local chromeModule = require(parent.Chrome)
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
local constants = UIBloxModule.App.Style.Constants
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local unibarStyle = chromeModule.UnibarStyle
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local var10 = if fFlagSideSheetFocusNav then reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui) else nil
local t = {
	isFocused = function() --[[ line: 41 ]]
		return true
	end,
	addListener = function(_, _) --[[ line: 44 ]]
		return { remove = function() --[[ line: 46 ]] end }
	end
}

return function(p0, p1, p2) --[[ line: 51 | named "wrapWithProviders" ]]
	-- upvalues: roduxModule (ref), reactModule (ref), fFlagEnableDrawerFocusNav (ref), roactNavigationModule (ref), t (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), fFlagSideSheetFocusNav (ref), unibarStyle (ref), reactFocusNavigationModule (ref), var10 (write), provider (ref)
	p2 = p2 or roduxModule.Store.new(function(p3) --[[ line: 52 ]]
		return p3 or {}
	end)
	local var13 = p0
	
	for i, v in p1 do
		var13 = reactModule.createElement(v, nil, var13)
	end
	if fFlagEnableDrawerFocusNav then
		var13 = reactModule.createElement(roactNavigationModule.Provider, { value = t }, var13)
	end
	return reactModule.createElement(roactRoduxModule.StoreProvider, { store = p2 }, {
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
					FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var10 }, {
						Registry = reactModule.createElement(provider, nil, var13)
					})
				}) else reactModule.createElement(unibarStyle.Provider, {}, var13)
			})
		})
	})
end