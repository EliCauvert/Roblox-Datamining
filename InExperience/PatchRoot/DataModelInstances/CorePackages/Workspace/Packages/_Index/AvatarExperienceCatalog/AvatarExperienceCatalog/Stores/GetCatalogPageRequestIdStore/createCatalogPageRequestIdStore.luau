local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref), httpService (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		getPageRequestIdMap = var1,
		getOrCreatePageRequestId = function(p1)
			-- upvalues: var1 (ref), httpService (copy), var2 (ref)
			local var3 = var1(false)
			local var4 = var3[p1]
			
			if var4 == nil then
				local var5 = httpService:GenerateGUID(false)
				local cloned = table.clone(var3)
				cloned[p1] = var5
				var2(cloned)
				
				return var5
			end
			return var4
		end,
		resetPageRequestId = function(value)
			-- upvalues: var1 (ref), var2 (ref)
			local var3 = var1(false)
			
			if var3[value] == nil then return end
			local t = {}
			
			for i, v in var3 do
				if i ~= value then
					t[i] = v
				end
			end
			var2(t)
		end
	}
end