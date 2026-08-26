local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueFragmentNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function()
				return false
			end,
			FragmentDefinition = function(_, p2)
				-- upvalues: t (ref), p1 (ref), graphQLError (copy)
				local value = p2.name.value
				
				if t[value] then
					p1:reportError(graphQLError.new(("There can be only one fragment named \"%s\"."):format(value), { t[value], p2.name }))
				else
					t[value] = p2.name
				end
				return false
			end
		}
	end
}