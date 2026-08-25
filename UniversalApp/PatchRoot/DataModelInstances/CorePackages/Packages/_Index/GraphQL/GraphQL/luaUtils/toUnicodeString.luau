local string = require(script.Parent.Parent.Parent.LuauPolyfill).String

return function(p0)
	-- upvalues: string (ref)
	return "\"\\u" .. string.slice("0000" .. string.format("%x", p0), -4):upper() .. "\""
end