local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

return {
	isSymbol = function(p0)
		return typeof(p0) == "userdata" and string.sub(tostring(p0), 1, 7) == "Symbol("
	end,
	getOwnPropertySymbols = function(p1)
		-- upvalues: array (ref), object (ref)
		return array.filter(object.keys(p1), function(p2)
			return typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol("
		end)
	end,
	getOwnPropertyNames = function(p3)
		-- upvalues: array (ref), object (ref)
		array.filter(object.keys(p3), function(p4)
			return not (typeof(p4) == "userdata" and string.sub(tostring(p4), 1, 7) == "Symbol(")
		end)
	end,
	create = function(p5)
		return if p5 then setmetatable({}, p5) else {}
	end
}