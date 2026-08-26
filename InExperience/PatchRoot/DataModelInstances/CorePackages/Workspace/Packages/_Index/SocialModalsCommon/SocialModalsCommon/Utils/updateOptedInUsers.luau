local constantsModule = require(script.Parent.Parent.Constants)
local universal_app_contact_importer_storage_keysEngineFeature = game:GetEngineFeature(constantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	clearLocalStorage = function(_, p1)
		-- upvalues: universal_app_contact_importer_storage_keysEngineFeature (ref), constantsModule (ref)
		if universal_app_contact_importer_storage_keysEngineFeature then
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, "")
				p1:Flush()
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
				local var1 = #t + 1
				
				for i in string.gmatch(status, "([^,]+)") do
					if i ~= p2 then
						t[var1] = i
						var1 += 1
						continue
					end
					return
				end
			end
			local var2 = table.concat(t, ","):gsub("%s+", "")
			pcall(function()
				-- upvalues: p1 (ref), constantsModule (copy), var2 (write)
				p1:SetItem(constantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, var2)
				p1:Flush()
			end)
		end
	end
}