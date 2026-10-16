return {
	stringIndexOf = function(Text: string, Pattern) --[[ Line: 11 ]]
		local StartIndex, _ = string.find(Text, Pattern)
		
		return if StartIndex == nil then -1 else StartIndex
	end
}