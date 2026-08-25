return function(...)
	local var0 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if var0 == select(i, ...) then
			continue
		end
		return false
	end
	return true
end