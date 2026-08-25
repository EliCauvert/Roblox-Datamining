local memStorageService = game:GetService("MemStorageService")
local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: memStorageService (ref), httpService (ref)
	local t = {
		persist = function(_, p1)
			-- upvalues: memStorageService (copy), p0 (ref), httpService (copy)
			local ok, _ = pcall(function()
				-- upvalues: memStorageService (copy), p0 (copy), httpService (copy), p1 (ref)
				memStorageService:SetItem(p0.storeKey, httpService:JSONEncode(p1))
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to update the store", p0.storeKey)
			end
			return ok
		end,
		restore = function()
			-- upvalues: memStorageService (copy), p0 (ref), httpService (copy)
			local ok, status = pcall(function()
				-- upvalues: memStorageService (copy), p0 (copy), httpService (copy)
				local storeKeyItem = memStorageService:GetItem(p0.storeKey)
				
				return if storeKeyItem and storeKeyItem ~= "" then httpService:JSONDecode(storeKeyItem) else nil
			end)
			
			return if ok then status else nil
		end,
		clean = function()
			-- upvalues: memStorageService (copy), p0 (ref)
			local ok, _ = pcall(function()
				-- upvalues: memStorageService (copy), p0 (copy)
				memStorageService:SetItem(p0.storeKey, "")
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to clean the store", p0.storeKey)
			end
			return ok
		end
	}
	
	function t.getMiddleware(_)
		-- upvalues: t (ref)
		return function(p2, p3)
			-- upvalues: t (copy)
			p3.changed:connect(function(p4, _)
				-- upvalues: t (copy), p3 (ref)
				t.persist(p3, p4)
			end)
			
			return function(p5)
				-- upvalues: p2 (ref)
				return p2(p5)
			end
		end
	end
	
	return t
end