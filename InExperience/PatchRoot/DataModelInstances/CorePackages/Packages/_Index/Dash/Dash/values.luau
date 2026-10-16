local _ = require(script.Parent.Types)
local InsertFunction = table.insert

return function(List) --[[ Line: 14 | Named "values" ]]
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for _, value in List do
		InsertFunction(t, value)
	end
	return t
end