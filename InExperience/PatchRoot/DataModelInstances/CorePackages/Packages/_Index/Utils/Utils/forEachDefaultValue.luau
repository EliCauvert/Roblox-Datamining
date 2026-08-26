local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local t = {}
local graphQLModule = require(parent.GraphQL)
local getNamedType = graphQLModule.getNamedType
local isObjectType = graphQLModule.isObjectType
local isInputObjectType = graphQLModule.isInputObjectType
local _ = require(script.Parent.Interfaces)
local string = luauPolyfillModule.String

function t.forEachDefaultValue(p1, p2)
	-- upvalues: string (ref), getNamedType (ref), boolean (ref), isObjectType (ref), isInputObjectType (ref)
	local typeMap = p1:getTypeMap()
	
	for i, v in typeMap do
		local var1 = typeMap:get(v[1])
		
		if not string.startsWith(getNamedType(var1).name, "__") then
			if boolean.toJSBoolean(isObjectType(var1)) then
				local fields = var1:getFields()
				
				for i_1, v_1 in fields do
					for i_2, v_2 in fields:get(v_1[1]).args do
						v_2.defaultValue = p2(v_2.type, v_2.defaultValue)
					end
				end
			elseif boolean.toJSBoolean(isInputObjectType(var1)) then
				local fields = var1:getFields()
				
				for i_1, v_1 in fields do
					local var2 = fields:get(v_1[1])
					var2.defaultValue = p2(var2.type, var2.defaultValue)
				end
			end
		end
	end
end

return t