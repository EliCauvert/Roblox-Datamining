local appStorageService = game:GetService("AppStorageService")
local dEV = _G.__DEV__ or false
local t = {}

return {
	getItem = function(p0, p1) --[[ line: 25 ]]
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p1 then
			return t[p0] or ""
		end
		local ok, status = pcall(function() --[[ line: 30 ]]
			-- upvalues: appStorageService (copy), p0 (ref)
			return appStorageService:GetItem(p0)
		end)
		
		return if ok then status else t[p0] or ""
	end,
	setItem = function(value, p2, p3) --[[ line: 42 ]]
		-- upvalues: dEV (ref), t (write), appStorageService (ref)
		if dEV or p3 then
			t[value] = p2
			
			return
		elseif not pcall(function() --[[ line: 48 ]]
			-- upvalues: appStorageService (copy), value (ref), p2 (ref)
			appStorageService:SetItem(value, p2)
		end) then
			t[value] = p2
		end
	end,
	flush = function() --[[ line: 56 ]]
		-- upvalues: appStorageService (ref)
		pcall(function() --[[ line: 57 ]]
			-- upvalues: appStorageService (copy)
			appStorageService:Flush()
		end)
	end,
	_resetMemStorageForTesting = function(value) --[[ line: 20 ]]
		-- upvalues: t (write)
		t = value or {}
	end
}