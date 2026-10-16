return function(p1) --[[ Line: 5 ]]
	if typeof(p1) == "Font" then
		return true
	else
		return false, `expected Font, got {p1}`
	end
end