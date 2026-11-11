return function(List, Callback, p1)
	local v1 = p1
	
	for i, value in List do
		v1 = Callback(v1, value, i)
	end
	return v1
end