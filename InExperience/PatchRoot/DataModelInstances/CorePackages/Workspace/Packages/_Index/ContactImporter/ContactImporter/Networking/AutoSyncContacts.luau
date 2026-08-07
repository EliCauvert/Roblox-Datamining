local parent = script.Parent.Parent
local parent_1 = parent.Parent
local networkingContacts = require(parent.dependencies).NetworkingContacts
local contactImporterSyncModule = require(parent.Utils.contactImporterSync)
local formatContactsModule = require(parent.Utils.formatContacts)
local uploadContactsSourcesModule = require(parent.Analytics.Enums.UploadContactsSources)
local permissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol
local default = permissionsProtocol.default
local list = { permissionsProtocol.Permissions.CONTACTS_ACCESS }

return function(p0, p1, p2, p3) --[[ line: 14 ]]
	-- upvalues: default (ref), list (ref), permissionsProtocol (ref), contactImporterSyncModule (ref), formatContactsModule (ref), uploadContactsSourcesModule (ref), networkingContacts (ref)
	return function(p4) --[[ line: 15 ]]
		-- upvalues: default (copy), list (copy), permissionsProtocol (copy), contactImporterSyncModule (copy), p2 (ref), p0 (ref), p3 (ref), p1 (ref), formatContactsModule (copy), uploadContactsSourcesModule (copy), networkingContacts (copy)
		default:hasPermissions(list):andThen(function(p5) --[[ line: 18 ]]
			-- upvalues: permissionsProtocol (copy), contactImporterSyncModule (copy), p2 (copy), p0 (copy), p3 (copy), p1 (copy), formatContactsModule (copy), uploadContactsSourcesModule (copy), p4 (ref), networkingContacts (copy)
			if p5 and p5.status == permissionsProtocol.Status.AUTHORIZED then
				local unixTimestampMillis = DateTime.now().UnixTimestampMillis
				
				if p3 or contactImporterSyncModule:shouldSyncContacts(p2, p0, unixTimestampMillis) then
					return p1:getContacts():andThen(function(p6) --[[ line: 27 ]]
						-- upvalues: formatContactsModule (copy), uploadContactsSourcesModule (copy), p4 (copy), networkingContacts (copy)
						local var4 = formatContactsModule(p6)
						var4.source = uploadContactsSourcesModule.AutoSync
						
						return p4:dispatch(networkingContacts.UploadContactsByUser.API(var4))
					end):andThen(function() --[[ line: 32 ]]
						-- upvalues: contactImporterSyncModule (copy), p2 (copy), p0 (copy), unixTimestampMillis (ref)
						return contactImporterSyncModule:updateSyncTimestamp(p2, p0, unixTimestampMillis)
					end):catch(function() --[[ line: 35 ]] end)
				end
			end
		end):catch(function() --[[ line: 39 ]] end)
	end
end