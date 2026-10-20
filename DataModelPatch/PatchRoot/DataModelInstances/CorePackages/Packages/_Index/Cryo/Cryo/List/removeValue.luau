return function(p1, p2)
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		if p1[i] ~= p2 then
			t[Count] = p1[i]
			Count += 1
		end
	end
	return t
end