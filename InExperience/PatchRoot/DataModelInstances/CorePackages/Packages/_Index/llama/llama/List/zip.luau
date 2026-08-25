return function(...)
	local t = {}
	local var1 = select("#", ...)
	local count = #select(1, ...)
	
	for i = 2, var1 do
		local count_1 = #select(i, ...)
		
		if count_1 < count then
			count = count_1
		end
	end
	for i_2 = 1, count do
		t[i_2] = {}
		
		for i_1 = 1, var1 do
			t[i_2][i_1] = select(i_1, ...)[i_2]
		end
	end
	return t
end