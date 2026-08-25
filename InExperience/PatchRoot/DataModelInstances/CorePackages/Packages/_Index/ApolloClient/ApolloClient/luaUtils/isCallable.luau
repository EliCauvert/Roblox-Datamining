return function(p0)
	if typeof(p0) == "function" then
		return true
	elseif typeof(p0) == "table" then
		local var0 = getmetatable(p0)
		
		return if var0 and rawget(var0, "__call") then true else p0._isMockFunction
	end
end