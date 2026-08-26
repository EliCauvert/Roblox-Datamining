local parent = script.Parent.Parent.Parent.Parent
local invariant = require(parent.jsutils.invariant).invariant
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local getNamedType = definitionModule.getNamedType
local isInputObjectType = definitionModule.isInputObjectType

return {
	NoDeprecatedCustomRule = function(p1)
		-- upvalues: invariant (ref), graphQLError (ref), getNamedType (ref), isInputObjectType (ref)
		return {
			Field = function(_, p2)
				-- upvalues: p1 (ref), invariant (copy), graphQLError (copy)
				local fieldDef = p1:getFieldDef()
				local deprecationReason = fieldDef and fieldDef.deprecationReason
				
				if fieldDef and deprecationReason ~= nil then
					local parentType = p1:getParentType()
					invariant(parentType ~= nil)
					p1:reportError(graphQLError.new(("The field %s.%s is deprecated. %s"):format(parentType.name, fieldDef.name, deprecationReason), p2))
				end
			end,
			Argument = function(_, p2)
				-- upvalues: p1 (ref), graphQLError (copy), invariant (copy)
				local argument = p1:getArgument()
				local deprecationReason = argument and argument.deprecationReason
				
				if argument and deprecationReason ~= nil then
					local directive = p1:getDirective()
					
					if directive ~= nil then
						p1:reportError(graphQLError.new(("Directive \"@%s\" argument \"%s\" is deprecated. %s"):format(directive.name, argument.name, deprecationReason), p2))
						
						return
					end
					local parentType = p1:getParentType()
					local fieldDef = p1:getFieldDef()
					invariant(parentType ~= nil and fieldDef ~= nil)
					p1:reportError(graphQLError.new(("Field \"%s.%s\" argument \"%s\" is deprecated. %s"):format(parentType.name, fieldDef.name, argument.name, deprecationReason), p2))
				end
			end,
			ObjectField = function(_, p2)
				-- upvalues: getNamedType (copy), p1 (ref), isInputObjectType (copy), graphQLError (copy)
				local var1 = getNamedType(p1:getParentInputType())
				
				if isInputObjectType(var1) then
					local value = var1:getFields():get(p2.name.value)
					local deprecationReason = value and value.deprecationReason
					
					if deprecationReason ~= nil then
						p1:reportError(graphQLError.new(("The input field %s.%s is deprecated. %s"):format(var1.name, value.name, deprecationReason), p2))
					end
				end
			end,
			EnumValue = function(_, p2)
				-- upvalues: p1 (ref), getNamedType (copy), invariant (copy), graphQLError (copy)
				local enumValue = p1:getEnumValue()
				local deprecationReason = enumValue and enumValue.deprecationReason
				
				if enumValue and deprecationReason ~= nil then
					local var1 = getNamedType(p1:getInputType())
					invariant(var1 ~= nil)
					p1:reportError(graphQLError.new(("The enum value \"%s.%s\" is deprecated. %s"):format(var1.name, enumValue.name, deprecationReason), p2))
				end
			end
		}
	end
}