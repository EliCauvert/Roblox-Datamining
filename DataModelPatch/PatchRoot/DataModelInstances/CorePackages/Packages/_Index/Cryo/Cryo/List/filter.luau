return function(p1, Callback)
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		local v1 = p1[i]
		
		if Callback(v1, i) then
			t[Count] = v1
			Count += 1
		end
	end
	return t
end