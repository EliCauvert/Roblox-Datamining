return function(...) --[[ line: 1 | named "join" ]]
	local t = {}
	
	for i = 1, select("#", ...) do
		local var1 = select(i, ...)
		
		if var1 == nil then
			continue
		end
		for i, v in pairs(var1) do
			t[i] = v
		end
	end
	return t
end