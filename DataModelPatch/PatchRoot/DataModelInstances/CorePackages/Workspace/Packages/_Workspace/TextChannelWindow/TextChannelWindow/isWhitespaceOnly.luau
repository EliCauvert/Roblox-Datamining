return function(Text: string): boolean
	return string.find(Text, "%S") == nil
end