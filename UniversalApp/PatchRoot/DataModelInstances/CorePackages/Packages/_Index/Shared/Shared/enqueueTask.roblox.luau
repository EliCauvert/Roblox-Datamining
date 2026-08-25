local setTimeout = require(script.Parent.Parent.LuauPolyfill).setTimeout

return function(p0)
	-- upvalues: setTimeout (ref)
	return setTimeout(p0, 0)
end