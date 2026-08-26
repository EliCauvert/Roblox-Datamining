local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUndefinedVariablesRule = function(p1)
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
					for i, v in ipairs(p1:getRecursiveVariableUsages(p2)) do
						local node = v.node
						local value = node.name.value
						
						if t[value] ~= true then
							p1:reportError(graphQLError.new(p2.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(value, p2.name.value) or ("Variable \"$%s\" is not defined."):format(value), { node, p2 }))
						end
					end
				end
			},
			VariableDefinition = function(_, p3)
				-- upvalues: t (write)
				t[p3.variable.name.value] = true
			end
		}
	end
}