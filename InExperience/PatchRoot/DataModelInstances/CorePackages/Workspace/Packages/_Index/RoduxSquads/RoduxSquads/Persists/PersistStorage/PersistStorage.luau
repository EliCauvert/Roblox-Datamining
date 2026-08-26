local memStorageService = game:GetService("MemStorageService")
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	return setmetatable({ memStorageKey = p1 }, t)
end

function t.getItem(p1)
	-- upvalues: memStorageService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: memStorageService (copy), p1 (ref), httpService (copy)
		local memStorageKeyItem = memStorageService:GetItem(p1.memStorageKey)
		
		return if memStorageKeyItem and memStorageKeyItem ~= "" then httpService:JSONDecode(memStorageKeyItem) else nil
	end)
	
	return if ok then status else nil
end

function t.setItem(value, p1)
	-- upvalues: memStorageService (ref), httpService (ref)
	local ok, _ = pcall(function()
		-- upvalues: memStorageService (copy), value (ref), p1 (ref), httpService (copy)
		memStorageService:SetItem(value.memStorageKey, if p1 and p1 ~= "" then httpService:JSONEncode(p1) else "")
	end)
	
	return ok
end

function t:bindAndFire(p1)
	-- upvalues: memStorageService (ref), httpService (ref)
	return memStorageService:BindAndFire(self.memStorageKey, function(p2)
		-- upvalues: httpService (copy), p1 (ref)
		local var1 = if p2 and p2 ~= "" then httpService:JSONDecode(p2) else nil
		
		if p1 then
			p1(var1)
		end
	end)
end

return t