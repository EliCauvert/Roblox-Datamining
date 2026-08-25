local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")

return {
	getTableAppStorageKey = function(p0)
		-- upvalues: appStorageService (ref), httpService (ref)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p0 (ref)
			return appStorageService:GetItem(p0)
		end)
		
		return if ok and status ~= nil then httpService:JSONDecode(status) else {}
	end,
	setTableAppStorageKey = function(value, p1)
		-- upvalues: appStorageService (ref)
		pcall(function()
			-- upvalues: appStorageService (copy), value (ref), p1 (ref)
			appStorageService:SetItem(value, tostring(p1))
			appStorageService:Flush()
		end)
	end
}