local SetTimeoutFunction = require(script.Parent.Parent.LuauPolyfill).setTimeout

return function(p1)
	-- upvalues: SetTimeoutFunction (copy)
	return SetTimeoutFunction(p1, 0)
end