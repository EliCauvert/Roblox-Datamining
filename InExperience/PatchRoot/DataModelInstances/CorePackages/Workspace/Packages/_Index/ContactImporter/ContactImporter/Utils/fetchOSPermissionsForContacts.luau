local dependenciesModule = require(script.Parent.Parent.dependencies)
local updateOptedInUsers = dependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local appStorageService = dependenciesModule.AppStorageService

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: permissionsProtocol (ref), updateOptedInUsers (ref), appStorageService (ref)
	p0:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p2) --[[ line: 13 ]]
		-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), p1 (ref)
		local var1 = p2 and p2.status == permissionsProtocol.Status.AUTHORIZED
		
		if not var1 then
			updateOptedInUsers:clearLocalStorage(appStorageService)
		end
		if p1 then
			p1(var1)
		end
	end):catch(function(_) --[[ line: 24 ]]
		-- upvalues: p1 (ref)
		if p1 then
			p1(false)
		end
	end)
end