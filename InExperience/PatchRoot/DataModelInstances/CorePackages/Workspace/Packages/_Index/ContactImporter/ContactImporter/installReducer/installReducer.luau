local DependenciesModule = require(script.Parent.Parent.dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local ContactsModule = require(script.Parent.Contacts)
local ShowContactImporterParamsModule = require(script.Parent.ShowContactImporterParams)
local RoduxUserPermissions = DependenciesModule.RoduxUserPermissions

return function() --[[ Line: 11 ]]
	-- upvalues: Rodux (copy), ContactsModule (copy), RoduxUserPermissions (copy), RoduxNetworking (copy), ShowContactImporterParamsModule (copy)
	return Rodux.combineReducers({
		Contacts = ContactsModule,
		UserPermissions = RoduxUserPermissions.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer(),
		ShowContactImporterParams = ShowContactImporterParamsModule
	})
end