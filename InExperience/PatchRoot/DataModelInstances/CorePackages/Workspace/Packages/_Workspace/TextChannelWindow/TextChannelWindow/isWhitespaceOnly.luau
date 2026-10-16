return function(Text: string): boolean --[[ Line: 1 | Named "isWhitespaceOnly" ]]
	return string.find(Text, "%S") == nil
end