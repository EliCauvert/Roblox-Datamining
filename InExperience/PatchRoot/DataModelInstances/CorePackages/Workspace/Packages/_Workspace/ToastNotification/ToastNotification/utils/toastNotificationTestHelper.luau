local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local appStyleProvider = require(parent.Style).AppStyleProvider
local constants = require(parent.Style).Constants
local t = {
	themeName = constants.ThemeName.Dark,
	fontName = constants.FontName.Gotham,
	Tokens = { Global = { Size_350 = 28, Size_500 = 40 } }
}
local t_1 = {
	ScreenSize = Vector2.new(500, 500),
	SetAlias = { Aliases = { byUserId = { ["1"] = "foo" } } }
}

local var6 = function(p0, p1) --[[ line: 42 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(p1 or function(p2) --[[ line: 43 ]]
		return p2
	end, p0 or {}, { roduxModule.thunkMiddleware })
end

local var7 = localization.new("en-us")

return {
	mockServices = function(p3) --[[ line: 52 ]]
		-- upvalues: reactModule (ref), roactRoduxModule (ref), var6 (ref), t_1 (ref), foundationProvider (ref), foundationModule (ref), appStyleProvider (ref), t (ref), localizationProvider (ref), var7 (ref), roactServices (ref)
		return reactModule.createElement(roactServices.ServiceProvider, {}, {
			storeProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var6(t_1) }, {
				foundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
					styleProvider = reactModule.createElement(appStyleProvider, { style = t }, {
						localizationProvider = reactModule.createElement(localizationProvider, { localization = var7 }, p3)
					})
				})
			})
		})
	end
}