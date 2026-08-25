local dependenciesModule = require(script.Parent.Parent.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxUserPermissions = dependenciesModule.RoduxUserPermissions

return function()
	-- upvalues: rodux (ref), roduxUserPermissions (ref), roduxNetworking (ref)
	return rodux.combineReducers({
		UserPermissions = roduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer()
	})
end