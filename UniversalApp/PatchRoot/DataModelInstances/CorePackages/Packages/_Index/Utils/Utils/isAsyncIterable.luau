local Symbol = require(script.Parent.Parent.LuauPolyfill).Symbol

return {
	isAsyncIterable = function(p1): boolean --[[ Line: 12 ]]
		-- upvalues: Symbol (copy)
		local AsyncIterator = Symbol.asyncIterator
		
		return typeof(p1) == "table" and (p1 ~= nil and (AsyncIterator and (p1[AsyncIterator] and typeof(p1[AsyncIterator]) == "function")))
	end
}