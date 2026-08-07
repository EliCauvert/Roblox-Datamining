return function(p0) --[[ line: 5 | named "processSoftBreaks" ]]
	return p0:gsub("%s*[\r\n]%s*", " ")
end