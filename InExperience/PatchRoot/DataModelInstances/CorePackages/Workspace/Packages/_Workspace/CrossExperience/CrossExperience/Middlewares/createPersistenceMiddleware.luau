local memStorageService = game:GetService("MemStorageService")
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: memStorageService (ref), httpService (ref)
	local t = {
		persist = function(_, p2)
			-- upvalues: memStorageService (copy), p1 (ref), httpService (copy)
			local ok, _ = pcall(function()
				-- upvalues: memStorageService (copy), p1 (copy), httpService (copy), p2 (ref)
				memStorageService:SetItem(p1.storeKey, httpService:JSONEncode(p2))
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to update the store", p1.storeKey)
			end
			return ok
		end,
		restore = function()
			-- upvalues: memStorageService (copy), p1 (ref), httpService (copy)
			local ok, status = pcall(function()
				-- upvalues: memStorageService (copy), p1 (copy), httpService (copy)
				local storeKeyItem = memStorageService:GetItem(p1.storeKey)
				
				return if storeKeyItem and storeKeyItem ~= "" then httpService:JSONDecode(storeKeyItem) else nil
			end)
			
			return if ok then status else nil
		end,
		clean = function()
			-- upvalues: memStorageService (copy), p1 (ref)
			local ok, _ = pcall(function()
				-- upvalues: memStorageService (copy), p1 (copy)
				memStorageService:SetItem(p1.storeKey, "")
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to clean the store", p1.storeKey)
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
			
			return function(p4)
				-- upvalues: p2 (ref)
				return p2(p4)
			end
		end
	end
	
	return t
end