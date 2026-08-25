local constantsModule = require(script.Parent.Parent.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	clearLocalStorage = function(_, p0)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if universal_app_contact_importer_storage_keysEngineFeature then
			pcall(function()
				-- upvalues: p0 (ref), constantsModule (copy)
				p0:SetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, "")
				p0:Flush()
			end)
			
			return
		end
	end,
	addUserToLocalStorage = function(_, p1, p2)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if not universal_app_contact_importer_storage_keysEngineFeature then return end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			return p1:GetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS)
		end)
		
		if ok then
			local t = { [1] = p2 }
			
			if status ~= nil and status ~= "" then
				local var3 = #t + 1
				
				for i in string.gmatch(status, "([^,]+)") do
					if i ~= p2 then
						t[var3] = i
						var3 += 1
						continue
					end
					return
				end
			end
			local var4 = table.concat(t, ","):gsub("%s+", "")
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy), var4 (write)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, var4)
				p1:Flush()
			end)
		end
	end
}