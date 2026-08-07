local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 25 ]]
	local _ = {}
	local p0Count = #p0
	local list = table.create(p0Count)
	
	if p1 then
		for i = 1, p0Count do
			if p2 == nil then
				list[i] = p1(string.sub(p0, i, i), i)
			else
				list[i] = p1(p2, string.sub(p0, i, i), i)
			end
		end
		return list
	else
		for i_1 = 1, p0Count do
			list[i_1] = string.sub(p0, i_1, i_1)
		end
		return list
	end
end