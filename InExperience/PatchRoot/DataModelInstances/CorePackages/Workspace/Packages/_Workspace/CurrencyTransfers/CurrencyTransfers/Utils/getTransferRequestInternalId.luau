return function(p0)
	return if p0 == nil or p0 == "" then "" elseif #p0 >= 4 and string.lower(string.sub(p0, 1, 4)) == "rxt-" then string.sub(p0, 5) else p0
end