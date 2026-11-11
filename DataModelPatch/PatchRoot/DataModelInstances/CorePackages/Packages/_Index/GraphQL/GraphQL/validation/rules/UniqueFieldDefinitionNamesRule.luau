local Parent = script.Parent.Parent.Parent
local Map = require(Parent.Parent.LuauPolyfill).Map
local IsNotNillishFunction = require(Parent.luaUtils.isNillish).isNotNillish
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local DefinitionModule = require(Parent.type.definition)
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local Callback = nil
local UniqueFieldDefinitionNamesRuleModule = {
	UniqueFieldDefinitionNamesRule = function(p1)
		-- upvalues: Map (copy), Callback (ref), GraphQLError (copy)
		local Schema = p1:getSchema()
		local TypeMap = Schema and Schema:getTypeMap() or Map.new()
		local t = {}
		
		local function checkFieldUniqueness(_, p2): boolean
			-- upvalues: t (copy), Callback (upval), TypeMap (copy), p1 (copy), GraphQLError (upval)
			local Value = p2.name.value
			
			if not t[Value] then
				t[Value] = {}
			end
			local Entry = t[Value]
			
			for _, value in ipairs(p2.fields or {}) do
				local Value1 = value.name.value
				
				if Callback(TypeMap:get(Value), Value1) then
					p1:reportError(GraphQLError.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(Value, Value1), value.name))
				elseif Entry[Value1] then
					p1:reportError(GraphQLError.new(("Field \"%s.%s\" can only be defined once."):format(Value, Value1), { Entry[Value1], value.name }))
				else
					Entry[Value1] = value.name
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
}

Callback = function(GetResult, p2)
	-- upvalues: IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsInputObjectTypeFunction (copy), IsNotNillishFunction (copy)
	return if IsObjectTypeFunction(GetResult) or IsInterfaceTypeFunction(GetResult) or IsInputObjectTypeFunction(GetResult) then IsNotNillishFunction(GetResult:getFields():get(p2)) else false
end

return UniqueFieldDefinitionNamesRuleModule