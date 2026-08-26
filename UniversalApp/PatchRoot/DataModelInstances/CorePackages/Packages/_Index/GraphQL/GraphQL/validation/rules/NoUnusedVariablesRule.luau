local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUnusedVariablesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = {
				enter = function()
					-- upvalues: t (write)
					t = {}
				end,
				leave = function(_, p2)
					-- upvalues: p1 (ref), t (write), graphQLError (copy)
					local t_1 = {}
					
					for i, v in ipairs(p1:getRecursiveVariableUsages(p2)) do
						t_1[v.node.name.value] = true
					end
					for i, v_1 in ipairs(t) do
						local value = v_1.variable.name.value
						
						if t_1[value] ~= true then
							p1:reportError(graphQLError.new(p2.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(value, p2.name.value) or ("Variable \"$%s\" is never used."):format(value), v_1))
						end
					end
				end
			},
			VariableDefinition = function(_, p3)
				-- upvalues: t (write)
				table.insert(t, p3)
			end
		}
	end
}