return function(p1)
	if typeof(p1) ~= "table" then
		return false
	elseif next(p1) == nil then
		return true
	elseif #p1 == 0 then
		return false
	end
	local var1 = 0
	local var2 = 0
	
	for i in pairs(p1) do
		if typeof(i) == "number" then
			if i % 1 == 0 and i >= 1 then
				var1 += 1
				var2 += i
				continue
			end
			return false
		end
		return false
	end
	return var2 == var1 * (var1 + 1) / 2
end