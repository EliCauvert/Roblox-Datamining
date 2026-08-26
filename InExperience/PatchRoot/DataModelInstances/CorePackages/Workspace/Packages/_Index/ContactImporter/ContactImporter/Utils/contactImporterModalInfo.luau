local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local getFIntContactImporterModalDisplayMaxCountModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMaxCount)
local getFIntContactImporterModalDisplayMinDaysModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMinDays)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	isUserOptedInLocalStorage = function(_, p1, p2)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return false
		end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			return p1:GetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS)
		end)
		
		if ok then
			for i in string.gmatch(status or "", "([^,]+)") do
				if p2 == i then
					return true
				end
			end
		end
		return false
	end,
	shouldUserSeeModalPotentiallyAgain = function(_, p3, p4)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref), getFIntContactImporterModalDisplayMaxCountModule (ref), getFIntContactImporterModalDisplayMinDaysModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return true
		end
		local ok, status = pcall(function()
			-- upvalues: p3 (ref), constantsModule (copy)
			return p3:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if not ok then
			return true
		end
		local parts
		local var1 = 0
		
		for i in string.gmatch(status or "", "([^,]+)") do
			parts = string.split(i, ":")
			
			if parts[1] == p4 then
				var1 = tonumber(parts[2]) or 0
				break
			end
		end
		if var1 <= getFIntContactImporterModalDisplayMaxCountModule() then
			return true
		end
		local ok_1, status_1 = pcall(function()
			-- upvalues: p3 (ref), constantsModule (copy)
			return p3:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if not ok_1 then
			return true
		end
		local parts
		local var2 = 0
		
		for i_1 in string.gmatch(status_1 or "", "([^,]+)") do
			parts = string.split(i_1, ":")
			
			if parts[1] == p4 then
				var2 = tonumber(parts[2]) or 0
				break
			end
		end
		return var2 + getFIntContactImporterModalDisplayMinDaysModule() * 86400000 <= DateTime.now().UnixTimestampMillis
	end
}