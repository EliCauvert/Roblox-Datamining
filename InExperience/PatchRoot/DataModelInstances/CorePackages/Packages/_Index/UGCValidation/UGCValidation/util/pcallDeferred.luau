local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)

return function(p1, p2)
	-- upvalues: tryYieldModule (ref)
	tryYieldModule(p2)
	
	return pcall(p1)
end