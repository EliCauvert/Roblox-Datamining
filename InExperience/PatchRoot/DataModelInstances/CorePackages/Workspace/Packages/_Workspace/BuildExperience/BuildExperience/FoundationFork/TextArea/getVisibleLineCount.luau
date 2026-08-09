return function(p0, p1) --[[ line: 3 | named "getVisibleLineCount" ]]
	local var0 = 1
	
	if p0 ~= "" then
		for i in string.gmatch(p0, "\n") do
			var0 += 1
		end
	end
	return math.clamp(var0, 1, p1)
end