local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local InstanceofFunction = LuauPolyfillModule.instanceof
local LuauRegExpModule = require(Parent.LuauRegExp)

local function valueMatchesCriteria(p1, p2)
	-- upvalues: Array (copy), valueMatchesCriteria (copy), Boolean (copy), Object (copy), InstanceofFunction (copy), LuauRegExpModule (copy)
	return if p1 == nil then p1 == p2 elseif Array.isArray(p1) then Array.isArray(p2) and Array.every(p1, function(p3, p4)
		-- upvalues: valueMatchesCriteria (upval), p2 (copy)
		return valueMatchesCriteria(p3, p2[p4])
	end) elseif typeof(p1) == "table" then typeof(p2) == "table" and (Boolean.toJSBoolean(p2) and Array.every(Object.keys(p2), function(p3)
		-- upvalues: valueMatchesCriteria (upval), p1 (copy), p2 (copy)
		return valueMatchesCriteria(p1[p3], p2[p3])
	end)) elseif InstanceofFunction(p2, LuauRegExpModule) then p2:test(p1) else p1 == p2
end

return { valueMatchesCriteria = valueMatchesCriteria }