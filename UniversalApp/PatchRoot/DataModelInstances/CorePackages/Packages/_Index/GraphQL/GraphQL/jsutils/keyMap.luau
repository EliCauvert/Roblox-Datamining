local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.ObjMap)

return {
	keyMap = function(p1, p2)
		local t = {}
		
		for i, v in ipairs(p1) do
			t[p2(v)] = v
		end
		return t
	end
}