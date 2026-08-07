local dependenciesModule = require(script.Parent.Parent.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxAliases = dependenciesModule.RoduxAliases

return function() --[[ line: 8 ]]
	-- upvalues: rodux (ref), roduxAliases (ref), roduxNetworking (ref)
	return rodux.combineReducers({
		Aliases = roduxAliases.installReducer(),
		NetworkStatus = roduxNetworking.installReducer()
	})
end