return function(p1, p2)
	if #p1 <= 1 then
		return { p2 }
	end
	local t = {}
	
	for i, v in p1 do
		if v ~= p2 then
			table.insert(t, v)
		end
	end
	return if #t == 0 then { p2 } else t
end