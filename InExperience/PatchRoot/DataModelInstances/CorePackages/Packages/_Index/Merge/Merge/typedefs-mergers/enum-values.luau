local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local _ = require(Parent.GraphQL)
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])
local CompareNodes = require(Parent.Utils).compareNodes

return {
	mergeEnumValues = function(List, ConcatResult, p1)
		-- upvalues: Boolean (copy), Array (copy), Map (copy), MergeDirectivesFunction (copy), CompareNodes (copy)
		if Boolean.toJSBoolean(if typeof(p1) == "table" then p1.consistentEnumMerge else nil) then
			local ConcatResult1 = {}
			
			if Boolean.toJSBoolean(List) then
				ConcatResult1 = Array.concat(ConcatResult1, List)
			end
			List = ConcatResult
			ConcatResult = ConcatResult1
		end
		local NewMap = Map.new()
		
		if List then
			for _, value in List do
				NewMap:set(value.name.value, value)
			end
		end
		if ConcatResult then
			for _, value1 in ConcatResult do
				local Value = value1.name.value
				
				if Boolean.toJSBoolean(NewMap:has(Value)) then
					local GetResult = NewMap:get(Value)
					GetResult.description = Boolean.toJSBoolean(value1.description) and value1.description or GetResult.description
					GetResult.directives = MergeDirectivesFunction(value1.directives, GetResult.directives)
				else
					NewMap:set(Value, value1)
				end
			end
		end
		local ConcatResult2 = Array.concat({}, NewMap:values())
		
		if p1 and Boolean.toJSBoolean(p1.sort) then
			Array.sort(ConcatResult2, CompareNodes)
		end
		return ConcatResult2
	end
}