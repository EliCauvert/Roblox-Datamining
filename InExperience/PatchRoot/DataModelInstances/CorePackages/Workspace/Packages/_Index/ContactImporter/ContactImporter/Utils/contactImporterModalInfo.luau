local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local getFIntContactImporterModalDisplayMaxCountModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMaxCount)
local getFIntContactImporterModalDisplayMinDaysModule = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMinDays)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	isUserOptedInLocalStorage = function(_, p0, p1)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return false
		end
		local ok, status = pcall(function()
			-- upvalues: p0 (ref), constantsModule (copy)
			return p0:GetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS)
		end)
		
		if ok then
			for i in string.gmatch(status or "", "([^,]+)") do
				if p1 == i then
					return true
				end
			end
		end
		return false
	end,
	shouldUserSeeModalPotentiallyAgain = function(_, p2, p3)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref), getFIntContactImporterModalDisplayMaxCountModule (ref), getFIntContactImporterModalDisplayMinDaysModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return true
		end
		local ok, status = pcall(function()
			-- upvalues: p2 (ref), constantsModule (copy)
			return p2:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if not ok then
			return true
		end
		local parts
		local var4 = 0
		
		for i in string.gmatch(status or "", "([^,]+)") do
			parts = string.split(i, ":")
			
			if parts[1] == p3 then
				var4 = tonumber(parts[2]) or 0
				break
			end
		end
		if var4 <= getFIntContactImporterModalDisplayMaxCountModule() then
			return true
		end
		local ok_1, status_1 = pcall(function()
			-- upvalues: p2 (ref), constantsModule (copy)
			return p2:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if not ok_1 then
			return true
		end
		local parts
		local var5 = 0
		
		for i_1 in string.gmatch(status_1 or "", "([^,]+)") do
			parts = string.split(i_1, ":")
			
			if parts[1] == p3 then
				var5 = tonumber(parts[2]) or 0
				break
			end
		end
		return var5 + getFIntContactImporterModalDisplayMinDaysModule() * 86400000 <= DateTime.now().UnixTimestampMillis
	end
}