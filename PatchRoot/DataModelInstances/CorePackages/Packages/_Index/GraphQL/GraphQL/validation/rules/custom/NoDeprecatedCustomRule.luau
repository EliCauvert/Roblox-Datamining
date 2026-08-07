-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local invariant = require(parent.jsutils.invariant).invariant
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local getNamedType = definitionModule.getNamedType
local isInputObjectType = definitionModule.isInputObjectType

return {
	NoDeprecatedCustomRule = function(p0) --[[ line: 28 ]]
		-- upvalues: invariant (ref), graphQLError (ref), getNamedType (ref), isInputObjectType (ref)
		return {
			Field = function(_, p1) --[[ line: 30 ]]
				-- upvalues: p0 (ref), invariant (copy), graphQLError (copy)
				local fieldDef = p0:getFieldDef()
				local deprecationReason = fieldDef and fieldDef.deprecationReason
				
				if fieldDef and deprecationReason ~= nil then
					local parentType = p0:getParentType()
					invariant(parentType ~= nil)
					p0:reportError(graphQLError.new(("The field %s.%s is deprecated. %s"):format(parentType.name, fieldDef.name, deprecationReason), p1))
				end
			end,
			Argument = function(_, p2) --[[ line: 48 ]]
				-- upvalues: p0 (ref), graphQLError (copy), invariant (copy)
				local argument = p0:getArgument()
				local deprecationReason = argument and argument.deprecationReason
				
				if argument and deprecationReason ~= nil then
					local directive = p0:getDirective()
					
					if directive ~= nil then
						p0:reportError(graphQLError.new(("Directive \"@%s\" argument \"%s\" is deprecated. %s"):format(directive.name, argument.name, deprecationReason), p2))
						
						return
					end
					local parentType = p0:getParentType()
					local fieldDef = p0:getFieldDef()
					invariant(parentType ~= nil and fieldDef ~= nil)
					p0:reportError(graphQLError.new(("Field \"%s.%s\" argument \"%s\" is deprecated. %s"):format(parentType.name, fieldDef.name, argument.name, deprecationReason), p2))
				end
			end,
			ObjectField = function(_, p3) --[[ line: 82 ]]
				-- upvalues: getNamedType (copy), p0 (ref), isInputObjectType (copy), graphQLError (copy)
				local var9 = getNamedType(p0:getParentInputType())
				
				if isInputObjectType(var9) then
					local value = var9:getFields():get(p3.name.value)
					local deprecationReason = value and value.deprecationReason
					
					if deprecationReason ~= nil then
						p0:reportError(graphQLError.new(("The input field %s.%s is deprecated. %s"):format(var9.name, value.name, deprecationReason), p3))
					end
				end
			end,
			EnumValue = function(_, p4) --[[ line: 103 ]]
				-- upvalues: p0 (ref), getNamedType (copy), invariant (copy), graphQLError (copy)
				local enumValue = p0:getEnumValue()
				local deprecationReason = enumValue and enumValue.deprecationReason
				
				if enumValue and deprecationReason ~= nil then
					local var14 = getNamedType(p0:getInputType())
					invariant(var14 ~= nil)
					p0:reportError(graphQLError.new(("The enum value \"%s.%s\" is deprecated. %s"):format(var14.name, enumValue.name, deprecationReason), p4))
				end
			end
		}
	end
}