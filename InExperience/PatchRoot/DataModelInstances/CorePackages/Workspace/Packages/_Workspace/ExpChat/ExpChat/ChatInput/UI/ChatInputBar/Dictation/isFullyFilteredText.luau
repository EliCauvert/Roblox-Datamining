return function(p1, Text: string): boolean
	return Text ~= p1 and (string.find(Text, "#", 1, true) ~= nil and string.find(Text, "[^#%s]") == nil)
end