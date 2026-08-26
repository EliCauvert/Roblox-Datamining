return function(p1, p2)
	local var1 = type(p2)
	assert(var1 == "function", "expected a function for second argument, got " .. var0)
	
	for i, v in pairs(p1) do
		if p2(v, i) then
			return true
		end
	end
	return false
end