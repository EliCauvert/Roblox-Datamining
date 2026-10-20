local _ = require(script.Parent.Types)
local InsertFunction = table.insert

return function(List, Callback)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for i, value in List do
		local CallbackResult = if typeof(Callback) == "function" then Callback(value, i) else value[Callback]
		
		if CallbackResult ~= nil then
			if t[CallbackResult] == nil then
				t[CallbackResult] = { value }
			else
				InsertFunction(t[CallbackResult], value)
			end
		end
	end
	return t
end