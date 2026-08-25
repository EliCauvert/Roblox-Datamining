local roactRoduxModule = require(script:FindFirstAncestor("Packages").Dev.RoactRodux)
local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local roact = dependenciesModule.Roact
local rodux = dependenciesModule.Rodux
local mockStyleModule = require(script.Parent.mockStyle)
local mockNavigationModule = require(script.Parent.mockNavigation)
local var4 = rodux.Store.new(function()
	return {}
end, {}, { rodux.thunkMiddleware })

return function(p0, p1)
	-- upvalues: var4 (ref), mockNavigationModule (ref), mockStyleModule (ref), roact (ref), roactRoduxModule (ref)
	p1 = p1 or {}
	
	return roact.createElement(roactRoduxModule.StoreProvider, { store = p1.store or var4 }, {
		children = mockStyleModule((p1.mockNavigation or mockNavigationModule)(p0))
	})
end