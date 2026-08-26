local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueDirectiveNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		local schema = p1:getSchema()
		
		return {
			DirectiveDefinition = function(_, p2)
				-- upvalues: schema (ref), p1 (ref), graphQLError (copy), t (ref)
				local value = p2.name.value
				
				if schema and schema:getDirective(value) then
					p1:reportError(graphQLError.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(value), p2.name))
					
					return
				elseif t[value] then
					p1:reportError(graphQLError.new(("There can be only one directive named \"@%s\"."):format(value), { t[value], p2.name }))
				else
					t[value] = p2.name
				end
				return false
			end
		}
	end
}