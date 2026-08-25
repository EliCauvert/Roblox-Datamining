local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.ObjMap)

return {
	keyMap = function(p0, p1)
		local t = {}
		
		for i, v in ipairs(p0) do
			t[p1(v)] = v
		end
		return t
	end
}