local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueFragmentNamesRule = function(p1) --[[ Line: 19 ]]
		-- upvalues: GraphQLError (copy)
		local Names = {}
		
		return {
			OperationDefinition = function(): boolean --[[ Line: 23 ]]
				return false
			end,
			FragmentDefinition = function(_, p2): boolean --[[ Line: 26 ]]
				-- upvalues: Names (copy), p1 (copy), GraphQLError (upval)
				local Value = p2.name.value
				
				if Names[Value] then
					p1:reportError(GraphQLError.new(("There can be only one fragment named \"%s\"."):format(Value), { Names[Value], p2.name }))
				else
					Names[Value] = p2.name
				end
				return false
			end
		}
	end
}