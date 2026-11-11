local Parent = script.Parent.Parent.Parent.Parent
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local DefinitionModule = require(Parent.type.definition)
local GetNamedTypeFunction = DefinitionModule.getNamedType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType

return {
	NoDeprecatedCustomRule = function(p1)
		-- upvalues: InvariantFunction (copy), GraphQLError (copy), GetNamedTypeFunction (copy), IsInputObjectTypeFunction (copy)
		return {
			Field = function(_, p2)
				-- upvalues: p1 (copy), InvariantFunction (upval), GraphQLError (upval)
				local FieldDef = p1:getFieldDef()
				local DeprecationReason = FieldDef and FieldDef.deprecationReason
				
				if FieldDef and DeprecationReason ~= nil then
					local ParentType = p1:getParentType()
					InvariantFunction(ParentType ~= nil)
					p1:reportError(GraphQLError.new(("The field %s.%s is deprecated. %s"):format(ParentType.name, FieldDef.name, DeprecationReason), p2))
				end
			end,
			Argument = function(_, p2)
				-- upvalues: p1 (copy), GraphQLError (upval), InvariantFunction (upval)
				local Argument = p1:getArgument()
				local DeprecationReason = Argument and Argument.deprecationReason
				
				if Argument and DeprecationReason ~= nil then
					local Directive = p1:getDirective()
					
					if Directive ~= nil then
						p1:reportError(GraphQLError.new(("Directive \"@%s\" argument \"%s\" is deprecated. %s"):format(Directive.name, Argument.name, DeprecationReason), p2))
						
						return
					end
					local ParentType = p1:getParentType()
					local FieldDef = p1:getFieldDef()
					InvariantFunction(ParentType ~= nil and FieldDef ~= nil)
					p1:reportError(GraphQLError.new(("Field \"%s.%s\" argument \"%s\" is deprecated. %s"):format(ParentType.name, FieldDef.name, Argument.name, DeprecationReason), p2))
				end
			end,
			ObjectField = function(_, p2)
				-- upvalues: GetNamedTypeFunction (upval), p1 (copy), IsInputObjectTypeFunction (upval), GraphQLError (upval)
				local NamedType = GetNamedTypeFunction(p1:getParentInputType())
				
				if IsInputObjectTypeFunction(NamedType) then
					local GetResult = NamedType:getFields():get(p2.name.value)
					local DeprecationReason = GetResult and GetResult.deprecationReason
					
					if DeprecationReason ~= nil then
						p1:reportError(GraphQLError.new(("The input field %s.%s is deprecated. %s"):format(NamedType.name, GetResult.name, DeprecationReason), p2))
					end
				end
			end,
			EnumValue = function(_, p2)
				-- upvalues: p1 (copy), GetNamedTypeFunction (upval), InvariantFunction (upval), GraphQLError (upval)
				local EnumValue = p1:getEnumValue()
				local DeprecationReason = EnumValue and EnumValue.deprecationReason
				
				if EnumValue and DeprecationReason ~= nil then
					local NamedType = GetNamedTypeFunction(p1:getInputType())
					InvariantFunction(NamedType ~= nil)
					p1:reportError(GraphQLError.new(("The enum value \"%s.%s\" is deprecated. %s"):format(NamedType.name, EnumValue.name, DeprecationReason), p2))
				end
			end
		}
	end
}