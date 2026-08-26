local setTimeout = require(script.Parent.Parent.LuauPolyfill).setTimeout

return function(p1)
	-- upvalues: setTimeout (ref)
	return setTimeout(p1, 0)
end