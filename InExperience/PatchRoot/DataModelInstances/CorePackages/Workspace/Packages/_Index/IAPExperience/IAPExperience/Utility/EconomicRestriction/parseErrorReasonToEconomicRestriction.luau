return function(p1)
	local parts = string.split(p1, "/")
	local partsCount = #parts
	
	return {
		timeoutMinutes = parts[partsCount],
		violationType = parts[partsCount - 1]
	}
end