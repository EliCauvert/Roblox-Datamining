return function(p0) --[[ line: 1 | named "isWhitespaceOnly" ]]
	return string.find(p0, "%S") == nil
end