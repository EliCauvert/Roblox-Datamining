local ConstantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local EngineFeature = game:GetEngineFeature(ConstantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	getLastOSPermissionSettings = function(_, p1): boolean --[[ Line: 8 ]]
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if EngineFeature then
			local Success, Result = pcall(function() --[[ Line: 14 ]]
				-- upvalues: p1 (copy), ConstantsModule (upval)
				return p1:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS)
			end)
			
			return if Success then Result == "true" else false
		else
			return true
		end
	end,
	updateOSPermissionSettings = function(_, p1, p2) --[[ Line: 25 ]]
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if EngineFeature then
			pcall(function() --[[ Line: 30 ]]
				-- upvalues: p1 (copy), ConstantsModule (upval), p2 (copy)
				p1:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS, (tostring(p2)))
				p1:Flush()
			end)
			
			return
		end
	end
}