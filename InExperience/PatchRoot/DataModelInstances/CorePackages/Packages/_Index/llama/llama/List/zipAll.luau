local NoneModule = require(script.Parent.Parent.None)

return function(...) --[[ Line: 4 | Named "zipAll" ]]
	-- upvalues: NoneModule (copy)
	local t = {}
	local Selected = select("#", ...)
	local Count = #select(1, ...)
	
	for i = 2, Selected do
		local Count1 = #select(i, ...)
		
		if Count < Count1 then
			Count = Count1
		end
	end
	for i1 = 1, Count do
		t[i1] = {}
		
		for i2 = 1, Selected do
			if select(i2, ...)[i1] == nil then
				t[i1][i2] = NoneModule
			else
				t[i1][i2] = select(i2, ...)[i1]
			end
		end
	end
	return t
end