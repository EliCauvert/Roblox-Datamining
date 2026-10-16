return function(p1): boolean --[[ Line: 3 | Named "isLoggedOutUserId" ]]
	return p1 == nil or (p1 == "" or (p1 == "-1" or p1 == "0"))
end