local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local isObjectType = require(parent.GraphQL).isObjectType
local _ = require(script.Parent.types)

function t.getObjectTypeFromTypeMap(p1, p2)
	-- upvalues: boolean (ref), isObjectType (ref)
	if p2 then
		local name = p1:get(p2.name)
		
		return if boolean.toJSBoolean(isObjectType(name)) then name else nil
	end
end

return t