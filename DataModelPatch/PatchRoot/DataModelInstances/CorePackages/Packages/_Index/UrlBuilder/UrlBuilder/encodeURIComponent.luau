local function formatCharacter(Text: string): string
	return string.format("%%%02X", Text:byte(1, 1))
end

return function(Text: string): string
	-- upvalues: formatCharacter (copy)
	return Text:gsub("[^%w_%-%!%.%~%*%'%(%)]", formatCharacter)
end