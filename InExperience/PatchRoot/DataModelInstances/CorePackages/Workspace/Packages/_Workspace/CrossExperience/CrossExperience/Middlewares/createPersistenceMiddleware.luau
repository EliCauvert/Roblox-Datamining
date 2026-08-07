local memStorageService = game:GetService("MemStorageService")
local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 8 ]]
	-- upvalues: memStorageService (ref), httpService (ref)
	local t = {
		persist = function(_, p1) --[[ line: 10 ]]
			-- upvalues: memStorageService (copy), p0 (ref), httpService (copy)
			local ok, _ = pcall(function() --[[ line: 11 ]]
				-- upvalues: memStorageService (copy), p0 (copy), httpService (copy), p1 (ref)
				memStorageService:SetItem(p0.storeKey, httpService:JSONEncode(p1))
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to update the store", p0.storeKey)
			end
			return ok
		end,
		restore = function() --[[ line: 19 ]]
			-- upvalues: memStorageService (copy), p0 (ref), httpService (copy)
			local ok, status = pcall(function() --[[ line: 20 ]]
				-- upvalues: memStorageService (copy), p0 (copy), httpService (copy)
				local storeKeyItem = memStorageService:GetItem(p0.storeKey)
				
				return if storeKeyItem and storeKeyItem ~= "" then httpService:JSONDecode(storeKeyItem) else nil
			end)
			
			return if ok then status else nil
		end,
		clean = function() --[[ line: 32 ]]
			-- upvalues: memStorageService (copy), p0 (ref)
			local ok, _ = pcall(function() --[[ line: 33 ]]
				-- upvalues: memStorageService (copy), p0 (copy)
				memStorageService:SetItem(p0.storeKey, "")
			end)
			
			if not ok then
				print("PersistenceMiddleware - failed to clean the store", p0.storeKey)
			end
			return ok
		end
	}
	
	function t.getMiddleware(_) --[[ line: 43 ]]
		-- upvalues: t (ref)
		return function(p2, p3) --[[ line: 44 ]]
			-- upvalues: t (copy)
			p3.changed:connect(function(p4, _) --[[ line: 47 ]]
				-- upvalues: t (copy), p3 (ref)
				t.persist(p3, p4)
			end)
			
			return function(p5) --[[ line: 50 ]]
				-- upvalues: p2 (ref)
				return p2(p5)
			end
		end
	end
	
	return t
end