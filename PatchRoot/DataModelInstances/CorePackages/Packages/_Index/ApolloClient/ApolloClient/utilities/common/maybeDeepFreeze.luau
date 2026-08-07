-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local array = luauPolyfillModule.Array
require(script.Parent.Parent.globals)
local isNonNullObject = require(script.Parent.objects).isNonNullObject

local function deepFreeze(p0) --[[ line: 22 ]]
	-- upvalues: set (ref), isNonNullObject (ref), object (ref), array (ref)
	local var3 = set.new({ p0 })
	
	for i, v in var3 do
		if isNonNullObject(v) then
			if not table.isfrozen(v) then
				object.freeze(v)
			end
			array.forEach(object.keys(v), function(p1) --[[ line: 30 ]]
				-- upvalues: isNonNullObject (copy), v (ref), var3 (ref)
				if isNonNullObject(v[p1]) then
					var3:add(v[p1])
				end
			end)
		end
	end
	return p0
end

function t.maybeDeepFreeze(p2) --[[ line: 41 ]]
	-- upvalues: deepFreeze (ref)
	if _G.__DEV__ then
		deepFreeze(p2)
	end
	return p2
end

return t