local symbol = require(script.Parent.Parent.LuauPolyfill).Symbol

return {
	isAsyncIterable = function(p1)
		-- upvalues: symbol (ref)
		local asyncIterator = symbol.asyncIterator
		
		return typeof(p1) == "table" and (p1 ~= nil and (asyncIterator and (p1[asyncIterator] and typeof(p1[asyncIterator]) == "function")))
	end
}