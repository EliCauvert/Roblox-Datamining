local NoneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: NoneModule (copy)
	local Selected = select("#", ...)
	
	if Selected == 0 then
		return {}
	end
	if Selected == 1 then
		local Copy = table.clone(...)
		setmetatable(Copy, nil)
		
		return Copy
	end
	local Copy = table.clone(select(1, ...))
	setmetatable(Copy, nil)
	
	for i = 2, Selected do
		for i1, value in pairs((select(i, ...))) do
			if value == NoneModule then
				Copy[i1] = nil
			else
				Copy[i1] = value
			end
		end
	end
	return Copy
end