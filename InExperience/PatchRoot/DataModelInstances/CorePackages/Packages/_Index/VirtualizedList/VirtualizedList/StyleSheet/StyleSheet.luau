local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

return {
	compose = function(p1, p2)
		return if not (p1 ~= nil and p2 ~= nil) then if p1 == nil then p2 else p1 else { p1, p2 }
	end,
	create = function(p1)
		-- upvalues: array (ref), object (ref)
		if _G.__DEV__ then
			array.forEach(object.keys(p1), function(p2)
				-- upvalues: p1 (ref), object (copy)
				if p1[p2] then
					object.freeze(p1[p2])
				end
			end)
		end
		return p1
	end
}