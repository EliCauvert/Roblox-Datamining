local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueDirectiveNamesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		local schema = p0:getSchema()
		
		return {
			DirectiveDefinition = function(_, p1) --[[ line: 24 ]]
				-- upvalues: schema (ref), p0 (ref), graphQLError (copy), t (ref)
				local value = p1.name.value
				
				if schema and schema:getDirective(value) then
					p0:reportError(graphQLError.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(value), p1.name))
					
					return
				elseif t[value] then
					p0:reportError(graphQLError.new(("There can be only one directive named \"@%s\"."):format(value), { t[value], p1.name }))
				else
					t[value] = p1.name
				end
				return false
			end
		}
	end
}