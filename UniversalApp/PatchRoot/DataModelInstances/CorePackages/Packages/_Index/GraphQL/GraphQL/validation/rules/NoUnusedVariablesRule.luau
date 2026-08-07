local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUnusedVariablesRule = function(p0) --[[ line: 20 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = {
				enter = function() --[[ line: 25 ]]
					-- upvalues: t (write)
					t = {}
				end,
				leave = function(_, p1) --[[ line: 28 ]]
					-- upvalues: p0 (ref), t (write), graphQLError (copy)
					local t_1 = {}
					
					for i, v in ipairs(p0:getRecursiveVariableUsages(p1)) do
						t_1[v.node.name.value] = true
					end
					for i, v_1 in ipairs(t) do
						local value = v_1.variable.name.value
						
						if t_1[value] ~= true then
							p0:reportError(graphQLError.new(p1.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(value, p1.name.value) or ("Variable \"$%s\" is never used."):format(value), v_1))
						end
					end
				end
			},
			VariableDefinition = function(_, p2) --[[ line: 55 ]]
				-- upvalues: t (write)
				table.insert(t, p2)
			end
		}
	end
}