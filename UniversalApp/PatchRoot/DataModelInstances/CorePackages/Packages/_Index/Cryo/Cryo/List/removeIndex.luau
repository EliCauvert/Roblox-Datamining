return function(p1, p2) --[[ Line: 4 | Named "removeIndex" ]]
	local t = {}
	local v1 = 0
	
	for i = 1, #p1 do
		if i == p2 then
			v1 = 1
		else
			t[i - v1] = p1[i]
		end
	end
	return t
end