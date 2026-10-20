return function(Text: string, Text1): boolean
	return Text:sub(-Text1:len()) == Text1
end