local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

return {
	compose = function(p0, p1) --[[ line: 22 ]]
		return if not (p0 ~= nil and p1 ~= nil) then if p0 == nil then p1 else p0 else { p0, p1 }
	end,
	create = function(p2) --[[ line: 31 ]]
		-- upvalues: array (ref), object (ref)
		if _G.__DEV__ then
			array.forEach(object.keys(p2), function(p3) --[[ line: 36 ]]
				-- upvalues: p2 (ref), object (copy)
				if p2[p3] then
					object.freeze(p2[p3])
				end
			end)
		end
		return p2
	end
}