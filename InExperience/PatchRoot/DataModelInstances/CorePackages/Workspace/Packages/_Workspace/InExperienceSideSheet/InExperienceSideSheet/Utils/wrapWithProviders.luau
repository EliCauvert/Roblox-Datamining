local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local chromeModule = require(parent.Chrome)
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local constants = require(parent.UIBlox).App.Style.Constants
local uiModeStyleProvider = require(parent.Style).UiModeStyleProvider
local unibarStyle = chromeModule.UnibarStyle

return function(p0, p1, p2) --[[ line: 19 | named "wrapWithProviders" ]]
	-- upvalues: roduxModule (ref), reactModule (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), uiModeStyleProvider (ref), constants (ref), unibarStyle (ref)
	p2 = p2 or roduxModule.Store.new(function(p3) --[[ line: 20 ]]
		return p3 or {}
	end)
	local var6 = p0
	
	for i, v in p1 do
		var6 = reactModule.createElement(v, nil, var6)
	end
	return reactModule.createElement(roactRoduxModule.StoreProvider, { store = p2 }, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			UiModeStyleProvider = reactModule.createElement(uiModeStyleProvider, {
				style = {
					themeName = constants.ThemeName.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				UnibarStyleProvider = reactModule.createElement(unibarStyle.Provider, {}, var6)
			})
		})
	})
end