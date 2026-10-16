local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUnusedVariablesRule = function(p1) --[[ Line: 20 ]]
		-- upvalues: GraphQLError (copy)
		local List = {}
		
		return {
			OperationDefinition = {
				enter = function() --[[ Line: 25 ]]
					-- upvalues: List (ref)
					List = {}
				end,
				leave = function(_, p2) --[[ Line: 28 ]]
					-- upvalues: p1 (copy), List (ref), GraphQLError (upval)
					local t = {}
					
					for _, recursiveVariableUsage in ipairs((p1:getRecursiveVariableUsages(p2))) do
						t[recursiveVariableUsage.node.name.value] = true
					end
					for _, value in ipairs(List) do
						local Value = value.variable.name.value
						
						if t[Value] ~= true then
							p1:reportError(GraphQLError.new(p2.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(Value, p2.name.value) or ("Variable \"$%s\" is never used."):format(Value), value))
						end
					end
				end
			},
			VariableDefinition = function(_, p3) --[[ Line: 55 ]]
				-- upvalues: List (ref)
				table.insert(List, p3)
			end
		}
	end
}