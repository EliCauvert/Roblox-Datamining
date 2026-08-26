local parent = script.Parent
local _ = require(parent.Types)
local assertEqualModule = require(parent.assertEqual)

return function(p1, p2)
	-- upvalues: assertEqualModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = p2(v, i)
		assertEqualModule(var1 == nil, false, "Returned nil from a Dash.map handler")
		t[i] = var1
	end
	return t
end