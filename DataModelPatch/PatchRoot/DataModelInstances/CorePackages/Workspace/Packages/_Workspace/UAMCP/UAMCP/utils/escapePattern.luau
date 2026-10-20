return function(Text: string): string
	return Text:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
end