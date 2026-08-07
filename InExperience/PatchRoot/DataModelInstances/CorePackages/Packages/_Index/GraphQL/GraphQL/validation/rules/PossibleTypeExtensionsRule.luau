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

function t.PossibleTypeExtensionsRule(p0) --[[ line: 45 ]]
	-- upvalues: isTypeDefinitionNode (ref), t_1 (write), typeToExtKind (write), extensionKindToTypeName (write), graphQLError (ref), object (ref), array (ref), suggestionList (ref), didYouMean (ref)
	local schema = p0:getSchema()
	local t = {}
	
	for i, v in ipairs(p0:getDocument().definitions) do
		if isTypeDefinitionNode(v) then
			t[v.name.value] = v
		end
	end
	local function checkExtension(p1) --[[ line: 55 ]]
		-- upvalues: t (ref), schema (ref), t_1 (copy), typeToExtKind (copy), extensionKindToTypeName (copy), p0 (ref), graphQLError (copy), object (copy), array (copy), suggestionList (copy), didYouMean (copy)
		local value = p1.name.value
		local var10 = t[value]
		local var11 = if schema then schema:getType(value) else nil
		local var12 = nil
		
		if var10 then
			var12 = t_1[var10.kind]
		elseif var11 then
			var12 = typeToExtKind(var11)
		end
		if var12 then
			if var12 == p1.kind then
				return
			else
				p0:reportError(graphQLError.new(("Cannot extend non-%s type \"%s\"."):format(extensionKindToTypeName(p1.kind), value), if var10 then { var10, p1 } else p1))
				
				return
			end
		else
			local var13 = object.keys(t)
			
			if schema then
				var13 = array.concat(var13, schema:getTypeMap():keys())
			end
			p0:reportError(graphQLError.new(("Cannot extend type \"%s\" because it is not defined."):format(value) .. didYouMean(suggestionList(value, var13)), p1.name))
		end
	end
	
	local var9 = function(_, ...) --[[ line: 100 ]]
		-- upvalues: checkExtension (ref)
		return checkExtension(...)
	end
	
	return {
		ScalarTypeExtension = var9,
		ObjectTypeExtension = var9,
		InterfaceTypeExtension = var9,
		UnionTypeExtension = var9,
		EnumTypeExtension = var9,
		InputObjectTypeExtension = var9
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

typeToExtKind = function(p2) --[[ line: 122 | named "typeToExtKind" ]]
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

extensionKindToTypeName = function(p3) --[[ line: 150 | named "extensionKindToTypeName" ]]
	-- upvalues: kind (ref), invariant (ref), inspect (ref)
	if p3 == kind.SCALAR_TYPE_EXTENSION then
		return "scalar"
	elseif p3 == kind.OBJECT_TYPE_EXTENSION then
		return "object"
	elseif p3 == kind.INTERFACE_TYPE_EXTENSION then
		return "interface"
	elseif p3 == kind.UNION_TYPE_EXTENSION then
		return "union"
	elseif p3 == kind.ENUM_TYPE_EXTENSION then
		return "enum"
	elseif p3 == kind.INPUT_OBJECT_TYPE_EXTENSION then
		return "input object"
	end
	invariant(false, "Unexpected kind: " .. inspect(p3))
	
	return ""
end

return t