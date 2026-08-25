return function(p0)
	local parts = string.split(p0, "/")
	local partsCount = #parts
	
	return {
		timeoutMinutes = parts[partsCount],
		violationType = parts[partsCount - 1]
	}
end