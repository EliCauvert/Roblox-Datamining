return function(p1, p2)
	local t = {}
	local var1 = 1
	
	for i = 1, #p1 do
		if p1[i] ~= p2 then
			t[var1] = p1[i]
			var1 += 1
		end
	end
	return t
end