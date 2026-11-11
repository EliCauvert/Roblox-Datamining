return function(...)
	local t = {}
	local Selected = select("#", ...)
	local Flag = nil
	
	for i1, _ in pairs((select(1, ...))) do
		Flag = true
		
		for i = 2, Selected do
			if select(i, ...)[i1] ~= nil then
				continue
			end
			Flag = false
			break
		end
		if Flag then
			t[i1] = true
		end
	end
	return t
end