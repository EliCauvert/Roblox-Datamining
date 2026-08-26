local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueVariableNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function()
				-- upvalues: t (write)
				t = {}
			end,
			VariableDefinition = function(_, p2)
				-- upvalues: t (write), p1 (ref), graphQLError (copy)
				local value = p2.variable.name.value
				
				if t[value] then
					p1:reportError(graphQLError.new(("There can be only one variable named \"$%s\"."):format(value), { t[value], p2.variable.name }))
					
					return
				end
				t[value] = p2.variable.name
			end
		}
	end
}