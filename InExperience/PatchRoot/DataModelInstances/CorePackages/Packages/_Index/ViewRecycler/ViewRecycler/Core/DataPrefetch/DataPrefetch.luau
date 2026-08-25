local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)

return table.freeze({
	Edge = table.freeze({ Start = "start", End = "end" }),
	resolve = function(p0)
		local var0 = p0 ~= nil and ((if p0 ~= nil then p0.startItems else nil) or 0)
		local var1 = p0 ~= nil and ((if p0 ~= nil then p0.endItems else nil) or 0)
		assert(var0 >= 0 and var0 % 1 == 0, "DataPrefetch: startItems must be a non-negative integer")
		assert(var1 >= 0 and var1 % 1 == 0, "DataPrefetch: endItems must be a non-negative integer")
		
		return { startItems = var0, endItems = var1 }
	end
})