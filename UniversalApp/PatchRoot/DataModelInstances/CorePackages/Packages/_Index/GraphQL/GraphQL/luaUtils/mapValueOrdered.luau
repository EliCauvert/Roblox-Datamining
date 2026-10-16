local Map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	mapValueOrdered = function(List, Callback) --[[ Line: 17 ]]
		-- upvalues: Map (copy)
		local NewMap = Map.new()
		
		for _, value in List do
			local v1 = value[1]
			NewMap:set(v1, Callback(value[2], v1))
		end
		return NewMap
	end
}