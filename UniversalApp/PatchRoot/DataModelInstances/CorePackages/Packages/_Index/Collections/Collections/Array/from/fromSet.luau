local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	local _ = {}
	
	if not p2 then
		return table.clone(p1._array)
	end
	local t = {}
	
	for i, v in p1 do
		if p3 == nil then
			t[i] = p2(v, i)
		else
			t[i] = p2(p3, v, i)
		end
	end
	return t
end