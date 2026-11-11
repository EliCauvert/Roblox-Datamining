local DependenciesModule = require(script.Parent.Parent.dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local RoduxAliases = DependenciesModule.RoduxAliases

return function()
	-- upvalues: Rodux (copy), RoduxAliases (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		Aliases = RoduxAliases.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer()
	})
end