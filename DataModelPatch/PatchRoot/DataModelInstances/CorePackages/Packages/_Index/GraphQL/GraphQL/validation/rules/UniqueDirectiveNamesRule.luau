local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueDirectiveNamesRule = function(p1)
		-- upvalues: GraphQLError (copy)
		local Names = {}
		local Schema = p1:getSchema()
		
		return {
			DirectiveDefinition = function(_, p2): boolean?
				-- upvalues: Schema (copy), p1 (copy), GraphQLError (upval), Names (copy)
				local Value = p2.name.value
				
				if Schema and Schema:getDirective(Value) then
					p1:reportError(GraphQLError.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(Value), p2.name))
					
					return
				end
				if Names[Value] then
					p1:reportError(GraphQLError.new(("There can be only one directive named \"@%s\"."):format(Value), { Names[Value], p2.name }))
				else
					Names[Value] = p2.name
				end
				return false
			end
		}
	end
}