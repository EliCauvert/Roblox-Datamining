local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local t = {}
local graphQLModule = require(parent.GraphQL)
local getNamedType = graphQLModule.getNamedType
local isObjectType = graphQLModule.isObjectType
local _ = require(script.Parent.Interfaces)
local string = luauPolyfillModule.String

function t.forEachField(p1, p2)
	-- upvalues: string (ref), getNamedType (ref), isObjectType (ref)
	local typeMap = p1:getTypeMap()
	
	for i, v in typeMap do
		local var1 = v[1]
		local var2 = typeMap:get(var1)
		
		if not string.startsWith(getNamedType(var2).name, "__") and isObjectType(var2) then
			local fields = var2:getFields()
			
			for i_1, v_1 in fields do
				local var3 = v_1[1]
				p2(fields:get(var3), var1, var3)
			end
		end
	end
end

return t