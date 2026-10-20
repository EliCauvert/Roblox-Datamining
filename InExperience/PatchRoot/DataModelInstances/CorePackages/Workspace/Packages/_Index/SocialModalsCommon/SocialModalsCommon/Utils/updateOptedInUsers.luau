local ConstantsModule = require(script.Parent.Parent.Constants)
local EngineFeature = game:GetEngineFeature(ConstantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	clearLocalStorage = function(_, p1)
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if EngineFeature then
			pcall(function()
				-- upvalues: p1 (copy), ConstantsModule (upval)
				p1:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, "")
				p1:Flush()
			end)
			
			return
		end
	end,
	addUserToLocalStorage = function(_, p1, p2)
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if not EngineFeature then return end
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			return p1:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS)
		end)
		
		if Success then
			local config = { [1] = p2 }
			
			if Result ~= nil and Result ~= "" then
				local Count = #config + 1
				
				for i in string.gmatch(Result, "([^,]+)") do
					if i == p2 then return end
					config[Count] = i
					Count += 1
				end
			end
			local S = table.concat(config, ","):gsub("%s+", "")
			pcall(function()
				-- upvalues: p1 (copy), ConstantsModule (upval), S (ref)
				p1:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_OPTED_IN_USERS, S)
				p1:Flush()
			end)
		end
	end
}