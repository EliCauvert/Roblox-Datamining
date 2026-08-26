local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	KnownFragmentNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		return {
			FragmentSpread = function(_, p2)
				-- upvalues: p1 (ref), graphQLError (copy)
				local value = p2.name.value
				
				if not p1:getFragment(value) then
					p1:reportError(graphQLError.new(("Unknown fragment \"%s\"."):format(value), p2.name))
				end
			end
		}
	end
}