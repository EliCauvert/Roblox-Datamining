local parent = script.Parent.Parent.Parent
local map = require(parent.Parent.LuauPolyfill).Map
local isNotNillish = require(parent.luaUtils.isNillish).isNotNillish
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isInputObjectType = definitionModule.isInputObjectType
local t = {}
local hasField = nil

function t.UniqueFieldDefinitionNamesRule(p1)
	-- upvalues: map (ref), hasField (write), graphQLError (ref)
	local schema = p1:getSchema()
	local var1 = schema and schema:getTypeMap() or map.new()
	local t = {}
	
	local function checkFieldUniqueness(_, p2)
		-- upvalues: t (ref), hasField (copy), var1 (ref), p1 (ref), graphQLError (copy)
		local value = p2.name.value
		
		if not t[value] then
			t[value] = {}
		end
		local var2 = t[value]
		
		for i, v in ipairs(p2.fields or {}) do
			local value_1 = v.name.value
			
			if hasField(var1:get(value), value_1) then
				p1:reportError(graphQLError.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(value, value_1), v.name))
			elseif var2[value_1] then
				p1:reportError(graphQLError.new(("Field \"%s.%s\" can only be defined once."):format(value, value_1), { var2[value_1], v.name }))
			else
				var2[value_1] = v.name
			end
		end
		return false
	end
	
	return {
		InputObjectTypeDefinition = checkFieldUniqueness,
		InputObjectTypeExtension = checkFieldUniqueness,
		InterfaceTypeDefinition = checkFieldUniqueness,
		InterfaceTypeExtension = checkFieldUniqueness,
		ObjectTypeDefinition = checkFieldUniqueness,
		ObjectTypeExtension = checkFieldUniqueness
	}
end

hasField = function(p2, p3)
	-- upvalues: isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref), isNotNillish (ref)
	return if isObjectType(p2) or isInterfaceType(p2) or isInputObjectType(p2) then isNotNillish(p2:getFields():get(p3)) else false
end

return t