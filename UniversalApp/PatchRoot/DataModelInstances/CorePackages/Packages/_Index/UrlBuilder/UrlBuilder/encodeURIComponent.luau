local function formatCharacter(p1)
	return string.format("%%%02X", p1:byte(1, 1))
end

return function(p1)
	-- upvalues: formatCharacter (ref)
	return p1:gsub("[^%w_%-%!%.%~%*%'%(%)]", formatCharacter)
end