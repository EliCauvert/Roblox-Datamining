local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local GraphQLModule = require(Parent.GraphQL)
local GetNamedTypeFunction = GraphQLModule.getNamedType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local _ = require(script.Parent.Interfaces)
local String = LuauPolyfillModule.String

return {
	forEachDefaultValue = function(p1, Callback) --[[ Line: 26 ]]
		-- upvalues: String (copy), GetNamedTypeFunction (copy), Boolean (copy), IsObjectTypeFunction (copy), IsInputObjectTypeFunction (copy)
		local TypeMap = p1:getTypeMap()
		
		for _, value in TypeMap do
			local GetResult = TypeMap:get(value[1])
			
			if not String.startsWith(GetNamedTypeFunction(GetResult).name, "__") then
				if not Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
					if Boolean.toJSBoolean(IsInputObjectTypeFunction(GetResult)) then
						local Fields = GetResult:getFields()
						
						for _, field1 in Fields do
							local GetResult1 = Fields:get(field1[1])
							GetResult1.defaultValue = Callback(GetResult1.type, GetResult1.defaultValue)
						end
					end
					continue
				end
				local Fields = GetResult:getFields()
				
				for _, field in Fields do
					for _, arg in Fields:get(field[1]).args do
						arg.defaultValue = Callback(arg.type, arg.defaultValue)
					end
				end
			end
		end
	end
}