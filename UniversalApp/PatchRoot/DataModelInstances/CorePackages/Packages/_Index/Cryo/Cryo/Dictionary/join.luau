local noneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: noneModule (ref)
	local var1 = select("#", ...)
	
	if var1 == 0 then
		return {}
	elseif var1 == 1 then
		local cloned = table.clone(...)
		setmetatable(cloned, nil)
		
		return cloned
	end
	local cloned = table.clone(select(1, ...))
	setmetatable(cloned, nil)
	
	for i_1 = 2, var1 do
		for i, v in pairs(select(i_1, ...)) do
			if v == noneModule then
				cloned[i] = nil
			else
				cloned[i] = v
			end
		end
	end
	return cloned
end