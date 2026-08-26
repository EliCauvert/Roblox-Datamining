local parent = script.Parent.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local getNamedType = definitionModule.getNamedType
local isLeafType = definitionModule.isLeafType

return {
	ScalarLeafsRule = function(p1)
		-- upvalues: isLeafType (ref), getNamedType (ref), inspect (ref), graphQLError (ref)
		return {
			Field = function(_, p2)
				-- upvalues: p1 (ref), isLeafType (copy), getNamedType (copy), inspect (copy), graphQLError (copy)
				local type = p1:getType()
				local selectionSet = p2.selectionSet
				
				if type then
					if isLeafType(getNamedType(type)) then
						if selectionSet then
							p1:reportError(graphQLError.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(p2.name.value, inspect(type)), selectionSet))
							
							return
						end
					elseif not selectionSet then
						local value = p2.name.value
						p1:reportError(graphQLError.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(value, inspect(type), value), p2))
					end
				end
			end
		}
	end
}