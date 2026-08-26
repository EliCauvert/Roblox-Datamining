local constantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	addSeenCount = function(_, p1, p2)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			return p1:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if ok then
			local var1 = ""
			
			if status == "" then
				var1 = p2 .. ":" .. "1"
			else
				local var2 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var3 = parts[1]
					local var4 = tonumber(parts[2]) or 0
					
					if var3 == p2 then
						var2 = true
						var4 += 1
					end
					local text = var3 .. ":" .. tostring(var4)
					var1 = if var1 ~= "" then text else var1 .. "," .. text
				end
				if not var2 then
					var1 ..= "," .. p1 .. ":" .. "1"
				end
			end
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy), var1 (write)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT, var1)
				p1:Flush()
			end)
		end
	end,
	updateTimestamp = function(_, p3, p4, p5)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p3 (ref), constantsModule (copy)
			return p3:GetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if ok then
			local var5 = ""
			
			if status == "" then
				var5 = p4 .. ":" .. tostring(p5)
			else
				local var6 = false
				
				for i in string.gmatch(status or "", "([^,]+)") do
					local parts = string.split(i, ":")
					local var7 = parts[1]
					local var8 = parts[2]
					
					if var7 == p4 then
						var8 = tostring(p5)
						var6 = true
					end
					local text = var7 .. ":" .. tostring(var8)
					var5 = if var5 ~= "" then text else var5 .. "," .. text
				end
				if not var6 then
					var5 ..= "," .. p3 .. ":" .. tostring(p5)
				end
			end
			pcall(function()
				-- upvalues: p3 (ref), constantsModule (copy), var5 (write)
				p3:SetItem(constantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP, var5)
				p3:Flush()
			end)
		end
	end
}