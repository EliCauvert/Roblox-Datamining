local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueFragmentNamesRule = function(p0)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function()
				return false
			end,
			FragmentDefinition = function(_, p1)
				-- upvalues: t (ref), p0 (ref), graphQLError (copy)
				local value = p1.name.value
				
				if t[value] then
					p0:reportError(graphQLError.new(("There can be only one fragment named \"%s\"."):format(value), { t[value], p1.name }))
				else
					t[value] = p1.name
				end
				return false
			end
		}
	end
}