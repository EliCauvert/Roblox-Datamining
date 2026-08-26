return function(p1)
	return if typeof(p1) == "table" and p1.errorMessage then `HTTP {tostring(p1.responseCode)}: {p1.errorMessage}` else tostring(p1)
end