return function(p1)
	if typeof(p1) == "function" then
		return true
	elseif typeof(p1) == "table" then
		local var1 = getmetatable(p1)
		
		return if var1 and rawget(var1, "__call") then true else p1._isMockFunction
	end
end