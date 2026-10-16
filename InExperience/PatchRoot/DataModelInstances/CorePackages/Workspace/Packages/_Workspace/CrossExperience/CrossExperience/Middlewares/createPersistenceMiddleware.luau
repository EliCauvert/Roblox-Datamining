local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 8 ]]
	-- upvalues: MemStorageService (copy), HttpService (copy)
	local config = {
		persist = function(_, Input) --[[ Line: 10 ]]
			-- upvalues: MemStorageService (upval), p1 (copy), HttpService (upval)
			local Success, _ = pcall(function() --[[ Line: 11 ]]
				-- upvalues: MemStorageService (upval), p1 (upval), HttpService (upval), Input (copy)
				MemStorageService:SetItem(p1.storeKey, HttpService:JSONEncode(Input))
			end)
			
			if not Success then
				print("PersistenceMiddleware - failed to update the store", p1.storeKey)
			end
			return Success
		end,
		restore = function() --[[ Line: 19 ]]
			-- upvalues: MemStorageService (upval), p1 (copy), HttpService (upval)
			local Success, Result = pcall(function() --[[ Line: 20 ]]
				-- upvalues: MemStorageService (upval), p1 (upval), HttpService (upval)
				local Item = MemStorageService:GetItem(p1.storeKey)
				
				return if Item and Item ~= "" then HttpService:JSONDecode(Item) else nil
			end)
			
			return if Success then Result else nil
		end,
		clean = function() --[[ Line: 32 ]]
			-- upvalues: MemStorageService (upval), p1 (copy)
			local Success, _ = pcall(function() --[[ Line: 33 ]]
				-- upvalues: MemStorageService (upval), p1 (upval)
				MemStorageService:SetItem(p1.storeKey, "")
			end)
			
			if not Success then
				print("PersistenceMiddleware - failed to clean the store", p1.storeKey)
			end
			return Success
		end
	}
	
	function config:getMiddleware() --[[ Line: 43 ]]
		-- upvalues: config (copy)
		return function(Callback, p2) --[[ Line: 44 ]]
			-- upvalues: config (upval)
			p2.changed:connect(function(Value, _) --[[ Line: 47 ]]
				-- upvalues: config (upval), p2 (copy)
				config.persist(p2, Value)
			end)
			
			return function(p3) --[[ Line: 50 ]]
				-- upvalues: Callback (copy)
				return Callback(p3)
			end
		end
	end
	
	return config
end