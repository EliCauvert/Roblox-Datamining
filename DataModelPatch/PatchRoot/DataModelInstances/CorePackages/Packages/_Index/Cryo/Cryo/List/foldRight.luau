return function(p1, Callback, p2)
	local v1 = p2
	
	for i = #p1, 1, -1 do
		v1 = Callback(v1, p1[i], i)
	end
	return v1
end