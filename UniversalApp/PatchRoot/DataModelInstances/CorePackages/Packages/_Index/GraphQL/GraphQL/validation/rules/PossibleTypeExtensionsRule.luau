local parent = script.Parent.Parent.Parent
local jsutils = parent.jsutils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local isTypeDefinitionNode = require(language.predicates).isTypeDefinitionNode
local definitionModule = require(parent.type.definition)
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local t = {}
local t_1 = nil
local typeToExtKind = nil
local extensionKindToTypeName = nil

function t.PossibleTypeExtensionsRule(p1)
	-- upvalues: isTypeDefinitionNode (ref), t_1 (write), typeToExtKind (write), extensionKindToTypeName (write), graphQLError (ref), object (ref), array (ref), suggestionList (ref), didYouMean (ref)
	local schema = p1:getSchema()
	local t = {}
	
	for i, v in ipairs(p1:getDocument().definitions) do
		if isTypeDefinitionNode(v) then
			t[v.name.value] = v
		end
	end
	local function checkExtension(p2)
		-- upvalues: t (ref), schema (ref), t_1 (copy), typeToExtKind (copy), extensionKindToTypeName (copy), p1 (ref), graphQLError (copy), object (copy), array (copy), suggestionList (copy), didYouMean (copy)
		local value = p2.name.value
		local var1 = t[value]
		local var2 = if schema then schema:getType(value) else nil
		local var3 = nil
		
		if var1 then
			var3 = t_1[var1.kind]
		elseif var2 then
			var3 = typeToExtKind(var2)
		end
		if var3 then
			if var3 == p2.kind then
				return
			else
				p1:reportError(graphQLError.new(("Cannot extend non-%s type \"%s\"."):format(extensionKindToTypeName(p2.kind), value), if var1 then { var1, p2 } else p2))
				
				return
			end
		else
			local var4 = object.keys(t)
			
			if schema then
				var4 = array.concat(var4, schema:getTypeMap():keys())
			end
			p1:reportError(graphQLError.new(("Cannot extend type \"%s\" because it is not defined."):format(value) .. didYouMean(suggestionList(value, var4)), p2.name))
		end
	end
	
	local var1 = function(_, ...)
		-- upvalues: checkExtension (ref)
		return checkExtension(...)
	end
	
	return {
		ScalarTypeExtension = var1,
		ObjectTypeExtension = var1,
		InterfaceTypeExtension = var1,
		UnionTypeExtension = var1,
		EnumTypeExtension = var1,
		InputObjectTypeExtension = var1
	}
end

t_1 = {
	[kind.SCALAR_TYPE_DEFINITION] = kind.SCALAR_TYPE_EXTENSION,
	[kind.OBJECT_TYPE_DEFINITION] = kind.OBJECT_TYPE_EXTENSION,
	[kind.INTERFACE_TYPE_DEFINITION] = kind.INTERFACE_TYPE_EXTENSION,
	[kind.UNION_TYPE_DEFINITION] = kind.UNION_TYPE_EXTENSION,
	[kind.ENUM_TYPE_DEFINITION] = kind.ENUM_TYPE_EXTENSION,
	[kind.INPUT_OBJECT_TYPE_DEFINITION] = kind.INPUT_OBJECT_TYPE_EXTENSION
}

typeToExtKind = function(p2)
	-- upvalues: isScalarType (ref), kind (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), invariant (ref), inspect (ref)
	if isScalarType(p2) then
		return kind.SCALAR_TYPE_EXTENSION
	elseif isObjectType(p2) then
		return kind.OBJECT_TYPE_EXTENSION
	elseif isInterfaceType(p2) then
		return kind.INTERFACE_TYPE_EXTENSION
	elseif isUnionType(p2) then
		return kind.UNION_TYPE_EXTENSION
	elseif isEnumType(p2) then
		return kind.ENUM_TYPE_EXTENSION
	elseif isInputObjectType(p2) then
		return kind.INPUT_OBJECT_TYPE_EXTENSION
	end
	invariant(false, "Unexpected type: " .. inspect(p2))
	
	return nil
end

extensionKindToTypeName = function(p2)
	-- upvalues: kind (ref), invariant (ref), inspect (ref)
	if p2 == kind.SCALAR_TYPE_EXTENSION then
		return "scalar"
	elseif p2 == kind.OBJECT_TYPE_EXTENSION then
		return "object"
	elseif p2 == kind.INTERFACE_TYPE_EXTENSION then
		return "interface"
	elseif p2 == kind.UNION_TYPE_EXTENSION then
		return "union"
	elseif p2 == kind.ENUM_TYPE_EXTENSION then
		return "enum"
	elseif p2 == kind.INPUT_OBJECT_TYPE_EXTENSION then
		return "input object"
	end
	invariant(false, "Unexpected kind: " .. inspect(p2))
	
	return ""
end

return t