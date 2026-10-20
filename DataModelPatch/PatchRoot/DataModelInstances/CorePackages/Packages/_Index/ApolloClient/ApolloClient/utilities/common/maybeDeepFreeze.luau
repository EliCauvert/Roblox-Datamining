local MaybeDeepFreezeModule = {}
local LuauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local Array = LuauPolyfillModule.Array
require(script.Parent.Parent.globals)
local IsNonNullObjectFunction = require(script.Parent.objects).isNonNullObject

local function deepFreeze(p1)
	-- upvalues: Set (copy), IsNonNullObjectFunction (copy), Object (copy), Array (copy)
	local NewSet = Set.new({ p1 })
	
	for _, value in NewSet do
		if IsNonNullObjectFunction(value) then
			if not table.isfrozen(value) then
				Object.freeze(value)
			end
			Array.forEach(Object.keys(value), function(p2)
				-- upvalues: IsNonNullObjectFunction (upval), value (copy), NewSet (copy)
				if IsNonNullObjectFunction(value[p2]) then
					NewSet:add(value[p2])
				end
			end)
		end
	end
	return p1
end

function MaybeDeepFreezeModule.maybeDeepFreeze(p2)
	-- upvalues: deepFreeze (copy)
	if _G.__DEV__ then
		deepFreeze(p2)
	end
	return p2
end

return MaybeDeepFreezeModule