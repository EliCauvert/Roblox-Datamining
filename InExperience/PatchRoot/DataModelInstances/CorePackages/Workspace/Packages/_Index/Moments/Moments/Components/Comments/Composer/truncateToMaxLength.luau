return function(Text: string, Value: number): string
	local Largest = math.max(0, (math.floor(Value)))
	local Length = utf8.len(Text)
	
	return if Length == nil then if Largest < #Text then string.sub(Text, 1, Largest) else Text elseif Length <= Largest then Text else string.sub(Text, 1, utf8.offset(Text, Largest + 1) - 1)
end