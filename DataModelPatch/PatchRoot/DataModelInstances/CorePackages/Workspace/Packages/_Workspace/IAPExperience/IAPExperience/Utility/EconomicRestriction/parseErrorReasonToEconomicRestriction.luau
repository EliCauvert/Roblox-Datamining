return function(Text: string)
	local Parts = string.split(Text, "/")
	local CountParts = #Parts
	
	return {
		timeoutMinutes = Parts[CountParts],
		violationType = Parts[CountParts - 1]
	}
end