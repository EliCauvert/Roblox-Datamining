local function formatCharacter(p0)
	return string.format("%%%02X", p0:byte(1, 1))
end

return function(p1)
	-- upvalues: formatCharacter (ref)
	return p1:gsub("[^%w_%-%!%.%~%*%'%(%)]", formatCharacter)
end