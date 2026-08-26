local roactRoduxModule = require(script:FindFirstAncestor("Packages").Dev.RoactRodux)
local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local rodux = dependenciesModule.Rodux
local mockStyleModule = require(script.Parent.mockStyle)
local mockNavigationModule = require(script.Parent.mockNavigation)
local var1 = rodux.Store.new(function()
	return {}
end, {}, { rodux.thunkMiddleware })

return function(p1, p2)
	-- upvalues: var1 (ref), mockNavigationModule (ref), mockStyleModule (ref), roact (ref), roactRoduxModule (ref)
	p2 = p2 or {}
	
	return roact.createElement(roactRoduxModule.StoreProvider, { store = p2.store or var1 }, {
		children = mockStyleModule((p2.mockNavigation or mockNavigationModule)(p1))
	})
end