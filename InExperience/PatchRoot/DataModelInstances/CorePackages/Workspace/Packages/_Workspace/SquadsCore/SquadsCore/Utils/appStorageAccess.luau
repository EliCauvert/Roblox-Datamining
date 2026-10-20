local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return {
	getTableAppStorageKey = function(Key)
		-- upvalues: AppStorageService (copy), HttpService (copy)
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), Key (copy)
			return AppStorageService:GetItem(Key)
		end)
		
		return if Success and Result ~= nil then HttpService:JSONDecode(Result) else {}
	end,
	setTableAppStorageKey = function(Key, p1)
		-- upvalues: AppStorageService (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval), Key (copy), p1 (copy)
			AppStorageService:SetItem(Key, (tostring(p1)))
			AppStorageService:Flush()
		end)
	end
}