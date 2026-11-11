local AppStorageService = game:GetService("AppStorageService")
local ConstantsModule = require(script:FindFirstAncestor("ContactsToast").Common.Constants)
local EngineFeature = game:GetEngineFeature(ConstantsModule.ENGINE_FEATURE_STORAGE_KEY)

return {
	AddUser = function(_, p1)
		-- upvalues: EngineFeature (copy), AppStorageService (copy), ConstantsModule (copy)
		if not EngineFeature then return end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), ConstantsModule (upval)
			return AppStorageService:GetItem(ConstantsModule.TOAST_SEEN_STORAGE_KEY)
		end)
		
		if Success then
			local config = { [1] = p1 }
			
			if Result ~= nil and Result ~= "" then
				local Count = #config + 1
				
				for i in string.gmatch(Result, "([^,]+)") do
					if i == p1 then return end
					config[Count] = i
					Count += 1
				end
			end
			local S = table.concat(config, ","):gsub("%s+", "")
			pcall(function()
				-- upvalues: AppStorageService (upval), ConstantsModule (upval), S (ref)
				AppStorageService:SetItem(ConstantsModule.TOAST_SEEN_STORAGE_KEY, S)
				AppStorageService:Flush()
			end)
		end
	end,
	CheckUserHasNotSeen = function(_, p2): boolean
		-- upvalues: EngineFeature (copy), AppStorageService (copy), ConstantsModule (copy)
		if not EngineFeature then
			return false
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), ConstantsModule (upval)
			return AppStorageService:GetItem(ConstantsModule.TOAST_SEEN_STORAGE_KEY)
		end)
		
		if Success then
			for i in string.gmatch(Result or "", "([^,]+)") do
				if p2 == i then
					return false
				end
			end
		end
		return true
	end,
	CheckUserHasNotOptedIn = function(_, p3): boolean
		-- upvalues: EngineFeature (copy), AppStorageService (copy), ConstantsModule (copy)
		if not EngineFeature then
			return false
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), ConstantsModule (upval)
			return AppStorageService:GetItem(ConstantsModule.OPTED_IN_USERS_STORAGE_KEY)
		end)
		
		if Success then
			for i in string.gmatch(Result or "", "([^,]+)") do
				if p3 == i then
					return false
				end
			end
		end
		return true
	end
}