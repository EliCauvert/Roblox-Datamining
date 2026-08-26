return function(p1)
	return if not (type(p1) == "function" or type(p1) ~= "table" or not getmetatable(p1)) then getmetatable(p1).__call ~= nil else true
end