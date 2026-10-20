return function(Text: string): boolean
	return type(Text) == "string" and Text ~= "00000000-0000-0000-0000-000000000000" and Text == string.lower(Text) and string.match(Text, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
end