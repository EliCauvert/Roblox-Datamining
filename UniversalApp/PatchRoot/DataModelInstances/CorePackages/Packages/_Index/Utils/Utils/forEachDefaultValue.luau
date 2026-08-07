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

function t.forEachDefaultValue(p0, p1) --[[ line: 26 ]]
	-- upvalues: string (ref), getNamedType (ref), boolean (ref), isObjectType (ref), isInputObjectType (ref)
	local typeMap = p0:getTypeMap()
	
	for i, v in typeMap do
		local var4 = typeMap:get(v[1])
		
		if not string.startsWith(getNamedType(var4).name, "__") then
			if boolean.toJSBoolean(isObjectType(var4)) then
				local fields = var4:getFields()
				
				for i_1, v_1 in fields do
					for i_2, v_2 in fields:get(v_1[1]).args do
						v_2.defaultValue = p1(v_2.type, v_2.defaultValue)
					end
				end
			elseif boolean.toJSBoolean(isInputObjectType(var4)) then
				local fields = var4:getFields()
				
				for i_1, v_1 in fields do
					local var7 = fields:get(v_1[1])
					var7.defaultValue = p1(var7.type, var7.defaultValue)
				end
			end
		end
	end
end

return t