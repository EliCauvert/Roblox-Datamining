local Parent = script.Parent.Parent
local GraphQLModule = require(Parent.GraphQL)
local GetNamedTypeFunction = GraphQLModule.getNamedType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local _ = require(script.Parent.Interfaces)
local String = require(Parent.LuauPolyfill).String

return {
	forEachField = function(p1, Callback: (any, any, any) -> ())
		-- upvalues: String (copy), GetNamedTypeFunction (copy), IsObjectTypeFunction (copy)
		local TypeMap = p1:getTypeMap()
		
		for _, value in TypeMap do
			local v1 = value[1]
			local GetResult = TypeMap:get(v1)
			
			if not String.startsWith(GetNamedTypeFunction(GetResult).name, "__") and IsObjectTypeFunction(GetResult) then
				local Fields = GetResult:getFields()
				
				for _, field in Fields do
					local v2 = field[1]
					Callback(Fields:get(v2), v1, v2)
				end
			end
		end
	end
}