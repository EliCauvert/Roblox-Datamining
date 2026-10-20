local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local Constants = require(Parent.Style).Constants
local Style = {
	themeName = Constants.ThemeName.Dark,
	fontName = Constants.FontName.Gotham
}
local config = {
	ScreenSize = Vector2.new(500, 500),
	SetAlias = { Aliases = { byUserId = { ["1"] = "foo" } } }
}

local function v11(p1, p2)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { RoduxModule.thunkMiddleware })
end

return {
	mockServices = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), v11 (copy), config (copy), FoundationProvider (copy), FoundationModule (copy), AppStyleProvider (copy), Style (copy), RoactServices (copy)
		return (ReactModule.createElement(RoactServices.ServiceProvider, {}, {
			storeProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = v11(config) }, {
				foundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
					styleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, p1)
				})
			})
		}))
	end
}