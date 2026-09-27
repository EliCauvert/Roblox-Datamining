return function(p1)
	return type(p1) == "string" and p1 ~= "00000000-0000-0000-0000-000000000000" and p1 == string.lower(p1) and string.match(p1, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
end