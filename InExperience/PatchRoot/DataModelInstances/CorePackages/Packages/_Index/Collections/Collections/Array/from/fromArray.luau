local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	local _ = {}
	
	if not p2 then
		return table.clone(p1)
	end
	local p0Count = #p1
	local list = table.create(p0Count)
	
	for i = 1, p0Count do
		if p3 == nil then
			list[i] = p2(p1[i], i)
		else
			list[i] = p2(p3, p1[i], i)
		end
	end
	return list
end