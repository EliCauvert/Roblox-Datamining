return function(Text: string): boolean
	return Text ~= nil and Text ~= "" and string.match(Text, "^.+@.+%..+$") ~= nil
end