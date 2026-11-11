local _ = require(script.Parent.Types)
local InsertFunction = table.insert

return function(List, Callback)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for i, value in List do
		local CallbackResult = Callback(i, value)
		
		if CallbackResult ~= nil then
			InsertFunction(t, CallbackResult)
		end
	end
	return t
end