local _ = require(script.Parent.ObjMap)

return {
	mapValue = function(List, Callback) --[[ Line: 15 ]]
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = Callback(value, i)
		end
		return t
	end
}