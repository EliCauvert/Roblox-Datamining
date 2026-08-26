return function(p1, p2, p3)
	if not p1 then
		return false
	end
	local p0Count = #p1
	
	if p3 then
		p0Count -= 1
	end
	for i = 1, p0Count do
		if p1[i].name ~= p2 then
			continue
		end
		return true
	end
	return false
end