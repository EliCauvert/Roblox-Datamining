return function(p1, p2)
	local var1 = 1
	
	if p1 ~= "" then
		for i in string.gmatch(p1, "\n") do
			var1 += 1
		end
	end
	return math.clamp(var1, 1, p2)
end