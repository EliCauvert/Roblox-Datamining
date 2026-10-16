return function(...) --[[ Line: 1 | Named "join" ]]
	local t = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected ~= nil then
			for i1, value in pairs(Selected) do
				t[i1] = value
			end
		end
	end
	return t
end