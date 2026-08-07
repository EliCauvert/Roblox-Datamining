local noneModule = require(script.Parent.Parent.None)

return function(...) --[[ line: 4 | named "join" ]]
	-- upvalues: noneModule (ref)
	local t = {}
	local var2 = 1
	
	for i_1 = 1, select("#", ...) do
		local var3 = select(i_1, ...)
		
		if not var3 then
			continue
		end
		for i = 1, #var3 do
			if var3[i] ~= noneModule then
				t[var2] = var3[i]
				var2 += 1
			end
		end
	end
	return t
end