local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyValMap = function(p1, p2, p3)
		-- upvalues: map (ref)
		local var1 = map.new()
		
		for i, v in ipairs(p1) do
			var1:set(p2(v), p3(v))
		end
		return var1
	end
}