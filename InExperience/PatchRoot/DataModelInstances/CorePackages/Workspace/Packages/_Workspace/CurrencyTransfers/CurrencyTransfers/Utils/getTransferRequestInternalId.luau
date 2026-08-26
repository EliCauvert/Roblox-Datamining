return function(p1)
	return if p1 == nil or p1 == "" then "" elseif #p1 >= 4 and string.lower(string.sub(p1, 1, 4)) == "rxt-" then string.sub(p1, 5) else p1
end