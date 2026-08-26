local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local isObjectType = require(parent.GraphQL).isObjectType

function t.getImplementingTypes(p1, p2)
	-- upvalues: boolean (ref), isObjectType (ref), array (ref)
	local typeMap = p2:getTypeMap()
	local t = {}
	
	for i, v in typeMap do
		local var1 = typeMap:get(table.unpack(v))
		
		if boolean.toJSBoolean(isObjectType(var1)) and boolean.toJSBoolean(array.find(var1:getInterfaces(), function(p3)
			-- upvalues: p1 (ref)
			return p3.name == p1
		end)) then
			table.insert(t, var1.name)
		end
	end
	return t
end

return t