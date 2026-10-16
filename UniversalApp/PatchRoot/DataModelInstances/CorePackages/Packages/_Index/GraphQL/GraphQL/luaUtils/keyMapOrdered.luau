local Map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyMapOrdered = function(p1, Callback) --[[ Line: 37 ]]
		-- upvalues: Map (copy)
		local NewMap = Map.new()
		
		for i = 1, #p1 do
			local v1 = p1[i]
			NewMap:set(Callback(v1), v1)
		end
		return NewMap
	end
}