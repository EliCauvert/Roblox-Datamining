return function(p0, p1, p2) --[[ line: 1 ]]
	if not p0 then
		return false
	end
	local p0Count = #p0
	
	if p2 then
		p0Count -= 1
	end
	for i = 1, p0Count do
		if p0[i].name ~= p1 then
			continue
		end
		return true
	end
	return false
end