return function(p1)
	local t = {}
	
	if p1 ~= nil and p1.errors ~= nil and p1.errors[1] and p1.errors[1].fieldData then
		local Count = 0
		
		for i in string.gmatch(p1.errors[1].fieldData, "([^,]+)") do
			t[Count] = i
			Count += 1
		end
	end
	if #t >= 1 then
		return t[0], t[1]
	elseif #t == 0 and t[0] ~= nil then
		return "", t[0]
	else
		return "", ""
	end
end