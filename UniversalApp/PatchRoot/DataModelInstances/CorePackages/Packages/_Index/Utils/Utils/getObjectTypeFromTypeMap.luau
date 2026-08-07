local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local isObjectType = require(parent.GraphQL).isObjectType
local _ = require(script.Parent.types)

function t.getObjectTypeFromTypeMap(p0, p1) --[[ line: 26 ]]
	-- upvalues: boolean (ref), isObjectType (ref)
	if p1 then
		local name = p0:get(p1.name)
		
		return if boolean.toJSBoolean(isObjectType(name)) then name else nil
	end
end

return t