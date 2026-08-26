local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function(_, p2)
				-- upvalues: t (ref), p1 (ref), graphQLError (copy)
				local name = p2.name
				
				if name then
					if t[name.value] then
						p1:reportError(graphQLError.new(("There can be only one operation named \"%s\"."):format(name.value), { t[name.value], name }))
					else
						t[name.value] = name
					end
				end
				return false
			end,
			FragmentDefinition = function()
				return false
			end
		}
	end
}