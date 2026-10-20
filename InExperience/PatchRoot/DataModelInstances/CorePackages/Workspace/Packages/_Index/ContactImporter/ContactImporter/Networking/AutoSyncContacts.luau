local Parent = script.Parent.Parent
local NetworkingContacts = require(Parent.dependencies).NetworkingContacts
local ContactImporterSyncModule = require(Parent.Utils.contactImporterSync)
local FormatContactsModule = require(Parent.Utils.formatContacts)
local UploadContactsSourcesModule = require(Parent.Analytics.Enums.UploadContactsSources)
local PermissionsProtocol = require(Parent.Parent.PermissionsProtocol).PermissionsProtocol
local Default = PermissionsProtocol.default
local list = { PermissionsProtocol.Permissions.CONTACTS_ACCESS }

return function(p1, p2, p3, p4)
	-- upvalues: Default (copy), list (copy), PermissionsProtocol (copy), ContactImporterSyncModule (copy), FormatContactsModule (copy), UploadContactsSourcesModule (copy), NetworkingContacts (copy)
	return function(p5)
		-- upvalues: Default (upval), list (upval), PermissionsProtocol (upval), ContactImporterSyncModule (upval), p3 (copy), p1 (copy), p4 (copy), p2 (copy), FormatContactsModule (upval), UploadContactsSourcesModule (upval), NetworkingContacts (upval)
		Default:hasPermissions(list):andThen(function(Result)
			-- upvalues: PermissionsProtocol (upval), ContactImporterSyncModule (upval), p3 (upval), p1 (upval), p4 (upval), p2 (upval), FormatContactsModule (upval), UploadContactsSourcesModule (upval), p5 (copy), NetworkingContacts (upval)
			if Result and Result.status == PermissionsProtocol.Status.AUTHORIZED then
				local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
				local ShouldSyncContacts = ContactImporterSyncModule:shouldSyncContacts(p3, p1, UnixTimestampMillis)
				
				if p4 or ShouldSyncContacts then
					return p2:getContacts():andThen(function(Result)
						-- upvalues: FormatContactsModule (upval), UploadContactsSourcesModule (upval), p5 (upval), NetworkingContacts (upval)
						local FormatContactsModuleResult = FormatContactsModule(Result)
						FormatContactsModuleResult.source = UploadContactsSourcesModule.AutoSync
						
						return p5:dispatch(NetworkingContacts.UploadContactsByUser.API(FormatContactsModuleResult))
					end):andThen(function()
						-- upvalues: ContactImporterSyncModule (upval), p3 (upval), p1 (upval), UnixTimestampMillis (copy)
						return ContactImporterSyncModule:updateSyncTimestamp(p3, p1, UnixTimestampMillis)
					end):catch(function() end)
				end
			end
		end):catch(function() end)
	end
end