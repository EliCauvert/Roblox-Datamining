local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyValMap = function(p0, p1, p2)
		-- upvalues: map (ref)
		local var0 = map.new()
		
		for i, v in ipairs(p0) do
			var0:set(p1(v), p2(v))
		end
		return var0
	end
}