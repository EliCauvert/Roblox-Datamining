return function(p1, Name, p2): boolean
	if not p1 then
		return false
	end
	local CountP0 = #p1
	
	if p2 then
		CountP0 -= 1
	end
	for i = 1, CountP0 do
		if p1[i].name == Name then
			return true
		end
	end
	return false
end