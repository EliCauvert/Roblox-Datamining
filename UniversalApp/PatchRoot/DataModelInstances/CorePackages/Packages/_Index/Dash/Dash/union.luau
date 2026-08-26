local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)

return function(p1, p2)
	-- upvalues: noneModule (ref)
	local cloned = table.clone(p1)
	
	for i, v in p2 do
		if v == noneModule then
			cloned[i] = nil
		else
			cloned[i] = v
		end
	end
	return cloned
end