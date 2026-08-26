local noneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: noneModule (ref)
	local t = {}
	
	for i_1 = 1, select("#", ...) do
		local var1 = select(i_1, ...)
		local tCount = #t
		
		for i = 1, #var1 do
			if var1[i] == noneModule then
				tCount -= 1
			else
				t[tCount + i] = var1[i]
			end
		end
	end
	return t
end