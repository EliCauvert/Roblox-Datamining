local AppStorageService = game:GetService("AppStorageService")
local DEV = _G.__DEV__ or false
local t = {}

return {
	getItem = function(Key, p1)
		-- upvalues: DEV (copy), t (ref), AppStorageService (copy)
		if DEV or p1 then
			return t[Key] or ""
		else
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval), Key (copy)
				return AppStorageService:GetItem(Key)
			end)
			
			return if Success then Result else t[Key] or ""
		end
	end,
	setItem = function(Key, Value, p1)
		-- upvalues: DEV (copy), t (ref), AppStorageService (copy)
		if DEV or p1 then
			t[Key] = Value
			
			return
		end
		if not pcall(function()
			-- upvalues: AppStorageService (upval), Key (copy), Value (copy)
			AppStorageService:SetItem(Key, Value)
		end) then
			t[Key] = Value
		end
	end,
	flush = function()
		-- upvalues: AppStorageService (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval)
			AppStorageService:Flush()
		end)
	end,
	_resetMemStorageForTesting = function(p1)
		-- upvalues: t (ref)
		t = p1 or {}
	end
}