local _ = require(script.Parent.ObjMap)

return {
	toObjMap = function(List) --[[ Line: 12 ]]
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = value
		end
		return t
	end
}