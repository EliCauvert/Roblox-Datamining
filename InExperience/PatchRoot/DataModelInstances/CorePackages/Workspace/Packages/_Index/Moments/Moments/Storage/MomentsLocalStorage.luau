local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")

local function get()
	-- upvalues: appStorageService (ref), httpService (ref)
	local ok, status = pcall(appStorageService.GetItem, appStorageService, "MomentsLocalStorage")
	
	if not ok or status == "" then
		return {}
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, status)
	
	return if ok_1 and typeof(status_1) == "table" then status_1 else {}
end

return {
	get = get,
	set = function(value)
		-- upvalues: appStorageService (ref), httpService (ref)
		pcall(function()
			-- upvalues: appStorageService (copy), httpService (copy), value (ref)
			appStorageService:SetItem("MomentsLocalStorage", httpService:JSONEncode(value))
			appStorageService:Flush()
		end)
	end,
	getField = function(p0)
		-- upvalues: get (ref)
		return get()[p0]
	end,
	setField = function(value, p1)
		-- upvalues: get (ref), appStorageService (ref), httpService (ref)
		local var3 = get()
		var3[value] = p1
		pcall(function()
			-- upvalues: appStorageService (copy), httpService (copy), var3 (ref)
			appStorageService:SetItem("MomentsLocalStorage", httpService:JSONEncode(var3))
			appStorageService:Flush()
		end)
	end
}