local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local appStorageService = dependenciesModule.AppStorageService
local useDispatch = dependenciesModule.useDispatch
local useSelector = dependenciesModule.useSelector
local useEffectOnce = dependenciesModule.useEffectOnce
local fetchContactImporterParamsModule = require(parent.Networking.FetchContactImporterParams)
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local useContactImporterConfigurationModule = require(script.Parent.useContactImporterConfiguration)

return function(p1)
	-- upvalues: useSelector (ref), useDispatch (ref), fetchContactImporterParamsModule (ref), permissionsProtocol (ref), appStorageService (ref), useContactImporterConfigurationModule (ref), useEffectOnce (ref)
	local var1 = useSelector(function(p2)
		return p2.LocalUserId
	end)
	local var2 = useDispatch()
	useEffectOnce(function()
		-- upvalues: var2 (ref), fetchContactImporterParamsModule (copy), var1 (ref), permissionsProtocol (copy), appStorageService (copy)
		var2(fetchContactImporterParamsModule(var1, permissionsProtocol.default, appStorageService))
	end, if useContactImporterConfigurationModule(p1).shouldFetchContactImporterData then var1 and (var1 ~= "" and var1 ~= "0") else useContactImporterConfigurationModule(p1).shouldFetchContactImporterData)
end