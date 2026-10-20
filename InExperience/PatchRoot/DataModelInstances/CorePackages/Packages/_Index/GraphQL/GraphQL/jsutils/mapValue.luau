local _ = require(script.Parent.ObjMap)

return {
	mapValue = function(List, Callback)
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = Callback(value, i)
		end
		return t
	end
}