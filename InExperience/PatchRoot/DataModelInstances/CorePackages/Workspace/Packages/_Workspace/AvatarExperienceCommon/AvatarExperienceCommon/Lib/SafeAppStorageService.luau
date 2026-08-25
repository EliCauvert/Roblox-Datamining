local appStorageService = game:GetService("AppStorageService")
local dEV = _G.__DEV__ or false
local t = {}

return {
	getItem = function(p0, p1)
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p1 then
			return t[p0] or ""
		end
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p0 (ref)
			return appStorageService:GetItem(p0)
		end)
		
		return if ok then status else t[p0] or ""
	end,
	setItem = function(value, p2, p3)
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p3 then
			t[value] = p2
			
			return
		elseif not pcall(function()
			-- upvalues: appStorageService (copy), value (ref), p2 (ref)
			appStorageService:SetItem(value, p2)
		end) then
			t[value] = p2
		end
	end,
	flush = function()
		-- upvalues: appStorageService (ref)
		pcall(function()
			-- upvalues: appStorageService (copy)
			appStorageService:Flush()
		end)
	end,
	_resetMemStorageForTesting = function(value)
		-- upvalues: t (write)
		t = value or {}
	end
}