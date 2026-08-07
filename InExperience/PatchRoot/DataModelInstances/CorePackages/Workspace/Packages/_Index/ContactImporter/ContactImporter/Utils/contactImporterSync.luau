local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)
local getFIntContactImporterSyncMinHoursModule = require(script.Parent.Parent.Flags.getFIntContactImporterSyncMinHours)

return {
	updateSyncTimestamp = function(_, p0, p1, p2) --[[ line: 11 ]]
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function() --[[ line: 15 ]]
			-- upvalues: p0 (ref), constantsModule (copy)
			return p0:GetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if ok then
			local var3 = ""
			
			if status == "" then
				var3 = p1 .. ":" .. tostring(p2)
			else
				local var4 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var6 = parts[1]
					local var7 = tonumber(parts[2]) or 0
					
					if var6 == p1 then
						var4 = true
						var7 = p2
					end
					local text = var6 .. ":" .. tostring(var7)
					var3 = if var3 ~= "" then text else var3 .. "," .. text
				end
				if not var4 then
					var3 ..= "," .. p1 .. ":" .. tostring(p2)
				end
			end
			pcall(function() --[[ line: 46 ]]
				-- upvalues: p0 (ref), constantsModule (copy), var3 (write)
				p0:SetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC, var3)
				p0:Flush()
			end)
		end
	end,
	shouldSyncContacts = function(_, p3, p4, p5) --[[ line: 53 ]]
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref), getFIntContactImporterSyncMinHoursModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then
			return true
		end
		local ok, status = pcall(function() --[[ line: 57 ]]
			-- upvalues: p3 (ref), constantsModule (copy)
			return p3:GetItem(constantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if not ok then
			return true
		end
		local parts
		local var9 = 0
		
		for i in string.gmatch(status or "", "([^,]+)") do
			parts = string.split(i, ":")
			
			if parts[1] == p4 then
				var9 = tonumber(parts[2])
				break
			end
		end
		return getFIntContactImporterSyncMinHoursModule() * 3600000 <= p5 - var9
	end
}