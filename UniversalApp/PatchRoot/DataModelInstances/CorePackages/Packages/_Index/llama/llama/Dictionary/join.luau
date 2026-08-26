local noneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: noneModule (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var1 = select(i, ...)
		
		if not var1 then
			continue
		end
		for i, v in pairs(var1) do
			if v == noneModule then
				t[i] = nil
			else
				t[i] = v
			end
		end
	end
	return t
end