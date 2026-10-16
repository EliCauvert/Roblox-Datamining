local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueArgumentNamesRule = function(p1) --[[ Line: 20 ]]
		-- upvalues: GraphQLError (copy)
		local Names = {}
		
		return {
			Field = function() --[[ Line: 24 ]]
				-- upvalues: Names (ref)
				Names = {}
			end,
			Directive = function() --[[ Line: 27 ]]
				-- upvalues: Names (ref)
				Names = {}
			end,
			Argument = function(_, p2): boolean --[[ Line: 30 ]]
				-- upvalues: Names (ref), p1 (copy), GraphQLError (upval)
				local Value = p2.name.value
				
				if Names[Value] then
					p1:reportError(GraphQLError.new(("There can be only one argument named \"%s\"."):format(Value), { Names[Value], p2.name }))
				else
					Names[Value] = p2.name
				end
				return false
			end
		}
	end
}