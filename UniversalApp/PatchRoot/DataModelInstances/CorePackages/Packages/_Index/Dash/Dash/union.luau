local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)

return function(p0, p1) --[[ line: 14 | named "union" ]]
	-- upvalues: noneModule (ref)
	local cloned = table.clone(p0)
	
	for i, v in p1 do
		if v == noneModule then
			cloned[i] = nil
		else
			cloned[i] = v
		end
	end
	return cloned
end