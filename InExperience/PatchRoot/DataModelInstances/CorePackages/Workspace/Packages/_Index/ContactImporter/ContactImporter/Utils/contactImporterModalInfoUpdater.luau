local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	addSeenCount = function(_, p0, p1)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p0 (ref), constantsModule (copy)
			return p0:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if ok then
			local var2 = ""
			
			if status == "" then
				var2 = p1 .. ":" .. "1"
			else
				local var3 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var5 = parts[1]
					local var6 = tonumber(parts[2]) or 0
					
					if var5 == p1 then
						var3 = true
						var6 += 1
					end
					local text = var5 .. ":" .. tostring(var6)
					var2 = if var2 ~= "" then text else var2 .. "," .. text
				end
				if not var3 then
					var2 ..= "," .. p1 .. ":" .. "1"
				end
			end
			pcall(function()
				-- upvalues: p0 (ref), constantsModule (copy), var2 (write)
				p0:SetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT, var2)
				p0:Flush()
			end)
		end
	end,
	updateTimestamp = function(_, p2, p3, p4)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p2 (ref), constantsModule (copy)
			return p2:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if ok then
			local var8 = ""
			
			if status == "" then
				var8 = p3 .. ":" .. tostring(p4)
			else
				local var9 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var11 = parts[1]
					local var12 = parts[2]
					
					if var11 == p3 then
						var12 = tostring(p4)
						var9 = true
					end
					local text = var11 .. ":" .. tostring(var12)
					var8 = if var8 ~= "" then text else var8 .. "," .. text
				end
				if not var9 then
					var8 ..= "," .. p3 .. ":" .. tostring(p4)
				end
			end
			pcall(function()
				-- upvalues: p2 (ref), constantsModule (copy), var8 (write)
				p2:SetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP, var8)
				p2:Flush()
			end)
		end
	end
}