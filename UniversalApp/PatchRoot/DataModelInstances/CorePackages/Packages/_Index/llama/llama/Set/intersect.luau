return function(...) --[[ line: 2 | named "intersect" ]]
	local var2
	local t = {}
	local var1 = select("#", ...)
	
	for i, v in pairs(select(1, ...)) do
		var2 = true
		
		for i_1 = 2, var1 do
			if select(i_1, ...)[i] ~= nil then
				continue
			end
			var2 = false
			break
		end
		if var2 then
			t[i] = true
		end
	end
	return t
end