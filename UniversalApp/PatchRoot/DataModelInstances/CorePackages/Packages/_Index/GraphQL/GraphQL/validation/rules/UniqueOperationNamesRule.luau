local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationNamesRule = function(p1) --[[ Line: 19 ]]
		-- upvalues: GraphQLError (copy)
		local Names = {}
		
		return {
			OperationDefinition = function(_, p2): boolean --[[ Line: 22 ]]
				-- upvalues: Names (copy), p1 (copy), GraphQLError (upval)
				local Name = p2.name
				
				if Name then
					if Names[Name.value] then
						p1:reportError(GraphQLError.new(("There can be only one operation named \"%s\"."):format(Name.value), { Names[Name.value], Name }))
					else
						Names[Name.value] = Name
					end
				end
				return false
			end,
			FragmentDefinition = function(): boolean --[[ Line: 40 ]]
				return false
			end
		}
	end
}