local DependenciesModule = require(script.Parent.Parent.dependencies)
local UpdateOptedInUsers = DependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local PermissionsProtocol = DependenciesModule.PermissionsProtocol
local AppStorageService = DependenciesModule.AppStorageService

return function(p1, Callback)
	-- upvalues: PermissionsProtocol (copy), UpdateOptedInUsers (copy), AppStorageService (copy)
	p1:hasPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(Result)
		-- upvalues: PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), Callback (copy)
		local IsStatusMatch: boolean = Result and Result.status == PermissionsProtocol.Status.AUTHORIZED
		
		if not IsStatusMatch then
			UpdateOptedInUsers:clearLocalStorage(AppStorageService)
		end
		if Callback then
			Callback(IsStatusMatch)
		end
	end):catch(function(_)
		-- upvalues: Callback (copy)
		if Callback then
			Callback(false)
		end
	end)
end