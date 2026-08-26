local appStorageService = game:GetService("AppStorageService")
local dEV = _G.__DEV__ or false
local t = {}

return {
	getItem = function(p1, p2)
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p2 then
			return t[p1] or ""
		end
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p1 (ref)
			return appStorageService:GetItem(p1)
		end)
		
		return if ok then status else t[p1] or ""
	end,
	setItem = function(value, p1, p2)
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p2 then
			t[value] = p1
			
			return
		elseif not pcall(function()
			-- upvalues: appStorageService (copy), value (ref), p1 (ref)
			appStorageService:SetItem(value, p1)
		end) then
			t[value] = p1
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