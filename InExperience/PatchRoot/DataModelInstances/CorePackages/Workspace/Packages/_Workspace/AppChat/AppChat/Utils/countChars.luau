local Character = utf8.char(8205)

return function(Text: string): number
	-- upvalues: Character (copy)
	if utf8.len(Text) == nil then
		return #Text
	end
	local NewLargest = 0
	
	for i, value in utf8.graphemes(Text) do
		local Count = 0
		
		for _, value1 in string.split(string.sub(Text, i, value), Character) do
			if value1 ~= "" then
				Count += 1
			end
		end
		NewLargest += math.max(Count, 1)
	end
	return NewLargest
end