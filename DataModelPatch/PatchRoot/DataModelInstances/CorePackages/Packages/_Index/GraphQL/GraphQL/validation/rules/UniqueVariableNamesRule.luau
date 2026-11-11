local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueVariableNamesRule = function(p1)
		-- upvalues: GraphQLError (copy)
		local Names = {}
		
		return {
			OperationDefinition = function()
				-- upvalues: Names (ref)
				Names = {}
			end,
			VariableDefinition = function(_, p2)
				-- upvalues: Names (ref), p1 (copy), GraphQLError (upval)
				local Value = p2.variable.name.value
				
				if Names[Value] then
					p1:reportError(GraphQLError.new(("There can be only one variable named \"$%s\"."):format(Value), { Names[Value], p2.variable.name }))
					
					return
				else
					Names[Value] = p2.variable.name
				end
			end
		}
	end
}