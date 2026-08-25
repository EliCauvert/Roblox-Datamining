local _ = require(script.Parent.ObjMap)

return {
	toObjMap = function(p0)
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = v
		end
		return t
	end
}