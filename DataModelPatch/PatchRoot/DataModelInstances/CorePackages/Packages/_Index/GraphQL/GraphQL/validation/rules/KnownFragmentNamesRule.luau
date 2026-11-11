local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	KnownFragmentNamesRule = function(p1)
		-- upvalues: GraphQLError (copy)
		return {
			FragmentSpread = function(_, p2)
				-- upvalues: p1 (copy), GraphQLError (upval)
				local Value = p2.name.value
				
				if not p1:getFragment(Value) then
					p1:reportError(GraphQLError.new(("Unknown fragment \"%s\"."):format(Value), p2.name))
				end
			end
		}
	end
}