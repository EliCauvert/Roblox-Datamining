return function(p0, p1)
	local t = {}
	local var1 = 0
	
	for i = 1, #p0 do
		if i == p1 then
			var1 = 1
		else
			t[i - var1] = p0[i]
		end
	end
	return t
end