local String = require(script.Parent.Parent.Parent.LuauPolyfill).String

return function(p1): string
	-- upvalues: String (copy)
	return "\"\\u" .. String.slice("0000" .. string.format("%x", p1), -4):upper() .. "\""
end