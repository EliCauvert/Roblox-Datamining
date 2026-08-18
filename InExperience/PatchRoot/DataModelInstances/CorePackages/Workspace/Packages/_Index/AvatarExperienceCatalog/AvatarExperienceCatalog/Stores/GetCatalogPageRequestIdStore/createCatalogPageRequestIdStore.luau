local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Signals)

return function() --[[ line: 23 | named "createCatalogPageRequestIdStore" ]]
	-- upvalues: signalsModule (ref), httpService (ref)
	local var2, var3 = signalsModule.createSignal({})
	
	return {
		getPageRequestIdMap = var2,
		getOrCreatePageRequestId = function(p0) --[[ line: 26 ]]
			-- upvalues: var2 (ref), httpService (copy), var3 (ref)
			local var4 = var2(false)
			local var5 = var4[p0]
			
			if var5 == nil then
				local var6 = httpService:GenerateGUID(false)
				local cloned = table.clone(var4)
				cloned[p0] = var6
				var3(cloned)
				
				return var6
			end
			return var5
		end,
		resetPageRequestId = function(value) --[[ line: 40 ]]
			-- upvalues: var2 (ref), var3 (ref)
			local var8 = var2(false)
			
			if var8[value] == nil then return end
			local t = {}
			
			for i, v in var8 do
				if i ~= value then
					t[i] = v
				end
			end
			var3(t)
		end
	}
end