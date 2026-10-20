local Map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

return {
	keyValMap = function(List, Callback, Callback1)
		-- upvalues: Map (copy)
		local NewMap = Map.new()
		
		for _, value in ipairs(List) do
			NewMap:set(Callback(value), Callback1(value))
		end
		return NewMap
	end
}