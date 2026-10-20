local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local AppStorageService = DependenciesModule.AppStorageService
local UseDispatchFunction = DependenciesModule.useDispatch
local UseSelectorFunction = DependenciesModule.useSelector
local UseEffectOnceFunction = DependenciesModule.useEffectOnce
local FetchContactImporterParamsModule = require(Parent.Networking.FetchContactImporterParams)
local PermissionsProtocol = DependenciesModule.PermissionsProtocol
local UseContactImporterConfigurationModule = require(script.Parent.useContactImporterConfiguration)

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseDispatchFunction (copy), FetchContactImporterParamsModule (copy), PermissionsProtocol (copy), AppStorageService (copy), UseContactImporterConfigurationModule (copy), UseEffectOnceFunction (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseDispatchResult = UseDispatchFunction()
	UseEffectOnceFunction(function()
		-- upvalues: UseDispatchResult (copy), FetchContactImporterParamsModule (upval), UseSelectorResult (copy), PermissionsProtocol (upval), AppStorageService (upval)
		UseDispatchResult(FetchContactImporterParamsModule(UseSelectorResult, PermissionsProtocol.default, AppStorageService))
	end, UseContactImporterConfigurationModule(p1).shouldFetchContactImporterData and (UseSelectorResult and (UseSelectorResult ~= "" and UseSelectorResult ~= "0")))
end