local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	getLastOSPermissionSettings = function(_, p0)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return true
		end
		local ok, status = pcall(function()
			-- upvalues: p0 (ref), constantsModule (copy)
			return p0:GetItem(constantsModule.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS)
		end)
		
		return if ok then status == "true" else false
	end,
	updateOSPermissionSettings = function(_, p1, p2)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if universal_app_contact_importer_storage_keysEngineFeature then
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy), p2 (ref)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS, tostring(p2))
				p1:Flush()
			end)
			
			return
		end
	end
}