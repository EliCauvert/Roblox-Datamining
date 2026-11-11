local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local CreateStyleProviderFunction = require(Parent.Dev.UnitTestHelpers).createStyleProvider
local config = {
	ScreenSize = Vector2.new(500, 500),
	SetAlias = { Aliases = { byUserId = { ["1"] = "foo" } } }
}

local function v6(p1, p2)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { RoduxModule.thunkMiddleware })
end

return {
	mockServices = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), v6 (copy), config (copy), CreateStyleProviderFunction (copy), RoactServices (copy)
		return (ReactModule.createElement(RoactServices.ServiceProvider, {}, {
			storeProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = v6(config) }, { styleProvider = CreateStyleProviderFunction(p1) })
		}))
	end
}