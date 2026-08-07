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

function t.UniqueFieldDefinitionNamesRule(p0) --[[ line: 32 ]]
	-- upvalues: map (ref), hasField (write), graphQLError (ref)
	local schema = p0:getSchema()
	local var4 = schema and schema:getTypeMap() or map.new()
	local t = {}
	
	local function checkFieldUniqueness(_, p1) --[[ line: 40 ]]
		-- upvalues: t (ref), hasField (copy), var4 (ref), p0 (ref), graphQLError (copy)
		local value = p1.name.value
		
		if not t[value] then
			t[value] = {}
		end
		local var7 = t[value]
		
		for i, v in ipairs(p1.fields or {}) do
			local value_1 = v.name.value
			
			if hasField(var4:get(value), value_1) then
				p0:reportError(graphQLError.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(value, value_1), v.name))
			elseif var7[value_1] then
				p0:reportError(graphQLError.new(("Field \"%s.%s\" can only be defined once."):format(value, value_1), { var7[value_1], v.name }))
			else
				var7[value_1] = v.name
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

hasField = function(p2, p3) --[[ line: 88 | named "hasField" ]]
	-- upvalues: isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref), isNotNillish (ref)
	return if isObjectType(p2) or isInterfaceType(p2) or isInputObjectType(p2) then isNotNillish(p2:getFields():get(p3)) else false
end

return t