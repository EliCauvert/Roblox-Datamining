local _ = require(script.Parent.ObjMap)

return {
	mapValue = function(p0, p1) --[[ line: 15 ]]
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = p1(v, i)
		end
		return t
	end
}