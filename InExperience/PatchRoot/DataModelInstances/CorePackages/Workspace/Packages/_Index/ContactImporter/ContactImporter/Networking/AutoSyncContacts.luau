local parent = script.Parent.Parent
local parent_1 = parent.Parent
local networkingContacts = require(parent.dependencies).NetworkingContacts
local contactImporterSyncModule = require(parent.Utils.contactImporterSync)
local formatContactsModule = require(parent.Utils.formatContacts)
local uploadContactsSourcesModule = require(parent.Analytics.Enums.UploadContactsSources)
local permissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol
local default = permissionsProtocol.default
local list = { permissionsProtocol.Permissions.CONTACTS_ACCESS }

return function(p1, p2, p3, p4)
	-- upvalues: default (ref), list (ref), permissionsProtocol (ref), contactImporterSyncModule (ref), formatContactsModule (ref), uploadContactsSourcesModule (ref), networkingContacts (ref)
	return function(p5)
		-- upvalues: default (copy), list (copy), permissionsProtocol (copy), contactImporterSyncModule (copy), p3 (ref), p1 (ref), p4 (ref), p2 (ref), formatContactsModule (copy), uploadContactsSourcesModule (copy), networkingContacts (copy)
		default:hasPermissions(list):andThen(function(p6)
			-- upvalues: permissionsProtocol (copy), contactImporterSyncModule (copy), p3 (copy), p1 (copy), p4 (copy), p2 (copy), formatContactsModule (copy), uploadContactsSourcesModule (copy), p5 (ref), networkingContacts (copy)
			if p6 and p6.status == permissionsProtocol.Status.AUTHORIZED then
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				
				if p4 or contactImporterSyncModule:shouldSyncContacts(p3, p1, unixTimestampMillis) then
					return p2:getContacts():andThen(function(p7)
						-- upvalues: formatContactsModule (copy), uploadContactsSourcesModule (copy), p5 (copy), networkingContacts (copy)
						local var1 = formatContactsModule(p7)
						var1.source = uploadContactsSourcesModule.AutoSync
						
						return p5:dispatch(networkingContacts.UploadContactsByUser.API(var1))
					end):andThen(function()
						-- upvalues: contactImporterSyncModule (copy), p3 (copy), p1 (copy), unixTimestampMillis (ref)
						return contactImporterSyncModule:updateSyncTimestamp(p3, p1, unixTimestampMillis)
					end):catch(function() end)
				end
			end
		end):catch(function() end)
	end
end