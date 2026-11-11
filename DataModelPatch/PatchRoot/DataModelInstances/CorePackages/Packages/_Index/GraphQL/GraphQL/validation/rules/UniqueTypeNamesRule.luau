local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueTypeNamesRule = function(p1)
		-- upvalues: GraphQLError (copy)
		local Names = {}
		local Schema = p1:getSchema()
		
		local function checkTypeName(_, p2): boolean?
			-- upvalues: Schema (copy), p1 (copy), GraphQLError (upval), Names (copy)
			local Value = p2.name.value
			
			if Schema and Schema:getType(Value) then
				p1:reportError(GraphQLError.new(("Type \"%s\" already exists in the schema. It cannot also be defined in this type definition."):format(Value), p2.name))
				
				return
			end
			if Names[Value] then
				p1:reportError(GraphQLError.new(("There can be only one type named \"%s\"."):format(Value), { Names[Value], p2.name }))
			else
				Names[Value] = p2.name
			end
			return false
		end
		
		return {
			ScalarTypeDefinition = checkTypeName,
			ObjectTypeDefinition = checkTypeName,
			InterfaceTypeDefinition = checkTypeName,
			UnionTypeDefinition = checkTypeName,
			EnumTypeDefinition = checkTypeName,
			InputObjectTypeDefinition = checkTypeName
		}
	end
}