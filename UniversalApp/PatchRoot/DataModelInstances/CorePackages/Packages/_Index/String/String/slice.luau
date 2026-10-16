return function(Text: string, p1, p2): string --[[ Line: 16 | Named "slice" ]]
	local Length, Length2 = utf8.len(Text)
	assert(Length ~= nil, ("string `%s` has an invalid byte at position %s"):format(Text, (tostring(Length2))))
	local Number: number? = tonumber(p1)
	assert(typeof(Number) == "number", "startIndexStr should be a number")
	
	if Number + Length < 0 then
		Number = 1
	end
	if Length < Number then
		return ""
	end
	local NewLength: number = if p2 == nil then Length + 1 else tonumber(p2) or -(0 / 0)
	assert(typeof(NewLength) == "number", "lastIndexStr should convert to number")
	
	if Length < NewLength then
		NewLength = Length + 1
	end
	return (string.sub(Text, utf8.offset(Text, Number), utf8.offset(Text, NewLength) - 1))
end