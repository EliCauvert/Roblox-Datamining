return function(p1)
	if typeof(p1) == "Font" then
		return true
	end
	return false, `expected Font, got {p1}`
end