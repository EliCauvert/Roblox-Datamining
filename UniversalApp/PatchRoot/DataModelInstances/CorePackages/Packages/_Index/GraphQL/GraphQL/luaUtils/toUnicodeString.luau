local string = require(script.Parent.Parent.Parent.LuauPolyfill).String

return function(p1)
	-- upvalues: string (ref)
	return "\"\\u" .. string.slice("0000" .. string.format("%x", p1), -4):upper() .. "\""
end