local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)

return function(List, Callback, p1) --[[ Line: 10 ]]
	-- upvalues: GetExpectedPartSizeModule (copy)
	local t = {}
	
	for _, value in List do
		local CallbackResult = Callback(value)
		t[value] = GetExpectedPartSizeModule(CallbackResult, p1) / GetExpectedPartSizeModule(CallbackResult, p1, true)
	end
	return t
end