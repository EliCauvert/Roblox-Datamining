local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)

return function(p0, p1)
	-- upvalues: tryYieldModule (ref)
	tryYieldModule(p1)
	
	return pcall(p0)
end