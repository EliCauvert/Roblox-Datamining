return function(...)
	local var1 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if var1 == select(i, ...) then
			continue
		end
		return false
	end
	return true
end