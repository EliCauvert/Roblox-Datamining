return function(p0, p1)
	local var0 = type(p1)
	assert(var0 == "function", "expected a function for second argument, got " .. var0)
	
	for i, v in pairs(p0) do
		if p1(v, i) then
			return true
		end
	end
	return false
end