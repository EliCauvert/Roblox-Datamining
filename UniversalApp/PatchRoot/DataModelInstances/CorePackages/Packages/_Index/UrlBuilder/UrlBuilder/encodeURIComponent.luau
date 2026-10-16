local function formatCharacter(Text: string): string --[[ Line: 1 ]]
	return string.format("%%%02X", Text:byte(1, 1))
end

return function(Text: string): string --[[ Line: 5 ]]
	-- upvalues: formatCharacter (copy)
	return Text:gsub("[^%w_%-%!%.%~%*%'%(%)]", formatCharacter)
end