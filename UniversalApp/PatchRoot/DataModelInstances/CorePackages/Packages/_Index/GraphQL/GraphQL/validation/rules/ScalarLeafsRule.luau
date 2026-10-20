local Parent = script.Parent.Parent.Parent
local InspectFunction = require(Parent.jsutils.inspect).inspect
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local DefinitionModule = require(Parent.type.definition)
local GetNamedTypeFunction = DefinitionModule.getNamedType
local IsLeafTypeFunction = DefinitionModule.isLeafType

return {
	ScalarLeafsRule = function(p1)
		-- upvalues: IsLeafTypeFunction (copy), GetNamedTypeFunction (copy), InspectFunction (copy), GraphQLError (copy)
		return {
			Field = function(_, p2)
				-- upvalues: p1 (copy), IsLeafTypeFunction (upval), GetNamedTypeFunction (upval), InspectFunction (upval), GraphQLError (upval)
				local Type = p1:getType()
				local SelectionSet = p2.selectionSet
				
				if Type then
					if IsLeafTypeFunction(GetNamedTypeFunction(Type)) then
						if SelectionSet then
							p1:reportError(GraphQLError.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(p2.name.value, (InspectFunction(Type))), SelectionSet))
							
							return
						end
					elseif not SelectionSet then
						local Value = p2.name.value
						p1:reportError(GraphQLError.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(Value, InspectFunction(Type), Value), p2))
					end
				end
			end
		}
	end
}