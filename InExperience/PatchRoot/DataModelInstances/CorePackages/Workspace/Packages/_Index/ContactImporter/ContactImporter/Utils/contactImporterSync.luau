local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)
local getFIntContactImporterSyncMinHoursModule = require(script.Parent.Parent.Flags.getFIntContactImporterSyncMinHours)

return {
	updateSyncTimestamp = function(_, p1, p2, p3)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			return p1:GetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if ok then
			local var1 = ""
			
			if status == "" then
				var1 = p2 .. ":" .. tostring(p3)
			else
				local var2 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var3 = parts[1]
					local var4 = tonumber(parts[2]) or 0
					
					if var3 == p2 then
						var2 = true
						var4 = p3
					end
					local text = var3 .. ":" .. tostring(var4)
					var1 = if var1 ~= "" then text else var1 .. "," .. text
				end
				if not var2 then
					var1 ..= "," .. p1 .. ":" .. tostring(p3)
				end
			end
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy), var1 (write)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC, var1)
				p1:Flush()
			end)
		end
	end,
	shouldSyncContacts = function(_, p4, p5, p6)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref), getFIntContactImporterSyncMinHoursModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return true
		end
		local ok, status = pcall(function()
			-- upvalues: p4 (ref), constantsModule (copy)
			return p4:GetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if not ok then
			return true
		end
		local parts
		local var5 = 0
		
		for i in string.gmatch(status or "", "([^,]+)") do
			parts = string.split(i, ":")
			
			if parts[1] == p5 then
				var5 = tonumber(parts[2])
				break
			end
		end
		return getFIntContactImporterSyncMinHoursModule() * 3600000 <= p6 - var5
	end
}