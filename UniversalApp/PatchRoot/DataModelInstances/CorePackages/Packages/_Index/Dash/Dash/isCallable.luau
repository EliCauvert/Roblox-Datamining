return function(Callback): boolean --[[ Line: 7 | Named "isCallable" ]]
	return type(Callback) == "function" or (if type(Callback) == "table" and getmetatable(Callback) then getmetatable(Callback).__call ~= nil else false)
end