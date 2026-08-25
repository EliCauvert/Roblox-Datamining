local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueArgumentNamesRule = function(p0)
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
			Argument = function(_, p1)
				-- upvalues: t (write), p0 (ref), graphQLError (copy)
				local value = p1.name.value
				
				if t[value] then
					p0:reportError(graphQLError.new(("There can be only one argument named \"%s\"."):format(value), { t[value], p1.name }))
				else
					t[value] = p1.name
				end
				return false
			end
		}
	end
}