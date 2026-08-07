-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

return {
	isSymbol = function(p0) --[[ line: 9 ]]
		return typeof(p0) == "userdata" and string.sub(tostring(p0), 1, 7) == "Symbol("
	end,
	getOwnPropertySymbols = function(p1) --[[ line: 14 ]]
		-- upvalues: array (ref), object (ref)
		return array.filter(object.keys(p1), function(p2) --[[ line: 15 ]]
			return typeof(p2) == "userdata" and string.sub(tostring(p2), 1, 7) == "Symbol("
		end)
	end,
	getOwnPropertyNames = function(p3) --[[ line: 21 ]]
		-- upvalues: array (ref), object (ref)
		array.filter(object.keys(p3), function(p4) --[[ line: 22 ]]
			return not (typeof(p4) == "userdata" and string.sub(tostring(p4), 1, 7) == "Symbol(")
		end)
	end,
	create = function(p5) --[[ line: 28 ]]
		return if p5 then setmetatable({}, p5) else {}
	end
}