local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueArgumentNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			Field = function()
				-- upvalues: t (write)
				t = {}
			end,
			Directive = function()
				-- upvalues: t (write)
				t = {}
			end,
			Argument = function(_, p2)
				-- upvalues: t (write), p1 (ref), graphQLError (copy)
				local value = p2.name.value
				
				if t[value] then
					p1:reportError(graphQLError.new(("There can be only one argument named \"%s\"."):format(value), { t[value], p2.name }))
				else
					t[value] = p2.name
				end
				return false
			end
		}
	end
}