-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local map = require(parent.Parent.LuauPolyfill).Map
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local isEnumType = require(parent.type.definition).isEnumType

return {
	UniqueEnumValueNamesRule = function(p0) --[[ line: 25 ]]
		-- upvalues: map (ref), isEnumType (ref), graphQLError (ref)
		local schema = p0:getSchema()
		local var1 = schema and schema:getTypeMap() or map.new()
		local t = {}
		
		local function checkValueUniqueness(_, p1) --[[ line: 33 ]]
			-- upvalues: t (ref), var1 (ref), isEnumType (copy), p0 (ref), graphQLError (copy)
			local value = p1.name.value
			
			if not t[value] then
				t[value] = {}
			end
			local var4 = t[value]
			
			for i, v in ipairs(p1.values or {}) do
				local value_1 = v.name.value
				local var5 = var1:get(value)
				
				if isEnumType(var5) and var5:getValue(value_1) then
					p0:reportError(graphQLError.new(("Enum value \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(value, value_1), v.name))
				elseif var4[value_1] then
					p0:reportError(graphQLError.new(("Enum value \"%s.%s\" can only be defined once."):format(value, value_1), { var4[value_1], v.name }))
				else
					var4[value_1] = v.name
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