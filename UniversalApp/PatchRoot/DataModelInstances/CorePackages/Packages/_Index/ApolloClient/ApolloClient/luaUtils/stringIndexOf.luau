return {
	stringIndexOf = function(p0, p1) --[[ line: 11 ]]
		local matchIndex, _ = string.find(p0, p1)
		
		return if matchIndex == nil then -1 else matchIndex
	end
}