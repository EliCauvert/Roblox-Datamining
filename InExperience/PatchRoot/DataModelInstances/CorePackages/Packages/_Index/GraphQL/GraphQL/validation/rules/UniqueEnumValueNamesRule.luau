local Parent = script.Parent.Parent.Parent
local Map = require(Parent.Parent.LuauPolyfill).Map
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local IsEnumTypeFunction = require(Parent.type.definition).isEnumType

return {
	UniqueEnumValueNamesRule = function(p1) --[[ Line: 25 ]]
		-- upvalues: Map (copy), IsEnumTypeFunction (copy), GraphQLError (copy)
		local Schema = p1:getSchema()
		local TypeMap = Schema and Schema:getTypeMap() or Map.new()
		local t = {}
		
		local function checkValueUniqueness(_, p2): boolean --[[ Line: 33 ]]
			-- upvalues: t (copy), TypeMap (copy), IsEnumTypeFunction (upval), p1 (copy), GraphQLError (upval)
			local Value = p2.name.value
			
			if not t[Value] then
				t[Value] = {}
			end
			local Entry = t[Value]
			
			for _, value in ipairs(p2.values or {}) do
				local Value1 = value.name.value
				local GetResult = TypeMap:get(Value)
				
				if IsEnumTypeFunction(GetResult) and GetResult:getValue(Value1) then
					p1:reportError(GraphQLError.new(("Enum value \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(Value, Value1), value.name))
				elseif Entry[Value1] then
					p1:reportError(GraphQLError.new(("Enum value \"%s.%s\" can only be defined once."):format(Value, Value1), { Entry[Value1], value.name }))
				else
					Entry[Value1] = value.name
				end
			end
			return false
		end
		
		return {
			EnumTypeDefinition = checkValueUniqueness,
			EnumTypeExtension = checkValueUniqueness
		}
	end
}