local Parent = script.Parent.Parent.Parent
local Jsutils = Parent.jsutils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local IsTypeDefinitionNodeFunction = require(Language.predicates).isTypeDefinitionNode
local DefinitionModule = require(Parent.type.definition)
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local v1 = nil
local Callback = nil
local Callback1 = nil
local PossibleTypeExtensionsRuleModule = {
	PossibleTypeExtensionsRule = function(p1)
		-- upvalues: IsTypeDefinitionNodeFunction (copy), v1 (ref), Callback (ref), Callback1 (ref), GraphQLError (copy), Object (copy), Array (copy), SuggestionListFunction (copy), DidYouMeanFunction (copy)
		local Schema = p1:getSchema()
		local t = {}
		
		for _, definition in ipairs(p1:getDocument().definitions) do
			if IsTypeDefinitionNodeFunction(definition) then
				t[definition.name.value] = definition
			end
		end
		local function checkExtension(p2)
			-- upvalues: t (copy), Schema (copy), v1 (upval), Callback (upval), Callback1 (upval), p1 (copy), GraphQLError (upval), Object (upval), Array (upval), SuggestionListFunction (upval), DidYouMeanFunction (upval)
			local Value = p2.name.value
			local Entry = t[Value]
			local Type = if Schema then Schema:getType(Value) else nil
			local Kind = nil
			
			if Entry then
				Kind = v1[Entry.kind]
			elseif Type then
				Kind = Callback(Type)
			end
			if not Kind then
				local KeysResult = Object.keys(t)
				
				if Schema then
					KeysResult = Array.concat(KeysResult, Schema:getTypeMap():keys())
				end
				p1:reportError(GraphQLError.new(("Cannot extend type \"%s\" because it is not defined."):format(Value) .. DidYouMeanFunction((SuggestionListFunction(Value, KeysResult))), p2.name))
			elseif Kind ~= p2.kind then
				p1:reportError(GraphQLError.new(("Cannot extend non-%s type \"%s\"."):format(Callback1(p2.kind), Value), Entry and { Entry, p2 } or p2))
				
				return
			end
		end
		
		local function EnumTypeExtension(_, ...)
			-- upvalues: checkExtension (copy)
			return checkExtension(...)
		end
		
		return {
			ScalarTypeExtension = EnumTypeExtension,
			ObjectTypeExtension = EnumTypeExtension,
			InterfaceTypeExtension = EnumTypeExtension,
			UnionTypeExtension = EnumTypeExtension,
			EnumTypeExtension = EnumTypeExtension,
			InputObjectTypeExtension = EnumTypeExtension
		}
	end
}
v1 = {
	[Kind.SCALAR_TYPE_DEFINITION] = Kind.SCALAR_TYPE_EXTENSION,
	[Kind.OBJECT_TYPE_DEFINITION] = Kind.OBJECT_TYPE_EXTENSION,
	[Kind.INTERFACE_TYPE_DEFINITION] = Kind.INTERFACE_TYPE_EXTENSION,
	[Kind.UNION_TYPE_DEFINITION] = Kind.UNION_TYPE_EXTENSION,
	[Kind.ENUM_TYPE_DEFINITION] = Kind.ENUM_TYPE_EXTENSION,
	[Kind.INPUT_OBJECT_TYPE_DEFINITION] = Kind.INPUT_OBJECT_TYPE_EXTENSION
}

Callback = function(Type)
	-- upvalues: IsScalarTypeFunction (copy), Kind (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), IsInputObjectTypeFunction (copy), InvariantFunction (copy), InspectFunction (copy)
	if IsScalarTypeFunction(Type) then
		return Kind.SCALAR_TYPE_EXTENSION
	elseif IsObjectTypeFunction(Type) then
		return Kind.OBJECT_TYPE_EXTENSION
	elseif IsInterfaceTypeFunction(Type) then
		return Kind.INTERFACE_TYPE_EXTENSION
	elseif IsUnionTypeFunction(Type) then
		return Kind.UNION_TYPE_EXTENSION
	elseif IsEnumTypeFunction(Type) then
		return Kind.ENUM_TYPE_EXTENSION
	elseif IsInputObjectTypeFunction(Type) then
		return Kind.INPUT_OBJECT_TYPE_EXTENSION
	else
		InvariantFunction(false, "Unexpected type: " .. InspectFunction(Type))
		
		return nil
	end
end

Callback1 = function(Kind1): string
	-- upvalues: Kind (copy), InvariantFunction (copy), InspectFunction (copy)
	if Kind1 == Kind.SCALAR_TYPE_EXTENSION then
		return "scalar"
	elseif Kind1 == Kind.OBJECT_TYPE_EXTENSION then
		return "object"
	elseif Kind1 == Kind.INTERFACE_TYPE_EXTENSION then
		return "interface"
	elseif Kind1 == Kind.UNION_TYPE_EXTENSION then
		return "union"
	elseif Kind1 == Kind.ENUM_TYPE_EXTENSION then
		return "enum"
	elseif Kind1 == Kind.INPUT_OBJECT_TYPE_EXTENSION then
		return "input object"
	else
		InvariantFunction(false, "Unexpected kind: " .. InspectFunction(Kind1))
		
		return ""
	end
end

return PossibleTypeExtensionsRuleModule