local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)

return function(p1, p2, p3)
	-- upvalues: getExpectedPartSizeModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = p2(v)
		t[v] = getExpectedPartSizeModule(var1, p3) / getExpectedPartSizeModule(var1, p3, true)
	end
	return t
end