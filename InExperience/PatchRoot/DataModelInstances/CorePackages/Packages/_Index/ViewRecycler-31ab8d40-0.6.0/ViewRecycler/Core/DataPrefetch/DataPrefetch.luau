local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)

return table.freeze({
	Edge = table.freeze({ Start = "start", End = "end" }),
	resolve = function(p1)
		local var1 = p1 ~= nil and ((if p1 ~= nil then p1.startItems else nil) or 0)
		local var2 = p1 ~= nil and ((if p1 ~= nil then p1.endItems else nil) or 0)
		assert(var1 >= 0 and var1 % 1 == 0, "DataPrefetch: startItems must be a non-negative integer")
		assert(var2 >= 0 and var2 % 1 == 0, "DataPrefetch: endItems must be a non-negative integer")
		
		return { startItems = var1, endItems = var2 }
	end
})