local NoneModule = require(script.Parent.Parent.None)

return function(...) --[[ Line: 6 | Named "join" ]]
	-- upvalues: NoneModule (copy)
	local t = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		local CountT = #t
		
		for i1 = 1, #Selected do
			if Selected[i1] == NoneModule then
				CountT -= 1
			else
				t[CountT + i1] = Selected[i1]
			end
		end
	end
	return t
end