local dependenciesModule = require(script.Parent.Parent.dependencies)
local updateOptedInUsers = dependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local appStorageService = dependenciesModule.AppStorageService

return function(p1, p2)
	-- upvalues: permissionsProtocol (ref), updateOptedInUsers (ref), appStorageService (ref)
	p1:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p3)
		-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), p2 (ref)
		local var1 = p3 and p3.status == permissionsProtocol.Status.AUTHORIZED
		
		if not var1 then
			updateOptedInUsers:clearLocalStorage(appStorageService)
		end
		if p2 then
			p2(var1)
		end
	end):catch(function(_)
		-- upvalues: p2 (ref)
		if p2 then
			p2(false)
		end
	end)
end