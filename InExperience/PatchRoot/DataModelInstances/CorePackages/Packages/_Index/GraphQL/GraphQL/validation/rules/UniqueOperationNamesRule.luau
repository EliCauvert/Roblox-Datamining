local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationNamesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function(_, p1) --[[ line: 22 ]]
				-- upvalues: t (ref), p0 (ref), graphQLError (copy)
				local name = p1.name
				
				if name then
					if t[name.value] then
						p0:reportError(graphQLError.new(("There can be only one operation named \"%s\"."):format(name.value), { t[name.value], name }))
					else
						t[name.value] = name
					end
				end
				return false
			end,
			FragmentDefinition = function() --[[ line: 40 ]]
				return false
			end
		}
	end
}