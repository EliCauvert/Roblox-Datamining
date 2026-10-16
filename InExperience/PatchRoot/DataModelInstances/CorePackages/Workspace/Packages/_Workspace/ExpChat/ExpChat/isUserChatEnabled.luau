return function(Text: string): boolean --[[ Line: 4 ]]
	return string.sub(Text, 1, 7) == "Enabled" or Text == "AllUsers"
end