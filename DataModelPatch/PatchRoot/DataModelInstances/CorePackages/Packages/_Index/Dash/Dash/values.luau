local _ = require(script.Parent.Types)
local InsertFunction = table.insert

return function(List)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for _, value in List do
		InsertFunction(t, value)
	end
	return t
end