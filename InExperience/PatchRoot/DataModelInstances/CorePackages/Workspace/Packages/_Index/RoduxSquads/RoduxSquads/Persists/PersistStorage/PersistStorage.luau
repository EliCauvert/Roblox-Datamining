local memStorageService = game:GetService("MemStorageService")
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	return setmetatable({ memStorageKey = p0 }, t)
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

function t.setItem(value, p2)
	-- upvalues: memStorageService (ref), httpService (ref)
	local ok, _ = pcall(function()
		-- upvalues: memStorageService (copy), value (ref), p2 (ref), httpService (copy)
		memStorageService:SetItem(value.memStorageKey, if p2 and p2 ~= "" then httpService:JSONEncode(p2) else "")
	end)
	
	return ok
end

function t:bindAndFire(p3)
	-- upvalues: memStorageService (ref), httpService (ref)
	return memStorageService:BindAndFire(self.memStorageKey, function(p4)
		-- upvalues: httpService (copy), p3 (ref)
		local var4 = if p4 and p4 ~= "" then httpService:JSONDecode(p4) else nil
		
		if p3 then
			p3(var4)
		end
	end)
end

return t