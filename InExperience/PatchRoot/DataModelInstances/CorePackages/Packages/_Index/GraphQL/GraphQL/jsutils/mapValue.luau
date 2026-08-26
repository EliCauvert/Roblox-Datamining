local _ = require(script.Parent.ObjMap)

return {
	mapValue = function(p1, p2)
		local t = {}
		
		for i, v in pairs(p1) do
			t[i] = p2(v, i)
		end
		return t
	end
}