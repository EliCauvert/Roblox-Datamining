return function(p0) --[[ line: 1 | named "parseErrorReasonToEconomicRestriction" ]]
	local parts = string.split(p0, "/")
	local partsCount = #parts
	
	return {
		timeoutMinutes = parts[partsCount],
		violationType = parts[partsCount - 1]
	}
end