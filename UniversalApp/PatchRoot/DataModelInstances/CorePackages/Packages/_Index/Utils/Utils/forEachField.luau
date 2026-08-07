local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local t = {}
local graphQLModule = require(parent.GraphQL)
local getNamedType = graphQLModule.getNamedType
local isObjectType = graphQLModule.isObjectType
local _ = require(script.Parent.Interfaces)
local string = luauPolyfillModule.String

function t.forEachField(p0, p1) --[[ line: 25 ]]
	-- upvalues: string (ref), getNamedType (ref), isObjectType (ref)
	local typeMap = p0:getTypeMap()
	
	for i, v in typeMap do
		local var4 = v[1]
		local var5 = typeMap:get(var4)
		
		if not string.startsWith(getNamedType(var5).name, "__") and isObjectType(var5) then
			local fields = var5:getFields()
			
			for i_1, v_1 in fields do
				local var7 = v_1[1]
				p1(fields:get(var7), var4, var7)
			end
		end
	end
end

return t