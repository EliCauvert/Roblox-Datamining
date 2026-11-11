return function(Callback): boolean
	return type(Callback) == "function" or (if type(Callback) == "table" and getmetatable(Callback) then getmetatable(Callback).__call ~= nil else false)
end