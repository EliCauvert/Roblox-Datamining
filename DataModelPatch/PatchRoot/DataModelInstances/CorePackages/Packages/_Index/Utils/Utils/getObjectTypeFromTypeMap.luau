local Parent = script.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local IsObjectTypeFunction = require(Parent.GraphQL).isObjectType
local _ = require(script.Parent.types)

return {
	getObjectTypeFromTypeMap = function(p1, p2)
		-- upvalues: Boolean (copy), IsObjectTypeFunction (copy)
		if p2 then
			local GetResult = p1:get(p2.name)
			
			if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
				return GetResult
			end
		end
		return nil
	end
}