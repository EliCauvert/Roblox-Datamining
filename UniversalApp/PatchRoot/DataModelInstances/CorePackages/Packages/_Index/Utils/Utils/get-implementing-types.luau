local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local isObjectType = require(parent.GraphQL).isObjectType

function t.getImplementingTypes(p0, p1) --[[ line: 17 ]]
	-- upvalues: boolean (ref), isObjectType (ref), array (ref)
	local typeMap = p1:getTypeMap()
	local t = {}
	
	for i, v in typeMap do
		local var4 = typeMap:get(table.unpack(v))
		
		if boolean.toJSBoolean(isObjectType(var4)) and boolean.toJSBoolean(array.find(var4:getInterfaces(), function(p2) --[[ line: 36 ]]
			-- upvalues: p0 (ref)
			return p2.name == p0
		end)) then
			table.insert(t, var4.name)
		end
	end
	return t
end

return t