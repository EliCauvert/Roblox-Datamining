local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUnusedFragmentsRule = function(p1) --[[ Line: 20 ]]
		-- upvalues: GraphQLError (copy)
		local List = {}
		local List1 = {}
		
		return {
			OperationDefinition = function(_, p2): boolean --[[ Line: 25 ]]
				-- upvalues: List (copy)
				table.insert(List, p2)
				
				return false
			end,
			FragmentDefinition = function(_, p2): boolean --[[ Line: 29 ]]
				-- upvalues: List1 (copy)
				table.insert(List1, p2)
				
				return false
			end,
			Document = {
				leave = function() --[[ Line: 34 ]]
					-- upvalues: List (copy), p1 (copy), List1 (copy), GraphQLError (upval)
					local t = {}
					
					for _, value in ipairs(List) do
						for _, recursivelyReferencedFragment in ipairs(p1:getRecursivelyReferencedFragments(value)) do
							t[recursivelyReferencedFragment.name.value] = true
						end
					end
					for _, value1 in ipairs(List1) do
						local Value = value1.name.value
						
						if t[Value] ~= true then
							p1:reportError(GraphQLError.new(("Fragment \"%s\" is never used."):format(Value), value1))
						end
					end
				end
			}
		}
	end
}