local dependenciesModule = require(script.Parent.Parent.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local contactsModule = require(script.Parent.Contacts)
local showContactImporterParamsModule = require(script.Parent.ShowContactImporterParams)
local roduxUserPermissions = dependenciesModule.RoduxUserPermissions

return function() --[[ line: 11 ]]
	-- upvalues: rodux (ref), contactsModule (ref), roduxUserPermissions (ref), roduxNetworking (ref), showContactImporterParamsModule (ref)
	return rodux.combineReducers({
		Contacts = contactsModule,
		UserPermissions = roduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer(),
		ShowContactImporterParams = showContactImporterParamsModule
	})
end