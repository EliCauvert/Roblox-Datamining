local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 25 ]]
	local _ = {}
	
	if not p1 then
		return table.clone(p0._array)
	end
	local t = {}
	
	for i, v in p0 do
		if p2 == nil then
			t[i] = p1(v, i)
		else
			t[i] = p1(p2, v, i)
		end
	end
	return t
end