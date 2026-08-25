local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyMapOrdered = function(p0, p1)
		-- upvalues: map (ref)
		local var0 = map.new()
		
		for i = 1, #p0 do
			local var1 = p0[i]
			var0:set(p1(var1), var1)
		end
		return var0
	end
}