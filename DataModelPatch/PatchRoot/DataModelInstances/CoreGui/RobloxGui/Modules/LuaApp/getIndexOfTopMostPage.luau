return function(Name, p1): number?
	local v1 = p1[#p1]
	
	if not v1 then return end
	for i = #v1, 1, -1 do
		if v1[i].name == Name then
			return i
		end
	end
end