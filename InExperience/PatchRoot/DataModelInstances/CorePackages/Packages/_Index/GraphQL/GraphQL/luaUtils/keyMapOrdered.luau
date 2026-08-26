local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyMapOrdered = function(p1, p2)
		-- upvalues: map (ref)
		local var1 = map.new()
		
		for i = 1, #p1 do
			local var2 = p1[i]
			var1:set(p2(var2), var2)
		end
		return var1
	end
}