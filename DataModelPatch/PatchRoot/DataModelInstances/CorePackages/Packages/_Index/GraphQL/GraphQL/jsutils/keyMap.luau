local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.ObjMap)

return {
	keyMap = function(List, Callback)
		local t = {}
		
		for _, value in ipairs(List) do
			t[Callback(value)] = value
		end
		return t
	end
}