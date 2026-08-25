local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueVariableNamesRule = function(p0)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function()
				-- upvalues: t (write)
				t = {}
			end,
			VariableDefinition = function(_, p1)
				-- upvalues: t (write), p0 (ref), graphQLError (copy)
				local value = p1.variable.name.value
				
				if t[value] then
					p0:reportError(graphQLError.new(("There can be only one variable named \"$%s\"."):format(value), { t[value], p1.variable.name }))
					
					return
				end
				t[value] = p1.variable.name
			end
		}
	end
}