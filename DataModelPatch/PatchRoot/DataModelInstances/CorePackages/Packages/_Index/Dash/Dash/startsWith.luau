return function(Text: string, Text1): boolean
	return Text:sub(1, Text1:len()) == Text1
end