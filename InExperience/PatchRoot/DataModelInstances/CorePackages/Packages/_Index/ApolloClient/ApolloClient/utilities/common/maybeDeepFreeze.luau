local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local array = luauPolyfillModule.Array
require(script.Parent.Parent.globals)
local isNonNullObject = require(script.Parent.objects).isNonNullObject

local function deepFreeze(p1)
	-- upvalues: set (ref), isNonNullObject (ref), object (ref), array (ref)
	local var1 = set.new({ p1 })
	
	for i, v in var1 do
		if isNonNullObject(v) then
			if not table.isfrozen(v) then
				object.freeze(v)
			end
			array.forEach(object.keys(v), function(p2)
				-- upvalues: isNonNullObject (copy), v (ref), var1 (ref)
				if isNonNullObject(v[p2]) then
					var1:add(v[p2])
				end
			end)
		end
	end
	return p1
end

function t.maybeDeepFreeze(p2)
	-- upvalues: deepFreeze (ref)
	if _G.__DEV__ then
		deepFreeze(p2)
	end
	return p2
end

return t