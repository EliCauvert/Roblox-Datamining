return function(p0, p1)
	if #p0 <= 1 then
		return { p1 }
	end
	local t = {}
	
	for i, v in p0 do
		if v ~= p1 then
			table.insert(t, v)
		end
	end
	return if #t == 0 then { p1 } else t
end