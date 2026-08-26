return {
	stringIndexOf = function(p1, p2)
		local matchIndex, _ = string.find(p1, p2)
		
		return if matchIndex == nil then -1 else matchIndex
	end
}