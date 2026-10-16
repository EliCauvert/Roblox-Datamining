return function(p1, p2): number? --[[ Line: 5 | Named "find" ]]
	for i = 1, #p1 do
		if p1[i] == p2 then
			return i
		end
	end
	return nil
end