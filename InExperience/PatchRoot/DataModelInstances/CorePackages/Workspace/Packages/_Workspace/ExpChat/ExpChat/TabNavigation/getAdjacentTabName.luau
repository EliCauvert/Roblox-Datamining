return function(p1, p2, p3)
	if #p1 < 2 then
		return nil
	end
	local cloned = table.clone(p1)
	table.sort(cloned, function(p4, p5)
		return p4.tabIndex < p5.tabIndex
	end)
	local var1 = nil
	
	for i, v in cloned do
		if v.name == p2 then
			var1 = i
			break
		end
	end
	return if var1 == nil then nil else cloned[(var1 - 1 + p3) % #cloned + 1].name
end