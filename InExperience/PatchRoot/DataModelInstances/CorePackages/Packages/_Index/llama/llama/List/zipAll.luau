local noneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: noneModule (ref)
	local t = {}
	local var2 = select("#", ...)
	local count = #select(1, ...)
	
	for i = 2, var2 do
		local count_1 = #select(i, ...)
		
		if count < count_1 then
			count = count_1
		end
	end
	for i_2 = 1, count do
		t[i_2] = {}
		
		for i_1 = 1, var2 do
			if select(i_1, ...)[i_2] == nil then
				t[i_2][i_1] = noneModule
			else
				t[i_2][i_1] = select(i_1, ...)[i_2]
			end
		end
	end
	return t
end