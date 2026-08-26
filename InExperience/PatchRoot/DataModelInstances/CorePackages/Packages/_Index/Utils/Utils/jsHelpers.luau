local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

return {
	isSymbol = function(p1)
		return typeof(p1) == "userdata" and string.sub(tostring(p1), 1, 7) == "Symbol("
	end,
	getOwnPropertySymbols = function(p1)
		-- upvalues: array (ref), object (ref)
		return array.filter(object.keys(p1), function(p2)
			return typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol("
		end)
	end,
	getOwnPropertyNames = function(p1)
		-- upvalues: array (ref), object (ref)
		array.filter(object.keys(p1), function(p2)
			return not (typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol(")
		end)
	end,
	create = function(p1)
		return if p1 then setmetatable({}, p1) else {}
	end
}