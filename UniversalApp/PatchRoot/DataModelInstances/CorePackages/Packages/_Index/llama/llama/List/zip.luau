return function(...)
	local t = {}
	local Selected = select("#", ...)
	local Count = #select(1, ...)
	
	for i = 2, Selected do
		local Count1 = #select(i, ...)
		
		if Count1 < Count then
			Count = Count1
		end
	end
	for i1 = 1, Count do
		t[i1] = {}
		
		for i2 = 1, Selected do
			t[i1][i2] = select(i2, ...)[i1]
		end
	end
	return t
end