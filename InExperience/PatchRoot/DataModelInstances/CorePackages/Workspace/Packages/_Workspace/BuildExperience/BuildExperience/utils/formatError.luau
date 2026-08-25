return function(p0)
	return if typeof(p0) == "table" and p0.errorMessage then `HTTP {tostring(p0.responseCode)}: {p0.errorMessage}` else tostring(p0)
end