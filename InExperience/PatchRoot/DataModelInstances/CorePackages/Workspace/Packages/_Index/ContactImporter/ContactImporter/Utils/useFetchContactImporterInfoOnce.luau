local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local appStorageService = dependenciesModule.AppStorageService
local useDispatch = dependenciesModule.useDispatch
local useSelector = dependenciesModule.useSelector
local useEffectOnce = dependenciesModule.useEffectOnce
local fetchContactImporterParamsModule = require(parent.Networking.FetchContactImporterParams)
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local useContactImporterConfigurationModule = require(script.Parent.useContactImporterConfiguration)

return function(p0)
	-- upvalues: useSelector (ref), useDispatch (ref), fetchContactImporterParamsModule (ref), permissionsProtocol (ref), appStorageService (ref), useContactImporterConfigurationModule (ref), useEffectOnce (ref)
	local var3 = useSelector(function(p1)
		return p1.LocalUserId
	end)
	local var4 = useDispatch()
	useEffectOnce(function()
		-- upvalues: var4 (ref), fetchContactImporterParamsModule (copy), var3 (ref), permissionsProtocol (copy), appStorageService (copy)
		var4(fetchContactImporterParamsModule(var3, permissionsProtocol.default, appStorageService))
	end, if useContactImporterConfigurationModule(p0).shouldFetchContactImporterData then var3 and (var3 ~= "" and var3 ~= "0") else useContactImporterConfigurationModule(p0).shouldFetchContactImporterData)
end