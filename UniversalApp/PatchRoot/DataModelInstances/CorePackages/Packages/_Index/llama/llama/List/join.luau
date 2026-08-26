local noneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: noneModule (ref)
	local t = {}
	local var1 = 1
	
	for i_1 = 1, select("#", ...) do
		local var2 = select(i_1, ...)
		
		if not var2 then
			continue
		end
		for i = 1, #var2 do
			if var2[i] ~= noneModule then
				t[var1] = var2[i]
				var1 += 1
			end
		end
	end
	return t
end