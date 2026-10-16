local Parent = script.Parent.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError

return {
	NoFragmentCyclesRule = function(p1) --[[ Line: 18 ]]
		-- upvalues: Array (copy), GraphQLError (copy)
		local t = {}
		local List = {}
		local t1 = {}
		
		local function detectCycleRecursive(Fragment) --[[ Line: 31 ]]
			-- upvalues: t (copy), p1 (copy), t1 (copy), List (copy), detectCycleRecursive (copy), Array (upval), GraphQLError (upval)
			if t[Fragment.name.value] then return end
			local Value = Fragment.name.value
			t[Value] = true
			local FragmentSpreads = p1:getFragmentSpreads(Fragment.selectionSet)
			
			if #FragmentSpreads == 0 then return end
			t1[Value] = #List
			
			for _, fragmentSpread in ipairs(FragmentSpreads) do
				local Value1 = fragmentSpread.name.value
				local Entry: number = t1[Value1]
				table.insert(List, fragmentSpread)
				
				if Entry == nil then
					local Fragment1 = p1:getFragment(Value1)
					
					if Fragment1 then
						detectCycleRecursive(Fragment1)
					end
				else
					local SliceResult = Array.slice(List, Entry + 1)
					local Joined = table.concat(Array.map(Array.slice(SliceResult, 1, #SliceResult), function(p2): string --[[ Line: 61 ]]
						return "\"" .. p2.name.value .. "\""
					end), ", ")
					p1:reportError(GraphQLError.new(("Cannot spread fragment \"%s\" within itself"):format(Value1) .. (if Joined == "" then "." else (" via %s."):format(Joined) or "."), SliceResult))
				end
				table.remove(List)
			end
			t1[Value] = nil
		end
		
		return {
			OperationDefinition = function(): boolean --[[ Line: 82 ]]
				return false
			end,
			FragmentDefinition = function(_, p2): boolean --[[ Line: 85 ]]
				-- upvalues: detectCycleRecursive (copy)
				detectCycleRecursive(p2)
				
				return false
			end
		}
	end
}