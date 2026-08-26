local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local appStyleProvider = require(parent.Style).AppStyleProvider
local t = {
	themeName = colorMode.Dark,
	fontName = require(parent.Style).Constants.FontName.Gotham,
	Tokens = { Global = { Size_350 = 28, Size_500 = 40 } }
}
local t_1 = {
	ScreenSize = Vector2.new(500, 500),
	SetAlias = { Aliases = { byUserId = { ["1"] = "foo" } } }
}

local var1 = function(p1, p2)
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { roduxModule.thunkMiddleware })
end

local var2 = localization.new("en-us")

return {
	mockServices = function(p1)
		-- upvalues: reactModule (ref), roactRoduxModule (ref), var1 (ref), t_1 (ref), foundationProvider (ref), colorMode (ref), appStyleProvider (ref), t (ref), localizationProvider (ref), var2 (ref), roactServices (ref)
		return reactModule.createElement(roactServices.ServiceProvider, {}, {
			storeProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var1(t_1) }, {
				foundationProvider = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
					styleProvider = reactModule.createElement(appStyleProvider, { style = t }, {
						localizationProvider = reactModule.createElement(localizationProvider, { localization = var2 }, p1)
					})
				})
			})
		})
	end
}