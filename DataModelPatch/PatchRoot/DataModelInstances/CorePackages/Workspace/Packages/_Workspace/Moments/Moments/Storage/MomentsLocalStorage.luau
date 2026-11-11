local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

local function get()
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, "MomentsLocalStorage")
	
	if Success and Result ~= "" then
		local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
		
		return if Success1 and typeof(Result1) == "table" then Result1 else {}
	else
		return {}
	end
end

return {
	get = get,
	set = function(p1)
		-- upvalues: AppStorageService (copy), HttpService (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval), HttpService (upval), p1 (copy)
			AppStorageService:SetItem("MomentsLocalStorage", HttpService:JSONEncode(p1))
			AppStorageService:Flush()
		end)
	end,
	getField = function(p1)
		-- upvalues: get (copy)
		return get()[p1]
	end,
	setField = function(Key, p1)
		-- upvalues: get (copy), AppStorageService (copy), HttpService (copy)
		local GetResult = get()
		GetResult[Key] = p1
		pcall(function()
			-- upvalues: AppStorageService (upval), HttpService (upval), GetResult (copy)
			AppStorageService:SetItem("MomentsLocalStorage", HttpService:JSONEncode(GetResult))
			AppStorageService:Flush()
		end)
	end
}