local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local instanceof = luauPolyfillModule.instanceof
local luauRegExpModule = require(parent.LuauRegExp)
local t = {}

local function valueMatchesCriteria(p1, p2)
	-- upvalues: array (ref), valueMatchesCriteria (ref), boolean (ref), object (ref), instanceof (ref), luauRegExpModule (ref)
	return if p1 == nil then p1 == p2 elseif array.isArray(p1) then array.isArray(p2) and array.every(p1, function(p3, p4)
		-- upvalues: valueMatchesCriteria (copy), p2 (ref)
		return valueMatchesCriteria(p3, p2[p4])
	end) elseif typeof(p1) == "table" then typeof(p2) == "table" and (boolean.toJSBoolean(p2) and array.every(object.keys(p2), function(p3)
		-- upvalues: valueMatchesCriteria (copy), p1 (ref), p2 (ref)
		return valueMatchesCriteria(p1[p3], p2[p3])
	end)) elseif instanceof(p2, luauRegExpModule) then p2:test(p1) else p1 == p2
end

t.valueMatchesCriteria = valueMatchesCriteria

return t