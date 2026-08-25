return function(p0)
	if typeof(p0) ~= "table" then
		return false
	elseif next(p0) == nil then
		return true
	elseif #p0 == 0 then
		return false
	end
	local var0 = 0
	local var1 = 0
	
	for i in pairs(p0) do
		if typeof(i) == "number" then
			if i % 1 == 0 and i >= 1 then
				var0 += 1
				var1 += i
				continue
			end
			return false
		end
		return false
	end
	return var1 == var0 * (var0 + 1) / 2
end