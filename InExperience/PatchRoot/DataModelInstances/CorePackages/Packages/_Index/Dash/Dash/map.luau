local parent = script.Parent
local _ = require(parent.Types)
local assertEqualModule = require(parent.assertEqual)

return function(p0, p1) --[[ line: 20 | named "map" ]]
	-- upvalues: assertEqualModule (ref)
	local t = {}
	
	for i, v in p0 do
		local var2 = p1(v, i)
		assertEqualModule(var2 == nil, false, "Returned nil from a Dash.map handler")
		t[i] = var2
	end
	return t
end