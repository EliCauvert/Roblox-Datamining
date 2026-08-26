return function(p1, p2)
	local t = {}
	local var1 = 0
	
	for i = 1, #p1 do
		if i == p2 then
			var1 = 1
		else
			t[i - var1] = p1[i]
		end
	end
	return t
end