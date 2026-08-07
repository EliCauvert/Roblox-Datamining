return function(p0) --[[ line: 9 | named "isCallable" ]]
	return if not (type(p0) == "function" or type(p0) ~= "table" or not getmetatable(p0)) then getmetatable(p0).__call ~= nil else true
end