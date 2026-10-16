local NoneModule = require(script.Parent.Parent.None)

return function(...) --[[ Line: 4 | Named "join" ]]
	-- upvalues: NoneModule (copy)
	local t = {}
	local Count = 1
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected then
			for i1 = 1, #Selected do
				if Selected[i1] ~= NoneModule then
					t[Count] = Selected[i1]
					Count += 1
				end
			end
		end
	end
	return t
end