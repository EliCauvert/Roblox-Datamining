local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local _ = require(Parent.GraphQL)
local _ = require(script.Parent["merge-typedefs_types"])
local CompareNodes = require(Parent.Utils).compareNodes

local function _(p1, p2): boolean --[[ Line: 25 | Named "alreadyExists" ]]
	-- upvalues: Boolean (copy), Array (copy)
	return not not Boolean.toJSBoolean(Array.find(p1, function(p3): boolean --[[ Line: 26 ]]
		-- upvalues: p2 (copy)
		return p3.name.value == p2.name.value
	end))
end

return {
	mergeNamedTypeArray = function(p1, p2, p3) --[[ Line: 30 ]]
		-- upvalues: Array (copy), Boolean (copy), CompareNodes (copy)
		local T = if p2 == nil then {} else p2
		local T1 = if p3 == nil then {} else p3
		local ConcatResult = Array.concat({}, T, Array.filter(if p1 == nil then {} else p1, function(p4): boolean --[[ Line: 44 ]]
			-- upvalues: Boolean (upval), T (copy), Array (upval)
			return not Boolean.toJSBoolean(not not Boolean.toJSBoolean(Array.find(T, function(p5): boolean --[[ Line: 26 ]]
				-- upvalues: p4 (copy)
				return p5.name.value == p4.name.value
			end)))
		end))
		
		if T1 and Boolean.toJSBoolean(T1.sort) then
			Array.sort(ConcatResult, CompareNodes)
		end
		return ConcatResult
	end
}