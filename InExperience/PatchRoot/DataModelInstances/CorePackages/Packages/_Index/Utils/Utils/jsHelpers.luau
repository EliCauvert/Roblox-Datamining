local LuauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object

return {
	isSymbol = function(p1): boolean --[[ Line: 9 ]]
		return typeof(p1) == "userdata" and string.sub(tostring(p1), 1, 7) == "Symbol("
	end,
	getOwnPropertySymbols = function(p1) --[[ Line: 14 ]]
		-- upvalues: Array (copy), Object (copy)
		return Array.filter(Object.keys(p1), function(p2): boolean --[[ Line: 15 ]]
			return typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol("
		end)
	end,
	getOwnPropertyNames = function(p1) --[[ Line: 21 ]]
		-- upvalues: Array (copy), Object (copy)
		Array.filter(Object.keys(p1), function(p2): boolean --[[ Line: 22 ]]
			return not (typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol(")
		end)
	end,
	create = function(p1) --[[ Line: 28 ]]
		return if p1 then setmetatable({}, p1) else {}
	end
}