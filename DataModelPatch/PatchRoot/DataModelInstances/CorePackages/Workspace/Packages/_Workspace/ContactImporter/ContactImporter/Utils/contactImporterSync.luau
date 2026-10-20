local ConstantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local EngineFeature = game:GetEngineFeature(ConstantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)
local GetFIntContactImporterSyncMinHoursModule = require(script.Parent.Parent.Flags.getFIntContactImporterSyncMinHours)

return {
	updateSyncTimestamp = function(_, p1, Text, p2)
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if not EngineFeature then return end
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			return p1:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if Success then
			local Text1 = ""
			
			if Result == "" then
				Text1 = Text .. ":" .. tostring(p2)
			else
				local Flag = false
				
				for i in string.gmatch(Result or "", "([^,]+)") do
					local Parts = string.split(i, ":")
					local Part = Parts[1]
					local Number: number = tonumber(Parts[2]) or 0
					
					if Part == Text then
						Flag = true
						Number = p2
					end
					local Text2 = Part .. ":" .. tostring(Number)
					
					if Text1 == "" then
						Text1 = Text2
					else
						Text1 ..= "," .. Text2
					end
				end
				if not Flag then
					Text1 ..= "," .. Text .. ":" .. tostring(p2)
				end
			end
			pcall(function()
				-- upvalues: p1 (copy), ConstantsModule (upval), Text1 (ref)
				p1:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC, Text1)
				p1:Flush()
			end)
		end
	end,
	shouldSyncContacts = function(_, p3, p4, p5: number): boolean
		-- upvalues: EngineFeature (copy), ConstantsModule (copy), GetFIntContactImporterSyncMinHoursModule (copy)
		if not EngineFeature then
			return true
		end
		local Success, Result = pcall(function()
			-- upvalues: p3 (copy), ConstantsModule (upval)
			return p3:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_CONTACTS_SYNC)
		end)
		
		if not Success then
			return true
		end
		local Number: number? = 0
		local Parts = nil
		
		for i in string.gmatch(Result or "", "([^,]+)") do
			Parts = string.split(i, ":")
			
			if Parts[1] == p4 then
				Number = tonumber(Parts[2])
				break
			end
		end
		return GetFIntContactImporterSyncMinHoursModule() * 3600000 <= p5 - Number
	end
}