local appStorageService = game:GetService("AppStorageService")
local constantsModule = require(script:FindFirstAncestor("ContactsToast").Common.Constants)
local engine_feature_storage_keyEngineFeature = game:GetEngineFeature(constantsModule.ENGINE_FEATURE_STORAGE_KEY)

return {
	AddUser = function(_, p0) --[[ line: 8 ]]
		-- upvalues: engine_feature_storage_keyEngineFeature (ref), appStorageService (ref), constantsModule (ref)
		if not engine_feature_storage_keyEngineFeature then return end
		local ok, status = pcall(function() --[[ line: 13 ]]
			-- upvalues: appStorageService (copy), constantsModule (copy)
			return appStorageService:GetItem(constantsModule.TOAST_SEEN_STORAGE_KEY)
		end)
		
		if ok then
			local t = { [1] = p0 }
			
			if status ~= nil and status ~= "" then
				local var4 = #t + 1
				
				for i in string.gmatch(status, "([^,]+)") do
					if i ~= p0 then
						t[var4] = i
						var4 += 1
						continue
					end
					return
				end
			end
			local var5 = table.concat(t, ","):gsub("%s+", "")
			pcall(function() --[[ line: 32 ]]
				-- upvalues: appStorageService (copy), constantsModule (copy), var5 (write)
				appStorageService:SetItem(constantsModule.TOAST_SEEN_STORAGE_KEY, var5)
				appStorageService:Flush()
			end)
		end
	end,
	CheckUserHasNotSeen = function(_, p1) --[[ line: 39 ]]
		-- upvalues: engine_feature_storage_keyEngineFeature (ref), appStorageService (ref), constantsModule (ref)
		if not engine_feature_storage_keyEngineFeature then
			return false
		end
		local ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: appStorageService (copy), constantsModule (copy)
			return appStorageService:GetItem(constantsModule.TOAST_SEEN_STORAGE_KEY)
		end)
		
		if ok then
			for i in string.gmatch(status or "", "([^,]+)") do
				if p1 == i then
					return false
				end
			end
		end
		return true
	end,
	CheckUserHasNotOptedIn = function(_, p2) --[[ line: 58 ]]
		-- upvalues: engine_feature_storage_keyEngineFeature (ref), appStorageService (ref), constantsModule (ref)
		if not engine_feature_storage_keyEngineFeature then
			return false
		end
		local ok, status = pcall(function() --[[ line: 63 ]]
			-- upvalues: appStorageService (copy), constantsModule (copy)
			return appStorageService:GetItem(constantsModule.OPTED_IN_USERS_STORAGE_KEY)
		end)
		
		if ok then
			for i in string.gmatch(status or "", "([^,]+)") do
				if p2 == i then
					return false
				end
			end
		end
		return true
	end
}