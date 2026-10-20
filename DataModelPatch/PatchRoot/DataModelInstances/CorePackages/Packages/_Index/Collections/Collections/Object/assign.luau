local Parent = script.Parent
local NoneModule = require(Parent.None)
local _ = require(Parent.Parent.Parent.ES7Types)

return function(NoneModules, List, List1, List2, ...)
	-- upvalues: NoneModule (copy)
	if List ~= nil and typeof(List) == "table" then
		for i, value in pairs(List) do
			if value == NoneModule then
				NoneModules[i] = nil
			else
				NoneModules[i] = value
			end
		end
	end
	if List1 ~= nil and typeof(List1) == "table" then
		for i1, value1 in pairs(List1) do
			if value1 == NoneModule then
				NoneModules[i1] = nil
			else
				NoneModules[i1] = value1
			end
		end
	end
	if List2 ~= nil and typeof(List2) == "table" then
		for i3, value2 in pairs(List2) do
			if value2 == NoneModule then
				NoneModules[i3] = nil
			else
				NoneModules[i3] = value2
			end
		end
	end
	for i2 = 1, select("#", ...) do
		local Selected = select(i2, ...)
		
		if Selected ~= nil and typeof(Selected) == "table" then
			for i4, value3 in pairs(Selected) do
				if value3 == NoneModule then
					NoneModules[i4] = nil
				else
					NoneModules[i4] = value3
				end
			end
		end
	end
	return NoneModules
end