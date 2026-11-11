local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local IsObjectTypeFunction = require(Parent.GraphQL).isObjectType

return {
	getImplementingTypes = function(Name, p1)
		-- upvalues: Boolean (copy), IsObjectTypeFunction (copy), Array (copy)
		local TypeMap = p1:getTypeMap()
		local List = {}
		
		for _, value in TypeMap do
			local GetResult = TypeMap:get((table.unpack(value)))
			
			if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) and Boolean.toJSBoolean(Array.find(GetResult:getInterfaces(), function(p2): boolean
				-- upvalues: Name (copy)
				return p2.name == Name
			end)) then
				table.insert(List, GetResult.name)
			end
		end
		return List
	end
}