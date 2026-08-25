local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)

return function(p0, p1, p2)
	-- upvalues: getExpectedPartSizeModule (ref)
	local t = {}
	
	for i, v in p0 do
		local var2 = p1(v)
		t[v] = getExpectedPartSizeModule(var2, p2) / getExpectedPartSizeModule(var2, p2, true)
	end
	return t
end