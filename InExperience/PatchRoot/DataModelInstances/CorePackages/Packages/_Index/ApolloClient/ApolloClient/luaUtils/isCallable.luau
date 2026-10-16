return function(p1): boolean --[[ Line: 9 | Named "isCallable" ]]
	if typeof(p1) == "function" then
		return true
	end
	if typeof(p1) == "table" then
		local Meta = getmetatable(p1)
		
		if Meta and rawget(Meta, "__call") then
			return true
		elseif p1._isMockFunction then
			return true
		end
	end
	return false
end