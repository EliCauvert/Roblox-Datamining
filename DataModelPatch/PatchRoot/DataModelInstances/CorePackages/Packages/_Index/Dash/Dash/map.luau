local Parent = script.Parent
local _ = require(Parent.Types)
local AssertEqualModule = require(Parent.assertEqual)

return function(List, Callback)
	-- upvalues: AssertEqualModule (copy)
	local t = {}
	
	for i, value in List do
		local CallbackResult = Callback(value, i)
		AssertEqualModule(CallbackResult == nil, false, "Returned nil from a Dash.map handler")
		t[i] = CallbackResult
	end
	return t
end