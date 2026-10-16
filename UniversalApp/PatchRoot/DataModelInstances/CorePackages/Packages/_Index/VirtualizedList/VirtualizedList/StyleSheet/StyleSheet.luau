local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object

return {
	compose = function(p1, p2) --[[ Line: 22 ]]
		return if p1 == nil or p2 == nil then if p1 == nil then p2 else p1 else { p1, p2 }
	end,
	create = function(p1) --[[ Line: 31 ]]
		-- upvalues: Array (copy), Object (copy)
		if _G.__DEV__ then
			Array.forEach(Object.keys(p1), function(p2) --[[ Line: 36 ]]
				-- upvalues: p1 (copy), Object (upval)
				if p1[p2] then
					Object.freeze(p1[p2])
				end
			end)
		end
		return p1
	end
}