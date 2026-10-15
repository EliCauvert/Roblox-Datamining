return function(p1)
	if utf8.len(p1) == nil then
		return #p1
	end
	local var1 = 0
	
	for i, v in utf8.codes(p1) do
		var1 += if v > 65535 then 2 else 1
	end
	return var1
end