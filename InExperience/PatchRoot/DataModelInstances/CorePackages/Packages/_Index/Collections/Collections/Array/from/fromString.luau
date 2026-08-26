local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	local _ = {}
	local p0Count = #p1
	local list = table.create(p0Count)
	
	if p2 then
		for i = 1, p0Count do
			if p3 == nil then
				list[i] = p2(string.sub(p1, i, i), i)
			else
				list[i] = p2(p3, string.sub(p1, i, i), i)
			end
		end
		return list
	else
		for i_1 = 1, p0Count do
			list[i_1] = string.sub(p1, i_1, i_1)
		end
		return list
	end
end