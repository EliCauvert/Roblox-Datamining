local Parent = script.Parent
local NoneModule = require(Parent.None)
local _ = require(Parent.Types)

return function(Tbl, List) --[[ Line: 14 | Named "union" ]]
	-- upvalues: NoneModule (copy)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		if value == NoneModule then
			Copy[i] = nil
		else
			Copy[i] = value
		end
	end
	return Copy
end