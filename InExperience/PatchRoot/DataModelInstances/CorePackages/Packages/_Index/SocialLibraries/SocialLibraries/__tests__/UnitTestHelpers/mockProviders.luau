local RoactRoduxModule = require(script:FindFirstAncestor("Packages").Dev.RoactRodux)
local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local Roact = DependenciesModule.Roact
local Rodux = DependenciesModule.Rodux
local MockStyleModule = require(script.Parent.mockStyle)
local MockNavigationModule = require(script.Parent.mockNavigation)
local NewResult = Rodux.Store.new(function() --[[ Line: 10 ]]
	return {}
end, {}, { Rodux.thunkMiddleware })

return function(p1, p2) --[[ Line: 14 ]]
	-- upvalues: NewResult (copy), MockNavigationModule (copy), MockStyleModule (copy), Roact (copy), RoactRoduxModule (copy)
	local P1 = p2 or {}
	
	return Roact.createElement(RoactRoduxModule.StoreProvider, { store = P1.store or NewResult }, {
		children = MockStyleModule((P1.mockNavigation or MockNavigationModule)(p1))
	})
end