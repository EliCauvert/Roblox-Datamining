local DependenciesModule = require(script.Parent.Parent.dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local RoduxUserPermissions = DependenciesModule.RoduxUserPermissions

return function()
	-- upvalues: Rodux (copy), RoduxUserPermissions (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		UserPermissions = RoduxUserPermissions.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer()
	})
end