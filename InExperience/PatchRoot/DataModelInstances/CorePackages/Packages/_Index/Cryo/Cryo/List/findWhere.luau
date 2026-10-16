return function(p1, Callback): number? --[[ Line: 5 | Named "findWhere" ]]
	for i = 1, #p1 do
		if Callback(p1[i], i) then
			return i
		end
	end
	return nil
end