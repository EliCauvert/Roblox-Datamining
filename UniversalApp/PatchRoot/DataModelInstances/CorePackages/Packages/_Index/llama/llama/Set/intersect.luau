return function(...)
	local var1
	local t = {}
	local var2 = select("#", ...)
	
	for i, v in pairs(select(1, ...)) do
		var1 = true
		
		for i_1 = 2, var2 do
			if select(i_1, ...)[i] ~= nil then
				continue
			end
			var1 = false
			break
		end
		if var1 then
			t[i] = true
		end
	end
	return t
end