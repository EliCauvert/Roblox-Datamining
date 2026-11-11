local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local Constants = require(Parent.Style).Constants
local Style = {
	themeName = Constants.ThemeName.Dark,
	fontName = Constants.FontName.Gotham,
	Tokens = { Global = { Size_350 = 28, Size_500 = 40 } }
}
local config = {
	ScreenSize = Vector2.new(500, 500),
	SetAlias = { Aliases = { byUserId = { ["1"] = "foo" } } }
}

local function v12(p1, p2)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { RoduxModule.thunkMiddleware })
end

local EnUs = require(Parent.RobloxAppLocales).Localization.new("en-us")

return {
	mockServices = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), v12 (copy), config (copy), FoundationProvider (copy), FoundationModule (copy), AppStyleProvider (copy), Style (copy), LocalizationProvider (copy), EnUs (copy), RoactServices (copy)
		return (ReactModule.createElement(RoactServices.ServiceProvider, {}, {
			storeProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = v12(config) }, {
				foundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
					styleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, {
						localizationProvider = ReactModule.createElement(LocalizationProvider, { localization = EnUs }, p1)
					})
				})
			})
		}))
	end
}