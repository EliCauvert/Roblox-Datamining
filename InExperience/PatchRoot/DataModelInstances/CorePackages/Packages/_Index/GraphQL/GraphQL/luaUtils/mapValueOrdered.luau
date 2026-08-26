local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	mapValueOrdered = function(p1, p2)
		-- upvalues: map (ref)
		local var1 = map.new()
		
		for i, v in p1 do
			local var2 = v[1]
			var1:set(var2, p2(v[2], var2))
		end
		return var1
	end
}