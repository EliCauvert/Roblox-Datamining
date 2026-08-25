return function(p0)
	return if not (type(p0) == "function" or type(p0) ~= "table" or not getmetatable(p0)) then getmetatable(p0).__call ~= nil else true
end