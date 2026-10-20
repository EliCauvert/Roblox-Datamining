return function(Text: string): boolean
	return string.sub(Text, 1, 7) == "Enabled" or Text == "AllUsers"
end