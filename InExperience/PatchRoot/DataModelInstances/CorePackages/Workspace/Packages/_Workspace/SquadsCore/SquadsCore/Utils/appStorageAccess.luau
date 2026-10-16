local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return {
	getTableAppStorageKey = function(Key) --[[ Line: 4 ]]
		-- upvalues: AppStorageService (copy), HttpService (copy)
		local Success, Result = pcall(function() --[[ Line: 5 ]]
			-- upvalues: AppStorageService (upval), Key (copy)
			return AppStorageService:GetItem(Key)
		end)
		
		return if Success and Result ~= nil then HttpService:JSONDecode(Result) else {}
	end,
	setTableAppStorageKey = function(Key, p1) --[[ Line: 16 ]]
		-- upvalues: AppStorageService (copy)
		pcall(function() --[[ Line: 17 ]]
			-- upvalues: AppStorageService (upval), Key (copy), p1 (copy)
			AppStorageService:SetItem(Key, (tostring(p1)))
			AppStorageService:Flush()
		end)
	end
}