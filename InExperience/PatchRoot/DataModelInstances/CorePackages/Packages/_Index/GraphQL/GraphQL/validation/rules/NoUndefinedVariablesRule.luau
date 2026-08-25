local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUndefinedVariablesRule = function(p0)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = {
				enter = function()
					-- upvalues: t (write)
					t = {}
				end,
				leave = function(_, p1)
					-- upvalues: p0 (ref), t (write), graphQLError (copy)
					for i, v in ipairs(p0:getRecursiveVariableUsages(p1)) do
						local node = v.node
						local value = node.name.value
						
						if t[value] ~= true then
							p0:reportError(graphQLError.new(p1.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(value, p1.name.value) or ("Variable \"$%s\" is not defined."):format(value), { node, p1 }))
						end
					end
				end
			},
			VariableDefinition = function(_, p2)
				-- upvalues: t (write)
				t[p2.variable.name.value] = true
			end
		}
	end
}