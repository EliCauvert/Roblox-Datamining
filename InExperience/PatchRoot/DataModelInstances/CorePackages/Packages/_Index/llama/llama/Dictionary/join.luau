local NoneModule = require(script.Parent.Parent.None)

return function(...)
	-- upvalues: NoneModule (copy)
	local NoneModules = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected then
			for i1, value in pairs(Selected) do
				if value == NoneModule then
					NoneModules[i1] = nil
				else
					NoneModules[i1] = value
				end
			end
		end
	end
	return NoneModules
end